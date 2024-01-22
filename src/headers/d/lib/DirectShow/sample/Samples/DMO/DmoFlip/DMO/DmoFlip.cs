#region license

/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released
as public domain.  It is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.
*****************************************************************************/

#endregion

using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using MediaObjectTemplate;
using DirectShowLib;
using DirectShowLib.DMO;

namespace DmoFlip
{
    /// <exclude></exclude>
    [ComVisible(true), Guid("7EF28FD7-E88F-45bb-9CDD-8A62956F2D75"),
    ClassInterface(ClassInterfaceType.None)]
    public class DmoFlip : IMediaObjectImpl
    {
        #region Declarations

        protected const long MAX_TIME = long.MaxValue;

        // Properties used to register the DMO in the registry
        private const string DMOName = "DmoFlip";
        private static readonly Guid DMOCat = DMOCategory.VideoEffect;
        private const int InputPinCount = 1;
        private const int OutputPinCount = 1;

        // Parameter info
        private const int NumParams = 1;
        private const FlipMode DEFAULTMODE = FlipMode.FlipY;

        [Flags]
        private enum FlipMode
        {
            None = 0,
            FlipY = 1,
            FlipX = 2,
            LAST = 3
        }

        #endregion

        #region APIs

        [DllImport("Kernel32.dll", EntryPoint="RtlMoveMemory")]
        public static extern void CopyMemory(IntPtr Destination, IntPtr Source, [MarshalAs(UnmanagedType.U4)] int Length);

        #endregion

        #region Member Vars

        // Stream info (set once per run)
        private int m_Width, m_Height, m_Stride, m_BPP;

        // Currently processing buffer info (set once per buffer)
        private long m_TimeStamp;
        private long m_TimeLength;
        private IMediaBuffer m_pBuffer;
        private IntPtr m_InBuffer;
        private int m_cbInData;
        private DMOOutputDataBufferFlags m_Flags;

        #endregion

        #region Utility Functions

        /// <summary>
        /// Register the DMO in the registry.  Called by regasm.
        /// </summary>
        /// <param name="t"></param>
        [ComRegisterFunctionAttribute]
        static private void DoRegister(Type t)
        {
            // Tell what media types you are able to support.  This allows
            // the smart connect capability of DS to avoid loading your DMO
            // if it can't handle the stream type.

            // Note that you don't have to register any (but I recommend
            // you do).  Also, you don't have to provide a subtype (use
            // Guid.Empty).  You can negotiate this at run time in
            // InternalCheckInputType.
            DMOPartialMediatype [] pIn = new DMOPartialMediatype[2];
            pIn[0] = new DMOPartialMediatype();
            pIn[0].type = MediaType.Video;
            pIn[0].subtype = MediaSubType.RGB24;

            pIn[1] = new DMOPartialMediatype();
            pIn[1].type = MediaType.Video;
            pIn[1].subtype = MediaSubType.RGB32;

            DMOPartialMediatype [] pOut = new DMOPartialMediatype[2];
            pOut[0] = new DMOPartialMediatype();
            pOut[0].type = MediaType.Video;
            pOut[0].subtype = MediaSubType.RGB24;

            pOut[1] = new DMOPartialMediatype();
            pOut[1].type = MediaType.Video;
            pOut[1].subtype = MediaSubType.RGB32;

            int hr = DMOUtils.DMORegister(
                DMOName,
                typeof(DmoFlip).GUID,
                DMOCat,
                DMORegisterFlags.None,
                pIn.Length,
                pIn,
                pOut.Length,
                pOut
                );
        }


        /// <summary>
        /// Remove the DMO from the registry
        /// </summary>
        /// <param name="t"></param>
        [ComUnregisterFunctionAttribute]
        static private void UnregisterFunction(Type t)
        {
            int hr = DMOUtils.DMOUnregister(typeof(DmoFlip).GUID, DMOCat);
        }


        /// <summary>
        /// Release all info for the most recent input buffer
        /// </summary>
        private void ReleaseInputBuffs()
        {
            if (m_pBuffer != null)
            {
                Marshal.ReleaseComObject(m_pBuffer);
                m_pBuffer = null;
            }
            m_InBuffer = IntPtr.Zero;
            m_cbInData = 0;
            m_Flags = 0;

            // I specifically DON'T release the TimeStamp so we can keep track of where we are
        }

        /// <summary>
        /// Perform the requested flip
        /// </summary>
        /// <param name="pbOutData">Pointer to the output buffer</param>
        /// <param name="cbInData">Size of input buffer</param>
        /// <param name="pbInData">Pointer to input buffer</param>
        /// <param name="BPP">Bytes (not bits) per pixel</param>
        /// <param name="mode">What type of flip to do</param>
        private void DoFlip(IntPtr pbOutData, int cbInData, IntPtr pbInData, int BPP, FlipMode mode)
        {
            switch (mode)
            {
                // No flip, just copy the data
                case FlipMode.None:
                    CopyMemory(pbOutData, pbInData, cbInData);
                    break;

                // Flip along the y axis
                case FlipMode.FlipY:

                    // Point to the last row of the dest and walk backwards
                    pbOutData = (IntPtr)(pbOutData.ToInt32() + cbInData - m_Stride);
                    for (int x=0; x < m_Height; x++)
                    {
                        // Copy a row
                        CopyMemory(pbOutData, pbInData, m_Stride);

                        // Walk forward thru the src, and backward thru the src
                        pbInData = (IntPtr)(pbInData.ToInt32() + m_Stride);
                        pbOutData = (IntPtr)(pbOutData.ToInt32() - m_Stride);
                    }
                    break;

                // Flip along the X axis
                case FlipMode.FlipX:
                    // For each row
                    for (int x=0; x < m_Height; x++)
                    {
                        // Calculate the read/write positions
                        int s = (x * m_Stride);
                        int src = s;
                        int dst = (m_Stride - BPP) + s;

                        // For each pixel in the row
                        for (int y=0; y < m_Width; y ++)
                        {
                            if (BPP == 4)
                            {
                                // Read the pixel, write the pixel
                                int i1 = Marshal.ReadInt32(pbInData, src);
                                Marshal.WriteInt32(pbOutData, dst, i1);
                            }
                            else
                            {
                                // Read the pixel
                                short s1 = Marshal.ReadInt16(pbInData, 0 + src);
                                byte i3 = Marshal.ReadByte(pbInData, 2 + src);

                                // Write the pixel (if you mess up the order here,
                                // you can get very strange looking output!)
                                Marshal.WriteInt16(pbOutData, 0 + dst, s1);
                                Marshal.WriteByte(pbOutData, 2 + dst, i3);
                            }

                            src += BPP;
                            dst -= BPP;
                        }
                    }
                    break;

                // Flip along both the X & Y axis
                case FlipMode.FlipY | FlipMode.FlipX:

                    // For each row
                    for (int x=0; x < m_Height; x++)
                    {
                        // Calculate the read/write positions
                        int src = (x * m_Stride);
                        int dst = (m_Stride - BPP) + (cbInData - ((x+1) * m_Stride));

                        // For each pixel in the row
                        for (int y=0; y < m_Width; y ++)
                        {

                            if (BPP == 4)
                            {
                                int i1 = Marshal.ReadInt32(pbInData, 0 + src);
                                Marshal.WriteInt32(pbOutData, 0 + dst, i1);
                            }
                            else
                            {
                                short s1 = Marshal.ReadInt16(pbInData, 0 + src);
                                byte i3 = Marshal.ReadByte(pbInData, 2 + src);

                                Marshal.WriteInt16(pbOutData, 0 + dst, s1);
                                Marshal.WriteByte(pbOutData, 2 + dst, i3);
                            }

                            src += BPP;
                            dst -= BPP;
                        }
                    }
                    break;
            }
        }

        #endregion

        /// <summary>
        /// The constructor.  The parameters to the base class
        /// describe the number of input and output streams, which
        /// DirectShow calls Pins, followed by the number of parameters
        /// this class supports (can be zero), and the timeformat of those
        /// parameters (should include ParamClass.TimeFormatFlags.Reference
        /// if NumParameters > 0).
        /// </summary>
        public DmoFlip() : base(InputPinCount, OutputPinCount, NumParams, TimeFormatFlags.Reference)
        {
            m_Log.Write("Constructor\r\n");

            // Initialize the data members
            m_Width = 0;
            m_Height = 0;
            m_Stride = 0;
            m_BPP = 0;
            m_TimeStamp = 0;
            m_TimeLength = 0;
            m_cbInData = 0;
            m_Flags = 0;
            m_InBuffer = IntPtr.Zero;
            m_pBuffer = null;

            // Start describing the parameters this DMO supports.  Building this
            // structure (painful as it is) will allow the base class to automatically
            // support IMediaParamInfo & IMediaParams, which allow clients to find
            // out what parameters you support, and to set them.

            // Our parameter has a minimum value of zero, and a max of
            // FlipMode.LAST, and a default of DEFAULTMODE;  See the MSDN
            // docs for MP_PARAMINFO for a description of the other parameters
            ParamInfo p = new ParamInfo();

            p.mopCaps = MPCaps.Jump;
            p.mpdMinValue.vInt = 0;
            p.mpdMaxValue.vInt = (int)FlipMode.LAST;
            p.mpdNeutralValue.vInt = (int)DEFAULTMODE;
            p.mpType = MPType.ENUM;
            p.szLabel = "";
            p.szUnitText = "FlipMode";

            // Parameter #0, using the struct, and a format string (described in MSDN
            // under IMediaParamInfo::GetParamText).  Note that when marshaling strings,
            // .NET will add another \0
            ParamDefine(0, p, "FlipMode\0\0None\0FlipY\0FlipX\0FlipY|FlipX\0");
        }


        #region IMediaObjImpl Members

        /// <summary>
        /// Given a specific AMMediaType, we are asked if we support it
        /// </summary>
        /// <param name="dwInputStreamIndex">Stream number</param>
        /// <param name="pmt">The AMMediaType to check</param>
        /// <returns>S_OK if it is supported, DMOResults.E_InvalidType if not</returns>
        override protected int InternalCheckInputType(int dwInputStreamIndex, AMMediaType pmt)
        {
            int hr;

            //  Check the format is defined
            if (pmt.majorType == MediaType.Video &&
                (pmt.subType == MediaSubType.RGB24 || pmt.subType == MediaSubType.RGB32) &&
                pmt.formatType == FormatType.VideoInfo &&
                pmt.formatPtr != IntPtr.Zero)
            {
                hr = S_OK;
            }
            else
            {
                hr = DMOResults.E_InvalidType;
            }

            return hr;
        }

        /// <summary>
        /// Given a specific AMMediaType, we are asked if we support it
        /// </summary>
        /// <param name="dwOutputStreamIndex">Stream number</param>
        /// <param name="pmt">The AMMediaType to check</param>
        /// <returns>S_OK if it is supported, DMOResults.E_InvalidType if not</returns>
        override protected int InternalCheckOutputType(int dwOutputStreamIndex, AMMediaType pmt)
        {
            int hr;

            AMMediaType pIn = InputType(0);

            // We don't support anything until after our input pin is set
            if (pIn != null)
            {
                // Our output type must be the same as the input type
                if (TypesMatch(pmt, pIn))
                {
                    hr = S_OK;
                }
                else
                {
                    hr = DMOResults.E_InvalidType;
                }
            }
            else
            {
                hr = DMOResults.E_InvalidType;
            }

            return hr;
        }

        /// <summary>
        /// Get the list of supported types.  Note this it is NOT required that any types be returned here.
        /// If no types are returned, connectors just try media types (InternalCheckInputType) until we
        /// accept one.
        /// </summary>
        /// <param name="dwInputStreamIndex">Stream number</param>
        /// <param name="dwTypeIndex">Index into the array of media types we support</param>
        /// <param name="pmt"></param>
        /// <returns>DMOResults.E_NoMoreItems if out of range, else S_OK</returns>
        override protected int InternalGetInputType(int dwInputStreamIndex, int dwTypeIndex, out AMMediaType pmt)
        {
            int hr;

            switch(dwTypeIndex)
            {
                case 0:
                    pmt = new AMMediaType();
                    pmt.majorType = MediaType.Video;
                    pmt.subType = MediaSubType.RGB32;
                    pmt.formatType = FormatType.VideoInfo;
                    hr = S_OK;
                    break;

                case 1:
                    pmt = new AMMediaType();
                    pmt.majorType = MediaType.Video;
                    pmt.subType = MediaSubType.RGB24;
                    pmt.formatType = FormatType.VideoInfo;
                    hr = S_OK;
                    break;

                default:
                    pmt = null;
                    hr = DMOResults.E_NoMoreItems;
                    break;
            }

            return hr;
        }

        /// <summary>
        /// What size (and alignment) do we require of our output buffer?
        /// </summary>
        /// <param name="dwOutputStreamIndex">Stream number</param>
        /// <param name="pcbSize">returns the buffer size needed</param>
        /// <param name="pcbAlignment">Returns the alignment needed (don't use zero!)</param>
        /// <returns>S_OK</returns>
        override protected int InternalGetOutputSizeInfo(int dwOutputStreamIndex, out int pcbSize, out int pcbAlignment)
        {
            pcbAlignment = 1;
            AMMediaType pmt = OutputType(0);

            VideoInfoHeader v = new VideoInfoHeader();
            Marshal.PtrToStructure(pmt.formatPtr, v);

            pcbSize = v.BmiHeader.ImageSize;

            return S_OK;
        }

        /// <summary>
        /// Flush releases all input buffers without processing them
        /// </summary>
        /// <returns>S_OK</returns>
        override protected int InternalFlush()
        {
            InternalDiscontinuity(0);

            // Release buffers
            ReleaseInputBuffs();
            m_TimeStamp = 0;

            return S_OK;
        }

        /// <summary>
        /// Our chance to allocate any storage we may need
        /// </summary>
        /// <returns>S_OK</returns>
        override protected int InternalAllocateStreamingResources()
        {
            //  Reinitialize variables
            InternalDiscontinuity(0);

            AMMediaType pmt = InputType(0);
            VideoInfoHeader v = new VideoInfoHeader();

            Marshal.PtrToStructure(pmt.formatPtr, v);
            m_Width = v.BmiHeader.Width;
            m_Height = v.BmiHeader.Height;
            m_BPP = v.BmiHeader.BitCount / 8;
            m_Stride = v.BmiHeader.Width * m_BPP;

            return S_OK;
        }

        /// <summary>
        /// Accept the input buffers to be processed.  You'll want to read
        /// the MSDN docs on this one.  One point worth noting is that DMO
        /// doesn't require that one complete block be passed at a time.
        /// Picture a case where raw data is being read from a file, and your
        /// DMO is the first to process it.  The chunk of data you receive
        /// might represent one image, 5 images, half an image, etc.  Likewise,
        /// your input could contain both video and audio that you are splitting
        /// into two output streams.
        /// That helps explain some of the parameters you see here and in
        /// InternalProcessOutput.
        /// Note that while DMO doesn't insist on it, for this sample, we
        /// specifically request that only complete buffers be provided.
        /// </summary>
        /// <param name="dwInputStreamIndex">Stream Index</param>
        /// <param name="pBuffer">Interface that holds the input data</param>
        /// <param name="dwFlags">Flags to control input processing</param>
        /// <param name="rtTimestamp">Timestamp of the sample</param>
        /// <param name="rtTimelength">Duration of the sample</param>
        /// <returns>S_FALSE if there is no output, S_OK otherwise</returns>
        override protected int InternalProcessInput(
            int dwInputStreamIndex,
            [In] IMediaBuffer pBuffer,
            DMOInputDataBuffer dwFlags,
            long rtTimestamp,
            long rtTimelength)
        {
            //  Check state - if we already have a buffer, we shouldn't be getting another
            Debug.Assert(m_pBuffer == null);

            int cbData;

            int hr = pBuffer.GetBufferAndLength(out m_InBuffer, out m_cbInData);
            if (hr >= 0)
            {
                // Ignore zero length buffers
                if (m_cbInData > 0)
                {
                    m_pBuffer = pBuffer;

                    // Cast the input flags to become output flags
                    m_Flags = (DMOOutputDataBufferFlags)dwFlags;

                    // If there is a time, store it
                    if (0 == (dwFlags & DMOInputDataBuffer.Time))
                    {
                        m_TimeStamp = MAX_TIME;
                    }
                    else
                    {
                        m_TimeStamp = rtTimestamp;
                    }


                    // If there is a TimeLength, store it
                    if (0 == (dwFlags & DMOInputDataBuffer.TimeLength))
                    {
                        m_TimeLength = -1;
                    }
                    else
                    {
                        m_TimeLength = rtTimelength;
                    }
                    hr = S_OK;
                }
                else
                {
                    ReleaseInputBuffs();
                    hr = S_FALSE;
                }
            }

            return hr;
        }

        /// <summary>
        /// Given output buffers, process the input buffers into the output buffers.
        /// </summary>
        /// <param name="dwFlags">Flags</param>
        /// <param name="cOutputBufferCount">Number of buffers (will be one per output stream)</param>
        /// <param name="pOutputBuffers">The buffers</param>
        /// <param name="pdwStatus">Reserved: 0</param>
        /// <returns>S_FALSE if there is no output, S_OK otherwise</returns>
        override protected int InternalProcessOutput(
            DMOProcessOutput dwFlags,
            int cOutputBufferCount,
            [In, Out] DMOOutputDataBuffer [] pOutputBuffers,
            out int pdwStatus)
        {
            //  Check buffer
            IntPtr pbOutData;
            int cbOutData;
            int cbCurrent;
            int hr = S_OK;

            pdwStatus = 0;

            // No input buffers to process
            if (m_pBuffer != null)
            {
                if (pOutputBuffers[0].pBuffer != null)
                {
                    // Get a pointer to the output buffer
                    hr = pOutputBuffers[0].pBuffer.GetBufferAndLength(out pbOutData, out cbCurrent);
                    if (hr >= 0)
                    {
                        hr = pOutputBuffers[0].pBuffer.GetMaxLength(out cbOutData);
                        if (hr >= 0)
                        {
                            // Make sure we have room
                            if (cbOutData >= cbCurrent + OutputType(0).sampleSize)
                            {
                                // Get the mode for the current timecode
                                MPData m = ParamCalcValueForTime(0, m_TimeStamp);

                                // Process from input to output according to the mode
                                DoFlip((IntPtr)(pbOutData.ToInt32() + cbCurrent), m_cbInData, m_InBuffer, m_BPP, (FlipMode)m.vInt);

                                // Keep the flags & time info from the input
                                pOutputBuffers[0].dwStatus = m_Flags;
                                pOutputBuffers[0].rtTimelength = m_TimeLength;
                                pOutputBuffers[0].rtTimestamp = m_TimeStamp;

                                // Release the buffer.  Since we are always processing one buffer at
                                // a time, we always release on completion.  If our input might be
                                // more than one buffer, we would only release the input when it had
                                // be complete processed.
                                ReleaseInputBuffs();

                                //  Say we've filled the buffer
                                hr = pOutputBuffers[0].pBuffer.SetLength(cbOutData);
                            }
                            else
                            {
                                hr = E_INVALIDARG;
                            }
                        }
                    }
                }
                else
                {
                    // No output buffer provided.  Happens in the DMO Wrapper if one of
                    // the output pins is not connected.
                    pOutputBuffers[0].dwStatus = m_Flags;
                    pOutputBuffers[0].rtTimelength = m_TimeLength;
                    pOutputBuffers[0].rtTimestamp = m_TimeStamp;

                    // Release the buffer.  Since we are always processing one buffer at
                    // a time, we always release on completion.  If our input might be
                    // more than one buffer, we would only release the input when it had
                    // be complete processed.
                    ReleaseInputBuffs();
                }
            }
            else
            {
                hr = S_FALSE;
            }

            return hr;
        }

        /// <summary>
        /// Are we able to accept more input at this time?
        /// </summary>
        /// <param name="dwInputStreamIndex">Stream number</param>
        /// <returns>S_OK if we can, else S_FALSE</returns>
        override protected int InternalAcceptingInput(int dwInputStreamIndex)
        {
            return m_pBuffer == null ? S_OK : S_FALSE;
        }

        override protected long InternalGetCurrentTime()
        {
            return m_TimeStamp;
        }


        #endregion
    }
}
