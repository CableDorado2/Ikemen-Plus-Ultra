/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Windows.Forms;

using Microsoft.Win32;

using DirectShowLib;
using DirectShowLib.BDA;
using DirectShowLib.Utils;

namespace DirectShowLib.Sample
{
	public class BDAGraphBuilder : IDisposable
	{
    Control hostingControl = null;

    IFilterGraph2 graphBuilder = null;
    DsROTEntry rot = null;

    IBaseFilter networkProvider = null;
    IBaseFilter mpeg2Demux = null;
    IBaseFilter tuner = null;
    IBaseFilter demodulator = null;
    IBaseFilter capture = null;
    IBaseFilter bdaTIF = null;
    IBaseFilter bdaSecTab = null;
    IBaseFilter audioRenderer = null;
    IBaseFilter videoRenderer = null;

		public BDAGraphBuilder(Control renderingControl)
		{
      this.hostingControl = renderingControl;
		}

    public void BuildGraph(ITuningSpace tuningSpace)
    {
      this.graphBuilder = (IFilterGraph2) new FilterGraph();
      rot = new DsROTEntry(this.graphBuilder);

      // Method names should be self explanatory
      AddNetworkProviderFilter(tuningSpace);
      AddMPEG2DemuxFilter();
      AddAndConnectBDABoardFilters();
      AddTransportStreamFiltersToGraph();
      AddRenderers();
      ConfigureVMR9InWindowlessMode();
      ConnectFilters();
    }

    public void SubmitTuneRequest(ITuneRequest tuneRequest)
    {
      int hr = 0;

      hr = (this.networkProvider as ITuner).put_TuneRequest(tuneRequest);
      DsError.ThrowExceptionForHR(hr);
    }

    public void RunGraph()
    {
      int hr = 0;

      hr = (this.graphBuilder as IMediaControl).Run();
      DsError.ThrowExceptionForHR(hr);
    }

    public void SaveGraph(string filepath)
    {
      // Nothing to do with a DTV viewer but can be useful
      FilterGraphTools.SaveGraphFile(this.graphBuilder, filepath);
    }

    #region Membres de IDisposable

    public void Dispose()
    {
      Decompose();
    }

    #endregion

    private void AddNetworkProviderFilter(ITuningSpace tuningSpace)
    {
      int hr = 0;
      Guid genProviderClsId = new Guid("{B2F3A67C-29DA-4C78-8831-091ED509A475}");
      Guid networkProviderClsId;

      // First test if the Generic Network Provider is available (only on MCE 2005 + Update Rollup 2 and higher)
      if (FilterGraphTools.IsThisComObjectInstalled(genProviderClsId))
      {
        this.networkProvider =  FilterGraphTools.AddFilterFromClsid(this.graphBuilder, genProviderClsId, "Generic Network Provider");

        hr = (this.networkProvider as ITuner).put_TuningSpace(tuningSpace);
        return;
      }

      // Get the network type of the requested Tuning Space
      hr = tuningSpace.get__NetworkType(out networkProviderClsId);

      // Get the network type of the requested Tuning Space
      if (networkProviderClsId == typeof(DVBTNetworkProvider).GUID)
      {
        this.networkProvider =  FilterGraphTools.AddFilterFromClsid(this.graphBuilder, networkProviderClsId, "DVBT Network Provider");
      }
      else if (networkProviderClsId == typeof(DVBSNetworkProvider).GUID)
      {
        this.networkProvider =  FilterGraphTools.AddFilterFromClsid(this.graphBuilder, networkProviderClsId, "DVBS Network Provider");
      }
      else if (networkProviderClsId == typeof(ATSCNetworkProvider).GUID)
      {
        this.networkProvider =  FilterGraphTools.AddFilterFromClsid(this.graphBuilder, networkProviderClsId, "ATSC Network Provider");
      }
      else if (networkProviderClsId == typeof(DVBCNetworkProvider).GUID)
      {
        this.networkProvider =  FilterGraphTools.AddFilterFromClsid(this.graphBuilder, networkProviderClsId, "DVBC Network Provider");
      }
      else
        // Tuning Space can also describe Analog TV but this application don't support them
        throw new ArgumentException("This application doesn't support this Tuning Space");

      hr = (this.networkProvider as ITuner).put_TuningSpace(tuningSpace);
    }

    private void AddMPEG2DemuxFilter()
    {
      int hr = 0;

      this.mpeg2Demux = (IBaseFilter) new MPEG2Demultiplexer();

      hr = this.graphBuilder.AddFilter(this.mpeg2Demux, "MPEG2 Demultiplexer");
      DsError.ThrowExceptionForHR(hr);
    }

    private void AddAndConnectBDABoardFilters()
    {
      int hr = 0;
      DsDevice[] devices;

      ICaptureGraphBuilder2 capBuilder = (ICaptureGraphBuilder2) new CaptureGraphBuilder2();
      capBuilder.SetFiltergraph(this.graphBuilder);

      try
      {
        // Enumerate BDA Source filters category and found one that can connect to the network provider
        devices = DsDevice.GetDevicesOfCat(FilterCategory.BDASourceFiltersCategory);
        for(int i = 0; i < devices.Length; i++)
        {
          IBaseFilter tmp;

          hr = graphBuilder.AddSourceFilterForMoniker(devices[i].Mon, null, devices[i].Name, out tmp);
          DsError.ThrowExceptionForHR(hr);

          hr = capBuilder.RenderStream(null, null, this.networkProvider, null, tmp);
          if (hr == 0)
          {
            // Got it !
            this.tuner = tmp;
            break;
          }
          else
          {
            // Try another...
            hr = graphBuilder.RemoveFilter(tmp);
            Marshal.ReleaseComObject(tmp);
          }
        }

        if (this.tuner == null)
          throw new ApplicationException("Can't find a valid BDA tuner");

        // trying to connect this filter to the MPEG-2 Demux
        hr = capBuilder.RenderStream(null, null, tuner, null, mpeg2Demux);
        if (hr >= 0)
        {
          // this is a one filter model
          this.demodulator = null;
          this.capture = null;
          return;
        }
        else
        {
          // Then enumerate BDA Receiver Components category to found a filter connecting 
          // to the tuner and the MPEG2 Demux
          devices = DsDevice.GetDevicesOfCat(FilterCategory.BDAReceiverComponentsCategory);

          for (int i = 0; i < devices.Length; i++)
          {
            IBaseFilter tmp;

            hr = graphBuilder.AddSourceFilterForMoniker(devices[i].Mon, null, devices[i].Name, out tmp);
            DsError.ThrowExceptionForHR(hr);

            hr = capBuilder.RenderStream(null, null, this.tuner, null, tmp);
            if (hr == 0)
            {
              // Got it !
              this.capture = tmp;

              // Connect it to the MPEG-2 Demux
              hr = capBuilder.RenderStream(null, null, this.capture, null, this.mpeg2Demux);
              if (hr >= 0)
              {
                // This second filter connect both with the tuner and the demux.
                // This is a capture filter...
                return;
              }
              else
              {
                // This second filter connect with the tuner but not with the demux.
                // This is in fact a demodulator filter. We now must find the true capture filter...

                this.demodulator = this.capture;
                this.capture = null;

                // saving the Demodulator's DevicePath to avoid creating it twice.
                string demodulatorDevicePath = devices[i].DevicePath;

                for (int j = 0; i < devices.Length; j++)
                {
                  if (devices[j].DevicePath.Equals(demodulatorDevicePath))
                    continue;

                  hr = graphBuilder.AddSourceFilterForMoniker(devices[i].Mon, null, devices[i].Name, out tmp);
                  DsError.ThrowExceptionForHR(hr);

                  hr = capBuilder.RenderStream(null, null, this.demodulator, null, tmp);
                  if (hr == 0)
                  {
                    // Got it !
                    this.capture = tmp;

                    // Connect it to the MPEG-2 Demux
                    hr = capBuilder.RenderStream(null, null, this.capture, null, this.mpeg2Demux);
                    if (hr >= 0)
                    {
                      // This second filter connect both with the demodulator and the demux.
                      // This is a true capture filter...
                      return;
                    }
                  }
                  else
                  {
                    // Try another...
                    hr = graphBuilder.RemoveFilter(tmp);
                    Marshal.ReleaseComObject(tmp);
                  }
                } // for j

                // We have a tuner and a capture/demodulator that don't connect with the demux
                // and we found no additionals filters to build a working filters chain.
                throw new ApplicationException("Can't find a valid BDA filter chain");
              }
            }
            else
            {
              // Try another...
              hr = graphBuilder.RemoveFilter(tmp);
              Marshal.ReleaseComObject(tmp);
            }
          } // for i

          // We have a tuner that connect to the Network Provider BUT not with the demux
          // and we found no additionals filters to build a working filters chain.
          throw new ApplicationException("Can't find a valid BDA filter chain");
        }
      }
      finally
      {
        Marshal.ReleaseComObject(capBuilder);
      }
    }

    public void AddTransportStreamFiltersToGraph()
    {
      int hr = 0;
      DsDevice[] devices;

      // Add two filters needed in a BDA graph
      devices = DsDevice.GetDevicesOfCat(FilterCategory.BDATransportInformationRenderersCategory);
      for(int i = 0; i < devices.Length; i++)
      {
        if (devices[i].Name.Equals("BDA MPEG2 Transport Information Filter"))
        {
          hr = graphBuilder.AddSourceFilterForMoniker(devices[i].Mon, null, devices[i].Name, out this.bdaTIF);
          DsError.ThrowExceptionForHR(hr);
          continue;
        }

        if (devices[i].Name.Equals("MPEG-2 Sections and Tables"))
        {
          hr = graphBuilder.AddSourceFilterForMoniker(devices[i].Mon, null, devices[i].Name, out this.bdaSecTab);
          DsError.ThrowExceptionForHR(hr);
          continue;
        }
      }
    }

    private void AddRenderers()
    {
      int hr = 0;

      // To hear something
      this.audioRenderer = (IBaseFilter) new DSoundRender();

      hr = this.graphBuilder.AddFilter(this.audioRenderer, "DirectSound Renderer");
      DsError.ThrowExceptionForHR(hr);

      // To see something
      this.videoRenderer = (IBaseFilter) new VideoMixingRenderer9();

      hr = this.graphBuilder.AddFilter(this.videoRenderer, "Video Mixing Renderer Filter 9");
      DsError.ThrowExceptionForHR(hr);
    }

    private void ConfigureVMR9InWindowlessMode()
    {
      int hr = 0;
      IVMRFilterConfig9 filterConfig = this.videoRenderer as IVMRFilterConfig9;

      // Configure VMR-9 in Windowsless mode
      hr = filterConfig.SetRenderingMode(VMR9Mode.Windowless);
      DsError.ThrowExceptionForHR(hr);

      // With 1 input stream
      hr = filterConfig.SetNumberOfStreams(1);
      DsError.ThrowExceptionForHR(hr);

      IVMRWindowlessControl9 windowlessControl = this.videoRenderer as IVMRWindowlessControl9;

      // The main form is hosting the VMR-9
      hr = windowlessControl.SetVideoClippingWindow(this.hostingControl.Handle);
      DsError.ThrowExceptionForHR(hr);

      // Keep the aspect-ratio OK
      hr = windowlessControl.SetAspectRatioMode(VMR9AspectRatioMode.LetterBox);
      DsError.ThrowExceptionForHR(hr);

      // Init the VMR-9 with default size values
      ResizeMoveHandler(null, null);

      // Add Windows Messages handlers
      AddHandlers();
    }

    private void AddHandlers()
    {
      // Add Windows Messages handlers
      this.hostingControl.Paint += new PaintEventHandler(PaintHandler); // for WM_PAINT
      this.hostingControl.Resize += new EventHandler(ResizeMoveHandler); // for WM_SIZE
      this.hostingControl.Move += new EventHandler(ResizeMoveHandler); // for WM_MOVE
      SystemEvents.DisplaySettingsChanged += new EventHandler(DisplayChangedHandler); // for WM_DISPLAYCHANGE
    }

    private void RemoveHandlers()
    {
      // Remove Windows Messages handlers
      this.hostingControl.Paint -= new PaintEventHandler(PaintHandler); // for WM_PAINT
      this.hostingControl.Resize -= new EventHandler(ResizeMoveHandler); // for WM_SIZE
      this.hostingControl.Move -= new EventHandler(ResizeMoveHandler); // for WM_MOVE
      SystemEvents.DisplaySettingsChanged -= new EventHandler(DisplayChangedHandler); // for WM_DISPLAYCHANGE
    }

    // This method changed to work with Windows 7
    // Under this OS, the MPEG-2 Demux now have dozens of outputs pins. 
    // Rendering all of them is not a good solution.
    // The rendering process must be more smart...
    private void ConnectFilters()
    {
      int hr = 0;
      int pinNumber = 0;
      IPin pinOut, pinIn;

      // After the rendering process, our 4 downstream filters must be rendered
      bool bdaTIFRendered = false;
      bool bdaSecTabRendered = false;
      bool audioRendered = false;
      bool videoRendered = false;

      // for each output pins...
      while (true)
      {
        pinOut = DsFindPin.ByDirection(mpeg2Demux, PinDirection.Output, pinNumber);
        // Is the last pin reached ?
        if (pinOut == null)
          break;

        IEnumMediaTypes enumMediaTypes = null;
        AMMediaType[] mediaTypes = new AMMediaType[1];

        try
        {
          // Get Pin's MediaType enumerator
          hr = pinOut.EnumMediaTypes(out enumMediaTypes);
          DsError.ThrowExceptionForHR(hr);

          // for each media types...
          while (enumMediaTypes.Next(mediaTypes.Length, mediaTypes, IntPtr.Zero) == 0)
          {
            // Store the majortype and the subtype and free the structure
            Guid majorType = mediaTypes[0].majorType;
            Guid subType = mediaTypes[0].subType;
            DsUtils.FreeAMMediaType(mediaTypes[0]);

            if (majorType == MediaType.Audio)
            {
              // Is the Audio already rendered ?
              if (!audioRendered)
              {
                // Get the first input pin
                pinIn = DsFindPin.ByDirection(audioRenderer, PinDirection.Input, 0);

                // Render it with IntelliConnect (a decoder should be added between the two filters.
                hr = graphBuilder.Connect(pinOut, pinIn);
                DsError.ThrowExceptionForHR(hr);

                // Release the Pin
                Marshal.ReleaseComObject(pinIn);
                pinIn = null;

                // Notify that the audio renderer is connected
                audioRendered = true;
              }
            }
            else if (majorType == MediaType.Video)
            {
              // Is the Video already rendered ?
              if (!videoRendered)
              {
                // Get the first input pin
                pinIn = DsFindPin.ByDirection(videoRenderer, PinDirection.Input, 0);

                // Render it with IntelliConnect (a decoder should be added between the two filters.
                hr = graphBuilder.Connect(pinOut, pinIn);
                DsError.ThrowExceptionForHR(hr);

                // Release the Pin
                Marshal.ReleaseComObject(pinIn);
                pinIn = null;

                // Notify that the video renderer is connected
                videoRendered = true;
              }
            }
            else if (majorType == MediaType.Mpeg2Sections)
            {
              if (subType == MediaSubType.Mpeg2Data)
              {
                // Is the MPEG-2 Sections and Tables Filter already rendered ?
                if (!bdaSecTabRendered)
                {
                  // Get the first input pin
                  pinIn = DsFindPin.ByDirection(bdaSecTab, PinDirection.Input, 0);

                  // A direct connection is enough
                  hr = graphBuilder.ConnectDirect(pinOut, pinIn, null);
                  DsError.ThrowExceptionForHR(hr);

                  // Release the Pin
                  Marshal.ReleaseComObject(pinIn);
                  pinIn = null;

                  // Notify that the MPEG-2 Sections and Tables Filter is connected
                  bdaSecTabRendered = true;
                }
              }
              // This sample only support DVB-T or DVB-S so only supporting this subtype is enough.
              // If you want to support ATSC or ISDB, don't forget to handle these network types.
              else if (subType == MediaSubType.DvbSI)
              {
                // Is the BDA MPEG-2 Transport Information Filter already rendered ?
                if (!bdaTIFRendered)
                {
                  // Get the first input pin
                  pinIn = DsFindPin.ByDirection(bdaTIF, PinDirection.Input, 0);

                  // A direct connection is enough
                  hr = graphBuilder.ConnectDirect(pinOut, pinIn, null);
                  DsError.ThrowExceptionForHR(hr);

                  // Release the Pin
                  Marshal.ReleaseComObject(pinIn);
                  pinIn = null;

                  // Notify that the BDA MPEG-2 Transport Information Filter is connected
                  bdaTIFRendered = true;
                }
              }
            }
          }
        }
        finally
        {
          // Free COM objects
          Marshal.ReleaseComObject(enumMediaTypes);
          enumMediaTypes = null;

          Marshal.ReleaseComObject(pinOut);
          pinOut = null;
        }

        // Next pin, please !
        pinNumber++;
      }
    }

    private void Decompose()
    {
      int hr = 0;

      // Decompose the graph
      hr = (this.graphBuilder as IMediaControl).StopWhenReady();
      hr = (this.graphBuilder as IMediaControl).Stop();

      RemoveHandlers();

      FilterGraphTools.RemoveAllFilters(this.graphBuilder);

      Marshal.ReleaseComObject(this.networkProvider); this.networkProvider = null;
      Marshal.ReleaseComObject(this.mpeg2Demux); this.mpeg2Demux = null;
      Marshal.ReleaseComObject(this.tuner); this.tuner = null;
      Marshal.ReleaseComObject(this.capture); this.capture = null;
      Marshal.ReleaseComObject(this.bdaTIF); this.bdaTIF = null;
      Marshal.ReleaseComObject(this.bdaSecTab); this.bdaSecTab = null;
      Marshal.ReleaseComObject(this.audioRenderer); this.audioRenderer = null;
      Marshal.ReleaseComObject(this.videoRenderer); this.videoRenderer = null;

      rot.Dispose();
      Marshal.ReleaseComObject(this.graphBuilder); this.graphBuilder = null;
    }

    private void PaintHandler(object sender, PaintEventArgs e)
    {
      if (this.videoRenderer != null)
      {
        IntPtr hdc = e.Graphics.GetHdc();
        int hr = (this.videoRenderer as IVMRWindowlessControl9).RepaintVideo(this.hostingControl.Handle, hdc);
        e.Graphics.ReleaseHdc(hdc);
      }
    }

    private void ResizeMoveHandler(object sender, EventArgs e)
    {
      if (this.videoRenderer != null)
      {
        int hr = (this.videoRenderer as IVMRWindowlessControl9).SetVideoPosition(null, DsRect.FromRectangle(this.hostingControl.ClientRectangle));
      }
    }

    private void DisplayChangedHandler(object sender, EventArgs e)
    {
      if (this.videoRenderer != null)
      {
        int hr = (this.videoRenderer as IVMRWindowlessControl9).DisplayModeChanged();
      }
    }

  }
}
