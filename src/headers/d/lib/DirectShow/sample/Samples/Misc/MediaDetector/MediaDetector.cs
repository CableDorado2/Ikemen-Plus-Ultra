using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;

using DirectShowLib;
using DirectShowLib.DES;

namespace DirectShowLib.Samples
{
  /// <summary>
  /// A wrapper class around the DirectShow's MediaDet object.
  /// </summary>
  public sealed class MediaDetector
  {
    public static MediaDescription GetDescription(string fileName)
    {
      int hr = 0;
      MediaDescription mediaDesc = new MediaDescription();
      IMediaDet mediaDet = null;

      try
      {
        // Create the DirectShow's MediaDet
        mediaDet = (IMediaDet)new MediaDet();

        hr = mediaDet.put_Filename(fileName);
        if (hr < 0)
        {
          MessageBox.Show("This file is not supprted by MediaDet", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
          DsError.ThrowExceptionForHR(hr);
        }

        mediaDesc.fileName = fileName;

        int streamCount;
        hr = mediaDet.get_OutputStreams(out streamCount);
        DsError.ThrowExceptionForHR(hr);

        for (int i = 0; i < streamCount; i++)
        {
          hr = mediaDet.put_CurrentStream(i);
          DsError.ThrowExceptionForHR(hr);

          Guid streamType;
          hr = mediaDet.get_StreamType(out streamType);
          DsError.ThrowExceptionForHR(hr);

          if (streamType == MediaType.Audio)
            UpdateAudioPart(mediaDet, mediaDesc);
          else if (streamType == MediaType.Video)
            UpdateVideoPart(mediaDet, mediaDesc);
          else
            continue;
        }

        if (mediaDesc.videoSubType != Guid.Empty)
          mediaDesc.snapshot = GetSnapshot(mediaDet, mediaDesc.resolution.Width, mediaDesc.resolution.Height, mediaDesc.videoLength.TotalSeconds / 2);
      }
      finally
      {
        if (mediaDet != null)
          Marshal.ReleaseComObject(mediaDet);
      }

      return mediaDesc;
    }

    private static void UpdateAudioPart(IMediaDet mediaDet, MediaDescription mediaDesc)
    {
      int hr = 0;
      AMMediaType mediaType = new AMMediaType();

      hr = mediaDet.get_StreamMediaType(mediaType);
      DsError.ThrowExceptionForHR(hr);

      mediaDesc.audioSubType = mediaType.subType;

      double streamLength;
      hr = mediaDet.get_StreamLength(out streamLength);
      DsError.ThrowExceptionForHR(hr);

      mediaDesc.audioLength = TimeSpan.FromSeconds(streamLength);

      if (mediaType.formatType == FormatType.WaveEx)
      {
        WaveFormatEx waveFormatEx = (WaveFormatEx)Marshal.PtrToStructure(mediaType.formatPtr, typeof(WaveFormatEx));
        mediaDesc.channels = waveFormatEx.nChannels;
        mediaDesc.samplesPerSec = ((float)waveFormatEx.nSamplesPerSec) / 1000;
        mediaDesc.bitsPerSample = waveFormatEx.wBitsPerSample;
      }
    }

    private static void UpdateVideoPart(IMediaDet mediaDet, MediaDescription mediaDesc)
    {
      int hr = 0;
      AMMediaType mediaType = new AMMediaType();

      hr = mediaDet.get_StreamMediaType(mediaType);
      DsError.ThrowExceptionForHR(hr);

      mediaDesc.videoSubType = mediaType.subType;

      double streamLength;
      hr = mediaDet.get_StreamLength(out streamLength);
      DsError.ThrowExceptionForHR(hr);

      mediaDesc.videoLength = TimeSpan.FromSeconds(streamLength);

      if (mediaType.formatType == FormatType.VideoInfo) 
      {
        VideoInfoHeader videoHeader = (VideoInfoHeader)Marshal.PtrToStructure(mediaType.formatPtr, typeof(VideoInfoHeader));

        mediaDesc.resolution = new Size(videoHeader.BmiHeader.Width, videoHeader.BmiHeader.Height);
        mediaDesc.bitsPerPixel = videoHeader.BmiHeader.BitCount;
        mediaDesc.fourCC = FourCCToString(videoHeader.BmiHeader.Compression);
      }
    }

    private static string FourCCToString(int fourcc)
    {
      byte[] bytes = new byte[4];

      bytes[0] = (byte)(fourcc & 0x000000ff); fourcc = fourcc >> 8;
      bytes[1] = (byte)(fourcc & 0x000000ff); fourcc = fourcc >> 8;
      bytes[2] = (byte)(fourcc & 0x000000ff); fourcc = fourcc >> 8;
      bytes[3] = (byte)(fourcc & 0x000000ff);

      return Encoding.ASCII.GetString(bytes);
    }

    private static Bitmap GetSnapshot(IMediaDet mediaDet, int width, int height, double position)
    {
      int hr = 0;
      Bitmap bitmap = null;
      int bufferSize = 0;
      IntPtr buffer = IntPtr.Zero;

      try
      {
        hr = mediaDet.GetBitmapBits(position, out bufferSize, IntPtr.Zero, width, height);
        if (hr == 0)
        {
          buffer = Marshal.AllocCoTaskMem(bufferSize);
          hr = mediaDet.GetBitmapBits(position, out bufferSize, buffer, width, height);

          BitmapInfoHeader bitmapHeader = (BitmapInfoHeader)Marshal.PtrToStructure(buffer, typeof(BitmapInfoHeader));
          IntPtr bitmapData;

          if (IntPtr.Size == 4)
            bitmapData = new IntPtr(buffer.ToInt32() + bitmapHeader.Size);
          else
            bitmapData = new IntPtr(buffer.ToInt64() + bitmapHeader.Size);

          bitmap = new Bitmap(bitmapHeader.Width, bitmapHeader.Height, PixelFormat.Format24bppRgb);
          BitmapData bmpData = bitmap.LockBits(new Rectangle(0, 0, bitmapHeader.Width, bitmapHeader.Height), ImageLockMode.WriteOnly, PixelFormat.Format24bppRgb);

          /*
          for (int i = 0; i < width * height * 3 ; i++)
          {
            byte b = Marshal.ReadByte(bitmapData, i);
            Marshal.WriteByte(bmpData.Scan0, i, b);
          }
          */

          CopyMemory(bmpData.Scan0, bitmapData, width * height * 3);
          bitmap.UnlockBits(bmpData);

          bitmap.RotateFlip(RotateFlipType.Rotate180FlipX); 
        }
      }
      finally
      {
        if (buffer != IntPtr.Zero)
          Marshal.FreeCoTaskMem(buffer);
      }
      return bitmap;
    }

    [DllImport("kernel32.dll", EntryPoint = "RtlMoveMemory")]
    private static extern void CopyMemory(IntPtr Destination, IntPtr Source, int Length);

  }
}
