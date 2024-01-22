/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Diagnostics;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Runtime.InteropServices;

using Microsoft.DirectX;
using Microsoft.DirectX.Direct3D;

using DirectShowLib;

namespace DirectShowLib.Sample
{
  public class MainForm : System.Windows.Forms.Form
  {
    // Managed Direct3D Device
    private Device device = null;
    private PresentParameters presentParams = null;

    // Managed Direct3D Resources
    private Surface renderTarget;
    private VertexBuffer vertexBuffer = null;
    private CustomVertex.TransformedTextured[] vertices = new CustomVertex.TransformedTextured[4];

    // The configuration retrieve from the conf form
    private Configuration config;

    // The window default size and backbuffer fixed size
    private Size displaySize = new Size(1024, 768);

    // DirectShow objects
    private IFilterGraph2 graphBuilder;
    private DsROTEntry rot;
    private IBaseFilter vmr9;
    private Allocator allocator;

    private const int WM_PAINT = 0x000F;
    private const int WM_GRAPHNOTIFY = 0x4000 + 123;

    public MainForm()
    {
      InitializeComponent();

      // The form is completly opaque and drawn by ourself
      this.SetStyle(ControlStyles.AllPaintingInWmPaint | ControlStyles.UserPaint | ControlStyles.Opaque, true);
    }

    public MainForm(Configuration config) : this()
    {
      this.config = config;
    }

    protected override void Dispose( bool disposing )
    {
      if( disposing )
      {
        Shutdown();
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
      // 
      // MainForm
      // 
      this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
      this.ClientSize = displaySize;
      this.Name = "MainForm";
      this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.MainForm_KeyDown);

    }
    #endregion

    private void MainForm_KeyDown(object sender, System.Windows.Forms.KeyEventArgs e)
    {
      switch(e.KeyCode)
      {
          // Press Escape to quit
        case Keys.Escape:
        {
          this.Close();
          break;
        }
      }
    }

    // Init the Managed Direct3D Device
    public void InitializeGraphics()
    {
      presentParams = new PresentParameters();

      if (config.IsWindowed)
      {
        // We want a windowed device
        presentParams.Windowed = true;

        // Enable Z-Buffer
        // This is not really needed in this sample but real applications generaly use it
        presentParams.EnableAutoDepthStencil = true;
        presentParams.AutoDepthStencilFormat = DepthFormat.D16;

        // Hint to the Device Driver : This is a video playing application
        presentParams.PresentFlag = PresentFlag.Video;

        // How to swap backbuffer in front and how many frames per screen refresh
        presentParams.SwapEffect = SwapEffect.Copy;
        presentParams.PresentationInterval = PresentInterval.One;
      }
      else
      {
        // We want a fullscreen device
        presentParams.Windowed = false;

        // One backbuffer should be enough
        presentParams.BackBufferCount = 2;
        presentParams.BackBufferWidth = config.Mode.Width;
        presentParams.BackBufferHeight = config.Mode.Height;
        presentParams.BackBufferFormat = config.Mode.Format;
        presentParams.FullScreenRefreshRateInHz = config.Mode.RefreshRate;

        // Enable Z-Buffer
        // This is not really needed in this sample but real applications generaly use it
        presentParams.EnableAutoDepthStencil = true;
        presentParams.AutoDepthStencilFormat = DepthFormat.D16;

        // Hint to the Device Driver : This is a video playing application
        presentParams.PresentFlag = PresentFlag.Video;

        // How to swap backbuffer in front and how many frames per screen refresh
        presentParams.SwapEffect = SwapEffect.Discard;
        presentParams.PresentationInterval = PresentInterval.One;

        displaySize = new Size(config.Mode.Width, config.Mode.Height);
      }

      // Disable Managed Direct3D events
      Device.IsUsingEventHandlers = false;

      // Create the device
      device = new Device(
        Manager.Adapters.Default.Adapter,
        DeviceType.Hardware,
        this,
        CreateFlags.SoftwareVertexProcessing | CreateFlags.MultiThreaded,
        presentParams
        );

      AllocateResources();
      InitializeDevice();
    }

    private void AllocateResources()
    {
      // Retrieve the render tatget (the backbuffer)
      renderTarget = device.GetRenderTarget(0);

      // Alloc a Vertex buffer to draw the video (4 vertices -> a Quad)
      vertexBuffer = new VertexBuffer(
        typeof(CustomVertex.TransformedTextured),
        4,
        device,
        Usage.Dynamic | Usage.WriteOnly,
        CustomVertex.TransformedTextured.Format,
        Pool.Default
        );
    }

    private void InitializeDevice()
    {
      FilterCaps filterCaps = device.DeviceCaps.TextureFilterCaps;

      // If the hardware support it, apply a bilinear filtering
      if (filterCaps.SupportsMagnifyLinear && filterCaps.SupportsMinifyLinear)
      {
        device.SamplerState[0].MinFilter = TextureFilter.Linear;
        device.SamplerState[0].MagFilter = TextureFilter.Linear;
      }
      else
      { 
        device.SamplerState[0].MinFilter = TextureFilter.Point;
        device.SamplerState[0].MagFilter = TextureFilter.Point;
      }
    }

    public void InitVMR9(string filename)
    {
      int hr = 0;

      // Create a DirectShow FilterGraph
      graphBuilder = (IFilterGraph2) new FilterGraph();

      // Add it in ROT for debug purpose
      rot = new DsROTEntry(graphBuilder);
     
      // Add a notification handler (see WndProc)
      hr = (graphBuilder as IMediaEventEx).SetNotifyWindow(this.Handle, WM_GRAPHNOTIFY, IntPtr.Zero);
      DsError.ThrowExceptionForHR(hr);

      // Create a VMR9 object
      vmr9 = (IBaseFilter) new VideoMixingRenderer9();

      IVMRFilterConfig9 filterConfig = (IVMRFilterConfig9) vmr9;
      
      // We want the Renderless mode!
      hr = filterConfig.SetRenderingMode(VMR9Mode.Renderless);
      DsError.ThrowExceptionForHR(hr);

      // Create the Allocator / Presenter object
      allocator = new Allocator(device);

      IVMRSurfaceAllocatorNotify9 vmrSurfAllocNotify = (IVMRSurfaceAllocatorNotify9) vmr9;

      // Notify the VMR9 filter about our allocator
      hr = vmrSurfAllocNotify.AdviseSurfaceAllocator(IntPtr.Zero, allocator);
      DsError.ThrowExceptionForHR(hr);

      // Notify our allocator about the VMR9 filter
      hr = allocator.AdviseNotify(vmrSurfAllocNotify);
      DsError.ThrowExceptionForHR(hr);

      if (config.IsUsingMixing)
      {
        // One stream is enough for this sample
        // This line also load the mixing componant
        hr = filterConfig.SetNumberOfStreams(1);
        DsError.ThrowExceptionForHR(hr);

        IVMRMixerControl9 mixerControl = (IVMRMixerControl9) vmr9;

        // Select the mixer mode : YUV or RGB
        if (config.UseYUVMixing)
        {
          hr = mixerControl.SetMixingPrefs(VMR9MixerPrefs.RenderTargetYUV | VMR9MixerPrefs.NoDecimation | VMR9MixerPrefs.ARAdjustXorY | VMR9MixerPrefs.BiLinearFiltering);
        }
        else
        {
          hr = mixerControl.SetMixingPrefs(VMR9MixerPrefs.RenderTargetRGB | VMR9MixerPrefs.NoDecimation | VMR9MixerPrefs.ARAdjustXorY | VMR9MixerPrefs.BiLinearFiltering);
        }
        DsError.ThrowExceptionForHR(hr);

        Debug.WriteLine("Using VMR9 mixing mode");
      }

      // Add the filter to the graph
      hr = graphBuilder.AddFilter(vmr9, "Video Mixing Renderer 9");
      DsError.ThrowExceptionForHR(hr);

      // Render the file
      hr = graphBuilder.RenderFile(filename, null);
      DsError.ThrowExceptionForHR(hr);

      // Run the graph
      hr = (graphBuilder as IMediaControl).Run();
      DsError.ThrowExceptionForHR(hr);
    }

    private void Shutdown()
    {
      int hr = 0;

      // Remove the ROT entry
      if (rot != null)
        rot.Dispose();

      if (graphBuilder != null)
      {
        // Stop DirectShow notifications
        hr = (graphBuilder as IMediaEventEx).SetNotifyWindow(IntPtr.Zero, 0, IntPtr.Zero);

        // Stop the graph
        hr = (graphBuilder as IMediaControl).StopWhenReady();
        hr = (graphBuilder as IMediaControl).Stop();

        // Dispose the allocator
        allocator.Dispose();

        // Release DirectShow objects
        Marshal.ReleaseComObject(vmr9);
        Marshal.ReleaseComObject(graphBuilder);
        graphBuilder = null;

        FreeResources();

        // Free the Managed Direct3D device
        device.Dispose();
      }
    }

    private void FreeResources()
    {
      // Free Managed Direct3D resources
      renderTarget.Dispose();
      vertexBuffer.Dispose();
    }

    // 
    private void UpdateEnvironment()
    {
      Size vmrTexSize = allocator.TextureSize;
      Size vmrVidSize = allocator.VideoSize;
      RectangleF videoClientRectangle = Rectangle.Empty;

      if (vmrVidSize.Width >= vmrVidSize.Height)
      {
        // Compute the video aspect-ratio for a landscape proportioned image
        float videoAR = (float)vmrVidSize.Height / (float)vmrVidSize.Width;

        videoClientRectangle.X = 0.0f;
        videoClientRectangle.Width = (float) displaySize.Width;
        videoClientRectangle.Height = (float) displaySize.Width * videoAR;
        videoClientRectangle.Y = ((float) displaySize.Height - videoClientRectangle.Height) / 2;
      }
      else
      {
        // Compute the video aspect-ratio for a portrait proportioned image
        float videoAR = (float)vmrVidSize.Width / (float)vmrVidSize.Height;

        videoClientRectangle.Y = 0.0f;
        videoClientRectangle.Width = (float) displaySize.Height * videoAR;
        videoClientRectangle.Height = (float) displaySize.Height;
        videoClientRectangle.X = ((float) displaySize.Width - videoClientRectangle.Width) / 2;
      }

      // The Quad is built using a triangle fan of 2 triangles : 0,1,2 and 0, 2, 3
      // 0 *-------------------* 1
      //   |\                  |
      //   |   \               |
      //   |      \            |
      //   |         \         |
      //   |            \      |
      //   |               \   |
      //   |                  \|
      // 3 *-------------------* 2

      vertices[0].X = videoClientRectangle.X;
      vertices[0].Y = videoClientRectangle.Y;
      vertices[1].X = videoClientRectangle.Width;
      vertices[1].Y = videoClientRectangle.Y;
      vertices[2].X = videoClientRectangle.Width;
      vertices[2].Y = videoClientRectangle.Height + videoClientRectangle.Y;
      vertices[3].X = videoClientRectangle.X;
      vertices[3].Y = videoClientRectangle.Height + videoClientRectangle.Y;

      // See the allocator source to see why the texture size is not necessary the video size
      vertices[0].Tu = 0.0f;
      vertices[0].Tv = 0.0f;
      vertices[1].Tu = (float) vmrVidSize.Width / (float) vmrTexSize.Width;
      vertices[1].Tv = 0.0f;
      vertices[2].Tu = (float) vmrVidSize.Width / (float) vmrTexSize.Width;
      vertices[2].Tv = (float) vmrVidSize.Height / (float) vmrTexSize.Height;
      vertices[3].Tu = 0.0f;
      vertices[3].Tv = (float) vmrVidSize.Height / (float) vmrTexSize.Height;

      // Fill the vertex buffer
      vertexBuffer.SetData(vertices, 0, LockFlags.Discard);
    }

    private void RenderEnvironment()
    {
      // Set the Render Target (the VMR9 change it)
      device.SetRenderTarget(0, renderTarget);

      // Clear it
      device.Clear(ClearFlags.Target | ClearFlags.ZBuffer, Color.LimeGreen, 1.0f, 0);

      device.BeginScene();

      // Attach the vertex buffer to the Direct3D Device
      device.SetStreamSource(0, vertexBuffer, 0);
      device.VertexFormat = CustomVertex.TransformedTextured.Format;

      // Set the allocator texture as active texture
      device.SetTexture(0, allocator.Texture);

      // Draw the Quad
      device.DrawPrimitives(PrimitiveType.TriangleFan, 0, 2);

      device.EndScene();

      device.SetTexture(0, null);

      // Show what we draw
      device.Present();

      // A "Device Lost" exception can occure. This sample don't manage it...
    }

    protected override void WndProc(ref Message m)
    {
      switch (m.Msg)
      {
        case WM_PAINT:
        {
          UpdateEnvironment();
          RenderEnvironment();
          NativeMethods.InvalidateRect(this.Handle, IntPtr.Zero, 0);
          return;
        }

        case WM_GRAPHNOTIFY:
        {
          IMediaEventEx eventEx = (IMediaEventEx)graphBuilder;

          EventCode evCode;
          IntPtr param1, param2;

          while (eventEx.GetEvent(out evCode, out param1, out param2, 0) == 0)
          {
            eventEx.FreeEventParams(evCode, param1, param2);

            Debug.WriteLine(string.Format("### Event : {0} Param1 : {1} Param2 {2}", evCode.ToString(), param1.ToString(), param2.ToString()));
          }

          break;
        }
      }

      base.WndProc (ref m);
    }

  }
}
