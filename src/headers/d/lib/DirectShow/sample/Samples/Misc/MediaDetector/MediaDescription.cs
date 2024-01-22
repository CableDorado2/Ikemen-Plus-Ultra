using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace DirectShowLib.Samples
{
  /// <summary>
  /// This class is mainly a storage class.
  /// Its primary purpose is to be used with a PropertyGrid.
  /// </summary>
  public class MediaDescription
  {
    internal string fileName;
    internal Guid audioSubType;
    internal int channels;
    internal float samplesPerSec;
    internal int bitsPerSample;
    internal TimeSpan audioLength;
    internal Guid videoSubType;
    internal Size resolution;
    internal int bitsPerPixel;
    internal string fourCC;
    internal TimeSpan videoLength;
    internal Bitmap snapshot;

    [Category("General"), ReadOnly(true), Description("The file name with its path")]
    public string FileName
    {
      get { return fileName; }
    }

    [Category("Audio"), ReadOnly(true), Description("Audio subtype GUID")]
    public Guid AudioSubType
    {
      get { return audioSubType; }
    }

    [Category("Audio"), ReadOnly(true), Description("Audio channel count")]
    public int Channels
    {
      get { return channels; }
    }

    [Category("Audio"), ReadOnly(true), Description("Samples per second in kHz")]
    public float SamplesPerSec
    {
      get { return samplesPerSec; }
    }

    [Category("Audio"), ReadOnly(true), Description("How many bits are used per samples")]
    public int BitsPerSample
    {
      get { return bitsPerSample; }
    }

    [Category("Audio"), ReadOnly(true), Description("The audio stream length")]
    public TimeSpan AudioLength
    {
      get { return audioLength; }
    }

    [Category("Video"), ReadOnly(true), Description("Video subtype GUID")]
    public Guid VideoSubType
    {
      get { return videoSubType; }
    }

    [Category("Video"), ReadOnly(true), Description("Specifies the width and height of the bitmap, in pixels")]
    public Size Resolution
    {
      get { return resolution; }
    }

    [Category("Video"), ReadOnly(true), Description("Specifies the number of bits per pixel (bpp)")]
    public int BitsPerPixel
    {
      get { return bitsPerPixel; }
    }

    [Category("Video"), ReadOnly(true), Description("The Video's FOURCC code")]
    public string FourCC
    {
      get { return fourCC; }
    }

    [Category("Video"), ReadOnly(true), Description("The video stream length")]
    public TimeSpan VideoLength
    {
      get { return videoLength; }
    }

    [Category("Video"), ReadOnly(true), Description("A snapshot of the video stream at half its duration")]
    public Bitmap Snapshot
    {
      get { return snapshot; }
    }
  }

}
