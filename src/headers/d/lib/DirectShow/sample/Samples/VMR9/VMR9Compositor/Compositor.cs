/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Reflection;
using System.Runtime.InteropServices;

using Microsoft.DirectX;
using Microsoft.DirectX.Direct3D;
using Direct3D = Microsoft.DirectX.Direct3D;

using DirectShowLib;

namespace DirectShowLib.Sample
{
  public class Compositor : IVMRImageCompositor9, IDisposable
  {
    private IntPtr unmanagedDevice;
    private Device device;
    private Sprite sprite;
    private Direct3D.Font d3dFont;
    private Texture spiderTex;
    private Vector3 spiderPos = new Vector3(0.0f, 0.0f, 0.5f);
    private Point spiderMove = new Point(+1, +1);
    private Size spiderSize;

    private System.Drawing.Font gdiFont;


    public Compositor()
    {
      Device.IsUsingEventHandlers = false;
    }

    #region IVMRImageCompositor9 Membres

    public int CompositeImage(IntPtr pD3DDevice, IntPtr pddsRenderTarget, AMMediaType pmtRenderTarget, long rtStart, long rtEnd, int dwClrBkGnd, VMR9VideoStreamInfo[] pVideoStreamInfo, int cStreams)
    {
      try
      {
        // Just in case the filter call CompositeImage before InitCompositionDevice (this sometime occure)
        if (unmanagedDevice != pD3DDevice)
        {
          SetManagedDevice(pD3DDevice);
        }

        // Create a managed Direct3D surface (the Render Target) from the unmanaged pointer.
        // The constructor don't call IUnknown.AddRef but the "destructor" seem to call IUnknown.Release
        // Direct3D seem to be happier with that according to the DirectX log
        Marshal.AddRef(pddsRenderTarget);
        Surface renderTarget = new Surface(pddsRenderTarget);
        SurfaceDescription renderTargetDesc = renderTarget.Description;
        Rectangle renderTargetRect = new Rectangle(0, 0, renderTargetDesc.Width, renderTargetDesc.Height);

        // Same thing for the first video surface
        // WARNING : This Compositor sample only use the video provided to the first pin.
        Marshal.AddRef(pVideoStreamInfo[0].pddsVideoSurface);
        Surface surface = new Surface(pVideoStreamInfo[0].pddsVideoSurface);
        SurfaceDescription surfaceDesc = surface.Description;
        Rectangle surfaceRect = new Rectangle(0, 0, surfaceDesc.Width, surfaceDesc.Height);

        // Get the current time (to write it over the video later)
        TimeSpan timeStart = TimeSpan.FromTicks(rtStart);

        // Set the device's render target (this doesn't seem to be needed)
        device.SetRenderTarget(0, renderTarget);

        // Copy the whole video surface into the render target
        // it's a de facto surface cleaning...
        device.StretchRectangle(surface, surfaceRect, renderTarget, renderTargetRect, TextureFilter.None);

        // sprite's methods need to be called between device.BeginScene and device.EndScene
        device.BeginScene();

        // Init the sprite engine for AlphaBlending operations
        sprite.Begin(SpriteFlags.AlphaBlend | SpriteFlags.DoNotSaveState);

        // Write the current video time (using the sprite)...
        d3dFont.DrawText(sprite, timeStart.ToString(), Point.Empty, Color.White);

        // Compute the spider moves
        if (spiderPos.X == 0) spiderMove.X = +1;
        if (spiderPos.X + spiderSize.Width > renderTargetDesc.Width) spiderMove.X = -1;

        spiderPos.X += spiderMove.X;

        if (spiderPos.Y == 0) spiderMove.Y = +1;
        if (spiderPos.Y + spiderSize.Height > renderTargetDesc.Height) spiderMove.Y = -1;
          
        spiderPos.Y += spiderMove.Y;

        // Draw the spider
        // sprite.Draw2D(spiderTex, Rectangle.Empty, Rectangle.Empty, spiderPos, -1);
        // Draw2D seem buggy. Many thanks to Hitbox for finding that !
        // https://sourceforge.net/forum/message.php?msg_id=4528466
        sprite.Draw(spiderTex, Vector3.Empty, spiderPos, -1);

        // End the spite engine (drawings take place here)
        sprite.Flush();
        sprite.End();

        // End the sceen. 
        device.EndScene();

        // No Present requiered because the rendering is on a render target... 
        // device.Present();

        // Dispose the managed surface
        surface.Dispose();
        surface = null;

        // and the managed render target
        renderTarget.Dispose();
        renderTarget = null;
      }
      catch(Exception e)
      {
        Debug.WriteLine(e.ToString());
      }

      // return a success to the filter
      return 0;
    }

    public int InitCompositionDevice(IntPtr pD3DDevice)
    {
      try
      {
        // Init the compositor with this unamanaged device
        if (unmanagedDevice != pD3DDevice)
        {
          SetManagedDevice(pD3DDevice);
        }
      }
      catch (Exception e)
      {
        Debug.WriteLine(e.ToString());
      }

      // return a success to the filter
      return 0;
    }

    public int SetStreamMediaType(int dwStrmID, AMMediaType pmt, bool fTexture)
    {
      // This method is called many times with pmt == null
      if (pmt == null)
        return 0;

      // This sample don't use this method... but return a success
      return 0;
    }

    public int TermCompositionDevice(IntPtr pD3DDevice)
    {
      try
      {
        // Free the resources each time this method is called
        unmanagedDevice = IntPtr.Zero;
        FreeResources();
      }
      catch (Exception e)
      {
        Debug.WriteLine(e.ToString());
      }

      // return a success to the filter
      return 0;
    }

    #endregion

    #region IDisposable Membres

    public void Dispose()
    {
      // free resources
      FreeResources();
    }

    #endregion

    private void FreeResources()
    {
      if (d3dFont != null)
      {
        d3dFont.Dispose();
        d3dFont = null;
      }

      if (sprite != null)
      {
        sprite.Dispose();
        sprite = null;
      }

      if (device != null)
      {
        device.Dispose();
        device = null;
      }

      if (gdiFont != null)
      {
        gdiFont.Dispose();
        gdiFont = null;
      }
    }

    private void SetManagedDevice(IntPtr unmanagedDevice)
    {
      // Start by freeing everything
      FreeResources();

      // Create a managed Device from the unmanaged pointer
      // The constructor don't call IUnknown.AddRef but the "destructor" seem to call IUnknown.Release
      // Direct3D seem to be happier with that according to the DirectX log
      Marshal.AddRef(unmanagedDevice);
      this.unmanagedDevice = unmanagedDevice;
      device = new Device(unmanagedDevice);

      // Create helper objects to draw over the video
      sprite = new Sprite(device);
      gdiFont = new System.Drawing.Font("Tahoma", 15);
      d3dFont = new Direct3D.Font(device, gdiFont);

      // Load a bitmap (the spider) from embedded resources. This is a png file with alpha transparency
      using (Stream stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("DirectShowLib.Sample.redspider.png"))
      {
        spiderTex = TextureLoader.FromStream(device, stream, D3DX.Default, D3DX.Default, D3DX.Default, D3DX.Default, Usage.None, Format.A8R8G8B8, Pool.Default, Filter.None, Filter.None, 0);
        SurfaceDescription spiderDesc = spiderTex.GetLevelDescription(0);
        spiderSize = new Size(spiderDesc.Width, spiderDesc.Height);
      }
    }

  }
}
