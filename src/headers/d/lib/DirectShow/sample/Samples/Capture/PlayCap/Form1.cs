/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/
//------------------------------------------------------------------------------
// Desc: DirectShow sample code - a very basic application using video capture
//       devices.  It creates a window and uses the first available capture
//       device to render and preview video capture data.
//
// DirectShow Interfaces used : ICaptureGraphBuilder2, IGraphBuilder, 
// IMediaEventEx, IMediaControl, IVideoWindow, IBaseFilter
//
// DirectShowLib helper classes used : DsError, DsROTEntry, DsDevice
//
//------------------------------------------------------------------------------


using System;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;

using DirectShowLib;

#if !USING_NET11
using System.Runtime.InteropServices.ComTypes;
#endif

namespace DirectShowLib.Samples
{
	public class Form1 : System.Windows.Forms.Form
	{
    // a small enum to record the graph state
    enum PlayState 
    {
      Stopped, 
      Paused, 
      Running, 
      Init
    };

    // Application-defined message to notify app of filtergraph events
    public const int WM_GRAPHNOTIFY = 0x8000 + 1;

    IVideoWindow  videoWindow = null;
    IMediaControl mediaControl = null;
    IMediaEventEx mediaEventEx = null;
    IGraphBuilder graphBuilder = null;
    ICaptureGraphBuilder2 captureGraphBuilder = null;
    PlayState currentState = PlayState.Stopped;

    DsROTEntry rot = null;

		public Form1()
		{
			InitializeComponent();
      CaptureVideo();
		}

		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
        // Stop capturing and release interfaces
        CloseInterfaces();  
      }

			base.Dispose( disposing );
		}

		#region Code généré par le Concepteur Windows Form
		/// <summary>
		/// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
		/// le contenu de cette méthode avec l'éditeur de code.
		/// </summary>
		private void InitializeComponent()
		{
      System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(Form1));
      // 
      // Form1
      // 
      this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
      this.ClientSize = new System.Drawing.Size(320, 320);
      this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
      this.Name = "Form1";
      this.Text = "Video Capture Previewer (PlayCap)";
      this.Resize += new System.EventHandler(this.Form1_Resize);

    }
		#endregion


    public void CaptureVideo()
    {
      int hr = 0;
      IBaseFilter sourceFilter = null;

      try
      {
        // Get DirectShow interfaces
        GetInterfaces();

        // Attach the filter graph to the capture graph
        hr = this.captureGraphBuilder.SetFiltergraph(this.graphBuilder);
        DsError.ThrowExceptionForHR(hr);

        // Use the system device enumerator and class enumerator to find
        // a video capture/preview device, such as a desktop USB video camera.
        sourceFilter = FindCaptureDevice();

        // Add Capture filter to our graph.
        hr = this.graphBuilder.AddFilter(sourceFilter, "Video Capture");
        DsError.ThrowExceptionForHR(hr);

        // Render the preview pin on the video capture filter
        // Use this instead of this.graphBuilder.RenderFile
        hr = this.captureGraphBuilder.RenderStream(PinCategory.Preview, MediaType.Video, sourceFilter, null, null);
        DsError.ThrowExceptionForHR(hr);

        // Now that the filter has been added to the graph and we have
        // rendered its stream, we can release this reference to the filter.
        Marshal.ReleaseComObject(sourceFilter);

        // Set video window style and position
        SetupVideoWindow();

        // Add our graph to the running object table, which will allow
        // the GraphEdit application to "spy" on our graph
        rot = new DsROTEntry(this.graphBuilder);

        // Start previewing video data
        hr = this.mediaControl.Run();
        DsError.ThrowExceptionForHR(hr);

        // Remember current state
        this.currentState = PlayState.Running;
      }
      catch
      {
        MessageBox.Show("An unrecoverable error has occurred.");
      }
    }

    // This version of FindCaptureDevice is provide for education only.
    // A second version using the DsDevice helper class is define later.
    public IBaseFilter FindCaptureDevice()
    {
      int hr = 0;
#if USING_NET11
      UCOMIEnumMoniker classEnum = null;
      UCOMIMoniker[] moniker = new UCOMIMoniker[1];
#else
      IEnumMoniker classEnum = null;
      IMoniker[] moniker = new IMoniker[1];
#endif
      object source = null;

      // Create the system device enumerator
      ICreateDevEnum devEnum = (ICreateDevEnum) new CreateDevEnum();

      // Create an enumerator for the video capture devices
      hr = devEnum.CreateClassEnumerator(FilterCategory.VideoInputDevice, out classEnum, 0);
      DsError.ThrowExceptionForHR(hr);

      // The device enumerator is no more needed
      Marshal.ReleaseComObject(devEnum);

      // If there are no enumerators for the requested type, then 
      // CreateClassEnumerator will succeed, but classEnum will be NULL.
      if (classEnum == null)
      {
        throw new ApplicationException("No video capture device was detected.\r\n\r\n" +
                                       "This sample requires a video capture device, such as a USB WebCam,\r\n" +
                                       "to be installed and working properly.  The sample will now close.");
      }

      // Use the first video capture device on the device list.
      // Note that if the Next() call succeeds but there are no monikers,
      // it will return 1 (S_FALSE) (which is not a failure).  Therefore, we
      // check that the return code is 0 (S_OK).
#if USING_NET11
      int i;
      if (classEnum.Next (moniker.Length, moniker, IntPtr.Zero) == 0)
#else
      if (classEnum.Next (moniker.Length, moniker, IntPtr.Zero) == 0)
#endif
      {
        // Bind Moniker to a filter object
        Guid iid = typeof(IBaseFilter).GUID;
        moniker[0].BindToObject(null, null, ref iid, out source);
      }
      else
      {
        throw new ApplicationException("Unable to access video capture device!");   
      }

      // Release COM objects
      Marshal.ReleaseComObject(moniker[0]);
      Marshal.ReleaseComObject(classEnum);

      // An exception is thrown if cast fail
      return (IBaseFilter) source;
    }
/*
    // Uncomment this version of FindCaptureDevice to use the DsDevice helper class
    // (and comment the first version of course)
    public IBaseFilter FindCaptureDevice()
    {
      System.Collections.ArrayList devices;
      object source;

      // Get all video input devices
      devices = DsDevice.GetDevicesOfCat(FilterCategory.VideoInputDevice);

      // Take the first device
      DsDevice device = (DsDevice)devices[0];

      // Bind Moniker to a filter object
      Guid iid = typeof(IBaseFilter).GUID;
      device.Mon.BindToObject(null, null, ref iid, out source);

      // An exception is thrown if cast fail
      return (IBaseFilter) source;
    }
*/
    public void GetInterfaces()
    {
      int hr = 0;

      // An exception is thrown if cast fail
      this.graphBuilder = (IGraphBuilder) new FilterGraph();
      this.captureGraphBuilder = (ICaptureGraphBuilder2) new CaptureGraphBuilder2();
      this.mediaControl = (IMediaControl) this.graphBuilder;
      this.videoWindow = (IVideoWindow) this.graphBuilder;
      this.mediaEventEx = (IMediaEventEx) this.graphBuilder;

      hr = this.mediaEventEx.SetNotifyWindow(this.Handle, WM_GRAPHNOTIFY, IntPtr.Zero);
      DsError.ThrowExceptionForHR(hr);
    }

    public void CloseInterfaces()
    {
      // Stop previewing data
      if (this.mediaControl != null)
        this.mediaControl.StopWhenReady();

      this.currentState = PlayState.Stopped;

      // Stop receiving events
      if (this.mediaEventEx != null)
        this.mediaEventEx.SetNotifyWindow(IntPtr.Zero, WM_GRAPHNOTIFY, IntPtr.Zero);

      // Relinquish ownership (IMPORTANT!) of the video window.
      // Failing to call put_Owner can lead to assert failures within
      // the video renderer, as it still assumes that it has a valid
      // parent window.
      if(this.videoWindow != null)
      {
        this.videoWindow.put_Visible(OABool.False);
        this.videoWindow.put_Owner(IntPtr.Zero);
      }

      // Remove filter graph from the running object table
      if (rot != null)
      {
        rot.Dispose();
        rot = null;
      }

      // Release DirectShow interfaces
      Marshal.ReleaseComObject(this.mediaControl); this.mediaControl = null;
      Marshal.ReleaseComObject(this.mediaEventEx); this.mediaEventEx = null;
      Marshal.ReleaseComObject(this.videoWindow); this.videoWindow = null;
      Marshal.ReleaseComObject(this.graphBuilder); this.graphBuilder = null;
      Marshal.ReleaseComObject(this.captureGraphBuilder); this.captureGraphBuilder = null;
    }

    public void SetupVideoWindow()
    {
      int hr = 0;

      // Set the video window to be a child of the main window
      hr = this.videoWindow.put_Owner(this.Handle);
      DsError.ThrowExceptionForHR(hr);

      hr = this.videoWindow.put_WindowStyle(WindowStyle.Child | WindowStyle.ClipChildren);
      DsError.ThrowExceptionForHR(hr);

      // Use helper function to position video window in client rect 
      // of main application window
      ResizeVideoWindow();

      // Make the video window visible, now that it is properly positioned
      hr = this.videoWindow.put_Visible(OABool.True);
      DsError.ThrowExceptionForHR(hr);
    }

    public void ResizeVideoWindow()
    {
      // Resize the video preview window to match owner window size
      if (this.videoWindow != null)
      {
        this.videoWindow.SetWindowPosition(0, 0, this.ClientSize.Width, this.ClientSize.Height);
      }
    }

    public void ChangePreviewState(bool showVideo)
    {
      int hr = 0;

      // If the media control interface isn't ready, don't call it
      if (this.mediaControl == null)
        return;

      if (showVideo)
      {
        if (this.currentState != PlayState.Running)
        {
          // Start previewing video data
          hr = this.mediaControl.Run();
          this.currentState = PlayState.Running;
        }
      }
      else
      {
        // Stop previewing video data
        hr = this.mediaControl.StopWhenReady();
        this.currentState = PlayState.Stopped;
      }
    }

    public void HandleGraphEvent()
    {
      int hr = 0;
      EventCode evCode;
      IntPtr evParam1, evParam2;

      if (this.mediaEventEx == null)
        return;

      while(this.mediaEventEx.GetEvent(out evCode, out evParam1, out evParam2, 0) == 0)
      {
        // Free event parameters to prevent memory leaks associated with
        // event parameter data.  While this application is not interested
        // in the received events, applications should always process them.
        hr = this.mediaEventEx.FreeEventParams(evCode, evParam1, evParam2);
        DsError.ThrowExceptionForHR(hr);
        
        // Insert event processing code here, if desired
      }
    }
    
    protected override void WndProc(ref Message m)
    {
      switch (m.Msg)
      {
        case WM_GRAPHNOTIFY:
        {
          HandleGraphEvent();
          break;
        }
      }

      // Pass this message to the video window for notification of system changes
      if (this.videoWindow != null)
          this.videoWindow.NotifyOwnerMessage(m.HWnd, m.Msg, m.WParam, m.LParam);

      base.WndProc (ref m);
    }

    private void Form1_Resize(object sender, System.EventArgs e)
    {
      // Stop graph when Form is iconic
      if (this.WindowState == FormWindowState.Minimized)
        ChangePreviewState(false);

      // Restart Graph when window come back to normal state
      if (this.WindowState == FormWindowState.Normal)
        ChangePreviewState(true);

      ResizeVideoWindow();
    }

		/// <summary>
		/// Point d'entrée principal de l'application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}

	}
}
