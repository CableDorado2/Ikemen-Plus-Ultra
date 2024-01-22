/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;

using Microsoft.Win32;

using DirectShowLib;

namespace DirectShowLib.Sample
{
  public partial class MainForm : Form
  {
    private IFilterGraph2 graphBuilder;
    private DsROTEntry rot;
    private IMediaControl mediaControl;

    private IBaseFilter vmr9;
    private IVMRWindowlessControl9 windowlessCtrl;

    private Compositor compositor;

    public MainForm()
    {
      InitializeComponent();
    }

    private void BuildGraph(string filename)
    {
      int hr = 0;

      try
      {
        graphBuilder = (IFilterGraph2)new FilterGraph();
        mediaControl = (IMediaControl)graphBuilder;

        rot = new DsROTEntry(graphBuilder);

        vmr9 = (IBaseFilter)new VideoMixingRenderer9();

        ConfigureVMR9InWindowlessMode();

        hr = graphBuilder.AddFilter(vmr9, "Video Mixing Renderer 9");
        DsError.ThrowExceptionForHR(hr);

        hr = graphBuilder.RenderFile(filename, null);
        DsError.ThrowExceptionForHR(hr);

        RunGraph();
      }
      catch (Exception e)
      {
        CloseInterfaces();
        MessageBox.Show("An error occured during the graph building : \r\n\r\n" + e.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
      }
    }

    private void ConfigureVMR9InWindowlessMode()
    {
      int hr = 0;

      IVMRFilterConfig9 filterConfig = (IVMRFilterConfig9)vmr9;

      // Must be called before calling SetImageCompositor
      hr = filterConfig.SetNumberOfStreams(1);
      DsError.ThrowExceptionForHR(hr);

      // Create an instance of the Compositor
      compositor = new Compositor();

      // Configure the filter with the Compositor
      hr = filterConfig.SetImageCompositor(compositor);
      DsError.ThrowExceptionForHR(hr);

      // Change VMR9 mode to Windowless
      hr = filterConfig.SetRenderingMode(VMR9Mode.Windowless);
      DsError.ThrowExceptionForHR(hr);

      windowlessCtrl = (IVMRWindowlessControl9)vmr9;

      // Set rendering window
      hr = windowlessCtrl.SetVideoClippingWindow(renderingPanel.Handle);
      DsError.ThrowExceptionForHR(hr);

      // Set Aspect-Ratio
      hr = windowlessCtrl.SetAspectRatioMode(VMR9AspectRatioMode.LetterBox);
      DsError.ThrowExceptionForHR(hr);

      // Add delegates for Windowless operations
      AddHandlers();

      // Call the resize handler to configure the output size
      MainForm_ResizeMove(null, null);
    }

    private void CloseInterfaces()
    {
      if (mediaControl != null)
        mediaControl.Stop();

      if (rot != null)
      {
        rot.Dispose();
        rot = null;
      }

      RemoveHandlers();

      if (compositor != null)
      {
        compositor.Dispose();
        compositor = null;
      }

      if (vmr9 != null)
      {
        Marshal.ReleaseComObject(vmr9);
        vmr9 = null;
        windowlessCtrl = null;
      }

      if (graphBuilder != null)
      {
        Marshal.ReleaseComObject(graphBuilder);
        graphBuilder = null;
        mediaControl = null;
      }

    }

    private void RunGraph()
    {
      if (mediaControl != null)
      {
        int hr = mediaControl.Run();
        DsError.ThrowExceptionForHR(hr);
      }
    }

    private void StopGraph()
    {
      if (mediaControl != null)
      {
        int hr = mediaControl.Stop();
        DsError.ThrowExceptionForHR(hr);
      }
    }

    private void AddHandlers()
    {
      // Add handlers for VMR purpose
      renderingPanel.Paint += new PaintEventHandler(MainForm_Paint); // for WM_PAINT
      renderingPanel.Resize += new EventHandler(MainForm_ResizeMove); // for WM_SIZE
      renderingPanel.Move += new EventHandler(MainForm_ResizeMove); // for WM_MOVE
      SystemEvents.DisplaySettingsChanged += new EventHandler(SystemEvents_DisplaySettingsChanged); // for WM_DISPLAYCHANGE
    }

    private void RemoveHandlers()
    {
      // remove handlers when they are no more needed
      renderingPanel.Paint -= new PaintEventHandler(MainForm_Paint);
      renderingPanel.Resize -= new EventHandler(MainForm_ResizeMove);
      renderingPanel.Move -= new EventHandler(MainForm_ResizeMove);
      SystemEvents.DisplaySettingsChanged -= new EventHandler(SystemEvents_DisplaySettingsChanged);
    }

    private void MainForm_Paint(object sender, PaintEventArgs e)
    {
      if (windowlessCtrl != null)
      {
        IntPtr hdc = e.Graphics.GetHdc();
        int hr = windowlessCtrl.RepaintVideo(renderingPanel.Handle, hdc);
        e.Graphics.ReleaseHdc(hdc);
      }
    }

    private void MainForm_ResizeMove(object sender, EventArgs e)
    {
      if (windowlessCtrl != null)
      {
        int hr = windowlessCtrl.SetVideoPosition(null, DsRect.FromRectangle(renderingPanel.ClientRectangle));
      }
    }

    private void SystemEvents_DisplaySettingsChanged(object sender, EventArgs e)
    {
      if (windowlessCtrl != null)
      {
        int hr = windowlessCtrl.DisplayModeChanged();
      }
    }

    private void menuFileQuit_Click(object sender, EventArgs e)
    {
      CloseInterfaces();
      this.Close();
    }

    private void menuFileOpen_Click(object sender, EventArgs e)
    {
      if (openFileDialog1.ShowDialog() == DialogResult.OK)
      {
        CloseInterfaces();
        BuildGraph(openFileDialog1.FileName);
      }
    }

    private void menuFileClose_Click(object sender, EventArgs e)
    {
      CloseInterfaces();
    }

    private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
    {
      CloseInterfaces();
    }

    private void menuAbout_Click(object sender, EventArgs e)
    {
      string title = "About VMR9 Compositor Sample";
      string text = "DirectShow.Net VMR9 Compositor Sample";

      AboutBox.Show(title, text);
    }

  }
}