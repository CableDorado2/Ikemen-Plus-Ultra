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

namespace EVRPlayer
{
    /// <summary>
    /// Convert RGB bitmaps to various video formats.  There isn't much documentation in the individual
    /// methods.  If you want to learn about video formats, check out http://www.fourcc.org and google.
    ///
    /// Most of the code I've written for the samples, I sacrificed performance for readability.  In this
    /// code, I tried to maximize performance.
    /// </summary>
    internal static class ConvertImage
    {
        /// <summary>
        /// The format of a 32bit ARGB struct.  In c++, this is an RGBQUAD
        /// </summary>
        private struct RGB
        {
            public byte B;
            public byte G;
            public byte R;
            public byte A;
        }

        /// <summary>
        /// A struct that describes a YUYV pixel
        /// </summary>
        private struct YUYV
        {
            public byte Y;
            public byte U;
            public byte Y2;
            public byte V;
        }

        /// <summary>
        /// A struct that describes an AYUV pixel
        /// </summary>
        private struct AYUV
        {
            public byte V;
            public byte U;
            public byte Y;
            public byte A;
        }

        [DllImport("Kernel32.dll", ExactSpelling = true, EntryPoint = "RtlMoveMemory"), SuppressUnmanagedCodeSecurity]
        private static extern void CopyMemory(IntPtr Destination, IntPtr Source, int Length);

        /// <summary>
        /// Call the appropriate converter based on the subtype
        /// </summary>
        /// <param name="st">Subtype</param>
        /// <param name="dwWidthInPixels">Width to copy in pixels</param>
        /// <param name="dwHeightInPixels">Height to copy in pixels</param>
        /// <param name="dwDestStride">Stride of target in bytes</param>
        /// <param name="ipSrc">Pointer to source data</param>
        /// <param name="ipDest">Pointer to destination data</param>
        public static int ToFormat(
            int st,
            int dwWidthInPixels,
            int dwHeightInPixels,
            int dwDestStride,
            IntPtr ipSrc,
            IntPtr ipDest)
        {
            int iRes = 0;

            switch (st)
            {
                case 0x00000003: // RGB - BI_BITFIELDS
                    iRes = ARGB32_To_ARGB32(dwWidthInPixels, dwHeightInPixels, dwDestStride, ipSrc, ipDest);
                    break;

                case 0x56555941: // AYUV
                    iRes = ARGB32_To_AYUV(dwWidthInPixels, dwHeightInPixels, dwDestStride, ipSrc, ipDest);
                    break;

                case 0x3231564e: // NV12
                    iRes = ARGB32_To_NV12(dwWidthInPixels, dwHeightInPixels, dwDestStride, ipSrc, ipDest);
                    break;

                case 0x32595559: // YUY2
                    iRes = ARGB32_To_YUY2(dwWidthInPixels, dwHeightInPixels, dwDestStride, ipSrc, ipDest);
                    break;

                // This code serves no functional purpose.  However, if you remove it, you get
                // warning errors during compiles.
                case 0x7fffffff:
                    RGB r = new RGB();
                    r.A = 0;
                    r.B = 0;
                    r.G = 0;
                    r.R = 0;
                    break;

                default:
                    throw new Exception("Unrecognized target type");
            }

            return iRes;
        }

        static public int ARGB32_To_ARGB32(
            int dwWidthInPixels,
            int dwHeightInPixels,
            int dwDestStride,
            IntPtr ipSrc,
            IntPtr ipDest
            )
        {
            // Assume 32bit source and dest
            Debug.Assert(dwWidthInPixels * 4 == dwDestStride);

            CopyMemory(ipDest, ipSrc, dwDestStride * dwHeightInPixels);

            return (dwWidthInPixels * 4) * dwHeightInPixels;
        }

        /// <summary>
        /// Convert a 32-bit ARGB image to YUY2
        /// </summary>
        /// <param name="dwWidthInPixels">Width to copy in pixels</param>
        /// <param name="dwHeightInPixels">Height to copy in pixels</param>
        /// <param name="dwDestStride">Stride of target in bytes</param>
        /// <param name="ipSrc">Pointer to source data</param>
        /// <param name="ipDest">Pointer to destination data</param>
        unsafe static public int ARGB32_To_YUY2(
            int dwWidthInPixels,
            int dwHeightInPixels,
            int dwDestStride,
            IntPtr ipSrc,
            IntPtr ipDest
            )
        {
            Debug.Assert(dwDestStride >= (dwWidthInPixels * 2));

            RGB* pSrcPixel = (RGB*)ipSrc;
            YUYV* pDestPixel = (YUYV*)ipDest;
            int dwUseWidth = dwWidthInPixels / 2;

            for (int y = 0; y < dwHeightInPixels; y++)
            {
                for (int x = 0; x < dwUseWidth; x++)
                {
                    pDestPixel[x].Y = (byte)(((66 * pSrcPixel->R + 129 * pSrcPixel->G + 25 * pSrcPixel->B + 128) >> 8) + 16);
                    pDestPixel[x].U = (byte)(((-38 * pSrcPixel->R - 74 * pSrcPixel->G + 112 * pSrcPixel->B + 128) >> 8) + 128);

                    pSrcPixel++;

                    pDestPixel[x].Y2 = (byte)(((66 * pSrcPixel->R + 129 * pSrcPixel->G + 25 * pSrcPixel->B + 128) >> 8) + 16);
                    pDestPixel[x].V = (byte)(((112 * pSrcPixel->R - 94 * pSrcPixel->G - 18 * pSrcPixel->B + 128) >> 8) + 128);

                    pSrcPixel++;
                }
                pDestPixel = &pDestPixel[dwDestStride / sizeof(YUYV)];
            }

            return (int)((byte*)pDestPixel - (byte*)ipDest);
        }

        /// <summary>
        /// Convert a 32-bit ARGB image to AYUV
        /// </summary>
        /// <param name="dwWidthInPixels">Width to copy in pixels</param>
        /// <param name="dwHeightInPixels">Height to copy in pixels</param>
        /// <param name="dwDestStride">Stride of target in bytes</param>
        /// <param name="ipSrc">Pointer to source data</param>
        /// <param name="ipDest">Pointer to destination data</param>
        unsafe static public int ARGB32_To_AYUV(
            int dwWidthInPixels,
            int dwHeightInPixels,
            int dwDestStride,
            IntPtr ipSrc,
            IntPtr ipDest
            )
        {
            Debug.Assert(dwDestStride >= (dwWidthInPixels * Marshal.SizeOf(typeof(AYUV))));

            RGB* pSrcPixel = (RGB*)ipSrc;
            AYUV* pDestPixel = (AYUV*)ipDest;

            for (int y = 0; y < dwHeightInPixels; y++)
            {
                for (int x = 0; x < dwWidthInPixels; x++)
                {
                    pDestPixel[x].V = (byte)(((112 * pSrcPixel->R - 94 * pSrcPixel->G - 18 * pSrcPixel->B + 128) >> 8) + 128);
                    pDestPixel[x].U = (byte)((((-38 * pSrcPixel->R - 74 * pSrcPixel->G + 112 * pSrcPixel->B + 128) >> 8) + 128));
                    pDestPixel[x].Y = (byte)((((66 * pSrcPixel->R + 129 * pSrcPixel->G + 25 * pSrcPixel->B + 128) >> 8) + 16));
                    pDestPixel[x].A = pSrcPixel->A;

                    pSrcPixel++;
                }
                pDestPixel = &pDestPixel[dwDestStride / sizeof(AYUV)];
            }

            return (int)((byte*)pDestPixel - (byte*)ipDest);
        }

        /// <summary>
        /// Convert a 32-bit ARGB image to NV12
        /// </summary>
        /// <param name="dwWidthInPixels">Width to copy in pixels</param>
        /// <param name="dwHeightInPixels">Height to copy in pixels</param>
        /// <param name="dwDestStride">Stride of target in bytes</param>
        /// <param name="ipSrc">Pointer to source data</param>
        /// <param name="ipDest">Pointer to destination data</param>
        unsafe static public int ARGB32_To_NV12(
            int dwWidthInPixels,
            int dwHeightInPixels,
            int dwDestStride,
            IntPtr ipSrc,
            IntPtr ipDest
            )
        {
            Debug.Assert(dwWidthInPixels % 2 == 0);
            Debug.Assert(dwHeightInPixels % 2 == 0);
            Debug.Assert(dwDestStride >= dwWidthInPixels);

            RGB* pSrcRow = (RGB*)ipSrc;
            byte* pDestY = (byte*)ipDest;

            // Convert the Y plane.
            for (int y = 0; y < dwHeightInPixels; y++)
            {
                RGB* pSrcPixel = (RGB*)pSrcRow;

                for (int x = 0; x < dwWidthInPixels; x++)
                {
                    // Y0
                    pDestY[x] = (byte)(((66 * pSrcPixel[x].R + 129 * pSrcPixel[x].G + 25 * pSrcPixel[x].B + 128) >> 8) + 16);
                }
                pDestY += dwDestStride;
                pSrcRow += dwWidthInPixels;
            }

            // Calculate the offsets for the V and U planes.
            // In NV12, each chroma plane has equal stride and half the height as the Y plane.
            byte* pDestUV = (byte*)ipDest;
            pDestUV += (dwDestStride * dwHeightInPixels);

            // Convert the V and U planes.
            // NV12 is a 4:2:0 format, so each chroma sample is derived from four RGB pixels.
            // The chroma samples are packed in one plane (U,V)
            pSrcRow = (RGB*)ipSrc;
            for (int y = 0; y < dwHeightInPixels; y += 2)
            {
                RGB* pSrcPixel = (RGB*)pSrcRow;
                RGB* pNextSrcRow = (RGB*)(pSrcRow + dwWidthInPixels);

                byte* pbUV = pDestUV;

                for (int x = 0; x < dwWidthInPixels; x += 2)
                {
                    // Use a simple average to downsample the chroma.

                    // U
                    *pbUV++ = (byte)((
                        (byte)(((-38 * pSrcPixel[x].R - 74 * pSrcPixel[x].G + 112 * pSrcPixel[x].B + 128) >> 8) + 128) +
                        (byte)(((-38 * pSrcPixel[x + 1].R - 74 * pSrcPixel[x + 1].G + 112 * pSrcPixel[x + 1].B + 128) >> 8) + 128) +
                        (byte)(((-38 * pNextSrcRow[x].R - 74 * pNextSrcRow[x].G + 112 * pNextSrcRow[x].B + 128) >> 8) + 128) +
                        (byte)(((-38 * pNextSrcRow[x + 1].R - 74 * pNextSrcRow[x + 1].G + 112 * pNextSrcRow[x + 1].B + 128) >> 8) + 128)
                               ) / 4);

                    // V
                    *pbUV++ = (byte)((
                        (byte)(((112 * pSrcPixel[x].R - 94 * pSrcPixel[x].G - 18 * pSrcPixel[x].B + 128) >> 8) + 128) +
                        (byte)(((112 * pSrcPixel[x + 1].R - 94 * pSrcPixel[x + 1].G - 18 * pSrcPixel[x + 1].B + 128) >> 8) + 128) +
                        (byte)(((112 * pNextSrcRow[x].R - 94 * pNextSrcRow[x].G - 18 * pNextSrcRow[x].B + 128) >> 8) + 128) +
                        (byte)(((112 * pNextSrcRow[x + 1].R - 94 * pNextSrcRow[x + 1].G - 18 * pNextSrcRow[x + 1].B + 128) >> 8) + 128)
                               ) / 4);
                }
                pDestUV += dwDestStride;

                // Skip two lines on the source image.
                pSrcRow += (dwWidthInPixels * 2);
            }

            return (int)(pDestUV - (byte*)ipDest);
        }
    }
}
