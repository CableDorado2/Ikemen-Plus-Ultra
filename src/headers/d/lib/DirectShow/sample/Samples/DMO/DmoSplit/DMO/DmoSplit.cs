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

namespace DmoSplit
{
    /// <exclude></exclude>
    [ComVisible(true), Guid("EAB6CBA9-78DD-4ae4-9A69-1CE1C55369F6"),
    ClassInterface(ClassInterfaceType.None)]
    public class DmoSplit : IMediaObjectImpl
    {
        #region Declarations

        protected const long MAX_TIME = long.MaxValue;

        // Properties used to register the DMO in the registry
        private const string DMOName = "DmoSplit";
        private static readonly Guid DMOCat = DMOCategory.AudioEffect;
        private const int InputPinCount = 1;
        private const int OutputPinCount = 2;

        // Parameter info
        private const int NumParams = 0;

        #endregion

        #region APIs

        [DllImport("Kernel32.dll", EntryPoint="RtlMoveMemory")]
        public static extern void CopyMemory(IntPtr Destination, IntPtr Source, [MarshalAs(UnmanagedType.U4)] int Length);

        #endregion

        #region Member Vars

        // Number of bits per sample (8 or 16)
        private short m_Bits;

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
            DMOPartialMediatype [] pIn = new DMOPartialMediatype[1];
            pIn[0] = new DMOPartialMediatype();
            pIn[0].type = MediaType.Audio;
            pIn[0].subtype = MediaSubType.PCM;

            DMOPartialMediatype [] pOut = new DMOPartialMediatype[1];
            pOut[0] = new DMOPartialMediatype();
            pOut[0].type = MediaType.Audio;
            pOut[0].subtype = MediaSubType.PCM;

            int hr = DMOUtils.DMORegister(
                DMOName,
                typeof(DmoSplit).GUID,
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
            int hr = DMOUtils.DMOUnregister(typeof(DmoSplit).GUID, DMOCat);
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
        /// Perform the split
        /// </summary>
        /// <param name="cbInData">Number of bytes to process</param>
        /// <param name="pbInData">Pointer to input buffer</param>
        /// <param name="pbOutData1">Pointer to the output buffer for stream 1</param>
        /// <param name="pbOutData2">Pointer to the output buffer for stream 2</param>
        /// <remarks>
        /// This routine would benefit greatly from being re-written in unsafe mode
        /// </remarks>
        private void DoSplit(
            int cbInData, 
            IntPtr pbInData, 
            IntPtr pbOutData1,
            IntPtr pbOutData2
            )
        {
            if (m_Bits == 16)
            {
                for (int x=0; x < cbInData; x+=4)
                {
                    if (pbOutData1 != IntPtr.Zero)
                    {
                        Marshal.WriteInt16(pbOutData1, x / 2, Marshal.ReadInt16(pbInData, x));
                    }
                    if (pbOutData2 != IntPtr.Zero)
                    {
                        Marshal.WriteInt16(pbOutData2, x / 2, Marshal.ReadInt16(pbInData, x + 2));
                    }
                }
            }
            else
            {
                for (int x=0; x < cbInData; x+=2)
                {
                    if (pbOutData1 != IntPtr.Zero)
                    {
                        Marshal.WriteByte(pbOutData1, x, Marshal.ReadByte(pbInData, x));
                    }
                    if (pbOutData2 != IntPtr.Zero)
                    {
                        Marshal.WriteByte(pbOutData2, x, Marshal.ReadByte(pbInData, x + 1));
                    }
                }
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
        public DmoSplit() : base(InputPinCount, OutputPinCount, NumParams, TimeFormatFlags.Reference)
        {
            m_Log.Write("Constructor\r\n");

            // Initialize the data members
            m_TimeStamp = 0;
            m_TimeLength = 0;
            m_cbInData = 0;
            m_Flags = 0;
            m_InBuffer = IntPtr.Zero;
            m_pBuffer = null;
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
            if (pmt.majorType == MediaType.Audio &&
                (pmt.subType == MediaSubType.PCM) && 
                pmt.formatType == FormatType.WaveEx &&
                pmt.formatPtr != IntPtr.Zero)
            {
                WaveFormatEx wav = new WaveFormatEx();
                Marshal.PtrToStructure(pmt.formatPtr, wav);

                if (wav.nChannels == 2 && (wav.wBitsPerSample == 8 || wav.wBitsPerSample == 16))
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
                // Match the types
                if (pmt.majorType  == MediaType.Audio &&
                    pmt.subType    == MediaSubType.PCM &&
                    pmt.formatType == FormatType.WaveEx)
                {
                    // Parse out the wav structure from the input stream
                    // and the proposed output stream
                    WaveFormatEx wavOut = new WaveFormatEx();
                    Marshal.PtrToStructure(pmt.formatPtr, wavOut);

                    WaveFormatEx wavIn = new WaveFormatEx();
                    Marshal.PtrToStructure(pIn.formatPtr, wavIn);

                    // Output must be one channel, which means half the
                    // nAvgBytesPerSec and half the nBlockAlign
                    if (wavOut.nChannels == 1 && 
                        wavOut.wBitsPerSample == wavIn.wBitsPerSample &&
                        wavOut.nAvgBytesPerSec == wavIn.nAvgBytesPerSec / 2 &&
                        wavOut.nBlockAlign == wavIn.nBlockAlign / 2)
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
        /// <param name="pmt">The media type</param>
        /// <returns>DMOResults.E_NoMoreItems if out of range, else S_OK</returns>
        override protected int InternalGetInputType(int dwInputStreamIndex, int dwTypeIndex, out AMMediaType pmt)
        {
            int hr;

            switch(dwTypeIndex)
            {
                case 0:
                    pmt = new AMMediaType();
                    pmt.majorType = MediaType.Audio;
                    pmt.subType = MediaSubType.PCM;
                    pmt.formatType = FormatType.WaveEx;
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
        /// Report the list of supported types
        /// </summary>
        /// <param name="dwOutputStreamIndex">Output stream number</param>
        /// <param name="dwTypeIndex">Zero based index into array of supported types</param>
        /// <param name="pmt">Supported type</param>
        /// <returns>S_OK for successful completion or DMOResults.E_NoMoreItems if dwTypeIndex is
        /// out of range.</returns>
        override protected int InternalGetOutputType(int dwOutputStreamIndex, int dwTypeIndex, out AMMediaType pmt)
        {
            int hr;
            pmt = InputType(0);

            // If the input type hasn't been set, we can't describe out output
            if (pmt != null)
            {
                // Only one possible value
                if (dwTypeIndex == 0)
                {
                    // Copy the input type
                    pmt = MoCloneMediaType(pmt);

                    // Parse out the wave struct
                    WaveFormatEx wav = new WaveFormatEx();
                    Marshal.PtrToStructure(pmt.formatPtr, wav);

                    // Adjust the struct for half as many channels
                    wav.nChannels = 1;
                    wav.nBlockAlign /= 2;
                    wav.nAvgBytesPerSec /= 2;

                    // Put the struct back
                    Marshal.StructureToPtr(wav, pmt.formatPtr, false);

                    hr = S_OK;
                }
                else
                {
                    pmt = null;
                    hr = DMOResults.E_NoMoreItems;
                }
            }
            else
            {
                pmt = null;
                hr = DMOResults.E_TypeNotSet;
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
            AMMediaType pmt = OutputType(dwOutputStreamIndex);

            VideoInfoHeader v = new VideoInfoHeader();
            WaveFormatEx wav = new WaveFormatEx();
            Marshal.PtrToStructure(pmt.formatPtr, wav);

            pcbSize = wav.nBlockAlign;

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
            WaveFormatEx wav = new WaveFormatEx();
            Marshal.PtrToStructure(pmt.formatPtr, wav);

            m_Bits = wav.wBitsPerSample;

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
            int hr = 0;
            bool bFoundOne = false;
            pdwStatus = 0;

            // No input buffers to process
            if (m_pBuffer != null)
            {
                int [] cbCurrent = new int[OutputPinCount]; // 0
                int [] cbOutData = new int[OutputPinCount]; //int.MaxValue;
                IntPtr [] pbOutData = new IntPtr[OutputPinCount]; //IntPtr.Zero;
                int iProcess = m_cbInData;

                for (int x=0; x < OutputPinCount; x++)
                {
                    if (pOutputBuffers[x].pBuffer != null)
                    {
                        // Get a pointer to the output buffer
                        hr = pOutputBuffers[x].pBuffer.GetBufferAndLength(out pbOutData[x], out cbCurrent[x]);

                        if (hr >= 0)
                        {
                            pbOutData[x] = (IntPtr)(pbOutData[x].ToInt32() + cbCurrent[x]);

                            hr = pOutputBuffers[x].pBuffer.GetMaxLength(out cbOutData[x]);

                            if (hr >= 0)
                            {
                                iProcess = Math.Min(iProcess, (cbOutData[x] - cbCurrent[x]) * 2);
                                bFoundOne = true;
                            }
                        }
                    }
                    else
                    {
                        pbOutData[x] = IntPtr.Zero;
                        cbOutData[x] = int.MaxValue;
                        cbCurrent[x] = 0;
                    }

                    if (hr < 0)
                    {
                        break;
                    }
                }

                if (hr >= 0)
                {
                    if (bFoundOne)
                    {
                        // Process from input to output according to the mode
                        DoSplit(
                            iProcess, 
                            m_InBuffer, 
                            pbOutData[0],
                            pbOutData[1]
                            );
                    }

                    for (int x=0; x < OutputPinCount; x++)
                    {
                        // Keep the flags & time info from the input
                        pOutputBuffers[x].rtTimelength = m_TimeLength;
                        pOutputBuffers[x].rtTimestamp = m_TimeStamp;

                        if (pOutputBuffers[x].pBuffer != null)
                        {
                            pOutputBuffers[x].pBuffer.SetLength((iProcess / 2) + cbCurrent[x]);
                        }

                        if (m_cbInData == iProcess)
                        {
                            pOutputBuffers[x].dwStatus = m_Flags;
                        }
                        else
                        {
                            pOutputBuffers[x].dwStatus = m_Flags | DMOOutputDataBufferFlags.InComplete;
                        }
                    }

                    // Did we process everything?
                    if (m_cbInData == iProcess)
                    {
                        ReleaseInputBuffs();
                    }
                    else
                    {
                        // Reset for next call, skipping processed data
                        long l = (long)Math.Round(((double)iProcess / m_cbInData) * m_TimeLength);
                        m_TimeStamp += l;
                        m_TimeLength -= l;

                        m_InBuffer = (IntPtr)(m_InBuffer.ToInt32() + iProcess);
                        m_cbInData -= iProcess;
                    }
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



        #endregion
    }
}
