/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;

using DirectShowLib;
using DirectShowLib.SBE;

namespace DirectShowLib.Sample
{
  public class SBECutter2 : IDisposable
  {
    IStreamBufferRecComp sbeRecComp;
    string source, destionation;

    /// <summary>
    /// This object is a managed wrapper around the SBE's RecComp object
    /// </summary>
    /// <param name="srcFile">The source file to be cutted</param>
    /// <param name="destFile">The resulting file. Delet</param>
    /// <remarks>Warning, if destFile already exists, the constructor delete it</remarks>
    /// <exception cref="System.IO.FileNotFoundException">Thrown if srcFile doesn't exists</exception>
    /// <exception cref="System.Runtime.InteropServices.COMException">Thrown if someting wrong append during the destination initialization</exception>
    public SBECutter2(string srcFile, string destFile)
    {
      if (!File.Exists(srcFile))
        throw new FileNotFoundException();

      if (File.Exists(destFile))
        File.Delete(destFile);

      sbeRecComp = (IStreamBufferRecComp) new StreamBufferComposeRecording();
      source = srcFile;
      destionation = destFile;

      int hr = sbeRecComp.Initialize(destionation, source);
      DsError.ThrowExceptionForHR(hr);
    }

    ~SBECutter2()
    {
      Dispose(false);
    }

    #region IDisposable Members

    /// <summary>
    /// Close both files and release unmanged ressources.
    /// </summary>
    public void Dispose()
    {
      Dispose(true);
      GC.SuppressFinalize(this);
    }

    #endregion

    /// <summary>
    /// Close both files and release unmanged ressources if disposing is true.
    /// </summary>
    /// <param name="disposing">dispose unmanaged ressources or not</param>
    protected virtual void Dispose(bool disposing)
    {
      if (disposing)
      {
        if (sbeRecComp != null)
        {
          sbeRecComp.Close();
          Marshal.ReleaseComObject(sbeRecComp);
        }
      }
    }

    /// <summary>
    /// Append a segment of the source file into the destination file
    /// </summary>
    /// <param name="from">start time of the segment</param>
    /// <param name="to">end time of the segment</param>
    /// <exception cref="System.ArgumentException">Thrown if the fist paramter is superior to the second</exception>
    /// <exception cref="System.Runtime.InteropServices.COMException">Thrown if someting wrong append during the copy</exception>
    public void CopyThisSegment(TimeSpan from, TimeSpan to)
    {
      if (from > to)
        throw new ArgumentException();

      int hr = sbeRecComp.AppendEx(source, from.Ticks, to.Ticks);
      DsError.ThrowExceptionForHR(hr);
    }
  }
}
