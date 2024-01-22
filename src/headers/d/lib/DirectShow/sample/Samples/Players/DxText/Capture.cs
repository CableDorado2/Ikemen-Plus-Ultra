// Capture
//
// Written by Richard L Rosenheim
//            richard@rosenheims.com
//            May 21, 2005
//
// Based in a large part upon the DxScan and DxPlayer samples by David Wohlferd
//
// Portions Copyright 2005 - Richard L Rosenheim

using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Windows.Forms;

using DirectShowLib;


namespace DxText
{
    /// <summary> Summary description for MainForm. </summary>
    internal class Capture : ISampleGrabberCB, IDisposable
    {
        #region Member variables

        /// <summary> graph builder interface. </summary>
        private IFilterGraph2 m_FilterGraph;

        /// <summary> Dimensions of the image, calculated once in constructor. </summary>
        private int m_videoWidth;
        private int m_videoHeight;
        private int m_stride;
        public int m_Count;

        private string m_String;
        private Bitmap bitmapOverlay;
        private Font fontOverlay;
        private Font transparentFont;
        private SolidBrush transparentBrush;

#if DEBUG
        // Allow you to "Connect to remote graph" from GraphEdit
        DsROTEntry m_rot = null;
#endif

        #endregion

        #region API

        [DllImport("Kernel32.dll", EntryPoint="RtlMoveMemory")]
        private static extern void CopyMemory(IntPtr Destination, IntPtr Source, [MarshalAs(UnmanagedType.U4)] uint Length);

        #endregion

        #region Declarations
        [ComVisible(false), ComImport,
            Guid("e436ebb5-524f-11ce-9f53-0020af0ba770")]
            public class AsyncReader
        {
        }

        // Declare the enum w/o using uint, so it can
        // be used in vb
        [Flags]
            enum WindowStyleFlags
        {
            OVERLAPPED      = 0x00000000,
            POPUP           = -2147483648,
            CHILD           = 0x40000000,
            MINIMIZE        = 0x20000000,
            VISIBLE         = 0x10000000,
            DISABLED        = 0x08000000,
            CLIPSIBLINGS    = 0x04000000,
            CLIPCHILDREN    = 0x02000000,
            MAXIMIZE        = 0x01000000,
            BORDER          = 0x00800000,
            DLGFRAME        = 0x00400000,
            VSCROLL         = 0x00200000,
            HSCROLL         = 0x00100000,
            SYSMENU         = 0x00080000,
            THICKFRAME      = 0x00040000,
            GROUP           = 0x00020000,
            TABSTOP         = 0x00010000,
            MINIMIZEBOX     = 0x00020000,
            MAXIMIZEBOX     = 0x00010000,
        }

        #endregion

        /// <summary> release everything. </summary>
        public void Dispose()
        {
            CloseInterfaces();

            bitmapOverlay.Dispose();
            fontOverlay.Dispose();
            transparentBrush.Dispose();
            transparentFont.Dispose();
        }
        ~Capture()
        {
            CloseInterfaces();

            bitmapOverlay.Dispose();
            fontOverlay.Dispose();
            transparentBrush.Dispose();
            transparentFont.Dispose();
        }

        /// <summary> Use capture device zero, default frame rate and size</summary>
        public Capture(string FileName, string TextString, Control hWin)
        {
            m_Count = 0;
            m_String = TextString;
            _Capture(FileName, hWin);
        }
        /// <summary> capture the next image </summary>
        public void Start()
        {
            IMediaControl mediaCtrl = m_FilterGraph as IMediaControl;

            int hr = mediaCtrl.Run();
            DsError.ThrowExceptionForHR( hr );
        }

        /// <summary>
        ///  Returns an interface to the event notification interface
        /// </summary>
        public IMediaEventEx MediaEventEx
        {
            get
            {
                return (IMediaEventEx) m_FilterGraph;
            }
        }
		
		
        // Internal capture
        private void _Capture(string FileName, Control hWin)
        {
            try
            {
                // Set up the capture graph
                SetupGraph( FileName, hWin);
                SetupBitmap();
            }
            catch
            {
                Dispose();
                throw;
            }
        }

        /// <summary> build the capture graph for grabber. </summary>
        private void SetupGraph(string FileName, Control hWin)
        {
            int hr;

            IBaseFilter ibfRenderer = null;
            ISampleGrabber sampGrabber = null;
            IBaseFilter capFilter = null;
            IPin iPinInFilter = null;
            IPin iPinOutFilter = null;
            IPin iPinInDest = null;

            // Get the graphbuilder object
            m_FilterGraph = new FilterGraph() as IFilterGraph2;
#if DEBUG
            m_rot = new DsROTEntry( m_FilterGraph );
#endif

            try
            {
                // Get the SampleGrabber interface
                sampGrabber = new SampleGrabber() as ISampleGrabber;

                // Add the video source
                hr = m_FilterGraph.AddSourceFilter(FileName, "Ds.NET FileFilter", out capFilter);
                DsError.ThrowExceptionForHR( hr );

                // Hopefully this will be the video pin
                IPin iPinOutSource = DsFindPin.ByDirection(capFilter, PinDirection.Output, 0);

                IBaseFilter baseGrabFlt = sampGrabber as IBaseFilter;
                ConfigureSampleGrabber(sampGrabber);

                iPinInFilter = DsFindPin.ByDirection(baseGrabFlt, PinDirection.Input, 0);
                iPinOutFilter = DsFindPin.ByDirection(baseGrabFlt, PinDirection.Output, 0);

                // Add the frame grabber to the graph
                hr = m_FilterGraph.AddFilter( baseGrabFlt, "Ds.NET Grabber" );
                DsError.ThrowExceptionForHR( hr );

                hr = m_FilterGraph.Connect(iPinOutSource, iPinInFilter);
                DsError.ThrowExceptionForHR( hr );

                // Get the default video renderer
                ibfRenderer = (IBaseFilter) new VideoRendererDefault();

                // Add it to the graph
                hr = m_FilterGraph.AddFilter( ibfRenderer, "Ds.NET VideoRendererDefault" );
                DsError.ThrowExceptionForHR( hr );
                iPinInDest = DsFindPin.ByDirection(ibfRenderer, PinDirection.Input, 0);

                // Connect the graph.  Many other filters automatically get added here
                hr = m_FilterGraph.Connect(iPinOutFilter, iPinInDest);
                DsError.ThrowExceptionForHR( hr );

                SaveSizeInfo(sampGrabber);

                // Set the output window
                IVideoWindow videoWindow = m_FilterGraph as IVideoWindow;
                hr = videoWindow.put_Owner( hWin.Handle );
                DsError.ThrowExceptionForHR( hr );

                hr = videoWindow.put_WindowStyle( WindowStyle.Child | WindowStyle.ClipChildren | WindowStyle.ClipSiblings );
                DsError.ThrowExceptionForHR( hr );

                hr = videoWindow.put_Visible( OABool.True );
                DsError.ThrowExceptionForHR( hr );

                Rectangle rc = hWin.ClientRectangle;
                hr = videoWindow.SetWindowPosition( 0, 0, rc.Right, rc.Bottom );
                DsError.ThrowExceptionForHR( hr );
            }
            finally
            {
                if (capFilter != null)
                {
                    Marshal.ReleaseComObject(capFilter);
                    capFilter = null;
                }
                if (sampGrabber != null)
                {
                    Marshal.ReleaseComObject(sampGrabber);
                    sampGrabber = null;
                }
                if (ibfRenderer != null)
                {
                    Marshal.ReleaseComObject(ibfRenderer);
                    ibfRenderer = null;
                }
                if (iPinInFilter != null)
                {
                    Marshal.ReleaseComObject(iPinInFilter);
                    iPinInFilter = null;
                }
                if (iPinOutFilter != null)
                {
                    Marshal.ReleaseComObject(iPinOutFilter);
                    iPinOutFilter = null;
                }
                if (iPinInDest != null)
                {
                    Marshal.ReleaseComObject(iPinInDest);
                    iPinInDest = null;
                }
            }
        }

        /// <summary> Read and store the properties </summary>
        private void SaveSizeInfo(ISampleGrabber sampGrabber)
        {
            int hr;

            // Get the media type from the SampleGrabber
            AMMediaType media = new AMMediaType();
            hr = sampGrabber.GetConnectedMediaType( media );
            DsError.ThrowExceptionForHR( hr );

            if( (media.formatType != FormatType.VideoInfo) || (media.formatPtr == IntPtr.Zero) )
            {
                throw new NotSupportedException( "Unknown Grabber Media Format" );
            }

            // Grab the size info
            VideoInfoHeader videoInfoHeader = (VideoInfoHeader) Marshal.PtrToStructure( media.formatPtr, typeof(VideoInfoHeader) );
            m_videoWidth = videoInfoHeader.BmiHeader.Width;
            m_videoHeight = videoInfoHeader.BmiHeader.Height;
            m_stride = m_videoWidth * (videoInfoHeader.BmiHeader.BitCount / 8);

            DsUtils.FreeAMMediaType(media);
            media = null;
        }
        /// <summary> Set the options on the sample grabber </summary>
        private void ConfigureSampleGrabber(ISampleGrabber sampGrabber)
        {
            AMMediaType media;
            int hr;

            // Set the media type to Video/RBG24
            media = new AMMediaType();
            media.majorType	= MediaType.Video;
            media.subType = MediaSubType.ARGB32;
            media.formatType = FormatType.VideoInfo;

            hr = sampGrabber.SetMediaType( media );
            DsError.ThrowExceptionForHR( hr );

            DsUtils.FreeAMMediaType(media);
            media = null;

            hr = sampGrabber.SetCallback( this, 1 );
            DsError.ThrowExceptionForHR( hr );
        }

        /// <summary> Shut down capture </summary>
        private void CloseInterfaces()
        {
            int hr;

            try
            {
                if( m_FilterGraph != null )
                {
                    IMediaControl mediaCtrl = m_FilterGraph as IMediaControl;

                    // Stop the graph
                    hr = mediaCtrl.Stop();
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex);
            }

#if DEBUG
            if (m_rot != null)
            {
                m_rot.Dispose();
            }
#endif

            if (m_FilterGraph != null)
            {
                Marshal.ReleaseComObject(m_FilterGraph);
                m_FilterGraph = null;
            }
            GC.Collect();
        }

        /// <summary> sample callback, NOT USED. </summary>
        int ISampleGrabberCB.SampleCB( double SampleTime, IMediaSample pSample )
        {
            Marshal.ReleaseComObject(pSample);
            return 0;
        }

        /// <summary> buffer callback, COULD BE FROM FOREIGN THREAD. </summary>
        int ISampleGrabberCB.BufferCB( double SampleTime, IntPtr pBuffer, int BufferLen )
        {
            Graphics g;
            String s;
            float sLeft;
            float sTop;
            SizeF d;
			
            g = Graphics.FromImage(bitmapOverlay);
            g.Clear(System.Drawing.Color.Transparent);
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias; 

            // Prepare to put the specified string on the image
            g.DrawRectangle(System.Drawing.Pens.Blue, 0, 0, m_videoWidth - 1, m_videoHeight - 1);
            g.DrawRectangle(System.Drawing.Pens.Blue, 1, 1, m_videoWidth - 3, m_videoHeight - 3);

            d = g.MeasureString(m_String, fontOverlay);

            sLeft = (m_videoWidth - d.Width) / 2;
            sTop = (m_videoHeight - d.Height ) / 2;

            g.DrawString(m_String, fontOverlay, System.Drawing.Brushes.Red, 
                sLeft, sTop, System.Drawing.StringFormat.GenericTypographic);

            // Add a frame number in the bottom right
            s = "Frame " + m_Count.ToString();
            d = g.MeasureString(s, transparentFont);
            sLeft = (m_videoWidth - d.Width) - 10;
            sTop = (m_videoHeight - d.Height ) - 10;

            g.DrawString(s, transparentFont, transparentBrush, sLeft, sTop, 
                System.Drawing.StringFormat.GenericTypographic);
            g.Dispose();

            // need to flip the bitmap so it's the same orientation as the
            // video buffer
            bitmapOverlay.RotateFlip(RotateFlipType.RotateNoneFlipY);
			
            // create and copy the video's buffer image to a bitmap
            Bitmap v;
            v = new Bitmap(m_videoWidth, m_videoHeight, m_stride,
                PixelFormat.Format32bppArgb, pBuffer);
            g = Graphics.FromImage(v);
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;

            // draw the overlay bitmap over the video's bitmap
            g.DrawImage(bitmapOverlay, 0, 0, bitmapOverlay.Width, bitmapOverlay.Height);

            // dispose of the various objects
            g.Dispose();
            v.Dispose();

            // Increment frame number.  Done this way, frame are zero indexed.
            m_Count++;

            return 0;
        }

        void SetupBitmap()
        {
            int fSize;

            // scale the font size in some portion to the video image
            fSize = 9 * (m_videoWidth / 64);
            bitmapOverlay = new Bitmap(m_videoWidth, m_videoHeight, 
                System.Drawing.Imaging.PixelFormat.Format32bppArgb); 
            fontOverlay = new Font("Times New Roman", fSize, System.Drawing.FontStyle.Bold, 
                System.Drawing.GraphicsUnit.Point);

            // scale the font size in some portion to the video image
            fSize = 5 * (m_videoWidth / 64);
            transparentFont  = new Font("Tahoma", fSize, System.Drawing.FontStyle.Bold, 
                System.Drawing.GraphicsUnit.Point);
            transparentBrush = new SolidBrush(Color.FromArgb(96, 0, 0, 255));
        }
    }
}
