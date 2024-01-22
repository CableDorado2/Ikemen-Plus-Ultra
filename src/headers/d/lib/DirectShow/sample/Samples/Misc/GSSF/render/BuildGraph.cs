/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

// This code is just to show a couple of ways you could use the 
// GenericSampleSourceFilter.  For a more details discussion, check out the
// readme.txt

// Note that in order to use the MP3 methods, you must download and
/// install Bass.Net (which must be added as a reference) and BASS.DLL
/// from http://www.un4seen.com
//#define USING_BASS_DLL

using System;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Threading;
using System.Windows.Forms;
using System.IO;

using DirectShowLib;
using GenericSampleSourceFilterClasses;

#if USING_BASS_DLL
using Un4seen.Bass;
#endif

namespace DxPlay
{
    /// <summary>
    /// A class to construct a graph using the GenericSampleSourceFilter.
    /// </summary>
    internal class DxPlay : IDisposable
    {
        #region Member variables

        // Event called when the graph stops
        public event EventHandler Completed = null;

        /// <summary>
        /// The class that retrieves the images
        /// </summary>
        private ImageHandler m_ImageHandler;

        /// <summary>
        /// graph builder interfaces
        /// </summary>
        private IFilterGraph2 m_FilterGraph;

        /// <summary>
        /// Another graph builder interface
        /// </summary>
        private IMediaControl m_mediaCtrl;

#if DEBUG
        /// <summary>
        /// Allow you to "Connect to remote graph" from GraphEdit
        /// </summary>
        DsROTEntry m_DsRot;
#endif

        #endregion

        /// <summary>
        /// Release everything
        /// </summary>
        public void Dispose()
        {
            GC.SuppressFinalize(this);
            CloseInterfaces();
        }

        /// <summary>
        /// Alternate cleanup
        /// </summary>
        ~DxPlay()
        {
            CloseInterfaces();
        }

        /// <summary>
        /// Play a video into a window using the GenericSampleSourceFilter as the video source
        /// </summary>
        /// <param name="sPath">Path for the ImageFromFiles class (if that's what we are using)
        /// to use to find images</param>
        /// <param name="hWin">Window to play the video in</param>
        public DxPlay(string sPath, Control hWin)
        {
            try
            {
                // pick one of our image providers
                //m_ImageHandler = new ImageFromFiles(sPath, 8);
                m_ImageHandler = new ImageFromPixels(20);
                //m_ImageHandler = new ImageFromMpg(@"c:\c1.mpg");
                //m_ImageHandler = new ImageFromMP3(@"c:\vss\media\track3.mp3");

                // Set up the graph
                SetupGraph(hWin);
            }
            catch
            {
                Dispose();
                throw;
            }
        }


        /// <summary>
        /// Start playing
        /// </summary>
        public void Start()
        {
            // Create a new thread to process events
            Thread t;
            t = new Thread(new ThreadStart(EventWait));
            t.Name = "Media Event Thread";
            t.Start();

            int hr = m_mediaCtrl.Run();
            DsError.ThrowExceptionForHR( hr );
        }

        /// <summary>
        /// Stop the capture graph.
        /// </summary>
        public void Stop()
        {
            int hr;

            hr = ((IMediaEventSink)m_FilterGraph).Notify(EventCode.UserAbort, IntPtr.Zero, IntPtr.Zero);
            DsError.ThrowExceptionForHR( hr );

            hr = m_mediaCtrl.Stop();
            DsError.ThrowExceptionForHR( hr );
        }


        /// <summary>
        /// Build the filter graph
        /// </summary>
        /// <param name="hWin">Window to draw into</param>
        private void SetupGraph(Control hWin)
        {
            int hr;

            // Get the graphbuilder object
            m_FilterGraph = new FilterGraph() as IFilterGraph2;

            // Get a ICaptureGraphBuilder2 to help build the graph
            ICaptureGraphBuilder2 icgb2 = (ICaptureGraphBuilder2)new CaptureGraphBuilder2() ;

            try
            {
                // Link the ICaptureGraphBuilder2 to the IFilterGraph2
                hr = icgb2.SetFiltergraph(m_FilterGraph);
                DsError.ThrowExceptionForHR( hr );

#if DEBUG
                // Allows you to view the graph with GraphEdit File/Connect
                m_DsRot = new DsROTEntry(m_FilterGraph);
#endif

                // Our data source
                IBaseFilter ipsb = (IBaseFilter)new GenericSampleSourceFilter();

                try
                {
                    // Get the pin from the filter so we can configure it
                    IPin ipin = DsFindPin.ByDirection(ipsb, PinDirection.Output, 0);

                    try
                    {
                        // Configure the pin using the provided BitmapInfo
                        ConfigurePusher((IGenericSampleConfig)ipin);
                    }
                    finally
                    {
                        Marshal.ReleaseComObject(ipin);
                    }

                    // Add the filter to the graph
                    hr = m_FilterGraph.AddFilter(ipsb, "GenericSampleSourceFilter");
                    Marshal.ThrowExceptionForHR( hr );

                    // Connect the filters together, use the default renderer
                    hr = icgb2.RenderStream(null, null, ipsb, null, null);
                    // DsError.ThrowExceptionForHR( hr );  // Ignore any error.  Blindly assume there is no video

                    hr = icgb2.RenderStream(null, MediaType.Audio, ipsb, null, null);
                    // DsError.ThrowExceptionForHR( hr ); // Ignore any error.  Blindly assume there is no audio
                }
                finally
                {
                    Marshal.ReleaseComObject(ipsb);
                }

                // Configure the Video Window
                IVideoWindow videoWindow = m_FilterGraph as IVideoWindow;
                ConfigureVideoWindow(videoWindow, hWin);

                // Grab some other interfaces
                m_mediaCtrl = m_FilterGraph as IMediaControl;
            }
            finally
            {
                Marshal.ReleaseComObject(icgb2);
            }
        }

        /// <summary>
        /// Configure the GenericSampleSourceFilter
        /// </summary>
        /// <param name="ips">The interface to the GenericSampleSourceFilter</param>
        private void ConfigurePusher(IGenericSampleConfig ips)
        {
            int hr;

            m_ImageHandler.SetMediaType(ips);

            // Specify the callback routine to call with each sample
            hr = ips.SetBitmapCB(m_ImageHandler);
            DsError.ThrowExceptionForHR(hr);
        }

        /// <summary>
        /// Configure the video window
        /// </summary>
        /// <param name="videoWindow">Interface of the video renderer</param>
        /// <param name="hWin">Handle of the window to draw into</param>
        private void ConfigureVideoWindow(IVideoWindow videoWindow, Control hWin)
        {
            int hr;

            // Set the output window
            hr = videoWindow.put_Owner( hWin.Handle );
            if (hr >= 0) // If there is video
            {
                // Set the window style
                hr = videoWindow.put_WindowStyle( (WindowStyle.Child | WindowStyle.ClipChildren | WindowStyle.ClipSiblings) );
                DsError.ThrowExceptionForHR( hr );

                // Make the window visible
                hr = videoWindow.put_Visible( OABool.True );
                DsError.ThrowExceptionForHR( hr );

                // Position the playing location
                Rectangle rc = hWin.ClientRectangle;
                hr = videoWindow.SetWindowPosition( 0, 0, rc.Right, rc.Bottom );
                DsError.ThrowExceptionForHR( hr );
            }
        }

        /// <summary>
        /// Shut down graph
        /// </summary>
        private void CloseInterfaces()
        {
            int hr;

            lock (this)
            {
                // Stop the graph
                if( m_mediaCtrl != null )
                {
                    // Stop the graph
                    hr = m_mediaCtrl.Stop();
                    m_mediaCtrl = null;
                }

                if (m_ImageHandler != null)
                {
                    m_ImageHandler.Dispose();
                    m_ImageHandler = null;
                }

#if DEBUG
                if (m_DsRot != null)
                {
                    m_DsRot.Dispose();
                    m_DsRot = null;
                }
#endif

                // Release the graph
                if (m_FilterGraph != null)
                {
                    hr = ((IMediaEventSink)m_FilterGraph).Notify(EventCode.UserAbort, IntPtr.Zero, IntPtr.Zero);

                    Marshal.ReleaseComObject(m_FilterGraph);
                    m_FilterGraph = null;
                }
            }
            GC.Collect();
        }

        /// <summary>
        /// Called on a new thread to process events from the graph.  The thread
        /// exits when the graph finishes.
        /// </summary>
        private void EventWait()
        {
            // Returned when GetEvent is called but there are no events
            const int E_ABORT = unchecked((int)0x80004004);

            int hr;
            IntPtr p1, p2;
            EventCode ec;
            EventCode exitCode = 0;

            IMediaEvent pEvent = (IMediaEvent)m_FilterGraph;

            do
            {
                // Read the event
                for (
                    hr = pEvent.GetEvent(out ec, out p1, out p2, 100);
                    hr >= 0;
                    hr = pEvent.GetEvent(out ec, out p1, out p2, 100)
                    )
                {
                    Debug.WriteLine(ec);
                    switch(ec)
                    {
                            // If the clip is finished playing
                        case EventCode.Complete:
                        case EventCode.ErrorAbort:
                        case EventCode.UserAbort:
                            exitCode = ec;

                            // Release any resources the message allocated
                            hr = pEvent.FreeEventParams(ec, p1, p2);
                            DsError.ThrowExceptionForHR(hr);
                            break;

                        default:
                            // Release any resources the message allocated
                            hr = pEvent.FreeEventParams(ec, p1, p2);
                            DsError.ThrowExceptionForHR(hr);
                            break;
                    }
                }

                // If the error that exited the loop wasn't due to running out of events
                if (hr != E_ABORT)
                {
                    DsError.ThrowExceptionForHR(hr);
                }
            } while (exitCode == 0);

            // Send an event saying we are complete
            if (Completed != null)
            {
                CompletedArgs ca = new CompletedArgs(exitCode);
                Completed(this, ca);
            }

        } // Exit the thread


        public class CompletedArgs : System.EventArgs
        {
            /// <summary>The result of the rendering</summary>
            /// <remarks>
            /// This code will be a member of DirectShowLib.EventCode.  Typically it 
            /// will be EventCode.Complete, EventCode.ErrorAbort or EventCode.UserAbort.
            /// </remarks>
            public EventCode Result;

            /// <summary>
            /// Used to construct an instace of the class.
            /// </summary>
            /// <param name="ec"></param>
            internal CompletedArgs(EventCode ec)
            {
                Result = ec;
            }
        }

    }

    // A generic class to support easily changing between my different sources of data.

    // Note: You DON'T have to use this class, or anything like it.  The key is the SampleCallback
    // routine.  How/where you get your bitmaps is ENTIRELY up to you.  Having SampleCallback call
    // members of this class was just the approach I used to isolate the data handling.
    abstract internal class ImageHandler : IDisposable, IGenericSampleCB
    {
        #region Definitions

        /// <summary>
        /// 100 ns - used by a number of DS methods
        /// </summary>
        protected const long UNIT = 10000000;

        #endregion

        /// <summary>
        /// Number of callbacks that returned a positive result
        /// </summary>
        protected int m_iFrameNumber = 0;

        virtual public void Dispose()
        {
        }

        abstract public void SetMediaType(IGenericSampleConfig psc);
        abstract public int GetImage(int iFrameNumber, IntPtr ip, int iSize, out int iRead);
        virtual public int SetTimeStamps(IMediaSample pSample)
        {
            return 0;
        }

        /// <summary>
        /// Called by the GenericSampleSourceFilter.  This routine populates the MediaSample.
        /// </summary>
        /// <param name="pSample">Pointer to a sample</param>
        /// <returns>0 = success, 1 = end of stream, negative values for errors</returns>
        virtual public int SampleCallback(IMediaSample pSample)
        {
            int hr;
            IntPtr pData;

            try
            {
                // Get the buffer into which we will copy the data
                hr = pSample.GetPointer(out pData);
                if (hr >= 0)
                {
                    // Set TRUE on every sample for uncompressed frames
                    hr = pSample.SetSyncPoint(true);
                    if (hr >= 0)
                    {
                        // Find out the amount of space in the buffer
                        int cbData = pSample.GetSize();

                        hr = SetTimeStamps(pSample);
                        if (hr >= 0)
                        {
                            int iRead;

                            // Get copy the data into the sample
                            hr = GetImage(m_iFrameNumber, pData, cbData, out iRead);
                            if (hr == 0) // 1 == End of stream
                            {
                                pSample.SetActualDataLength(iRead);

                                // increment the frame number for next time
                                m_iFrameNumber++;
                            }
                        }
                    }
                }
            }
            finally
            {
                // Release our pointer the the media sample.  THIS IS ESSENTIAL!  If
                // you don't do this, the graph will stop after about 2 samples.
                Marshal.ReleaseComObject(pSample);
            }

            return hr;
        }


    }

    /// <summary>
    /// Class to provide image data.  Note that the Bitmap class is very easy to use,
    /// but not terribly efficient.  If you aren't getting the performance you need,
    /// replacing that is a good place start.
    /// 
    /// Note that this class assumes that the images to show are all in the same
    /// directory, and are named 00000001.jpg, 00000002.jpg, etc
    /// 
    /// Also, make sure you read the comments on the ImageHandler class.
    /// </summary>
    internal class ImageFromFiles : ImageHandler
    {

        #region Defines

        [DllImport("Kernel32.dll", EntryPoint="RtlMoveMemory")]
        private static extern void CopyMemory(IntPtr Destination, IntPtr Source, int Length);

        /// <summary>
        /// How many frames to show the bitmap in.  Using 1 will return a new
        /// image for each frame.  Setting it to 5 would show the same image
        /// in 5 frames, etc.  So, if you are running at 5 FPS, and you set DIV
        /// to 5, each image will show for 1 second.
        /// </summary>
        private const int DIV = 1;

        #endregion

        #region Member Variables

        /// <summary>
        /// Contains the IntPtr to the raw data
        /// </summary>
        private BitmapData m_bmd;

        /// <summary>
        /// Needed to release the m_bmd member
        /// </summary>
        private Bitmap m_bmp;

        /// <summary>
        /// Path that contains the images
        /// </summary>
        private string m_sPath;

        // Number of frames per second
        private long m_FPS;

        #endregion

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="sPath">The directory that contains the images.</param>
        public ImageFromFiles(string sPath, long FPS)
        {
            m_sPath = sPath;
            m_FPS = UNIT / FPS;
        }

        /// <summary>
        /// Dispose
        /// </summary>
        override public void Dispose()
        {
            // Release any outstanding bitmaps
            if (m_bmp != null)
            {
                m_bmp.UnlockBits(m_bmd);
                m_bmp = null;
                m_bmd = null;
            }
        }

        /// <summary>
        /// Set the Mediatype from a bitmap
        /// </summary>
        override public void SetMediaType(IGenericSampleConfig psc)
        {
            BitmapInfoHeader bmi = new BitmapInfoHeader();

            // Make sure we have an image to get the data from
            if (m_bmp == null)
            {
                int i;
                IntPtr ip = IntPtr.Zero;
                GetImage(0, ip, 0, out i);
            }

            // Build a BitmapInfo struct using the parms from the file
            bmi.Size = Marshal.SizeOf(typeof(BitmapInfoHeader));
            bmi.Width = m_bmd.Width;
            bmi.Height = m_bmd.Height * -1;
            bmi.Planes = 1;
            bmi.BitCount = 32;
            bmi.Compression = 0;
            bmi.ImageSize = (bmi.BitCount / 8) * bmi.Width * bmi.Height;
            bmi.XPelsPerMeter = 0;
            bmi.YPelsPerMeter = 0;
            bmi.ClrUsed = 0;
            bmi.ClrImportant = 0;

            int hr = psc.SetMediaTypeFromBitmap(bmi, m_FPS);
            DsError.ThrowExceptionForHR(hr);
        }

        /// <summary>
        /// Populate the data buffer.  In this class I'm retrieving bitmaps 
        /// from files based on the current frame number.
        /// </summary>
        /// <param name="iFrameNumber">Frame number</param>
        /// <param name="ip">A pointer to the memory to populate with the bitmap data</param>
        /// <param name="iRead">returns the number of parameters read</param>
        /// <returns>0 on success and 1 on end of stream</returns>
        override public int GetImage(int iFrameNumber, IntPtr ip, int iSize, out int iRead)
        {
            int hr = 0;

            if (iFrameNumber % DIV == 0)
            {
                try
                {
                    // Open the next image
                    string sFileName = String.Format(@"{1}\{0:00000000}.jpg", iFrameNumber / DIV + 1, m_sPath);
                    Bitmap bmp = new Bitmap(sFileName);
                    Rectangle r = new Rectangle(0, 0, bmp.Width, bmp.Height);

                    // Release the previous image
                    if (m_bmd != null)
                    {
                        m_bmp.UnlockBits(m_bmd);
                        m_bmp.Dispose();
                    }

                    // Store the pointers
                    m_bmp = bmp;
                    m_bmd = m_bmp.LockBits(r, ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);

                    // Only do the copy if we have a place to put the data
                    if (ip != IntPtr.Zero)
                    {
                        // Copy from the bmd to the MediaSample
                        CopyMemory(ip, m_bmd.Scan0, iSize);
                    }
                }
                catch
                {
                    // Presumably we ran out of files.  Terminate the stream
                    hr = 1;
                }
            }

            iRead = iSize;

            return hr;
        }
        // Calculate the timestamps based on the frame number and the frames per second
        override public int SetTimeStamps(IMediaSample pSample)
        {
            // Calculate the start/end times based on the current frame number
            // and frame rate
            DsLong rtStart = new DsLong(m_iFrameNumber * m_FPS);
            DsLong rtStop  = new DsLong(rtStart + m_FPS);

            // Set the times into the sample
            int hr = pSample.SetTime(rtStart, rtStop);

            return hr;
        }
    }

    /// <summary>
    /// Alternate class to provide image data.  
    /// 
    /// This class just generates pretty colored bitmaps.
    /// 
    /// Also, make sure you read the comments on the ImageHandler class.
    /// </summary>
    internal class ImageFromPixels : ImageHandler
    {
        #region Definitions

        // How many frames to return before returning End Of Stream
        private const int MAXFRAMES = 1000;

        /// <summary>
        /// How many frames to show the bitmap in.  Using 1 will return a new
        /// image for each frame.  Setting it to 5 would show the same image
        /// in 5 frames, etc.
        /// </summary>
        private const int DIV = 1;

        private const int HEIGHT = 240;
        private const int WIDTH = 320;
        private const int BPP = 32;

        #endregion

        #region Member Variables

        // Used to make the pretty picture
        private int m_g = 0;
        private int m_b = 0;

        // Number of frames per second
        private long m_FPS;

        #endregion

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="FPS">Frames per second to use</param>
        public ImageFromPixels(long FPS)
        {
            m_FPS = UNIT / FPS;
            m_b = 211;
            m_g = 197;
        }

        /// <summary>
        /// Set the media type on the IGenericSampleConfig
        /// </summary>
        override public void SetMediaType(IGenericSampleConfig psc)
        {
            BitmapInfoHeader bmi = new BitmapInfoHeader();

            // Build a BitmapInfo struct using the parms from the file
            bmi.Size = Marshal.SizeOf(typeof(BitmapInfoHeader));
            bmi.Width = WIDTH;
            bmi.Height = HEIGHT * -1;
            bmi.Planes = 1;
            bmi.BitCount = BPP;
            bmi.Compression = 0;
            bmi.ImageSize = (bmi.BitCount / 8) * bmi.Width * bmi.Height;
            bmi.XPelsPerMeter = 0;
            bmi.YPelsPerMeter = 0;
            bmi.ClrUsed = 0;
            bmi.ClrImportant = 0;

            int hr = psc.SetMediaTypeFromBitmap(bmi, m_FPS);
            DsError.ThrowExceptionForHR(hr);
        }

        /// <summary>
        /// Populate the data buffer.  In this class I'm just generating bitmaps
        /// of random colors.
        /// 
        /// Using Marshal.Write* is *really* slow.  For decent performance, consider
        /// using pointers and unsafe code.
        /// </summary>
        /// <param name="iFrameNumber">Frame number</param>
        /// <param name="ip">A pointer to the memory to populate with the bitmap data</param>
        /// <returns>0 on success and 1 on end of stream</returns>
        unsafe override public int GetImage(int iFrameNumber, IntPtr ip, int iSize, out int iRead)
        {
            int hr = 0;

            if (iFrameNumber % DIV == 0)
            {
                if (iFrameNumber < MAXFRAMES)
                {
                    Color c = Color.FromArgb(0, ((iFrameNumber * 2) % 255), ((iFrameNumber * 2 + m_g) % 255), ((iFrameNumber * 2 + m_b) % 255));

                    m_g += 3;
                    m_b += 7;

                    // Uncomment this line (and the one inside the loop), and comment out
                    // the Marshal.WriteInt32 to DRASTICALLY improve performance, particularly
                    // under the vs 2005 debugger.
                    //int* bp = (int *)ip.ToPointer();

                    for (int x=0; x < (HEIGHT * WIDTH); x+=1)
                    {
                        //*(bp + x) = c.ToArgb();

                        Marshal.WriteInt32(ip, x * (BPP/8), c.ToArgb());
                    }
                }
                else
                {
                    hr = 1; // End of stream
                }
            }

            iRead = iSize;

            return hr;
        }
        // Calculate the timestamps based on the frame number and the frames per second
        override public int SetTimeStamps(IMediaSample pSample)
        {
            // Calculate the start/end times based on the current frame number
            // and frame rate
            DsLong rtStart = new DsLong(m_iFrameNumber * m_FPS);
            DsLong rtStop  = new DsLong(rtStart + m_FPS);

            // Set the times into the sample
            int hr = pSample.SetTime(rtStart, rtStop);

            return hr;
        }
    }

    /// <summary>
    /// Alternate class to provide image data.  
    /// 
    /// This class reads mpg files (note, the provider won't
    /// work for avi files.  See the GSPF sample for that.
    /// 
    /// Also, make sure you read the comments on the ImageHandler class.
    /// </summary>
    internal class ImageFromMpg : ImageHandler
    {
        #region Definitions

        // Size of the read buffer
        private const int BUFSIZE = 1024 * 256;

        #endregion

        #region Members

        // File stream to read from
        private FileStream m_fs;

        // Binary reader to read data with
        private BinaryReader m_br;

        #endregion

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="sFileName">File name to render</param>
        public ImageFromMpg(string sFileName)
        {
            m_fs = new FileStream(sFileName, FileMode.Open, FileAccess.Read, FileShare.Read);
            m_br = new BinaryReader(m_fs);
        }

        override public void Dispose()
        {
            if (m_br != null)
            {
                m_br.Close();
                m_br = null;
                m_fs = null;
            }
        }


        /// <summary>
        /// Populate the data buffer.  In this class I'm reading raw mpg data 
        /// from a file
        /// </summary>
        /// <param name="iFrameNumber"></param>
        /// <param name="ip"></param>
        /// <param name="iSize"></param>
        /// <param name="iRead"></param>
        /// <returns></returns>
        override public int GetImage(int iFrameNumber, IntPtr ip, int iSize, out int iRead)
        {
            int hr;

            Byte [] b = new byte[iSize];

            // Read the specified number of bytes
            iRead = m_br.Read(b, 0, iSize);

            // Copy the read data into the buffer.  Too bad BinaryReader doesn't have an overload
            // that takes an IntPtr
            Marshal.Copy(b, 0, ip, iSize);

            // A simpleminded check for reading past the eof
            if (iRead > 0 || iSize == 0)
            {
                hr = 0;
            }
            else
            {
                hr = 1;
            }

            return hr;
        }
        /// <summary>
        /// Populate the media type
        /// </summary>
        /// <param name="psc">IGenericSampleConfig onto which we set the media type</param>
        override public void SetMediaType(IGenericSampleConfig psc)
        {
            AMMediaType amt = new AMMediaType();
            amt.majorType = MediaType.Stream;
            amt.subType = MediaSubType.Mpeg2Program;
            amt.formatType = Guid.Empty;

            int hr = psc.SetMediaTypeEx(amt, BUFSIZE);
            DsError.ThrowExceptionForHR(hr);

            DsUtils.FreeAMMediaType(amt);
        }
    }

#if USING_BASS_DLL
    /// <summary>
    /// Alternate class to provide data, this time using sound
    /// instead of video.
    /// 
    /// This class uses mp3 files.  Note that it requires 
    /// BASS.DLL and Bass.Net (which must be added as a reference)
    /// from http://www.un4seen.com
    /// 
    /// Also, make sure you read the comments on the ImageHandler class.
    /// </summary>
    internal class ImageFromMP3 : ImageHandler
    {
        #region Definitions

        private const int BUFSIZE = 1024 * 2;

        #endregion

        #region Members

        private int m_fChan;
        private int m_BytesPerSample;
        private int m_Frequency;
        private int m_Channels;
        private long m_FMediaTime;
        private long m_FSampleTime;

        #endregion

        public ImageFromMP3(string sFileName)
        {
            // Turn off unnecessary thread
            Bass.BASS_SetConfig(BASSConfig.BASS_CONFIG_UPDATEPERIOD, 0);

            // Not sure why we need this since these parms should come
            // from the file.  However, if you don't call it, the
            // CreateFile call fails.
            Bass.BASS_Init(0, 48000, 0, 0, null);

            // Open the MP3, MP2, MP1, OGG, WAV, AIFF or plugin supported file
            m_fChan = Bass.BASS_StreamCreateFile(sFileName, 0, 0, BASSStream.BASS_STREAM_DECODE);
            if (m_fChan == 0)
            {
                throw new Exception("File not found");
            }
        }

        override public void Dispose()
        {
            if (m_fChan != 0)
            {
                Bass.BASS_StreamFree(m_fChan);
                m_fChan = 0;
            }
        }

        /// Populate the data buffer.  In this class I'm getting data from BASS.DLL.
        override public int GetImage(int iFrameNumber, IntPtr ip, int iSize, out int iRead)
        {
            int hr;

            iRead = Bass.BASS_ChannelGetData(m_fChan, ip, BUFSIZE);

            if (iRead > 0)
            {
                hr = 0;
            }
            else
            {
                hr = 1;
            }

            return hr;
        }
        /// <summary>
        /// Set the media type based on values from BASS.DLL
        /// </summary>
        /// <param name="psc">The IGenericSampleConfig onto which we set the mediatype</param>
        override public void SetMediaType(IGenericSampleConfig psc)
        {
            int lFrequency = 0;
            int lVolume = 0;
            int lPan = 0;

            WaveFormatEx w = new WaveFormatEx();
            BASS_CHANNELINFO lInfo = new BASS_CHANNELINFO();

            Bass.BASS_ChannelGetInfo(m_fChan, lInfo);
            if ((lInfo.flags & (int)BASSStream.BASS_SAMPLE_8BITS) == (int)BASSStream.BASS_SAMPLE_8BITS)
            {
                w.wBitsPerSample = 8;
            }
            else 
            {
                w.wBitsPerSample = 16;
            }
            Bass.BASS_ChannelGetAttributes(m_fChan, ref lFrequency, ref lVolume, ref lPan);

            w.cbSize = (short)Marshal.SizeOf(typeof(WaveFormatEx));
            w.nChannels = (short)lInfo.chans;
            w.nSamplesPerSec = lFrequency;
            w.wFormatTag = 1;
            w.nAvgBytesPerSec = w.nSamplesPerSec * w.nBlockAlign;
            m_BytesPerSample = (short)(w.nChannels * (w.wBitsPerSample / 8));
            m_Frequency = lFrequency;
            m_Channels = lInfo.chans;
            w.nBlockAlign = (short)m_BytesPerSample;
            w.nAvgBytesPerSec = w.nSamplesPerSec * w.nBlockAlign;

            AMMediaType amt = new AMMediaType();
            amt.majorType = MediaType.Audio;
            amt.subType = MediaSubType.PCM;
            amt.formatType = FormatType.WaveEx;
            amt.formatPtr = Marshal.AllocCoTaskMem(w.cbSize);
            amt.formatSize = w.cbSize;
            Marshal.StructureToPtr(w, amt.formatPtr, false);

            int hr = psc.SetMediaTypeEx(amt, BUFSIZE);
            DsError.ThrowExceptionForHR(hr);

            DsUtils.FreeAMMediaType(amt);
        }


        // Set the timestamps
        override public int SetTimeStamps(IMediaSample pSample)
        {
            int hr;

            int iRead = pSample.GetActualDataLength();
            long SampleTime = GetTimeFromBytes(iRead);
            long TimeStart = m_FSampleTime;
            m_FSampleTime = m_FSampleTime + SampleTime;
            long TimeStop = m_FSampleTime;
            hr = pSample.SetTime(TimeStart, TimeStop);

            if (hr >= 0)
            {
                TimeStart = m_FMediaTime;
                m_FMediaTime = m_FMediaTime + SampleTime;
                TimeStop = m_FMediaTime;
                hr = pSample.SetMediaTime(TimeStart, TimeStop);
                DsError.ThrowExceptionForHR(hr);
            }

            return hr;
        }

        // Helper function to perform calc
        private long GetTimeFromBytes(long Bytes)
        {
            return Bytes * UNIT / m_BytesPerSample / m_Frequency / m_Channels;
        }
    }
#endif
}
