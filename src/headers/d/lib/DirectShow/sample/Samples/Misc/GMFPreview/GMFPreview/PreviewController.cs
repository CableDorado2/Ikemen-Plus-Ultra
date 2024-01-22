/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Runtime.InteropServices;

using DirectShowLib;
using DirectShowLib.GDCL;

namespace GMFPreview
{
    class PreviewController : IDisposable
    {
        #region Member variables

        const long NEVER = long.MaxValue;

        // The file name to capture to
        private string m_strFile;

        // Running object table classes to show the graphs in GraphEdt
        private DsROTEntry m_rot1;
        private DsROTEntry m_rot2;

        // Has a device been selected yet?
        private bool m_DeviceSelected = false;

        // Are we actively capturing?
        private bool m_Capturing = false;

        // The graph that contains the source device
        private IGraphBuilder m_pSourceGraph;

        // The graph that contains the file writer
        private IGraphBuilder m_pCaptureGraph;

        // The bridge controller that stands between the two graphs
        private IGMFBridgeController m_pBridge;

        // The capture pin of the capture device (or the smarttee if
        // the capture device has no preview pin)
        private IPin m_pCapOutput;

        // The source side of the bridge
        private IBaseFilter m_pSourceGraphSinkFilter;

        // The other side of the bridge
        private IBaseFilter m_pCaptureGraphSourceFilter;

        #endregion

        // Property to return the current filename
        public string
        FileName
        {
            get
            {
                return m_strFile;
            }
        }

        // Property to report whether we are capturing
        public bool
        Capturing
        {
            get
            {
                return m_Capturing;
            }
        }

        // Property to report whether we have a device
        public bool
        Selected
        {
            get
            {
                return m_DeviceSelected;
            }
        }

        // Specify a device, and a window to draw the preview in
        public void
        SelectDevice(DsDevice dev, IntPtr hwnd)
        {
            int hr;
            IBaseFilter pfDevice = null;
            ICaptureGraphBuilder2 pBuilder = null;

            // release any leftovers
            ReleaseSelectMembers();

            try
            {
                // create source graph and add sink filter
                m_pSourceGraph = (IGraphBuilder)new FilterGraph();
                m_rot1 = new DsROTEntry(m_pSourceGraph);

                m_pBridge = (IGMFBridgeController)new GMFBridgeController();

                // init to video-only, in discard mode (ie when source graph
                // is running but not connected, buffers are discarded at the bridge)
                hr = m_pBridge.AddStream(true, eFormatType.MuxInputs, true);
                DsError.ThrowExceptionForHR(hr);

                // Add the requested device
                hr = ((IFilterGraph2)m_pSourceGraph).AddSourceFilterForMoniker(dev.Mon, null, dev.Name, out pfDevice);
                DsError.ThrowExceptionForHR(hr);

                // Add the sink filter to the source graph
                hr = m_pBridge.InsertSinkFilter(m_pSourceGraph, out m_pSourceGraphSinkFilter);
                DsError.ThrowExceptionForHR(hr);

                // use capture graph builder to render preview
                pBuilder = (ICaptureGraphBuilder2)new CaptureGraphBuilder2();

                // Init the CaptureGraphBuilder2
                hr = pBuilder.SetFiltergraph(m_pSourceGraph);
                DsError.ThrowExceptionForHR(hr);

                // Connect the filters together to allow preview
                hr = pBuilder.RenderStream(PinCategory.Preview, MediaType.Video, pfDevice, null, null);
                DsError.ThrowExceptionForHR(hr);

                // connect capture output to the pseudo-sink filter,
                // where it will be discarded until required
                hr = pBuilder.RenderStream(PinCategory.Capture, MediaType.Video, pfDevice, null, m_pSourceGraphSinkFilter);
                DsError.ThrowExceptionForHR(hr);

                // turn off capture stream if possible except when capturing
                hr = pBuilder.FindPin(pfDevice, PinDirection.Output, PinCategory.Capture, MediaType.Video, false, 0, out m_pCapOutput);
                if (hr >= 0)
                {
                    IAMStreamControl pSC = (IAMStreamControl)m_pCapOutput;
                    pSC.StartAt(NEVER, 0);  // Ignore any error
                }

                ConfigureVideo(hwnd);

                IMediaControl pMC = (IMediaControl)m_pSourceGraph;

                hr = pMC.Run();
                DsError.ThrowExceptionForHR(hr);

                // If we made it here, the device is selected
                m_DeviceSelected = true;
            }
            catch
            {
                ReleaseSelectMembers();
                throw;
            }
            finally
            {
                if (pBuilder != null)
                {
                    Marshal.ReleaseComObject(pBuilder);
                }

                if (pfDevice != null)
                {
                    Marshal.ReleaseComObject(pfDevice);
                }
            }
        }

        // Release all the members of the source graph
        private void ReleaseSelectMembers()
        {
            if (m_rot1 != null)
            {
                m_rot1.Dispose();
                m_rot1 = null;
            }

            if (m_pBridge != null)
            {
                Marshal.ReleaseComObject(m_pBridge);
                m_pBridge = null;
            }

            if (m_pSourceGraphSinkFilter != null)
            {
                Marshal.ReleaseComObject(m_pSourceGraphSinkFilter);
                m_pSourceGraphSinkFilter = null;
            }

            if (m_pSourceGraphSinkFilter != null)
            {
                Marshal.ReleaseComObject(m_pSourceGraphSinkFilter);
                m_pSourceGraphSinkFilter = null;
            }

            if (m_pCapOutput != null)
            {
                Marshal.ReleaseComObject(m_pCapOutput);
                m_pCapOutput = null;
            }

            if (m_pSourceGraph != null)
            {
                Marshal.ReleaseComObject(m_pSourceGraph);
                m_pSourceGraph = null;
            }
        }

        // Given a file name, build the output graph
        public void
        SetNextFilename(string pFile)
        {
            int hr;

            ICaptureGraphBuilder2 pBuilder = null;
            IBaseFilter pfMux = null;
            IFileSinkFilter pSink = null;

            if (pFile != null)
            {
                if (m_DeviceSelected)
                {
                    ReleaseFilenameMembers();

                    m_pCaptureGraph = (IGraphBuilder)new FilterGraph();
                    try
                    {
                        m_rot2 = new DsROTEntry(m_pCaptureGraph);

                        // Use the bridge to add the sourcefilter to the graph
                        hr = m_pBridge.InsertSourceFilter(m_pSourceGraphSinkFilter, m_pCaptureGraph, out m_pCaptureGraphSourceFilter);
                        DsError.ThrowExceptionForHR(hr);

                        // use capture graph builder to create mux/writer stage
                        pBuilder = (ICaptureGraphBuilder2)new CaptureGraphBuilder2();

                        hr = pBuilder.SetFiltergraph(m_pCaptureGraph);
                        DsError.ThrowExceptionForHR(hr);

                        // create the mux/writer
                        hr = pBuilder.SetOutputFileName(MediaSubType.Avi, pFile, out pfMux, out pSink);
                        DsError.ThrowExceptionForHR(hr);

                        // render source output to mux
                        hr = pBuilder.RenderStream(null, null, m_pCaptureGraphSourceFilter, null, pfMux);
                        DsError.ThrowExceptionForHR(hr);

                        // Store the file name for later use
                        m_strFile = pFile;
                    }
                    catch
                    {
                        ReleaseFilenameMembers();
                    }
                    finally
                    {
                        if (pBuilder != null)
                        {
                            Marshal.ReleaseComObject(pBuilder);
                        }

                        if (pfMux != null)
                        {
                            Marshal.ReleaseComObject(pfMux);
                        }

                        if (pSink != null)
                        {
                            Marshal.ReleaseComObject(pSink);
                        }
                    }
                }
                else
                {
                    throw new Exception("Device not selected");
                }
            }
            else
            {
                throw new Exception("Invalid parameter");
            }
        }

        // Release all the members of the capture graph
        private void ReleaseFilenameMembers()
        {
            if (m_rot2 != null)
            {
                m_rot2.Dispose();
                m_rot2 = null;
            }

            if (m_pCaptureGraphSourceFilter != null)
            {
                Marshal.ReleaseComObject(m_pCaptureGraphSourceFilter);
                m_pCaptureGraphSourceFilter = null;
            }
            if (m_pCaptureGraph != null)
            {
                Marshal.ReleaseComObject(m_pCaptureGraph);
                m_pCaptureGraph = null;
            }
        }

        // Start capturing to the file specified to SetNextFilename
        public void
        StartCapture()
        {
            int hr;

            if (m_DeviceSelected)
            {
                if (m_strFile != null)
                {
                    // re-enable capture stream
                    IAMStreamControl pSC = (IAMStreamControl)m_pCapOutput;

                    // immediately!
                    pSC.StartAt(null, 0); // Ignore any error

                    // start capture graph
                    IMediaControl pMC = (IMediaControl)m_pCaptureGraph;
                    hr = pMC.Run();
                    DsError.ThrowExceptionForHR(hr);

                    hr = m_pBridge.BridgeGraphs(m_pSourceGraphSinkFilter, m_pCaptureGraphSourceFilter);
                    DsError.ThrowExceptionForHR(hr);

                    // If we make it here, we are capturing
                    m_Capturing = true;
                }
                else
                {
                    throw new Exception("File name not specified");
                }
            }
            else
            {
                throw new Exception("Device not selected");
            }
        }

        // Stop the file capture (leave the preview running)
        public void
        StopCapture()
        {
            int hr;

            // Are we capturing?
            if (m_Capturing)
            {
                // disconnect segments
                hr = m_pBridge.BridgeGraphs(null, null);
                DsError.ThrowExceptionForHR(hr);

                // stop capture graph
                IMediaControl pMC = (IMediaControl)m_pCaptureGraph;

                hr = pMC.Stop();
                DsError.ThrowExceptionForHR(hr);

                // disable capture stream (to save resources)
                IAMStreamControl pSC = (IAMStreamControl)m_pCapOutput;

                pSC.StartAt(NEVER, 0); // Ignore any error

                m_Capturing = false;
            }
        }

        // Configure the video to fit in the provided window (if any)
        private void ConfigureVideo(IntPtr hwnd)
        {
            int hr;

            if (hwnd != IntPtr.Zero)
            {
                int cx, cy;
                IBasicVideo pBV = (IBasicVideo)m_pSourceGraph;

                hr = pBV.GetVideoSize(out cx, out cy);
                DsError.ThrowExceptionForHR(hr);

                // reparent playback window
                IVideoWindow pVW = (IVideoWindow)m_pSourceGraph;

                hr = pVW.put_WindowStyle(WindowStyle.Child | WindowStyle.ClipSiblings | WindowStyle.ClipChildren);
                DsError.ThrowExceptionForHR(hr);

                hr = pVW.put_Owner(hwnd);
                DsError.ThrowExceptionForHR(hr);

                hr = pVW.SetWindowPosition(1, 13, cx-7, cy);
                DsError.ThrowExceptionForHR(hr);
            }
        }

        #region IDisposable Members

        public void Dispose()
        {
            StopCapture();

            IMediaControl pMC = m_pSourceGraph as IMediaControl;
            if (pMC != null)
            {
                pMC.Stop();  // Ignore any error
            }

            ReleaseFilenameMembers();
            ReleaseSelectMembers();
        }

        #endregion
    }
}
