/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released
as public domain.  It is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.
*****************************************************************************/

using System;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Windows.Forms;

using DirectShowLib;
using MediaFoundation;
using MediaFoundation.EVR;
using MediaFoundation.Transform;
using MediaFoundation.Misc;
using GenericSampleSourceFilterClasses;

namespace EVRPlayer
{
    internal enum PlaybackState
    {
        Running,
        Paused,
        Stopped,
        Closed
    }

    // GraphEventCallback:
    // Defines a callback for the application to handle filter graph events.
    public interface GraphEventCallback
    {
        void OnGraphEvent(EventCode eventCode, IntPtr param1, IntPtr param2);
    }

    class DShowPlayer : COMBase, IDisposable
    {
        #region Member vars

        private ImageHandler[] m_ImageHandlers;
        private IPin[] m_pPins;

        private PlaybackState m_state;

        private Control m_hwndVideo;    // Video clipping window
        private IntPtr m_hwndEvent;     // Window to receive events
        private int m_EventMsg;         // Windows message for graph events

        private AMSeekingSeekingCapabilities m_seekCaps;        // Caps bits for IMediaSeeking

        private Guid m_clsidPresenter;   // CLSID of a custom presenter.
        private float m_fScale;
        private PointF m_ptHitTrack;

        // Filter graph interfaces.
        private IGraphBuilder m_pGraph;
        private IMediaControl m_pControl;
        private IMediaEventEx m_pEvent;
        private IMediaSeeking m_pSeek;
#if DEBUG
        private DsROTEntry m_rot;
#endif

        // EVR filter
        private IBaseFilter m_pEVR;
        private IMFVideoDisplayControl m_pDisplay;
        private IMFVideoMixerControl m_pMixer;
        private IMFVideoPositionMapper m_pMapper;

        #endregion

        public DShowPlayer(Control hwndVideo, IntPtr hwnd, int msg)
        {
            m_state = PlaybackState.Closed;
            m_hwndVideo = hwndVideo;
            m_hwndEvent = hwnd;
            m_EventMsg = msg;

            m_pGraph = null;
            m_pControl = null;
            m_pEvent = null;
            m_pSeek = null;
            m_pDisplay = null;
            m_pEVR = null;
            m_pMapper = null;
            m_seekCaps = 0;
            m_clsidPresenter = Guid.Empty;
        }
        ~DShowPlayer()
        {
            Dispose();
        }

        public PlaybackState State() { return m_state; }

        public void OpenFile(string sFileName, Guid clsidPresenter)
        {
            int hr = S_Ok;

            IBaseFilter pSource = null;

            // Create a new filter graph. (This also closes the old one, if any.)
            InitializeGraph();

            m_clsidPresenter = clsidPresenter;

            // Add the source filter to the graph.
            hr = m_pGraph.AddSourceFilter(sFileName, null, out pSource);
            DsError.ThrowExceptionForHR(hr);

            try
            {
                // Try to render the streams.
                RenderStreams(pSource);

                // Get the seeking capabilities.
                hr = m_pSeek.GetCapabilities(out m_seekCaps);
                DsError.ThrowExceptionForHR(hr);

                // Update our state.
                m_state = PlaybackState.Stopped;
            }
            finally
            {
                Marshal.ReleaseComObject(pSource);
            }
        }

        public void OpenOverlay(Guid gPresenter)
        {
            object o;

            if (m_ImageHandlers != null)
            {
                foreach (ImageHandler ih in m_ImageHandlers)
                {
                    ih.Dispose();
                }
                m_ImageHandlers = null;
            }

            m_ImageHandlers = new ImageHandler[2];

            m_ImageHandlers[0] = new ImageFromPixels(30, new FourCC("YUY2"), 320, 240, 16);
            //m_ImageHandlers[0] = new ImageFromPixels(30, new FourCC(3), 320, 240, 32, 255);
            //m_ImageHandlers[0] = new ImageFromPixels(30, new FourCC("AYUV"), 320, 240, 32, 255);
            //m_ImageHandlers[0] = new ImageFromPixels(30, new FourCC("NV12"), 320, 240, 12, 255);
            //m_ImageHandlers[1] = new ImageFromText(30, new FourCC(3), 320, 240, 32);
            m_ImageHandlers[1] = new ImageFromText(30, new FourCC("AYUV"), 320, 240, 32);

            InitializeGraph();
            SetupGraph(gPresenter);

            IMFGetService pGetService = (IMFGetService)m_pEVR;

            pGetService.GetService(MFServices.MR_VIDEO_MIXER_SERVICE, typeof(IMFVideoMixerControl).GUID, out o);
            m_pMixer = (IMFVideoMixerControl)o;

            pGetService.GetService(MFServices.MR_VIDEO_RENDER_SERVICE, typeof(IMFVideoPositionMapper).GUID, out o);
            m_pMapper = (IMFVideoPositionMapper)o;
        }

        public bool HasSubstream() { return m_pMixer != null; }
        public void SetScale(float fScale)
        {
            if (m_ImageHandlers == null || m_ImageHandlers.Length < 2)
            {
                return;
            }
            if (fScale < 0 || fScale > 1.0)
            {
                throw new COMException("Invalid scale", E_InvalidArgument);
            }

            if (fScale == m_fScale)
            {
                return; // no-op
            }

            if (m_pMixer == null)
            {
                throw new COMException("No mixer", E_InvalidArgument);
            }

            // Get the current position of the substream rectangle.
            MFVideoNormalizedRect rect = new MFVideoNormalizedRect();

            m_pMixer.GetStreamOutputRect(1, rect);

            // When this method is called, the substream might be positioned anywhere
            // within the composition rectangle. To resize it, first we scale the
            // right/bottom edges up to the maximum, and then scale the left/top edges.
            rect.right = Math.Min(rect.left + fScale, 1.0f);
            rect.bottom = Math.Min(rect.top + fScale, 1.0f);

            rect.left -= Math.Max(fScale - (rect.right - rect.left), 0.0f);
            rect.top -= Math.Max(fScale - (rect.bottom - rect.top), 0.0f);

            // Set the new position.
            m_pMixer.SetStreamOutputRect(1, rect);

            m_fScale = fScale;
        }

        public bool HitTest(Point pt)
        {
            if (m_pMapper == null)
            {
                throw new COMException("null mapper", MFError.MF_E_INVALIDREQUEST);
            }

            int hr = 0;
            bool bHit = false;

            float x = -1, y = -1;

            // Normalize the coordinates (ie, calculate them as a percentage of
            // the video window's entire client area).
            Rectangle r = m_hwndVideo.ClientRectangle;
            MFRect rc = new MFRect(r.Left, r.Top, r.Right, r.Bottom);

            float x1 = (float)pt.X / rc.right;
            float y1 = (float)pt.Y / rc.bottom;

            // Map these coordinates into the coordinate space of the substream.
            m_pMapper.MapOutputCoordinateToInputStream(
                x1, y1, // Output coordinates
                0,      // Output stream (the mixer only has one)
                1,      // Input stream (1 = substream)
                out x, out y  // Receives the normalized input coordinates.
                );

            // If the mapped coordinates fall within [0-1], it's a hit.
            if (Succeeded(hr))
            {
                bHit = ((x >= 0) && (x <= 1) && (y >= 0) && (y <= 1));
            }

            if (bHit)
            {
                // Store the hit point.
                // We adjust the hit point by the substream scaling factor, so that the
                // hit point is now scaled to the reference stream.

                // Example:
                // - The hit point is (0.5,0.5), the center of the image.
                // - The scaling factor is 0.5, so the substream image is 50% the size
                //   of the reference stream.
                // The adjusted hit point is (0.25,0.25) FROM the origin of the substream
                // rectangle but IN units of the reference stream. See DShowPlayer::Track
                // for where this is used.

                m_ptHitTrack = new PointF(x * m_fScale, y * m_fScale);
            }

            return bHit ? true : false;
        }
        public void Track(Point pt)
        {
            if (m_pMixer == null || m_pMapper == null)
            {
                throw new COMException("null mixer or mapper", MFError.MF_E_INVALIDREQUEST);
            }

            Rectangle r = m_hwndVideo.ClientRectangle;
            MFRect rc = new MFRect(r.Left, r.Top, r.Right, r.Bottom);

            // x, y: Mouse coordinates, normalized relative to the composition rectangle.
            float x = (float)pt.X / rc.right;
            float y = (float)pt.Y / rc.bottom;

            // Map the mouse coordinates to the reference stream.
            m_pMapper.MapOutputCoordinateToInputStream(
                x, y,       // Output coordinates
                0,          // Output stream (the mixer only has one)
                0,          // Input stream (0 = ref stream)
                out x, out y      // Receives the normalized input coordinates.
                );

            // Offset by the original hit point.
            x -= m_ptHitTrack.X;
            y -= m_ptHitTrack.Y;

            float max_offset = 1.0f - m_fScale; // Maximum left and top positions for the substream.

            MFVideoNormalizedRect nrcDest = new MFVideoNormalizedRect();

            if (x < 0)
            {
                nrcDest.left = 0;
                nrcDest.right = m_fScale;
            }
            else if (x > max_offset)
            {
                nrcDest.right = 1;
                nrcDest.left = max_offset;
            }
            else
            {
                nrcDest.left = x;
                nrcDest.right = x + m_fScale;
            }

            if (y < 0)
            {
                nrcDest.top = 0;
                nrcDest.bottom = m_fScale;
            }
            else if (y > max_offset)
            {
                nrcDest.bottom = 1;
                nrcDest.top = max_offset;
            }
            else
            {
                nrcDest.top = y;
                nrcDest.bottom = y + m_fScale;
            }

            // Set the new position.
            m_pMixer.SetStreamOutputRect(1, nrcDest);
        }

        // Streaming
        public void Play()
        {
            if (m_state != PlaybackState.Paused && m_state != PlaybackState.Stopped)
            {
                throw new COMException("Object in wrong state", DsResults.E_WrongState);
            }

            Debug.Assert(m_pGraph != null); // If state is correct, the graph should exist.

            int hr = m_pControl.Run();
            DsError.ThrowExceptionForHR(hr);

            m_state = PlaybackState.Running;
        }
        public void Pause()
        {
            if (m_state == PlaybackState.Closed)
            {
                throw new COMException("Graph in wrong state", DsResults.E_WrongState);
            }

            Debug.Assert(m_pGraph != null); // If state is correct, the graph should exist.

            int hr = m_pControl.Pause();
            DsError.ThrowExceptionForHR(hr);

            m_state = PlaybackState.Paused;
        }
        public void Stop()
        {
            if (m_state != PlaybackState.Running && m_state != PlaybackState.Paused)
            {
                throw new COMException("Graph in wrong state", DsResults.E_WrongState);
            }

            Debug.Assert(m_pGraph != null); // If state is correct, the graph should exist.

            int hr = m_pControl.Stop();
            DsError.ThrowExceptionForHR(hr);

            m_state = PlaybackState.Stopped;
        }
        public void Step(int dwFrames)
        {
            if (m_pGraph == null)
            {
                throw new COMException("Graph in wrong state", DsResults.E_WrongState);
            }

            IVideoFrameStep pStep = (IVideoFrameStep)m_pGraph;

            int hr = pStep.Step(dwFrames, null);
            DsError.ThrowExceptionForHR(hr);

            // To step, the Filter Graph Manager first runs the graph. When
            // the step is complete, it pauses the graph. For the application,
            // we can just report our new state as paused.
            m_state = PlaybackState.Paused;
        }

        // Video functionality
        public bool HasVideo() { return m_pDisplay != null; }
        public void RepaintVideo()
        {
            if (m_pDisplay != null)
            {
                m_pDisplay.RepaintVideo();
            }
        }

        // Filter graph events
        public void HandleGraphEvent(GraphEventCallback pCB)
        {
            if (pCB == null)
            {
                throw new COMException("No callback set", E_Pointer);
            }

            if (m_pEvent == null)
            {
                throw new COMException("No event pointer", E_Unexpected);
            }

            EventCode evCode = 0;
            IntPtr param1, param2;

            // Get the events from the queue.
            while (Succeeded(m_pEvent.GetEvent(out evCode, out param1, out param2, 0)))
            {
                // Invoke the callback.
                pCB.OnGraphEvent(evCode, param1, param2);

                // Free the event data.
                int hr = m_pEvent.FreeEventParams(evCode, param1, param2);
                DsError.ThrowExceptionForHR(hr);
            }
        }

        // Seeking
        public bool CanSeek()
        {
            const AMSeekingSeekingCapabilities caps =
                AMSeekingSeekingCapabilities.CanSeekAbsolute |
                AMSeekingSeekingCapabilities.CanGetDuration;

            return ((m_seekCaps & caps) == caps);
        }
        public void SetPosition(long pos)
        {
            if (m_pControl == null || m_pSeek == null)
            {
                throw new COMException("pointers not set", E_Unexpected);
            }

            int hr;

            hr = m_pSeek.SetPositions(
                pos,
                AMSeekingSeekingFlags.AbsolutePositioning,
                null,
                AMSeekingSeekingFlags.NoPositioning);
            DsError.ThrowExceptionForHR(hr);

            if (m_ImageHandlers != null)
            {
                for (int x = 1; x < m_ImageHandlers.Length; x++)
                {
                    IMediaSeeking ims = m_pPins[x] as IMediaSeeking;

                    hr = ims.SetPositions(
                        pos,
                        AMSeekingSeekingFlags.AbsolutePositioning,
                        null,
                        AMSeekingSeekingFlags.NoPositioning);
                    DsError.ThrowExceptionForHR(hr);
                }
            }

            // If playback is stopped, we need to put the graph into the paused
            // state to update the video renderer with the new frame, and then stop
            // the graph again. The IMediaControl::StopWhenReady does this.
            if (m_state == PlaybackState.Stopped)
            {
                hr = m_pControl.StopWhenReady();
                DsError.ThrowExceptionForHR(hr);
            }
        }
        public void GetStopTime(out long pDuration)
        {
            if (m_pSeek == null)
            {
                throw new COMException("No seek pointer", E_Unexpected);
            }

            int hr = m_pSeek.GetStopPosition(out pDuration);

            // If we cannot get the stop time, try to get the duration.
            if (Failed(hr))
            {
                hr = m_pSeek.GetDuration(out pDuration);
            }
            DsError.ThrowExceptionForHR(hr);
        }
        public void GetCurrentPosition(out long pTimeNow)
        {
            if (m_pSeek == null)
            {
                throw new COMException("No seek pointer", E_Unexpected);
            }

            int hr = m_pSeek.GetCurrentPosition(out pTimeNow);
            DsError.ThrowExceptionForHR(hr);
        }

        // Subpicture stuff
        private void SetupGraph(Guid clsidPresenter)
        {
            m_clsidPresenter = clsidPresenter;

            // Get a ICaptureGraphBuilder2 to help build the graph
            ICaptureGraphBuilder2 icgb2 = (ICaptureGraphBuilder2)new CaptureGraphBuilder2();

            try
            {
                int hr;

                // Link the ICaptureGraphBuilder2 to the IFilterGraph2
                hr = icgb2.SetFiltergraph(m_pGraph);
                DsError.ThrowExceptionForHR(hr);

                m_pEVR = (IBaseFilter)new EnhancedVideoRenderer();
                hr = m_pGraph.AddFilter(m_pEVR, "EVR");
                DsError.ThrowExceptionForHR(hr);

                InitializeEVR(m_pEVR, m_ImageHandlers.Length, out m_pDisplay);
                m_pPins = new IPin[m_ImageHandlers.Length];

                for (int x = 0; x < m_ImageHandlers.Length; x++)
                {
                    AddGSSF(m_ImageHandlers[x], icgb2, out m_pPins[x]);
                }

                // Get the seeking capabilities.
                hr = m_pSeek.GetCapabilities(out m_seekCaps);
                DsError.ThrowExceptionForHR(hr);
            }
            finally
            {
                Marshal.ReleaseComObject(icgb2);
            }

            // Update our state.
            m_state = PlaybackState.Stopped;
        }
        private void AddGSSF(ImageHandler ih, ICaptureGraphBuilder2 icgb2, out IPin pPin)
        {
            int hr;

            // Our data source.  An error here means the GSSF2 sample hasn't
            // been registered.
            IBaseFilter ipsb = (IBaseFilter)new GenericSampleSourceFilter2();

            try
            {
                // Get the pin from the filter so we can configure it
                pPin = DsFindPin.ByDirection(ipsb, PinDirection.Output, 0);

                // Configure the pin using the provided BitmapInfo
                ConfigurePusher((IGenericSampleConfig2)pPin, ih);

                // Add the filter to the graph
                hr = m_pGraph.AddFilter(ipsb, "GenericSampleSourceFilter");
                Marshal.ThrowExceptionForHR(hr);

                // Connect the filters together, use the default renderer
                hr = icgb2.RenderStream(null, null, pPin, null, m_pEVR);
                DsError.ThrowExceptionForHR(hr);
            }
            finally
            {
                Marshal.ReleaseComObject(ipsb);
            }
        }
        private void ConfigurePusher(IGenericSampleConfig2 ips, ImageHandler ih)
        {
            int hr;

            ih.SetMediaType(ips);

            // Specify the callback routine to call with each sample
            hr = ips.SetBitmapCB(ih);
            DsError.ThrowExceptionForHR(hr);
        }

        private void InitializeGraph()
        {
            int hr = 0;

            TearDownGraph();

            // Create the Filter Graph Manager.
            m_pGraph = (IGraphBuilder)new FilterGraph();
#if DEBUG
            m_rot = new DsROTEntry(m_pGraph);
#endif

            // Query for graph interfaces. (These interfaces are exposed by the graph
            // manager regardless of which filters are in the graph.)
            m_pControl = (IMediaControl)m_pGraph;
            m_pEvent = (IMediaEventEx)m_pGraph;
            m_pSeek = (IMediaSeeking)m_pGraph;

            // Set up event notification.
            hr = m_pEvent.SetNotifyWindow(m_hwndEvent, m_EventMsg, IntPtr.Zero);
            DsError.ThrowExceptionForHR(hr);
        }
        private void TearDownGraph()
        {
#if DEBUG
            if (m_rot != null)
            {
                m_rot.Dispose();
                m_rot = null;
            }
#endif

            // Stop sending event messages
            if (m_pEvent != null)
            {
                m_pEvent.SetNotifyWindow(IntPtr.Zero, 0, IntPtr.Zero);
                m_pEvent = null;
            }

            if (m_pControl != null)
            {
                m_pControl.Stop();
                m_pControl = null;
            }

            if (m_pDisplay != null)
            {
                //Marshal.ReleaseComObject(m_pDisplay);
                m_pDisplay = null;
            }

            if (m_pMapper != null)
            {
                Marshal.ReleaseComObject(m_pMapper);
                m_pMapper = null;
            }

            if (m_pMixer != null)
            {
                Marshal.ReleaseComObject(m_pMixer);
                m_pMixer = null;
            }

            if (m_pEVR != null)
            {
                Marshal.ReleaseComObject(m_pEVR);
                m_pEVR = null;
            }

            if (m_pGraph != null)
            {
                Marshal.ReleaseComObject(m_pGraph);
                m_pGraph = null;
            }

            m_state = PlaybackState.Closed;
            m_seekCaps = 0;
            m_pSeek = null;
        }
        private void RenderStreams(IBaseFilter pSource)
        {
            int hr;

            bool bRenderedAudio = false;
            bool bRenderedVideo = false;

            IBaseFilter pEVR = (IBaseFilter)new EnhancedVideoRenderer();
            IBaseFilter pAudioRenderer = (IBaseFilter)new DSoundRender();

            try
            {
                // Add the EVR to the graph.
                hr = m_pGraph.AddFilter(pEVR, "EVR");
                DsError.ThrowExceptionForHR(hr);

                InitializeEVR(pEVR, 1, out m_pDisplay);

                // Add the DSound Renderer to the graph.
                hr = m_pGraph.AddFilter(pAudioRenderer, "Audio Renderer");
                DsError.ThrowExceptionForHR(hr);

                ICaptureGraphBuilder2 cgb;
                cgb = (ICaptureGraphBuilder2)new CaptureGraphBuilder2();

                try
                {
                    hr = cgb.SetFiltergraph(m_pGraph);
                    DsError.ThrowExceptionForHR(hr);

                    // Connect the streams.
                    hr = cgb.RenderStream(null, MediaType.Video, pSource, null, pEVR);
                    DsError.ThrowExceptionForHR(hr);
                    hr = cgb.RenderStream(null, MediaType.Audio, pSource, null, pAudioRenderer);
                    DsError.ThrowExceptionForHR(hr);

                    // If we are using a splitter, the two lines above did nothing.  We
                    // ignore the errors from the next 2 statements in case the 2 lines above
                    // *did* do something.
                    hr = cgb.RenderStream(null, null, pSource, null, pEVR);
                    //DsError.ThrowExceptionForHR(hr);
                    hr = cgb.RenderStream(null, null, pSource, null, pAudioRenderer);
                    //DsError.ThrowExceptionForHR(hr);

                    IPin pPin = DsFindPin.ByConnectionStatus(pEVR, PinConnectedStatus.Unconnected, 0);

                    if (pPin == null)
                    {
                        bRenderedVideo = true;
                    }
                    else
                    {
                        Marshal.ReleaseComObject(pPin);
                    }

                    pPin = DsFindPin.ByConnectionStatus(pAudioRenderer, PinConnectedStatus.Unconnected, 0);

                    if (pPin == null)
                    {
                        bRenderedAudio = true;
                    }
                    else
                    {
                        Marshal.ReleaseComObject(pPin);
                    }
                }
                finally
                {
                    Marshal.ReleaseComObject(cgb);
                }

                // Remove un-used renderers.

                if (!bRenderedVideo)
                {
                    m_pGraph.RemoveFilter(pEVR);
                    // If we removed the EVR, then we also need to release our
                    // pointer to the EVR display interfaace
                    //Marshal.ReleaseComObject(m_pDisplay);
                    m_pDisplay = null;
                }
                else
                {
                    // EVR is still in the graph. Cache the interface pointer.
                    Debug.Assert(pEVR != null);
                    m_pEVR = pEVR;
                }

                if (!bRenderedAudio)
                {
                    m_pGraph.RemoveFilter(pAudioRenderer);
                }
            }
            finally
            {
                Marshal.ReleaseComObject(pAudioRenderer);
            }
        }

        private void InitializeEVR(IBaseFilter pEVR, int dwStreams, out IMFVideoDisplayControl ppDisplay)
        {
            IMFVideoRenderer pRenderer;
            IMFVideoDisplayControl pDisplay;
            IEVRFilterConfig pConfig;
            IMFVideoPresenter pPresenter;

            // Before doing anything else, set any custom presenter or mixer.

            // Presenter?
            if (m_clsidPresenter != Guid.Empty)
            {
                Type type = Type.GetTypeFromCLSID(m_clsidPresenter);

                // An error here means that the custom presenter sample from
                // http://mfnet.sourceforge.net hasn't been installed or
                // registered.
                pPresenter = (IMFVideoPresenter)Activator.CreateInstance(type);

                try
                {
                    pRenderer = (IMFVideoRenderer)pEVR;

                    pRenderer.InitializeRenderer(null, pPresenter);
                }
                finally
                {
                    //Marshal.ReleaseComObject(pPresenter);
                }
            }

            // Continue with the rest of the set-up.

            // Set the video window.
            object o;
            IMFGetService pGetService = null;
            pGetService = (IMFGetService)pEVR;
            pGetService.GetService(MFServices.MR_VIDEO_RENDER_SERVICE, typeof(IMFVideoDisplayControl).GUID, out o);

            try
            {
                pDisplay = (IMFVideoDisplayControl)o;
            }
            catch
            {
                Marshal.ReleaseComObject(o);
                throw;
            }

            try
            {
                // Set the number of streams.
                pDisplay.SetVideoWindow(m_hwndVideo.Handle);

                if (dwStreams > 1)
                {
                    pConfig = (IEVRFilterConfig)pEVR;
                    pConfig.SetNumberOfStreams(dwStreams);
                }

                // Set the display position to the entire window.
                Rectangle r = m_hwndVideo.ClientRectangle;
                MFRect rc = new MFRect(r.Left, r.Top, r.Right, r.Bottom);

                pDisplay.SetVideoPosition(null, rc);

                // Return the IMFVideoDisplayControl pointer to the caller.
                ppDisplay = pDisplay;
            }
            finally
            {
                //Marshal.ReleaseComObject(pDisplay);
            }
            m_pMixer = null;
        }

        #region IDisposable Members

        public void Dispose()
        {
            GC.SuppressFinalize(this);
            TearDownGraph();

            if (m_ImageHandlers != null)
            {
                foreach (ImageHandler ih in m_ImageHandlers)
                {
                    ih.Dispose();
                }
                m_ImageHandlers = null;
            }
            m_hwndVideo = null;
        }

        #endregion
    }
}
