/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Diagnostics;

using DirectShowLib;


namespace DxLogo
{
    /// <summary> Summary description for MainForm. </summary>
    internal class Capture : ISampleGrabberCB, IDisposable
    {
        #region Member variables

        /// <summary> graph builder interface. </summary>
        private IFilterGraph2 m_FilterGraph = null;
        IMediaControl m_mediaCtrl = null;

        /// <summary> Set by async routine when it captures an image </summary>
        private bool m_bRunning = false;

        /// <summary> Dimensions of the image, calculated once in constructor. </summary>
        private int m_videoWidth;
        private int m_videoHeight;
        private int m_stride;

        BitmapData m_bmdLogo = null;
        Bitmap m_Bitmap = null;

#if DEBUG
        // Allow you to "Connect to remote graph" from GraphEdit
        DsROTEntry m_rot = null;
#endif

        #endregion

        #region API

        [DllImport("Kernel32.dll", EntryPoint="RtlMoveMemory")]
        private static extern void CopyMemory(IntPtr Destination, IntPtr Source, [MarshalAs(UnmanagedType.U4)] uint Length);

        #endregion

        /// zero based device index, and some device parms, plus the file name to save to
        public Capture(int iDeviceNum, int iFrameRate, int iWidth, int iHeight, string FileName)
        {
            DsDevice[] capDevices;

            // Get the collection of video devices
            capDevices = DsDevice.GetDevicesOfCat(FilterCategory.VideoInputDevice);

            if (iDeviceNum + 1 > capDevices.Length)
            {
                throw new Exception("No video capture devices found at that index!");
            }

            try
            {
                // Set up the capture graph
                SetupGraph( capDevices[iDeviceNum], iFrameRate, iWidth, iHeight, FileName);
            }
            catch
            {
                Dispose();
                throw;
            }
        }

        /// <summary> release everything. </summary>
        public void Dispose()
        {
            CloseInterfaces();
            if (m_Bitmap != null)
            {
                m_Bitmap.UnlockBits(m_bmdLogo);
                m_Bitmap = null;
                m_bmdLogo = null;
            }
        }
        // Destructor
        ~Capture()
        {
            CloseInterfaces();
        }


        /// <summary> capture the next image </summary>
        public void Start()
        {
            if (!m_bRunning)
            {
                int hr = m_mediaCtrl.Run();
                DsError.ThrowExceptionForHR( hr );

                m_bRunning = true;
            }
        }
        // Pause the capture graph.
        // Running the graph takes up a lot of resources.  Pause it when it
        // isn't needed.
        public void Pause()
        {
            if (m_bRunning)
            {
                int hr = m_mediaCtrl.Pause();
                DsError.ThrowExceptionForHR( hr );

                m_bRunning = false;
            }
        }

        /// <summary> Specify the logo file to write onto each frame </summary>
        public void SetLogo(string fileName)
        {
            lock (this)
            {
                if (fileName.Length > 0)
                {
                    m_Bitmap = new Bitmap(fileName);

                    Rectangle r = new Rectangle(0, 0, m_Bitmap.Width, m_Bitmap.Height);
                    m_bmdLogo = m_Bitmap.LockBits(r, ImageLockMode.ReadOnly, PixelFormat.Format24bppRgb);
                }
                else
                {
                    if (m_Bitmap != null)
                    {
                        m_Bitmap.UnlockBits(m_bmdLogo);

                        m_Bitmap = null;
                        m_bmdLogo = null;
                    }
                }
            }
        }


        /// <summary> build the capture graph for grabber. </summary>
        private void SetupGraph(DsDevice dev, int iFrameRate, int iWidth, int iHeight, string FileName)
        {
            int hr;

            ISampleGrabber sampGrabber = null;
            IBaseFilter baseGrabFlt = null;
            IBaseFilter capFilter = null;
            IBaseFilter muxFilter = null;
            IFileSinkFilter fileWriterFilter = null;
            ICaptureGraphBuilder2 capGraph = null;

            // Get the graphbuilder object
            m_FilterGraph = new FilterGraph() as IFilterGraph2;
            m_mediaCtrl = m_FilterGraph as IMediaControl;

#if DEBUG
            m_rot = new DsROTEntry(m_FilterGraph);
#endif
            try
            {
                // Get the ICaptureGraphBuilder2
                capGraph = (ICaptureGraphBuilder2) new CaptureGraphBuilder2();

                // Get the SampleGrabber interface
                sampGrabber = (ISampleGrabber) new SampleGrabber();

                // Start building the graph
                hr = capGraph.SetFiltergraph( m_FilterGraph );
                DsError.ThrowExceptionForHR( hr );

                // Add the video device
                hr = m_FilterGraph.AddSourceFilterForMoniker(dev.Mon, null, dev.Name, out capFilter);
                DsError.ThrowExceptionForHR( hr );

                baseGrabFlt = (IBaseFilter) sampGrabber;
                ConfigureSampleGrabber(sampGrabber);

                // Add the frame grabber to the graph
                hr = m_FilterGraph.AddFilter( baseGrabFlt, "Ds.NET Grabber" );
                DsError.ThrowExceptionForHR( hr );

                // If any of the default config items are set
                if (iFrameRate + iHeight + iWidth > 0)
                {
                    SetConfigParms(capGraph, capFilter, iFrameRate, iWidth, iHeight);
                }

                // Create a filter for the output avi file
                hr = capGraph.SetOutputFileName(MediaSubType.Avi, FileName, out muxFilter, out fileWriterFilter);
                DsError.ThrowExceptionForHR( hr );

                // Connect everything together
                hr = capGraph.RenderStream( PinCategory.Capture, MediaType.Video, capFilter, baseGrabFlt,  muxFilter);
                DsError.ThrowExceptionForHR( hr );

                // Now that sizes are fixed, store the sizes
                SaveSizeInfo(sampGrabber);
            }
            finally
            {
                if (fileWriterFilter != null)
                {
                    Marshal.ReleaseComObject(fileWriterFilter);
                    fileWriterFilter = null;
                }
                if (muxFilter != null)
                {
                    Marshal.ReleaseComObject(muxFilter);
                    muxFilter = null;
                }
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
            int hr;
            AMMediaType media = new AMMediaType();

            // Set the media type to Video/RBG24
            media.majorType = MediaType.Video;
            media.subType = MediaSubType.RGB24;
            media.formatType = FormatType.VideoInfo;
            hr = sampGrabber.SetMediaType( media );
            DsError.ThrowExceptionForHR( hr );

            DsUtils.FreeAMMediaType(media);
            media = null;

            // Configure the samplegrabber callback
            hr = sampGrabber.SetCallback( this, 1 );
            DsError.ThrowExceptionForHR( hr );
        }

        // Set the Framerate, and video size
        private void SetConfigParms(ICaptureGraphBuilder2 capGraph, IBaseFilter capFilter, int iFrameRate, int iWidth, int iHeight)
        {
            int hr;
            object o;
            AMMediaType media;
            IAMStreamConfig videoStreamConfig;
            IAMVideoControl videoControl = capFilter as IAMVideoControl;

            // Find the stream config interface
            hr = capGraph.FindInterface(
                PinCategory.Capture, MediaType.Video, capFilter, typeof(IAMStreamConfig).GUID, out o );

            videoStreamConfig = o as IAMStreamConfig;
            try
            {
                if (videoStreamConfig == null)
                {
                    throw new Exception("Failed to get IAMStreamConfig");
                }

                hr = videoStreamConfig.GetFormat(out media);
                DsError.ThrowExceptionForHR( hr );

                // copy out the videoinfoheader
                VideoInfoHeader v = new VideoInfoHeader();
                Marshal.PtrToStructure( media.formatPtr, v );

                // if overriding the framerate, set the frame rate
                if (iFrameRate > 0)
                {
                    v.AvgTimePerFrame = 10000000 / iFrameRate;
                }

                // if overriding the width, set the width
                if (iWidth > 0)
                {
                    v.BmiHeader.Width = iWidth;
                }

                // if overriding the Height, set the Height
                if (iHeight > 0)
                {
                    v.BmiHeader.Height = iHeight;
                }

                // Copy the media structure back
                Marshal.StructureToPtr( v, media.formatPtr, false );

                // Set the new format
                hr = videoStreamConfig.SetFormat( media );
                DsError.ThrowExceptionForHR( hr );

                DsUtils.FreeAMMediaType(media);
                media = null;

                // Fix upsidedown video
                if (videoControl != null)
                {
                    VideoControlFlags pCapsFlags;

                    IPin pPin = DsFindPin.ByCategory(capFilter, PinCategory.Capture, 0);
                    hr = videoControl.GetCaps(pPin, out pCapsFlags);
                    DsError.ThrowExceptionForHR( hr );

                    if ((pCapsFlags & VideoControlFlags.FlipVertical) > 0)
                    {
                        hr = videoControl.GetMode(pPin, out pCapsFlags);
                        DsError.ThrowExceptionForHR( hr );

                        hr = videoControl.SetMode(pPin, 0);
                    }
                }
            }
            finally
            {
                Marshal.ReleaseComObject(videoStreamConfig);
            }
        }

        /// <summary> Shut down capture </summary>
        private void CloseInterfaces()
        {
            int hr;

            try
            {
                if( m_mediaCtrl != null )
                {
                    // Stop the graph
                    hr = m_mediaCtrl.Stop();
                    m_mediaCtrl = null;
                    m_bRunning = false;
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
            // Avoid the possibility that someone is calling SetLogo() at this instant
            lock (this)
            {
                if (m_bmdLogo != null)
                {
                    IntPtr ipSource = m_bmdLogo.Scan0;
                    IntPtr ipDest = pBuffer;

                    for (int x=0; x < m_bmdLogo.Height; x++)
                    {
                        CopyMemory(ipDest, ipSource, (uint)m_bmdLogo.Stride);
                        ipDest = (IntPtr)(ipDest.ToInt32() + m_stride);
                        ipSource = (IntPtr)(ipSource.ToInt32() + m_bmdLogo.Stride);
                    }
                }
            }

            return 0;
        }
    }
}
