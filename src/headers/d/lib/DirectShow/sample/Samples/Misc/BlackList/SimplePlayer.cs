using System;
using System.IO;
using System.Runtime.InteropServices;

using DirectShowLib;

namespace DirectShowLib.Samples
{
  /// <summary>
  /// The SimplePlayer class implement a very basic player that use DirectShow.
  /// </summary>
  /// <remarks>The main purpose of this class is to demonstrate the use of the BlackListManager class.</remarks>
  public class SimplePlayer : IDisposable
  {
    private bool disposed;
    private IFilterGraph2 graphBuilder;
    private IMediaControl mediaControl;
    private IMediaEvent mediaEvent;

    private BlackListManager blackListManager;

#if DEBUG
    private DsROTEntry rot;
#endif

    /// <summary>
    /// This constructor internally build a DirectShow graph using the given file name parameter.
    /// </summary>
    /// <param name="filename">A media file.</param>
    /// <remarks>This constructor use the BlackListManager class to bane the use of the ffdshow Audio and Video decoders during the Intelligent Connect graph building.</remarks>
    public SimplePlayer(string filename)
    {
      if (string.IsNullOrEmpty(filename))
        throw new ArgumentNullException("filename");

      if (!File.Exists(filename))
        throw new FileNotFoundException();

      this.graphBuilder = (IFilterGraph2)new FilterGraph();

#if DEBUG
      this.rot = new DsROTEntry(this.graphBuilder);
#endif

      this.blackListManager = new BlackListManager(this.graphBuilder);

      // blacklist the ffdshow Audio Decoder filter
      this.blackListManager.AddBlackListedFilter(new Guid("0F40E1E5-4F79-4988-B1A9-CC98794E6B55"));
      // blacklist the ffdshow Video Decoder filter
      this.blackListManager.AddBlackListedFilter(new Guid("04FE9017-F873-410E-871E-AB91661A4EF7"));
      
      int hr = this.graphBuilder.RenderFile(filename, null);
      DsError.ThrowExceptionForHR(hr);

      this.mediaControl = (IMediaControl)this.graphBuilder;
      this.mediaEvent = (IMediaEvent)this.graphBuilder;
    }


    public void Dispose()
    {
      this.Dispose(true);
      GC.SuppressFinalize(this);
    }

    protected virtual void Dispose(bool disposing)
    {
      if (this.disposed)
        return;

      if (disposing)
      {
#if DEBUG
        if (this.rot != null)
        {
          this.rot.Dispose();
          this.rot = null;
        }
#endif
        if (this.graphBuilder != null)
        {
          this.mediaControl.StopWhenReady();
          this.mediaControl.Stop();

          Marshal.ReleaseComObject(this.graphBuilder);
          this.graphBuilder = null;
        }
      }

      this.disposed = true;
    }

    /// <summary>
    /// Play the media file.
    /// </summary>
    public void Play()
    {
      if (this.disposed)
        throw new ObjectDisposedException(this.GetType().ToString());

      int hr = this.mediaControl.Run();
      DsError.ThrowExceptionForHR(hr);
    }

    /// <summary>
    /// Pause the media file.
    /// </summary>
    public void Pause()
    {
      if (this.disposed)
        throw new ObjectDisposedException(this.GetType().ToString());

      int hr = this.mediaControl.Pause();
      DsError.ThrowExceptionForHR(hr);
    }

    /// <summary>
    /// Stop the media file.
    /// </summary>
    public void Stop()
    {
      if (this.disposed)
        throw new ObjectDisposedException(this.GetType().ToString());

      int hr = this.mediaControl.StopWhenReady();
      DsError.ThrowExceptionForHR(hr);

      hr = this.mediaControl.Stop();
      DsError.ThrowExceptionForHR(hr);
    }
  }
}
