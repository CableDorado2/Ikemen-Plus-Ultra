/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.IO;

namespace DirectShowLib.Sample
{
	class StartUp
	{
    public static void ShowUsage()
    {
      Console.WriteLine();
      Console.WriteLine("Usage : DvrMsCutter.exe Source Destination StartTime EndTime");
      Console.WriteLine();
      Console.WriteLine("Source : must be an existing dvr-ms file");
      Console.WriteLine("Destination : the result dvr-ms file (warning : overwitten if already exist)");
      Console.WriteLine("StartTime : the start time the source file in this format : hh:mm:ss");
      Console.WriteLine("EndTime : the end time the source file in this format : hh:mm:ss");
    }

    private static TimeSpan ParseTime(string time)
    {
      string[] hhmmss = time.Split(new char[]{':'});

      return new TimeSpan(Convert.ToInt32(hhmmss[0]), Convert.ToInt32(hhmmss[1]), Convert.ToInt32(hhmmss[2]));
    }

		[STAThread]
		static int Main(string[] args)
		{
      // Verify if enough arguments have been given...
      if (args.Length != 4)
      {
        ShowUsage();
        return 1;
      }

      // Parse arguments
      string src = args[0];
      string dst = args[1];
      TimeSpan start = ParseTime(args[2]);
      TimeSpan end = ParseTime(args[3]);

      // If source file doesn't exist, exit with an error
      if (!File.Exists(src))
      {
        Console.WriteLine(src + " doesn't exist");
        return 1;
      }

      // If destination file exist, delete it
      if (File.Exists(dst))
        File.Delete(dst);

      // Cut the file
      SBECutter cutter = new SBECutter();
      cutter.DoCut(src, dst, start, end);
      cutter.Dispose();

      return 0;
		}
	}
}
