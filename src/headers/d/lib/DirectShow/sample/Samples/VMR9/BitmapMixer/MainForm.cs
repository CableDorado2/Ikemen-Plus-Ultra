/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Runtime.InteropServices;

using DirectShowLib;

using Microsoft.DirectX;
using Microsoft.DirectX.Direct3D;
using Microsoft.Win32;

namespace DirectShowLib.Sample
{
    public class MainForm : System.Windows.Forms.Form
    {
        private System.Windows.Forms.MainMenu mainMenu;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
        private System.Windows.Forms.MenuItem menuFile;
        private System.Windows.Forms.MenuItem menuFileOpen;
        private System.Windows.Forms.MenuItem menuFileClose;
        private System.Windows.Forms.MenuItem menuItem1;
        private System.Windows.Forms.MenuItem menuFileExit;
        private System.Windows.Forms.MenuItem menuMixer;
        private System.Windows.Forms.MenuItem menuHelp;
        private System.Windows.Forms.MenuItem menuHelpAbout;
        private System.Windows.Forms.MenuItem menuMixerEnable;
        private System.Windows.Forms.MenuItem menuMixerGDI;
        private System.Windows.Forms.MenuItem menuMixerD3D;
    
        private System.ComponentModel.Container components = null;

        private Color colorKey = Color.Violet; // The color use as ColorKey for GDI operations
        private Bitmap colorKeyBitmap; // A RGB bitmap used for GDI operations.
        private Bitmap alphaBitmap; // A ARGB bitmap used for Direct3D operations

        // Managed Direct3D magic number to retrieve unmanaged Direct3D interfaces
        private const int DxMagicNumber = -759872593;
        private Device device = null; // A Managed Direct3D device
        private PresentParameters presentParams;
        private Surface surface = null; // A Direct3D suface filled with alphaBitmap
        private IntPtr unmanagedSurface; // A pointer on the unmanaged surface

        private IFilterGraph2 graphBuilder = null; 
        private IMediaControl mediaControl = null; 
        private IBaseFilter vmr9 = null;
        private IVMRMixerBitmap9 mixerBitmap = null;
        private IVMRWindowlessControl9 windowlessCtrl = null;
        private bool handlersAdded = false; // Needed to remove delegates

        // Menus stuff
        private bool mixerEnabled = true;
        private bool usingGDI = true;

        public MainForm()
        {
            InitializeComponent();

            // We paint the windows ourself
            this.SetStyle(ControlStyles.UserPaint | ControlStyles.AllPaintingInWmPaint, true);

            // Get the colorkeyed bitmap without antialiasing
            colorKeyBitmap = BitmapGenerator.GenerateColorKeyBitmap(colorKey, false);
            // Get the bitmap with alpha transparency
            alphaBitmap = BitmapGenerator.GenerateAlphaBitmap();

            // Init Managed Direct3D
            InitializeDirect3D();
        }

        /// <summary>
        /// Nettoyage des ressources utilisées.
        /// </summary>
        protected override void Dispose( bool disposing )
        {
            if( disposing )
            {
                if (components != null) 
                {
                    components.Dispose();
                }
            }

            // Clean-up DirectShow interfaces
            CloseInterfaces();

            // Dispose Managed Direct3D objects
            surface.Dispose();
            device.Dispose();

            base.Dispose( disposing );
        }

        #region Code généré par le Concepteur Windows Form
        /// <summary>
        /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
        /// le contenu de cette méthode avec l'éditeur de code.
        /// </summary>
        private void InitializeComponent()
        {
            this.mainMenu = new System.Windows.Forms.MainMenu();
            this.menuFile = new System.Windows.Forms.MenuItem();
            this.menuFileOpen = new System.Windows.Forms.MenuItem();
            this.menuFileClose = new System.Windows.Forms.MenuItem();
            this.menuItem1 = new System.Windows.Forms.MenuItem();
            this.menuFileExit = new System.Windows.Forms.MenuItem();
            this.menuMixer = new System.Windows.Forms.MenuItem();
            this.menuMixerEnable = new System.Windows.Forms.MenuItem();
            this.menuMixerGDI = new System.Windows.Forms.MenuItem();
            this.menuMixerD3D = new System.Windows.Forms.MenuItem();
            this.menuHelp = new System.Windows.Forms.MenuItem();
            this.menuHelpAbout = new System.Windows.Forms.MenuItem();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            // 
            // mainMenu
            // 
            this.mainMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                                     this.menuFile,
                                                                                     this.menuMixer,
                                                                                     this.menuHelp});
            // 
            // menuFile
            // 
            this.menuFile.Index = 0;
            this.menuFile.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                                     this.menuFileOpen,
                                                                                     this.menuFileClose,
                                                                                     this.menuItem1,
                                                                                     this.menuFileExit});
            this.menuFile.Text = "File";
            // 
            // menuFileOpen
            // 
            this.menuFileOpen.Index = 0;
            this.menuFileOpen.Text = "Open Clip...";
            this.menuFileOpen.Click += new System.EventHandler(this.menuFileOpen_Click);
            // 
            // menuFileClose
            // 
            this.menuFileClose.Index = 1;
            this.menuFileClose.Text = "Close Clip";
            this.menuFileClose.Click += new System.EventHandler(this.menuFileClose_Click);
            // 
            // menuItem1
            // 
            this.menuItem1.Index = 2;
            this.menuItem1.Text = "-";
            // 
            // menuFileExit
            // 
            this.menuFileExit.Index = 3;
            this.menuFileExit.Text = "Exit";
            this.menuFileExit.Click += new System.EventHandler(this.menuFileExit_Click);
            // 
            // menuMixer
            // 
            this.menuMixer.Enabled = false;
            this.menuMixer.Index = 1;
            this.menuMixer.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                                      this.menuMixerEnable,
                                                                                      this.menuMixerGDI,
                                                                                      this.menuMixerD3D});
            this.menuMixer.Text = "Mixer";
            // 
            // menuMixerEnable
            // 
            this.menuMixerEnable.Checked = true;
            this.menuMixerEnable.Index = 0;
            this.menuMixerEnable.Text = "Enable / Disable";
            this.menuMixerEnable.Click += new System.EventHandler(this.menuMixerEnable_Click);
            // 
            // menuMixerGDI
            // 
            this.menuMixerGDI.Checked = true;
            this.menuMixerGDI.Index = 1;
            this.menuMixerGDI.Text = "Using GDI";
            this.menuMixerGDI.Click += new System.EventHandler(this.menuMixerGDI_Click);
            // 
            // menuMixerD3D
            // 
            this.menuMixerD3D.Index = 2;
            this.menuMixerD3D.Text = "Using Direct3D";
            this.menuMixerD3D.Click += new System.EventHandler(this.menuMixerD3D_Click);
            // 
            // menuHelp
            // 
            this.menuHelp.Index = 2;
            this.menuHelp.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                                     this.menuHelpAbout});
            this.menuHelp.Text = "Help";
            // 
            // menuHelpAbout
            // 
            this.menuHelpAbout.Index = 0;
            this.menuHelpAbout.Text = "About Bitmap mixer...";
            this.menuHelpAbout.Click += new System.EventHandler(this.menuHelpAbout_Click);
            // 
            // openFileDialog
            // 
            this.openFileDialog.Filter = @"Video Files (*.avi; *.qt; *.mov; *.mpg; *.mpeg; *.m1v)|*.avi; *.qt; *.mov; *.mpg; *.mpeg; *.m1v|Audio files (*.wav; *.mpa; *.mp2; *.mp3; *.au; *.aif; *.aiff; *.snd)|*.wav; *.mpa; *.mp2; *.mp3; *.au; *.aif; *.aiff; *.snd|MIDI Files (*.mid, *.midi, *.rmi)|*.mid; *.midi; *.rmi|Image Files (*.jpg, *.bmp, *.gif, *.tga)|*.jpg; *.bmp; *.gif; *.tga|All Files (*.*)|*.*";
            // 
            // MainForm
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.BackColor = System.Drawing.Color.Black;
            this.ClientSize = new System.Drawing.Size(640, 480);
            this.Menu = this.mainMenu;
            this.Name = "MainForm";
            this.Text = "Bitmap mixer";

        }
        #endregion

        private void InitializeDirect3D()
        {
          Device.IsUsingEventHandlers = false;

            // Basic Presentation Parameters...
            presentParams = new PresentParameters();
            presentParams.Windowed = true;
            presentParams.SwapEffect = SwapEffect.Discard;

            // Assume a hardware Direct3D device is available
            // Add MultiThreaded to be safe. Each DirectShow filter runs in a separate thread...
            device = new Device(
                0, 
                DeviceType.Hardware, 
                this, 
                CreateFlags.SoftwareVertexProcessing | CreateFlags.MultiThreaded, 
                presentParams
                );

            // Create a surface from our alpha bitmap
            surface = new Surface(device, alphaBitmap, Pool.SystemMemory);
            // Get the unmanaged pointer
            unmanagedSurface = surface.GetObjectByValue(DxMagicNumber);
        }

        private void CloseInterfaces()
        {
            if (mediaControl != null)
                mediaControl.Stop();

            if (handlersAdded)
                RemoveHandlers();

            if (vmr9 != null)
            {
                Marshal.ReleaseComObject(vmr9);
                vmr9 = null;
                windowlessCtrl = null;
                mixerBitmap = null;
            }

            if (graphBuilder != null)
            {
                Marshal.ReleaseComObject(graphBuilder);
                graphBuilder = null;
                mediaControl = null;
            }

            menuMixer.Enabled = false;
        }

        private void BuildGraph(string fileName)
        {
            int hr = 0;

            try
            {
                graphBuilder = (IFilterGraph2) new FilterGraph();
                mediaControl = (IMediaControl) graphBuilder;

                vmr9 = (IBaseFilter) new VideoMixingRenderer9();

                ConfigureVMR9InWindowlessMode();

                hr = graphBuilder.AddFilter(vmr9, "Video Mixing Renderer 9");
                DsError.ThrowExceptionForHR(hr);

                hr = graphBuilder.RenderFile(fileName, null);
                DsError.ThrowExceptionForHR(hr);

                mixerBitmap = (IVMRMixerBitmap9) vmr9;

                menuMixer.Enabled = true;
                mixerEnabled = true;
                usingGDI = false;
                UpdateMixerMenu();
                SetMixerSettings();
            }
            catch(Exception e)
            {
                CloseInterfaces();
                MessageBox.Show("An error occured during the graph building : \r\n\r\n" + e.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ConfigureVMR9InWindowlessMode()
        {
            int hr = 0;

            IVMRFilterConfig9 filterConfig = (IVMRFilterConfig9) vmr9;

            // Not really needed for VMR9 but don't forget calling it with VMR7
            hr = filterConfig.SetNumberOfStreams(1);
            DsError.ThrowExceptionForHR(hr);

            // Change VMR9 mode to Windowless
            hr = filterConfig.SetRenderingMode(VMR9Mode.Windowless);
            DsError.ThrowExceptionForHR(hr);

            windowlessCtrl = (IVMRWindowlessControl9) vmr9;

            // Set "Parent" window
            hr = windowlessCtrl.SetVideoClippingWindow(this.Handle);
            DsError.ThrowExceptionForHR(hr);

            // Set Aspect-Ratio
            hr = windowlessCtrl.SetAspectRatioMode(VMR9AspectRatioMode.LetterBox);
            DsError.ThrowExceptionForHR(hr);

            // Add delegates for Windowless operations
            AddHandlers();

            // Call the resize handler to configure the output size
            MainForm_ResizeMove(null, null);
        }

        private void SetMixerSettings()
        {
            int hr = 0;
            VMR9AlphaBitmap alphaBmp;
      
            if (!mixerEnabled) // Did the user disable the bitmap ?
            {
                // Get current Alpha Bitmap Parameters
                hr = mixerBitmap.GetAlphaBitmapParameters(out alphaBmp);
                DsError.ThrowExceptionForHR(hr);

                // Disable them
                alphaBmp.dwFlags = VMR9AlphaBitmapFlags.Disable;

                // Update the Alpha Bitmap Parameters
                hr = mixerBitmap.UpdateAlphaBitmapParameters(ref alphaBmp);
                DsError.ThrowExceptionForHR(hr);

                return;
            }

            if (usingGDI)
            {
                // Old school GDI stuff...
                Graphics g = Graphics.FromImage(colorKeyBitmap);
                IntPtr hdc = g.GetHdc();
                IntPtr memDC = NativeMethodes.CreateCompatibleDC(hdc);
                IntPtr hBitmap = colorKeyBitmap.GetHbitmap();
                NativeMethodes.SelectObject(memDC, hBitmap);

                // Set Alpha Bitmap Parameters for using a GDI DC
                alphaBmp = new VMR9AlphaBitmap();
                alphaBmp.dwFlags = VMR9AlphaBitmapFlags.hDC | VMR9AlphaBitmapFlags.SrcColorKey | VMR9AlphaBitmapFlags.FilterMode;
                alphaBmp.hdc = memDC;
                alphaBmp.rSrc = new DsRect(0, 0, colorKeyBitmap.Size.Width, colorKeyBitmap.Size.Height);
                alphaBmp.rDest = GetDestRectangle();
                alphaBmp.clrSrcKey = ColorTranslator.ToWin32(colorKey);
                alphaBmp.dwFilterMode = VMRMixerPrefs.PointFiltering;
                alphaBmp.fAlpha = 0.75f;

                // Set Alpha Bitmap Parameters
                hr = mixerBitmap.SetAlphaBitmap(ref alphaBmp);
                DsError.ThrowExceptionForHR(hr);
      
                // Release GDI handles
                NativeMethodes.DeleteObject(hBitmap);
                NativeMethodes.DeleteDC(memDC);
                g.ReleaseHdc(hdc);
                g.Dispose();
            }
            else // Using a Direct3D surface
            {
                // Set Alpha Bitmap Parameters for using a Direct3D surface
                alphaBmp = new VMR9AlphaBitmap();
                alphaBmp.dwFlags = VMR9AlphaBitmapFlags.EntireDDS;
                alphaBmp.pDDS = unmanagedSurface;
                alphaBmp.rDest = GetDestRectangle();
                alphaBmp.fAlpha = 1.0f;
                // Note : Alpha values from the bitmap are cumulative with the fAlpha parameter.
                // Example : texel alpha = 128 (50%) & fAlpha = 0.5f (50%) = effective alpha : 64 (25%)

                // Set Alpha Bitmap Parameters
                hr = mixerBitmap.SetAlphaBitmap(ref alphaBmp);
                DsError.ThrowExceptionForHR(hr);
            }
        }

        private NormalizedRect GetDestRectangle()
        {
            int hr = 0;
            int width, height, arW, arH;
            NormalizedRect rect = new NormalizedRect();

            hr = windowlessCtrl.GetNativeVideoSize(out width, out height, out arW, out arH);
            DsError.ThrowExceptionForHR(hr);

            // Position the bitmap in the middle of the video stream.
            if (width >= height)
            {
                rect.top = 0.0f;
                rect.left = (1.0f - ((float)height / (float)width)) / 2;
                rect.bottom = 1.0f;
                rect.right = rect.left + (float)height / (float)width;
            }
            else
            {
                rect.top = (1.0f - ((float)width / (float)height)) / 2;
                rect.left = 0.0f;
                rect.right = rect.top + (float)width / (float)height;
                rect.bottom = 1.0f;
            }

            return rect;
        }

        private void UpdateMixerMenu()
        {
            // Just manage the Mixer menu...
            menuMixerEnable.Checked = mixerEnabled;

            menuMixerGDI.Enabled = mixerEnabled;
            menuMixerGDI.Checked = usingGDI;
            menuMixerD3D.Enabled = mixerEnabled;
            menuMixerD3D.Checked = !usingGDI;
        }

        private void AddHandlers()
        {
            // Add handlers for VMR purpose
            this.Paint += new PaintEventHandler(MainForm_Paint); // for WM_PAINT
            this.Resize += new EventHandler(MainForm_ResizeMove); // for WM_SIZE
            this.Move += new EventHandler(MainForm_ResizeMove); // for WM_MOVE
            SystemEvents.DisplaySettingsChanged += new EventHandler(SystemEvents_DisplaySettingsChanged); // for WM_DISPLAYCHANGE
            handlersAdded = true;
        }

        private void RemoveHandlers()
        {
            // remove handlers when they are no more needed
            handlersAdded = false;
            this.Paint -= new PaintEventHandler(MainForm_Paint);
            this.Resize -= new EventHandler(MainForm_ResizeMove);
            this.Move -= new EventHandler(MainForm_ResizeMove);
            SystemEvents.DisplaySettingsChanged -= new EventHandler(SystemEvents_DisplaySettingsChanged);
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

        // Menus click handlers
        private void menuFileOpen_Click(object sender, System.EventArgs e)
        {
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                CloseInterfaces();
                BuildGraph(openFileDialog.FileName);
                RunGraph();
            }
        }

        private void menuFileClose_Click(object sender, System.EventArgs e)
        {
            StopGraph();
            CloseInterfaces();
            this.Invalidate();
        }

        private void menuFileExit_Click(object sender, System.EventArgs e)
        {
            StopGraph();
            CloseInterfaces();
            this.Dispose();
        }

        private void MainForm_Paint(object sender, PaintEventArgs e)
        {
            if (windowlessCtrl != null)
            {
                IntPtr hdc = e.Graphics.GetHdc();
                int hr = windowlessCtrl.RepaintVideo(this.Handle, hdc);
                e.Graphics.ReleaseHdc(hdc);
            }
        }

        private void MainForm_ResizeMove(object sender, EventArgs e)
        {
            if (windowlessCtrl != null)
            {
                int hr = windowlessCtrl.SetVideoPosition(null, DsRect.FromRectangle(this.ClientRectangle));
            }
        }

        private void SystemEvents_DisplaySettingsChanged(object sender, EventArgs e)
        {
            if (windowlessCtrl != null)
            {
                int hr = windowlessCtrl.DisplayModeChanged();
            }
        }

        private void menuMixerEnable_Click(object sender, System.EventArgs e)
        {
            mixerEnabled = !mixerEnabled;
            UpdateMixerMenu();
            SetMixerSettings();
        }

        private void menuMixerGDI_Click(object sender, System.EventArgs e)
        {
            usingGDI = true;
            UpdateMixerMenu();
            SetMixerSettings();
        }

        private void menuMixerD3D_Click(object sender, System.EventArgs e)
        {
            usingGDI = false;
            UpdateMixerMenu();
            SetMixerSettings();
        }

        private void menuHelpAbout_Click(object sender, System.EventArgs e)
        {
            string title = "About Bitmap mixer";
            string text = "DirectShow.Net VMR9 Bitmap mixer\r\nMake use of IVMRBitmapMixer9";

            AboutBox.Show(title, text);
        }

        [STAThread]
        static void Main() 
        {
            using (MainForm form = new MainForm())
            {
                Application.Run(form);
            }
        }

    }
}
