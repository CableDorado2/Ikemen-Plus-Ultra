/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Collections;
using System.Drawing;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;

using DirectShowLib;

using Microsoft.DirectX;
using Microsoft.DirectX.Direct3D;

namespace DirectShowLib.Sample
{
    [ComVisible(true)]
    [ClassInterface(ClassInterfaceType.None)]
    public class Allocator : IVMRSurfaceAllocator9, IVMRImagePresenter9, IDisposable
    {
        private const int E_FAIL = unchecked((int) 0x80004005);
        private const int DxMagicNumber = -759872593;

        private Control parentControl;

        private PresentParameters presentParam;
        private Device device = null;
        private Surface renderTarget = null;
        private AdapterInformation adapterInfo = null;

        private Hashtable textures = null;
        private Hashtable surfaces = null;
        private IntPtr[] unmanagedSurfaces = null;
        private Texture privateTexture = null;
        private Surface privateSurface = null;

        private IVMRSurfaceAllocatorNotify9 vmrSurfaceAllocatorNotify = null;
    
        private PlaneScene scene = null;

        public Allocator(Control control)
        {
            parentControl = control;
            scene = new PlaneScene();

            Device.IsUsingEventHandlers = false;

            CreateDevice();
        }

        ~Allocator()
        {
            Dispose();
        }

        private void CreateDevice()
        {
            adapterInfo = Manager.Adapters.Default;
      
            presentParam = new PresentParameters();
            presentParam.Windowed = true;
            presentParam.PresentFlag = PresentFlag.Video;
            presentParam.SwapEffect = SwapEffect.Copy;
            presentParam.BackBufferFormat = adapterInfo.CurrentDisplayMode.Format;

            device = new Device(
                0, 
                DeviceType.Hardware, 
                parentControl, 
                CreateFlags.SoftwareVertexProcessing | CreateFlags.MultiThreaded,
                presentParam
                );

            renderTarget = device.GetRenderTarget(0);
        }

        private void DeleteSurfaces()
        {
            lock(this)
            {
                if (privateTexture != null)
                {
                    privateTexture.Dispose();
                    privateTexture = null;
                }

                if (privateSurface != null)
                {
                    privateSurface.Dispose();
                    privateSurface = null;
                }

                if (textures != null)
                {
                    foreach (Texture tex in textures.Values)
                    {
                        tex.Dispose();
                    }
                    textures = null;
                }

                if (surfaces != null)
                {
                    foreach (Surface surf in surfaces.Values)
                    {
                        surf.Dispose();
                    }
                    surfaces = null;
                }
            }
        }

        #region Membres de IVMRSurfaceAllocator9

        public int InitializeDevice(IntPtr dwUserID, ref VMR9AllocationInfo lpAllocInfo, ref int lpNumBuffers)
        {
            int width = 1;
            int height = 1;
            float fTU = 1.0f;
            float fTV = 1.0f;

            if (vmrSurfaceAllocatorNotify == null)
            {
                return E_FAIL;
            }

            int hr = 0;

            try
            {
                IntPtr unmanagedDevice = device.GetObjectByValue(DxMagicNumber);
                IntPtr hMonitor = Manager.GetAdapterMonitor(adapterInfo.Adapter);

                hr = vmrSurfaceAllocatorNotify.SetD3DDevice(unmanagedDevice, hMonitor);
                DsError.ThrowExceptionForHR(hr);

                if (device.DeviceCaps.TextureCaps.SupportsPower2)
                {
                    while (width < lpAllocInfo.dwWidth)
                        width = width << 1;
                    while (height < lpAllocInfo.dwHeight)
                        height = height << 1;

                    fTU = (float)(lpAllocInfo.dwWidth) / (float)(width);
                    fTV = (float)(lpAllocInfo.dwHeight) / (float)(height);
                    scene.SetSrcRect(fTU, fTV);

                    lpAllocInfo.dwWidth = width;
                    lpAllocInfo.dwHeight = height;
                }

                // NOTE:
                // we need to make sure that we create textures because
                // surfaces can not be textured onto a primitive.
                lpAllocInfo.dwFlags |= VMR9SurfaceAllocationFlags.TextureSurface;

                DeleteSurfaces();

                unmanagedSurfaces = new IntPtr[lpNumBuffers];

                hr = vmrSurfaceAllocatorNotify.AllocateSurfaceHelper(ref lpAllocInfo, ref lpNumBuffers, unmanagedSurfaces);

                // If we couldn't create a texture surface and 
                // the format is not an alpha format,
                // then we probably cannot create a texture.
                // So what we need to do is create a private texture
                // and copy the decoded images onto it.
                if (hr < 0)
                {
                    DeleteSurfaces();

                    FourCC fcc = new FourCC("0000");

                    // is surface YUV ?
                    if (lpAllocInfo.Format > fcc.ToInt32())
                    {
                        // create the private texture
                        privateTexture = new Texture(
                            device,
                            lpAllocInfo.dwWidth,
                            lpAllocInfo.dwHeight,
                            1,
                            Usage.RenderTarget,
                            adapterInfo.CurrentDisplayMode.Format,
                            Pool.Default
                            );

                        privateSurface = privateTexture.GetSurfaceLevel(0);
                    }

                    lpAllocInfo.dwFlags &= ~VMR9SurfaceAllocationFlags.TextureSurface;
                    lpAllocInfo.dwFlags |= VMR9SurfaceAllocationFlags.OffscreenSurface;

                    unmanagedSurfaces = new IntPtr[lpNumBuffers];

                    hr = vmrSurfaceAllocatorNotify.AllocateSurfaceHelper(ref lpAllocInfo, ref lpNumBuffers, unmanagedSurfaces);
                    if (hr < 0)
                        return hr;
                }
                else
                {
                    surfaces = new Hashtable(unmanagedSurfaces.Length);
                    textures = new Hashtable(unmanagedSurfaces.Length);

                    for (int i = 0; i < lpNumBuffers; i++)
                    {
                        Surface surf = new Surface(unmanagedSurfaces[i]);
                        Texture text = (Texture) surf.GetContainer(new Guid("85C31227-3DE5-4f00-9B3A-F11AC38C18B5"));
                        surfaces.Add(unmanagedSurfaces[i], surf);
                        textures.Add(unmanagedSurfaces[i], text);
                    }
                }

                return scene.Init(device);
            }
            catch(DirectXException e)
            {
                return e.ErrorCode;
            }
            catch
            {
                return E_FAIL;
            }
        }

        public int TerminateDevice(IntPtr dwID)
        {
            DeleteSurfaces();
            return 0;
        }

        public int GetSurface(IntPtr dwUserID, int SurfaceIndex, int SurfaceFlags, out IntPtr lplpSurface)
        {
            lplpSurface = IntPtr.Zero;

            if (SurfaceIndex > unmanagedSurfaces.Length)
                return E_FAIL;

            lock(this)
            {
                lplpSurface = unmanagedSurfaces[SurfaceIndex];
                Marshal.AddRef(lplpSurface);
                return 0;
            }
        }

        public int AdviseNotify(IVMRSurfaceAllocatorNotify9 lpIVMRSurfAllocNotify)
        {
            lock(this)
            {
                vmrSurfaceAllocatorNotify = lpIVMRSurfAllocNotify;

                IntPtr unmanagedDevice = device.GetObjectByValue(DxMagicNumber);
                IntPtr hMonitor = Manager.GetAdapterMonitor(Manager.Adapters.Default.Adapter);

                return vmrSurfaceAllocatorNotify.SetD3DDevice(unmanagedDevice, hMonitor);
            }
        }

        #endregion

        #region Membres de IVMRImagePresenter9

        public int StartPresenting(IntPtr dwUserID)
        {
            lock(this)
            {
                if (device == null)
                    return E_FAIL;

                return 0;
            }
        }

        public int StopPresenting(IntPtr dwUserID)
        {
            return 0;
        }

        public int PresentImage(IntPtr dwUserID, ref VMR9PresentationInfo lpPresInfo)
        {
            int hr = 0;

            lock(this)
            {
                try
                {
                    // if we are in the middle of the display change
                    if(NeedToHandleDisplayChange())
                    {
                        // NOTE: this piece of code is left as a user exercise.  
                        // The D3DDevice here needs to be switched
                        // to the device that is using another adapter
                    }

                    hr = PresentHelper(lpPresInfo);

                    return hr;
                }
                catch (DirectXException e)
                {
                    return e.ErrorCode;
                }
                catch
                {
                    return E_FAIL;
                }
            }
        }

        private int PresentHelper(VMR9PresentationInfo lpPresInfo)
        {
            int hr = 0;

            try 
            {
                device.SetRenderTarget(0, renderTarget);

                if (privateTexture != null)
                {
                    Marshal.AddRef(lpPresInfo.lpSurf);
                    using(Surface surface = new Surface(lpPresInfo.lpSurf))
                    {
                        device.StretchRectangle(
                            surface,
                            new Rectangle(0, 0, surface.Description.Width, surface.Description.Height),
                            privateSurface,
                            new Rectangle(0, 0, privateSurface.Description.Width, privateSurface.Description.Height),
                            TextureFilter.None
                            );
                    }

                    hr = scene.DrawScene(device, privateTexture);
                    if (hr < 0)
                        return hr;
                }
                else
                {
                    if (textures.ContainsKey(lpPresInfo.lpSurf))
                    {
                        hr = scene.DrawScene(device, textures[lpPresInfo.lpSurf] as Texture);
                        if (hr < 0)
                            return hr;
                    }
                    else
                        hr = E_FAIL;
                }

                device.Present();
                return 0;
            }
            catch (DirectXException e)
            {
                return e.ErrorCode;
            }
            catch
            {
                return E_FAIL;
            }
        }

        private bool NeedToHandleDisplayChange()
        {
            if (vmrSurfaceAllocatorNotify == null)
                return false;

            IntPtr currentMonitor = Manager.GetAdapterMonitor(device.CreationParameters.AdapterOrdinal);
            IntPtr defaultMonitor = Manager.GetAdapterMonitor(adapterInfo.Adapter);

            return currentMonitor != defaultMonitor;
        }

        #endregion

        #region Membres de IDisposable

        public void Dispose()
        {
            DeleteSurfaces();
            scene.Dispose();
            device.Dispose();
        }

        #endregion

    }

    public class FourCC
    {
        private int fourCC = 0;

        public FourCC(string fcc)
        {
            if (fcc.Length != 4)
                throw new ArgumentException(fcc + " is not a valid FourCC");

            byte[] asc = Encoding.ASCII.GetBytes(fcc);

            this.fourCC = asc[0];
            this.fourCC |= asc[1] << 8;
            this.fourCC |= asc[2] << 16;
            this.fourCC |= asc[3] << 24;
        }

        public FourCC(char a, char b, char c, char d) : this(new string(new char[] {a, b, c, d}))
        {}

        public FourCC(int fcc)
        {
            this.fourCC = fcc;
        }

        public int ToInt32()
        {
            return this.fourCC;
        }

        public Guid ToMediaSubtype()
        {
            return new Guid(this.fourCC.ToString("X") + "-0000-0010-8000-00AA00389B71");
        }

        public static bool operator ==(FourCC fcc1, FourCC fcc2)
        {
            return fcc1.fourCC == fcc2.fourCC;
        }

        public static bool operator !=(FourCC fcc1, FourCC fcc2)
        {
            return fcc1.fourCC != fcc2.fourCC;
        }

        public override bool Equals(object obj)
        {
            if (!(obj is FourCC))
                return false;

            return (obj as FourCC).fourCC == this.fourCC;
        }

        public override int GetHashCode()
        {
            return this.fourCC.GetHashCode();
        }
    }
}
