/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Collections.Generic;
using System.IO;

namespace DirectShowLib.Sample
{
  public struct Segment
  {
    public TimeSpan From;
    public TimeSpan To;
  }

  class Program
  {
    static string sourceFile, destinationFile;
    static List<Segment> segments;

    public static void ShowUsage()
    {
      Console.WriteLine();
      Console.WriteLine("Usage : DvrMsCutter.exe Source Destination Segment1 Segment2 ... SegmentN");
      Console.WriteLine();
      Console.WriteLine("Source : must be an existing dvr-ms file");
      Console.WriteLine("Destination : the result dvr-ms file (warning : overwitten if already exist)");
      Console.WriteLine("Segment : the start and the end of a segment in this format : hh:mm:ss-hh:mm:ss");
    }

    public static bool ParseParameters(string[] args)
    {
      if (args.Length < 3)
      {
        Console.WriteLine("Not enough parameters");
        ShowUsage();
        return false;

      }

      sourceFile = args[0];
      if (!File.Exists(sourceFile))
        throw new FileNotFoundException();

      destinationFile = args[1];
      if (File.Exists(destinationFile))
      {
        Console.WriteLine("Destionation file already exists. Press Y to continue.");
        ConsoleKeyInfo keyInfo = Console.ReadKey();
        if (keyInfo.KeyChar != 'Y' && keyInfo.KeyChar != 'y')
        {
          return false;
        }
      }

      segments = new List<Segment>(args.Length - 2);

      for (int i = 2; i < args.Length; i++)
      {
        string[] segmentBounds = args[i].Split(new char[] { '-' });
        if (segmentBounds.Length != 2)
        {
          Console.WriteLine("Invalid segment : " + args[i]);
          return false;
        }

        Segment segment = new Segment();
        segment.From = ParseTime(segmentBounds[0]);
        segment.To = ParseTime(segmentBounds[1]);
        segments.Add(segment);
      }

      return true;
    }

    private static TimeSpan ParseTime(string time)
    {
      string[] hhmmss = time.Split(new char[] { ':' });

      if (hhmmss.Length != 3)
        throw new ArgumentException();

      return new TimeSpan(Convert.ToInt32(hhmmss[0]), Convert.ToInt32(hhmmss[1]), Convert.ToInt32(hhmmss[2]));
    }

    static void Main(string[] args)
    {
      SBECutter2 cutter;

      if (ParseParameters(args))
      {
        using (cutter = new SBECutter2(sourceFile, destinationFile))
        {
          foreach (Segment segment in segments)
          {
            cutter.CopyThisSegment(segment.From, segment.To);
          }
        }
      }

    }
  }
}
