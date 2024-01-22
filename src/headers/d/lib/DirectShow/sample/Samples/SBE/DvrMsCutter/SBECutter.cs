/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Runtime.InteropServices;

using DirectShowLib.SBE;

namespace DirectShowLib.Sample
{
	public class SBECutter : IDisposable
	{
    // SBE provide an utility object for cutting SBE files
    IStreamBufferRecComp recComp;

		public SBECutter()
		{
      // Create this object
      recComp = (IStreamBufferRecComp) new StreamBufferComposeRecording();
    }

    ~SBECutter()
    {
      Dispose();
    }

    public void Dispose()
    {
      // Realease it
      if (recComp != null)
        Marshal.ReleaseComObject(recComp);

      GC.SuppressFinalize(this);
    }

    public void DoCut(string srcFile, string dstFile, TimeSpan start, TimeSpan stop)
    {
      int hr = 0;

      // Initialize a destination file with the same profil as source file
      hr = recComp.Initialize(dstFile, srcFile);
      DsError.ThrowExceptionForHR(hr);

      // Copy source file into destination file
      hr = recComp.AppendEx(srcFile, start.Ticks, stop.Ticks);
      DsError.ThrowExceptionForHR(hr);

      // Close destination file
      hr = recComp.Close();
      DsError.ThrowExceptionForHR(hr);
    }

  }
}
