/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released
as public domain.  It is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.
*****************************************************************************/

using System;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Security;

using DirectShowLib;
using MediaFoundation;
using GenericSampleSourceFilterClasses;

namespace EVRPlayer
{
    /// <summary>
    /// This abstract class serves as a wrapper for the calls and callbacks used by the
    /// GSSF provider.  It is intended to be generic, and should work for both video and
    /// audio data.
    /// </summary>
    abstract internal class GSSFHandler : MediaFoundation.Misc.COMBase, IDisposable, IGenericSampleCB2
    {
        #region Definitions

        /// <summary>
        /// 100 ns - used by a number of DS methods
        /// </summary>
        protected const int UNIT = 10000000;

        [DllImport("NTDll.dll", ExactSpelling = true, EntryPoint = "RtlCompareMemory"), SuppressUnmanagedCodeSecurity]
        protected static extern int CompareMemory(IntPtr Destination, IntPtr Source, [MarshalAs(UnmanagedType.U4)] int Length);

        #endregion

        /// <summary>
        /// Number of callbacks that returned a positive result
        /// </summary>
        protected volatile int m_iFrameNumber;
        /// <summary>
        /// Current MediaType
        /// </summary>
        protected AMMediaType m_pmt;

        /// <summary>
        /// Public constructor.  Subclasses should call this in their own constructors
        /// </summary>
        public GSSFHandler()
        {
            m_iFrameNumber = 0;
        }

        /// <summary>
        /// Calls the GSSF to specify the media type.  Must be called before pins try to connect.
        /// </summary>
        /// <param name="psc">Pointer to the GSSF</param>
        abstract public void SetMediaType(IGenericSampleConfig2 psc);

        /// <summary>
        /// Set the timestamps on samples.  It is not always required that media samples have
        /// timestamps, so this default implementation does not set one.  To set a timestamp
        /// on the samples, override this method in a child class.
        /// </summary>
        /// <param name="pSample">Pointer to the sample interface</param>
        /// <returns>HRESULT</returns>
        virtual public int SetTimeStamps(IMediaSample pSample)
        {
            return S_Ok;
        }

        /// <summary>
        /// Release all member variables.  Child classes that implement IDisposable should
        /// call base.Dispose();
        /// </summary>
        virtual public void Dispose()
        {
            GC.SuppressFinalize(this);

            if (m_pmt != null)
            {
                DsUtils.FreeAMMediaType(m_pmt);
                m_pmt = null;
            }
        }

        #region IGenericSampleCB2 Members

        /// <summary>
        /// The GSSF calls this method to determine whether a proposed media type is acceptable.  While
        /// the GSSF offers up the value set in SetMediaType, downstream filters may counter-propose
        /// media types that are similar.  This method allows c# programs to accept or reject proposed
        /// alternatives.
        /// This default implementation is based on CMediaType operator== (from the c++ baseclasses).
        /// </summary>
        /// <param name="amt">The proposed alternative media type.  Do NOT call DsUtils.FreeAMMediaType on this</param>
        /// <returns>S_Ok to accept the media type, E_Fail to decline</returns>
        virtual public int CheckMediaType(AMMediaType amt)
        {
            if (
                (amt.majorType == m_pmt.majorType) &&
                (amt.subType == m_pmt.subType) &&
                (amt.formatType == m_pmt.formatType) &&
                (amt.formatSize == m_pmt.formatSize) &&
                ((amt.formatSize == 0) ||
                  (amt.formatPtr != IntPtr.Zero &&
                   m_pmt.formatPtr != IntPtr.Zero &&
                   CompareMemory(amt.formatPtr, m_pmt.formatPtr, amt.formatSize) == amt.formatSize))
                )
            {
                return S_Ok;
            }

            return E_Fail;
        }
        /// <summary>
        /// The callback from the GSSF to populate the sample.  This class isn't intended
        /// to be overridden.  Child classes should instead implement PopulateSample,
        /// which this method calls.
        /// </summary>
        /// <param name="pSample">The sample to populate</param>
        /// <returns>HRESULT</returns>
        public int SampleCallback(IMediaSample pSample)
        {
            int hr;
            IntPtr pData;

            try
            {
                // Get the buffer into which we will copy the data
                hr = pSample.GetPointer(out pData);
                if (hr >= 0)
                {
                    // Find out the amount of space in the buffer
                    int cbData = pSample.GetSize();

                    lock (this)
                    {
                        hr = SetTimeStamps(pSample);
                        if (hr >= 0)
                        {
                            int iRead;

                            // Populate the sample
                            hr = PopulateSample(pData, cbData, out iRead);
                            if (hr >= 0)
                            {
                                if (hr == S_Ok) // 1 == End of stream
                                {
                                    // increment the frame number for next time
                                    m_iFrameNumber++;
                                }
                                else
                                {
                                    m_iFrameNumber = 0;
                                }

                                pSample.SetActualDataLength(iRead);
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
        /// <summary>
        /// Notifies us that the media type has changed.  When CheckMediaType is called, you can't
        /// assume that returning S_Ok means that the specified media type *will* be used.  When
        /// the two pins involved in the connection finally agree on a media type, that media
        /// type will be passed to this method.
        /// Also, if the media *samples* include a media type (see IMediaSample::GetMediaType on
        /// MSDN), the new type is checked with CheckMediaType, then passed to MediaTypeChanged.
        /// </summary>
        /// <param name="amt">The proposed alternative media type.  You must eventually call DsUtils.FreeAMMediaType on this to avoid a leak</param>
        /// <returns>The return value is ignored.  Declining a media type must occur in CheckMediaType</returns>
        virtual public int OnMediaTypeChanged(AMMediaType pmt)
        {
            // Free the old value (if any)
            if (m_pmt != null)
            {
                DsUtils.FreeAMMediaType(m_pmt);
            }
            m_pmt = pmt;

            return S_Ok;
        }

        /// <summary>
        /// Called when the GSSF OnThreadCreate method is called.  See the docs for the baseclasses.
        /// </summary>
        /// <returns>HRESULT</returns>
        virtual public int OnThreadCreate()
        {
            return S_Ok;
        }
        /// <summary>
        /// Called when the GSSF OnThreadDestroy method is called.  See the docs for the baseclasses.
        /// </summary>
        /// <returns>HRESULT</returns>
        virtual public int OnThreadDestroy()
        {
            return S_Ok;
        }

        /// <summary>
        /// Called by the GSSF to determine whether we support seeking
        /// </summary>
        /// <param name="sc">What seek operations we support</param>
        /// <param name="lDuration">Total duration</param>
        /// <returns>HRESULT</returns>
        virtual public int Startup(out AMSeekingSeekingCapabilities sc, out long lDuration)
        {
            sc = AMSeekingSeekingCapabilities.None; // By default, say we support nothing
            lDuration = 0;                          // have no duration

            return E_NotImplemented;                // and don't support seeking
        }

        /// <summary>
        /// Called by the GSSF to notify use that the start point has changed.  See the
        /// baseclasses for ChangeStart.
        /// </summary>
        /// <param name="rtStart">New start time in 100ns units</param>
        /// <returns>HRESULT</returns>
        virtual public int ChangeStart(long rtStart)
        {
            return E_NotImplemented;
        }

        /// <summary>
        /// Called by the GSSF to notify use that the start point has changed.  See the
        /// baseclasses for ChangeStop.
        /// </summary>
        /// <param name="rtStop">New stop time in 100ns units</param>
        /// <returns>S_FALSE if a flush is needed, or an HRESULT</returns>
        virtual public int ChangeStop(long rtStop)
        {
            return E_NotImplemented;
        }

        /// <summary>
        /// Called by the GSSF to get our current position.
        /// </summary>
        /// <param name="lPosition">Our current position in 100ns units</param>
        /// <returns>HRESULT</returns>
        virtual public int GetCurrentPosition(out long lPosition)
        {
            lPosition = 0;

            return E_NotImplemented;
        }

        #endregion

        /// <summary>
        /// This method must be implemented by child classes.  It is called by SampleCallback
        /// and performs the actual work of filling in the sample.
        /// </summary>
        /// <param name="ip">Pointer to the buffer to fill</param>
        /// <param name="iSize">Size of the buffer</param>
        /// <param name="iRead">Returns the number of buffer bytes used</param>
        /// <returns>HRESULT for failure, S_Ok for success, or S_False for end of stream</returns>
        abstract protected int PopulateSample(IntPtr ip, int iSize, out int iRead);
    }

    /// <summary>
    /// This class is a somewhat more specific implementation of GSSFHandler.  It is intended to
    /// work primarily with video streams.
    /// </summary>
    abstract internal class ImageHandler : GSSFHandler, IDisposable
    {
        // How many frames to return before returning End Of Stream
        protected const int MAXFRAMES = 300;

        #region Member Variables

        /// <summary>Frames per second</summary>
        protected int m_Fps;
        /// <summary>Media Subtype</summary>
        protected MediaFoundation.Misc.FourCC m_SubType;
        /// <summary>Video width in pixels</summary>
        protected int m_Width;
        /// <summary>Video height in pixels</summary>
        protected int m_Height;
        /// <summary>Bits per pixel</summary>
        protected short m_bpp;

        /// <summary>Bitmap's stride.  May not always be (m_bpp * m_width) / 8</summary>
        protected int m_Stride;

        /// <summary>The bitmap into which the frame is drawn</summary>
        protected Bitmap m_bitmapOverlay;
        /// <summary>The pointer to the bitmaps's buffer</summary>
        protected IntPtr m_pData;
        /// <summary>The current stream time to write onto the sample</summary>
        protected long m_rtSampleTime;
        /// <summary>The current stream time to write onto the sample</summary>
        protected long m_rtStopTime;

        #endregion

        /// <summary>
        /// Public constructor.  Subclasses should call this in their own constructors
        /// </summary>
        /// <param name="FPS">Frames per second; 30 = 30 FPS</param>
        /// <param name="SubType">Used to construct the AMMediaType and BmiHeader.Compression</param>
        /// <param name="width">Frame width in pixels</param>
        /// <param name="height">Frame height in pixels</param>
        /// <param name="bpp">Bits per pixel</param>
        public ImageHandler(int FPS, MediaFoundation.Misc.FourCC SubType, int width, int height, short bpp)
            : base()
        {
            m_rtSampleTime = 0;
            m_rtStopTime = MAXFRAMES * (UNIT / FPS);

            // The BYTES per pixel of the buffer in which we do our work.  Since this buffer
            // is ARGB, that's 32bpp / 8
            const int WORKINGBPP = (32 / 8);

            // Store the passed in parameters
            m_Fps = FPS;
            m_SubType = SubType;
            m_Height = height;
            m_Width = width;
            m_bpp = bpp;
            m_Stride = (width * bpp) / 8; // This is an estimate, and may be overwritten later

            // Create a buffer to do our drawing in.  It is *much* easier to draw in a Format32bppArgb
            // buffer than a YUYV buffer.  So, we draw in ARGB, and translate to the appropriate format.
            m_pData = Marshal.AllocCoTaskMem(m_Width * m_Height * WORKINGBPP);
            m_bitmapOverlay = new Bitmap(m_Width, m_Height, m_Width * WORKINGBPP, PixelFormat.Format32bppArgb, m_pData);
        }

        /// <summary>
        /// This method calls the GSSF and specifies the media type to use.  This
        /// overridable method builds a generic AMMediaType based on the arguments
        /// passed to the constructor.
        /// </summary>
        /// <param name="psc">Interface pointer to the GSSF</param>
        public override void SetMediaType(IGenericSampleConfig2 psc)
        {
            VideoInfoHeader2 vih2 = new VideoInfoHeader2();

            vih2.BmiHeader = new BitmapInfoHeader();
            vih2.SrcRect = new DsRect(0, 0, m_Width, m_Height);
            vih2.TargetRect = new DsRect(0, 0, m_Width, m_Height);

            // Build a BitmapInfo struct using the parms from the file
            vih2.BmiHeader.Size = Marshal.SizeOf(typeof(BitmapInfoHeader));
            vih2.BmiHeader.Width = m_Width;
            vih2.BmiHeader.Height = m_Height;
            vih2.BmiHeader.Planes = 1;
            vih2.BmiHeader.BitCount = m_bpp;
            vih2.BmiHeader.Compression = (int)m_SubType;
            vih2.BmiHeader.ImageSize = ((vih2.BmiHeader.BitCount * vih2.BmiHeader.Width) / 8) * vih2.BmiHeader.Height;
            vih2.BmiHeader.XPelsPerMeter = 0;
            vih2.BmiHeader.YPelsPerMeter = 0;
            vih2.BmiHeader.ClrUsed = 0;
            vih2.BmiHeader.ClrImportant = 0;
            vih2.BmiHeader.Height *= -1; // The bitmap is a top-down DIB

            vih2.BitRate = (int)(vih2.BmiHeader.ImageSize * 8 * m_Fps);
            vih2.BitErrorRate = 0;
            vih2.AvgTimePerFrame = UNIT / m_Fps;
            vih2.InterlaceFlags = 0;
            vih2.CopyProtectFlags = 0;
            vih2.PictAspectRatioX = 4;
            vih2.PictAspectRatioY = 3;
            vih2.ControlFlags = 0;
            vih2.Reserved2 = 0;

            // Free any previous media type
            if (m_pmt != null)
            {
                DsUtils.FreeAMMediaType(m_pmt);
            }

            m_pmt = new AMMediaType();
            m_pmt.majorType = MediaType.Video;
            m_pmt.fixedSizeSamples = true;
            m_pmt.temporalCompression = false;
            m_pmt.formatType = FormatType.VideoInfo2;
            m_pmt.sampleSize = vih2.BmiHeader.ImageSize;

            int iStride;

            if ((int)m_SubType == 3) // 3 == BI_BITFIELDS
            {
                Debug.Assert(vih2.BmiHeader.BitCount == 32); // 16bit uses a slightly different format

                m_pmt.subType = MediaSubType.ARGB32; // Can't use the compression type to compute the subtype

                m_pmt.formatSize = Marshal.SizeOf(vih2) + (3 * (m_bpp / 8)); // Make room for the bitfields
                m_pmt.formatPtr = Marshal.AllocCoTaskMem(m_pmt.formatSize);

                if (m_bpp != 16)
                {
                    vih2.BmiHeader.Size += 3 * sizeof(int);

                    // One byte per color
                    Marshal.WriteInt32(m_pmt.formatPtr, 0xff); // Red
                    Marshal.WriteInt32(m_pmt.formatPtr, 4, 0xff00); // Green
                    Marshal.WriteInt32(m_pmt.formatPtr, 8, 0xff0000); // Blue
                }
                else
                {
                    // Todo - 555, 565
                }

                iStride = (m_Width * m_bpp) / 8;
            }
            else
            {
                // Calculate the stride from the compression type
                MFExtern.MFGetStrideForBitmapInfoHeader(vih2.BmiHeader.Compression, vih2.BmiHeader.Width, out iStride);

                m_pmt.subType = (Guid)m_SubType;
                m_pmt.formatSize = Marshal.SizeOf(vih2);
                m_pmt.formatPtr = Marshal.AllocCoTaskMem(m_pmt.formatSize);
            }

            m_pmt.sampleSize = iStride * m_Height;
            Marshal.StructureToPtr(vih2, m_pmt.formatPtr, false);

            int hr = psc.SetPinMediaType(m_pmt);
            DsError.ThrowExceptionForHR(hr);
        }

        /// <summary>
        /// Notifies us that the media type has changed.  When CheckMediaType is called, you can't
        /// assume that returning S_Ok means that the specified media type *will* be used.  When
        /// the two pins involved in the connection finally agree on a media type, that media
        /// type will be passed to this method.
        /// Also, if the media *samples* include a media type (see IMediaSample::GetMediaType on
        /// MSDN), the new type is checked with CheckMediaType, then passed to MediaTypeChanged.
        /// </summary>
        /// <param name="amt">The proposed alternative media type.  You must eventually call DsUtils.FreeAMMediaType on this to avoid a leak</param>
        /// <returns>The return value is ignored.  Declining a media type must occur in CheckMediaType</returns>
        override public int OnMediaTypeChanged(AMMediaType pmt)
        {
            // Let the parent do its bit
            base.OnMediaTypeChanged(pmt);

            Debug.Assert(pmt.formatType == FormatType.VideoInfo2);

            // Overwrite the stride based on the new AMMediaType.  This code is essential since
            // sometimes (like when using the EVR), the stride is changed by sending a new
            // AMMediaType on the samples.

            VideoInfoHeader2 vih2 = (VideoInfoHeader2)Marshal.PtrToStructure(m_pmt.formatPtr, typeof(VideoInfoHeader2));

            // Compute the stride
            if (vih2.BmiHeader.Compression == 3)
            {
                // It isn't possible for MFGetStrideForBitmapInfoHeader to handle straight RGB
                // formats (they'd need to rest of the BMIHeader).  Handle that as a special case
                m_Stride = (m_Width * m_bpp) / 8;
            }
            else
            {
                MFExtern.MFGetStrideForBitmapInfoHeader((int)m_SubType, vih2.BmiHeader.Width, out m_Stride);
            }

            return S_Ok;
        }

        /// <summary>
        /// Override OnThreadCreate to ensure sample times are set correctly
        /// </summary>
        /// <returns>HRESULT</returns>
        public override int OnThreadCreate()
        {
            m_rtSampleTime = 0;

            return base.OnThreadCreate();
        }

        /// <summary>
        /// The GSSF calls this method to determine whether a proposed media type is acceptable.  While
        /// the GSSF offers up the value set in SetMediaType, downstream filters may counter-propose
        /// media types that are similar.  This method allows c# programs to accept or reject proposed
        /// alternatives.
        /// </summary>
        /// <param name="amt">The proposed alternative media type.  Do NOT call DsUtils.FreeAMMediaType on this</param>
        /// <returns>S_Ok to accept the media type, a negative value to decline</returns>
        override public int CheckMediaType(AMMediaType amt)
        {
            // The media types sent down from the EVR can be very different from the one
            // we proposed.  I've seen a basic 320x240 get transformed to one where biWidth
            // was 384, but TargetRect & SrcRect are still 320 x 240.  Further, the formatsize
            // is sometimes > 1000 bytes, instead of the ~90 you would expect from VIH2.

            // To "approve" such bizarre constructs requires some creativity.  This code is
            // adapted from the EVRPlayer sample.

            if (amt == null ||
                amt.formatType != FormatType.VideoInfo2 ||
                amt.formatSize < Marshal.SizeOf(typeof(VideoInfoHeader2)))
            {
                return DsResults.E_TypeNotAccepted;
            }

            // ValidateBitmapInfoHeader() - doesn't seem necessary.

            VideoInfoHeader2 pvi = (VideoInfoHeader2)Marshal.PtrToStructure(amt.formatPtr, typeof(VideoInfoHeader2));

            AMMediaType pmtDesired = m_pmt;

            VideoInfoHeader2 vihDesired = (VideoInfoHeader2)Marshal.PtrToStructure(pmtDesired.formatPtr, typeof(VideoInfoHeader2));

            // Check the basics
            if (
                (amt.majorType != pmtDesired.majorType) ||
                (amt.subType != pmtDesired.subType) ||
                // (amt.formatType != pmtDesired.formatType) ||
                (amt.formatSize < pmtDesired.formatSize) ||
                (amt.formatSize == 0) ||
                (amt.formatPtr == IntPtr.Zero)
                )
            {
                return DsResults.E_InvalidMediaType;
            }

            // Check some of the basic VIH2 stuff

            if ((pvi.AvgTimePerFrame != vihDesired.AvgTimePerFrame) ||
                (pvi.InterlaceFlags != vihDesired.InterlaceFlags) ||
                (pvi.PictAspectRatioX != vihDesired.PictAspectRatioX) ||
                (pvi.PictAspectRatioY != vihDesired.PictAspectRatioY) ||
                (pvi.BmiHeader.Compression != vihDesired.BmiHeader.Compression))
            {
                return DsResults.E_InvalidMediaType;
            }

            // Check the image size - If the biWidth has changed, we won't be able to just
            // compare to the value we proposed
            if (pvi.BmiHeader.ImageSize != 0)
            {
                int cbImage;

                if (pvi.BmiHeader.Compression != 3)
                {
                    // ARGH! Create a MediaFoundation.Misc.BitmapInfoHeader from a DirectShowLib.BitmapInfoHeader (even
                    // tho they are the same), so we can call MFCalculateBitmapImageSize
                    MediaFoundation.Misc.BitmapInfoHeader bmi = new MediaFoundation.Misc.BitmapInfoHeader();
                    GCHandle gh = GCHandle.Alloc(pvi.BmiHeader, GCHandleType.Pinned);
                    try
                    {
                        Marshal.PtrToStructure(gh.AddrOfPinnedObject(), bmi);
                    }
                    finally
                    {
                        gh.Free();
                    }

                    bool b;
                    MFExtern.MFCalculateBitmapImageSize(bmi, Marshal.SizeOf(typeof(BitmapInfo)), out cbImage, out b);
                }
                else
                {
                    cbImage = ((m_bpp * m_Width) / 8) * m_Height;
                }

                if (pvi.BmiHeader.ImageSize != cbImage)
                {
                    return DsResults.E_InvalidMediaType;
                }
            }

            // Check the dimensions
            Rectangle rcImage = new Rectangle(0, 0, m_Width, Math.Abs(m_Height));

            // Heights must match.
            if (Math.Abs(pvi.BmiHeader.Height) != Math.Abs(vihDesired.BmiHeader.Height))
            {
                return DsResults.E_InvalidMediaType;
            }

            // If rcTarget is empty, then biWidth must be our original width.
            if (pvi.TargetRect == null || pvi.TargetRect.ToRectangle().IsEmpty)
            {
                if (pvi.BmiHeader.Width != vihDesired.BmiHeader.Width)
                {
                    return DsResults.E_InvalidMediaType;
                }
            }
            // Otherwise, rcTarget must be the same as our image size
            else if (pvi.TargetRect != rcImage)
            {
                return DsResults.E_InvalidMediaType;
            }

            // Finally, biWidth must be at least as wide as our image width.
            if (pvi.BmiHeader.Width < vihDesired.BmiHeader.Width)
            {
                return DsResults.E_InvalidMediaType;
            }

            // Everything checks out.
            return S_Ok;
        }

        /// <summary>
        /// Calculate and populate the timestamps
        /// </summary>
        /// <param name="pSample">The IMediaSample to set the timestamps on</param>
        /// <returns>HRESULT</returns>
        override public int SetTimeStamps(IMediaSample pSample)
        {
            // Time per frame
            int tpf = (UNIT / m_Fps);

            DsLong rtStart = new DsLong(m_rtSampleTime);
            m_rtSampleTime += tpf;

            DsLong rtStop = new DsLong(m_rtSampleTime);

            // Set the times into the sample
            int hr = pSample.SetTime(rtStart, rtStop);

            // Set TRUE on every sample for uncompressed frames
            if (hr >= 0)
            {
                hr = pSample.SetSyncPoint(true);
            }

            return hr;
        }

        /// <summary>
        /// Called by the GSSF to determine whether we support seeking
        /// </summary>
        /// <param name="sc">What seek operations we support</param>
        /// <param name="lDuration">Total duration</param>
        /// <returns>HRESULT</returns>
        public override int Startup(out AMSeekingSeekingCapabilities sc, out long lDuration)
        {
            sc = AMSeekingSeekingCapabilities.CanGetCurrentPos |
                    AMSeekingSeekingCapabilities.CanGetDuration |
                    AMSeekingSeekingCapabilities.CanSeekAbsolute |
                    AMSeekingSeekingCapabilities.CanSeekBackwards |
                    AMSeekingSeekingCapabilities.CanSeekForwards;

            lDuration = MAXFRAMES * (UNIT / m_Fps);

            return S_Ok;
        }

        /// <summary>
        /// Called by the GSSF to notify use that the start point has changed.  See the
        /// baseclasses for ChangeStart.
        /// </summary>
        /// <param name="rtStart">New start time in 100ns units</param>
        /// <returns>HRESULT</returns>
        public override int ChangeStart(long rtStart)
        {
            m_iFrameNumber = (int)(rtStart / (UNIT / m_Fps));
            m_rtSampleTime = 0;

            return S_Ok;
        }

        /// <summary>
        /// Called by the GSSF to notify use that the start point has changed.  See the
        /// baseclasses for ChangeStop.
        /// </summary>
        /// <param name="rtStop">New stop time in 100ns units</param>
        /// <returns>S_FALSE if a flush is needed, or an HRESULT</returns>
        public override int ChangeStop(long rtStop)
        {
            m_rtStopTime = rtStop;

            return S_Ok;
        }

        /// <summary>
        /// Called by the GSSF to get our current position.
        /// </summary>
        /// <param name="lPosition">Our current position in 100ns units</param>
        /// <returns>HRESULT</returns>
        public override int GetCurrentPosition(out long lPosition)
        {
            lPosition = m_iFrameNumber * (UNIT / m_Fps);

            return S_Ok;
        }

        /// <summary>
        /// Release the member variables
        /// </summary>
        override public void Dispose()
        {
            base.Dispose();
            if (m_bitmapOverlay != null)
            {
                Marshal.FreeCoTaskMem(m_pData);
                m_pData = IntPtr.Zero;

                m_bitmapOverlay.Dispose();
                m_bitmapOverlay = null;
            }
        }
    }

    /// <summary>
    /// Class to provide a video stream.  It paints the background various colors
    /// and draws a piegraph section on top of it.
    /// </summary>
    internal class ImageFromPixels : ImageHandler, IDisposable
    {
        #region Member Variables

        /// <summary>Red</summary>
        private int m_r;
        /// <summary>Green</summary>
        private int m_g;
        /// <summary>Blue</summary>
        private int m_b;

        #endregion

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="FPS">Frames per second; 30 = 30 FPS</param>
        /// <param name="SubType">Used to construct the AMMediaType and BmiHeader.Compression</param>
        /// <param name="width">Frame width in pixels</param>
        /// <param name="height">Frame height in pixels</param>
        /// <param name="bpp">Bits per pixel</param>
        public ImageFromPixels(int FPS, MediaFoundation.Misc.FourCC SubType, int width, int height, short bpp)
            : base(FPS, SubType, width, height, bpp)
        {
            // Pick a random starting point for the RGB of the background
            Random r = new Random();
            m_r = r.Next(256);
            m_b = r.Next(256);
            m_g = r.Next(256);
        }
        ~ImageFromPixels()
        {
            Dispose();
        }

        /// <summary>
        /// Override of PopulateSample to fill in the sample data
        /// </summary>
        /// <param name="ip">Pointer to the buffer to fill</param>
        /// <param name="iSize">Size of the buffer</param>
        /// <param name="iRead">Returns the number of buffer bytes used</param>
        /// <returns>HRESULT for failure, S_Ok for success, or S_False for end of stream</returns>
        override protected int PopulateSample(IntPtr ip, int iSize, out int iRead)
        {
            int hr = S_Ok;

            // Send back MAXFRAMES frames, then end the stream
            if (m_rtSampleTime < m_rtStopTime)
            {
                // It is *much* easier to draw in a Format32bppArgb buffer than a YUYV, NV12, etc buffer.  So,
                // we draw in ARGB, then translate it to the appropriate format.

                Graphics g;
                Rectangle r1 = new Rectangle(0, 0, m_Width - 1, m_Height - 1);

                // Get a graphics handle.
                g = Graphics.FromImage(m_bitmapOverlay);

                try
                {
                    // Clear the entire box to the specified color
                    g.Clear(Color.FromArgb(255, m_r % 255, m_g % 255, m_b % 255));

                    // For testing purposes, sometimes it's useful to clear to a solid color
                    //g.Clear(Color.Red);

                    // Draw a pie chart segment on the background, simply because we can
                    g.FillPie(Brushes.BlueViolet, r1, m_iFrameNumber, (m_iFrameNumber + 123) % 360);
                }
                finally
                {
                    g.Dispose();
                }

                // Convert the RGB bitmap to the appropriate output format
                iRead = ConvertImage.ToFormat((int)m_SubType, m_Width, m_Height, m_Stride, m_pData, ip);
                Debug.Assert(iRead <= iSize);

                // Reset for the next call
                m_r += 1;
                m_g += 3;
                m_b += 7;
            }
            else
            {
                hr = S_False; // End of stream
                iRead = 0;
            }

            return hr;
        }
    }

    /// <summary>
    /// Class to provide a video stream.  It creates a transparent box in which it prints the current time.
    /// </summary>
    internal class ImageFromText : ImageHandler, IDisposable
    {
        #region Member Variables

        /// <summary>The font used to write the text</summary>
        private Font m_fontOverlay;

        #endregion

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="FPS">Frames per second; 30 = 30 FPS</param>
        /// <param name="SubType">Used to construct the AMMediaType and BmiHeader.Compression</param>
        /// <param name="width">Frame width in pixels</param>
        /// <param name="height">Frame height in pixels</param>
        /// <param name="bpp">Bits per pixel</param>
        public ImageFromText(int FPS, MediaFoundation.Misc.FourCC SubType, int width, int height, short bpp)
            : base(FPS, SubType, width, height, bpp)
        {
        }
        ~ImageFromText()
        {
            Dispose();
        }

        /// <summary>
        /// Overrides parent class to compute font size for output string
        /// </summary>
        /// <param name="amt">The proposed alternative media type.  You must eventually call DsUtils.FreeAMMediaType on this to avoid a leak</param>
        /// <returns>HRESULT</returns>
        public override int OnMediaTypeChanged(AMMediaType pmt)
        {
            int hr = base.OnMediaTypeChanged(pmt);

            int fSize = 9 * (m_Width / 64);

            if (m_fontOverlay != null)
            {
                // Release the old font
                m_fontOverlay.Dispose();
            }

            m_fontOverlay = new Font("Times New Roman", fSize, FontStyle.Bold, GraphicsUnit.Point);

            return hr;
        }

        /// <summary>
        /// Override of PopulateSample to fill in the sample data
        /// </summary>
        /// <param name="ip">Pointer to the buffer to fill</param>
        /// <param name="iSize">Size of the buffer</param>
        /// <param name="iRead">Returns the number of buffer bytes used</param>
        /// <returns>HRESULT for failure, S_Ok for success, or S_False for end of stream</returns>
        override protected int PopulateSample(IntPtr ip, int iSize, out int iRead)
        {
            int hr = S_Ok;

            // Send back MAXFRAMES frames, then end the stream
            if (m_rtSampleTime < m_rtStopTime)
            {
                // It is *much* easier to draw in a Format32bppArgb buffer than a YUYV buffer.  So,
                // we draw in ARGB, and translate to the appropriate format.

                Graphics g;
                float sLeft;
                float sTop;
                SizeF d;

                // The string to print
                string sString = DateTime.Now.ToString("h:mm:ss");
                sString = m_iFrameNumber.ToString();

                // Get a graphics handle.  We do the drawing on an ARGB32 bitmap, then
                // convert the bitmap to the appropriate format (below)
                g = Graphics.FromImage(m_bitmapOverlay);

                try
                {
                    // Clear the entire box to transparent
                    g.Clear(Color.Transparent);

                    // Prepare to put the specified string on the image
                    g.DrawRectangle(Pens.Blue, 0, 0, m_Width - 1, m_Height - 1);
                    g.DrawRectangle(Pens.Blue, 1, 1, m_Width - 3, m_Height - 3);

                    // Print the string in the box
                    d = g.MeasureString(sString, m_fontOverlay);

                    sLeft = (m_Width - d.Width) / 2;
                    sTop = (m_Height - d.Height) / 2;

                    g.DrawString(sString, m_fontOverlay, Brushes.Red, sLeft, sTop, StringFormat.GenericTypographic);
                }
                finally
                {
                    g.Dispose();
                }

                // Convert the RGB bitmap to the appropriate format
                iRead = ConvertImage.ToFormat((int)m_SubType, m_Width, m_Height, m_Stride, m_pData, ip);
                Debug.Assert(iRead <= iSize);
            }
            else
            {
                hr = S_False; // End of stream
                iRead = 0;
            }

            return hr;
        }

        /// <summary>
        /// Release all member variables.
        /// </summary>
        override public void Dispose()
        {
            if (m_fontOverlay != null)
            {
                m_fontOverlay.Dispose();
                m_fontOverlay = null;
            }
            base.Dispose();
        }
    }
}
