/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using DirectShowLib;
using DirectShowLib.GDCL;
using System.Runtime.InteropServices;
using System.Diagnostics;

namespace GMFPlay
{
    public class ClipPlayer : IDisposable
    {
        #region Constants

        private const int S_OK = 0;
        private const int VFW_E_UNSUPPORTED_AUDIO = unchecked((int)0x8004025C);
        private const int E_FAIL = unchecked((int)0x80004005);
        private const int E_INVALIDARG = unchecked((int)0x80000003);
        private const int VFW_S_STATE_INTERMEDIATE = unchecked((int)0x00040237);

        #endregion

        #region Member variables

        private ArrayList m_Clips;
        private bool m_bLoop;
        private long m_tDuration;
        private long m_tStartPosition;
        private bool m_bActive;
        private IntPtr m_hwndApp;
        private int m_msgEvent;
        private int m_msgSegment;
        private int m_pPlayNext;
        private int m_itCurrent;

        private IGMFBridgeController m_pController;
        private IGraphBuilder m_pRenderGraph;
        private IBaseFilter m_pRenderGraphSourceFilter;

        #endregion

        public ClipPlayer(IntPtr hwnd, int msgSegment, int msgEvent)
        {
            m_bLoop = false;
            m_tDuration = 0;
            m_tStartPosition = 0;
            m_bActive = false;
            m_hwndApp = hwnd;
            m_msgEvent = msgEvent;
            m_msgSegment = msgSegment;
            m_pPlayNext = -1;

            m_Clips = new ArrayList(5);

            m_pController = new GMFBridgeController() as IGMFBridgeController;

	        m_pController.SetNotify(hwnd, msgSegment);

	        // we use a video and an audio stream,
	        // options:
	        //don't allow compressed in source graphs, 
	        //don't discard when not connected
            m_pController.AddStream(true, eFormatType.Uncompressed, false);
            m_pController.AddStream(false, eFormatType.Uncompressed, false);

	        // increase buffering at the join, so that audio does not run out
	        m_pController.SetBufferMinimum(200);

            m_itCurrent = m_Clips.Count;
        }

        public bool IsCued()
        {
            IMediaControl pMC = m_pRenderGraph as IMediaControl;
            if (pMC != null)
            {
                FilterState fs;
                int hr = pMC.GetState(0, out fs);
                if (hr == VFW_S_STATE_INTERMEDIATE)
                {
                    return false;
                }
            }
            return true;
        }

        public long TotalDuration()
        {
            return m_tDuration;
        }

        public int AddClip(string path, out ClipEntry pClip)
        {
            int it = m_Clips.Count;

            pClip = new ClipEntry();
	        m_Clips.Add(pClip);

            int hr = pClip.Create(m_pController, path);

	        // if we expect both audio and video, then all clips
	        // must have both audio and video. 
	        // If the first clip is video only, then switch
	        // to video-only automatically
	        if ((hr == VFW_E_UNSUPPORTED_AUDIO) && (m_Clips.Count == 1))
	        {
		        // new controller, different options (only one video stream)
                if (m_pController != null)
                {
                    Marshal.ReleaseComObject(m_pController);
                    m_pController = null;
                }
                m_pController = new GMFBridgeController() as IGMFBridgeController;
                m_pController.SetNotify(m_hwndApp, m_msgSegment);
                m_pController.AddStream(true, eFormatType.Uncompressed, false);
		        m_pController.SetBufferMinimum(200);

		        // try again
		        hr = pClip.Create(m_pController, path);
	        }

	        if (hr >= 0)
	        {
		        pClip.SetStartPosition(m_tDuration);
		        m_tDuration += pClip.Duration();

		        // if this is the first clip, create the render graph
		        if (m_Clips.Count == 1)
		        {
                    m_pRenderGraph = new FilterGraph() as IGraphBuilder;
			        hr = m_pController.CreateRenderGraph(pClip.SinkFilter(), m_pRenderGraph, out m_pRenderGraphSourceFilter);
			        if (hr >= 0 && m_hwndApp != IntPtr.Zero)
			        {
                        IMediaEventEx pME = m_pRenderGraph as IMediaEventEx;
                        if (pME != null)
				        {
                            pME.SetNotifyWindow(m_hwndApp, m_msgEvent, IntPtr.Zero);
				        }
			        }
		        }
	        } 
            else 
            {
                pClip.Dispose();
                m_Clips.RemoveAt(it);
	        }

	        return hr;
        }

        public int Play()
        {
	        // make all graphs active
	        int hr = S_OK;
	        if (!m_bActive)
	        {
		        UpdateDuration();
		        hr = Pause();
	        }

            ClipEntry ce = (ClipEntry)m_Clips[m_itCurrent];
            if (ce.Graph() == null)
	        {
		        hr = E_FAIL;
	        }

            if (hr >= 0)
	        {
                IMediaControl pMC = m_pRenderGraph as IMediaControl;
		        hr = pMC.Run();
	        }
	        return hr;
        }

        public int Pause()
        {
            // make all graphs active
	        if (!m_bActive)
	        {
		        // render graph first, or data may be discarded
                IMediaControl pMC = m_pRenderGraph as IMediaControl;
		        pMC.Pause();

                // seek all source graphs to correct start positions
                SeekSourceGraphs();

		        // activate each graph
                foreach(ClipEntry ce in m_Clips)
                {
                    IMediaControl pMC2 = ce.Graph() as IMediaControl;
                    pMC2.Run();
                }

		        m_bActive = true;
	        }

            IMediaControl pMC3 = m_pRenderGraph as IMediaControl;
            if (pMC3 != null)
	        {
		        pMC3.Pause();
	        }
	        return S_OK;
        }

        public int Stop()
        {
	        if (m_bActive)
	        {
		        // deactivate all graphs
                IMediaControl pMC = m_pRenderGraph as IMediaControl;
                if (pMC != null)
		        {
			        pMC.Stop();
		        }
		        foreach(ClipEntry it in m_Clips)
		        {
                    it.Stop();
		        }
		        m_bActive = false;
	        }

	        // rewind on stop
	        m_itCurrent = m_Clips.Count;
	        m_tStartPosition = 0;
            m_pPlayNext = -1;
	        return S_OK;
        }

        public void OnEndOfSegment1()
        {
	        if (m_itCurrent == m_Clips.Count)
	        {
		        // ? already at the end
		        return;
	        }

            int itOld = m_itCurrent;

	        // locate next graph
            if (m_pPlayNext < 0)
            {
                m_itCurrent++;

                if (m_itCurrent == m_Clips.Count)
                {
                    if (!m_bLoop)
                    {
                        // no more clips, so allow EOS to propagate through
                        // render graph. We will receive EC_COMPLETE eventually.
                        m_pController.NoMoreSegments();

                        // disconnect graphs -- but we cannot do that until NoMoreSegments has 
                        // sent the EndOfStream through the bridge
                        m_pController.BridgeGraphs(null, null);
                        return;
                    }
                    else
                    {
                        m_pController.BridgeGraphs(null, null);
                        m_itCurrent = 0;
                    }
                }
            }
            else
            {
                m_itCurrent = m_pPlayNext;
                m_pPlayNext = -1;
            }

            // disconnect graphs before seeking the source graph
	        m_tStartPosition = 0;

            ClipEntry ce = (ClipEntry)m_Clips[m_itCurrent];

            // looping to same graph? rewind now
            if (m_itCurrent == itOld)
            {
                ce.Prime(0);
            }
            else
            {
                // need to rewind clip for next time round
                // unless we are reusing it immediately (ie looping single clip)
                // it's better to do this when not in use
                ClipEntry ce3 = (ClipEntry)m_Clips[itOld];
                ce3.Prime(0);
            }

            // now we are about to connect it, so as soon as data is delivered out of the graph it
            // is no longer primed for re-use (it will need a new seek before using again)
            ce.InUse();

	        // reconnect
            m_pController.BridgeGraphs(ce.SinkFilter(), m_pRenderGraphSourceFilter);
        }

        public void OnEndOfSegment()
        {
            if (m_itCurrent == m_Clips.Count)
            {
                // ? already at the end
                return;
            }

            int itOld = m_itCurrent;

            // locate next graph
            m_itCurrent++;
            if (m_pPlayNext >= 0)
            {
                // jump to specified clip
                m_itCurrent = m_pPlayNext;
                m_pPlayNext = -1;
            }

            if (m_itCurrent == m_Clips.Count)
            {
                if (!m_bLoop)
                {
                    // no more clips, so allow EOS to propagate through
                    // render graph. We will receive EC_COMPLETE eventually.
                    m_pController.NoMoreSegments();

                    // disconnect graphs -- but we cannot do that until NoMoreSegments has 
                    // sent the EndOfStream through the bridge
                    m_pController.BridgeGraphs(null, null);
                    return;
                }

                // disconnect graphs before seeking the source graph
                m_pController.BridgeGraphs(null, null);
                m_itCurrent = 0;
                m_tStartPosition = 0;
            }

            ClipEntry ce = (ClipEntry)m_Clips[m_itCurrent];

            // has this graph been rewound?
            ce.Prime();

            // now we are about to connect it, so as soon as data is delivered out of the graph it
            // is no longer primed for re-use (it will need a new seek before using again)
            ce.InUse();

            // reconnect
            m_pController.BridgeGraphs(ce.SinkFilter(), m_pRenderGraphSourceFilter);

            if (m_bLoop && (m_itCurrent != itOld))
            {
                ce = (ClipEntry)m_Clips[itOld];

                // need to rewind clip for next time round
                // unless we are reusing it immediately (ie looping single clip)
                // it's better to do this when not in use
                ce.Prime(0);
            }
        }

        public void OnEvent()
        {
            IMediaEventEx pME = m_pRenderGraph as IMediaEventEx;
            if (pME != null)
	        {
                EventCode lEvent;
                IntPtr l1, l2;
		        while (pME.GetEvent(out lEvent, out l1, out l2, 0) == S_OK)
		        {
                    switch (lEvent)
                    {
                        case EventCode.Complete:
                            Stop();
                            break;
                        case EventCode.VideoSizeChanged:
                            ResizeWindowToVideo();
                            break;
                    }
			        pME.FreeEventParams(lEvent, l1, l2);
		        }
	        }
        }

        public void ResizeWindowToVideo()
        {
            IVideoWindow pVW = m_pRenderGraph as IVideoWindow;
            IBasicVideo pBV = m_pRenderGraph as IBasicVideo;
            if ((pVW != null) && (pBV != null))
            {
                // size of new video
                int cx, cy;
                pBV.GetVideoSize(out cx, out cy);
                DsRect rcVideo = new DsRect(0, 0, cx, cy);

                // adjust from client size to window size
                WindowStyle style;
                pVW.get_WindowStyle(out style);
                //AdjustWindowRect(rcVideo, style, false);

                // get current window top/left
                int cxWindow, cyWindow;
                DsRect rc = new DsRect();
                pVW.GetWindowPosition(out rc.left, out rc.top, out cxWindow, out cyWindow);
                
                // reposition video window with old top/left position and new size
                pVW.SetWindowPosition(rc.left, rc.top, rcVideo.right - rcVideo.left, rcVideo.bottom - rcVideo.top);
            }
        }

        public long CurrentPosition()
        {
	        if ((m_itCurrent == m_Clips.Count) || !m_bActive)
	        {
		        return m_tStartPosition;
	        }
	        double dTime = 0;
	        m_pController.GetSegmentTime(out dTime);
	        long tNow = (long)(dTime * 10000000);

            ClipEntry ce = (ClipEntry)m_Clips[m_itCurrent];

	        // this is relative to the start position within this particular clip.
	        // Did we start at the beginning of this clip?
	        if (m_tStartPosition > ce.GetStartPosition())
	        {
		        // no, we started some distance into the clip
		        tNow += (m_tStartPosition - ce.GetStartPosition());
	        }
	        // offset from start of this clip to start of entire sequence
	        tNow += ce.GetStartPosition();

	        if ((tNow < 0) && m_bLoop)
	        {
		        // current time is near end of previous loop
                ce = (ClipEntry)m_Clips[m_Clips.Count-1];
		        tNow += ce.GetStartPosition() + ce.Duration();
	        }
	        return tNow;
        }

        public int SeekSourceGraphs()
        {
            ClipEntry ce;

            // disconnect first
            m_pController.BridgeGraphs(null, null);

            // now seek all graphs and activate them

            long tStartThis = 0;
            int hr = E_INVALIDARG;
	        m_itCurrent = 0;
            for(int x=0; x < m_Clips.Count; x++)
            {
                ce = (ClipEntry)m_Clips[x];
                // all clips at or after start: seek to correct position
                if ((tStartThis + ce.Duration()) <= m_tStartPosition)
                {
                    // whole clip is before beginning point - not required
			        // but must rewind if we are in loop mode
			        if (m_bLoop)
			        {
                        ce.Prime(0);
			        }
                } 
                else 
                {
                    // included in clip -- set start position
                    long tOffset = 0;
                    if (m_tStartPosition >= tStartThis)
                    {
                        // starts someway in (this is first clip in sequence)
                        m_itCurrent = x;
                        tOffset = m_tStartPosition - tStartThis;
                    }
                    ce.Prime(tOffset);
                }

                tStartThis += ce.Duration();
            }

            // bridge the correct graph
            // note: once connected, this graph is no longer primed (it has output some data
            // and will need rewinding before re-use)
            ce = (ClipEntry)m_Clips[m_itCurrent];
            ce.InUse();
            hr = m_pController.BridgeGraphs(ce.SinkFilter(), m_pRenderGraphSourceFilter);

            return hr;
        }

        public int SetPosition(long tStart)
        {
	        m_tStartPosition = tStart;
            IMediaControl pMC = m_pRenderGraph as IMediaControl;
            if (pMC == null)
	        {
		        return E_FAIL;
	        }
	        FilterState fs;
	        pMC.GetState(0, out fs);
	        bool bRunning = false;
            if (fs == FilterState.Running)
	        {
		        pMC.Pause();
		        bRunning = true;
	        } 
            else if (fs == FilterState.Stopped)
	        {
                // on going active, we'll seek all graphs
                return S_OK;
            }

            int hr = SeekSourceGraphs();

	        if (bRunning)
	        {
		        pMC.Run();
	        }
	        return hr;
        }

        public ClipEntry CurrentClip()
        {
	        if (m_itCurrent == m_Clips.Count)
	        {
                return null;
	        }
            ClipEntry ce = (ClipEntry)m_Clips[m_itCurrent];
            return ce;
        }

        public void UpdateDuration()
        {
	        // loop through all clips setting position and calculating duration
	        m_tDuration = 0;
            foreach (ClipEntry pClip in m_Clips)
	        {
		        pClip.SetStartPosition(m_tDuration);
		        m_tDuration += pClip.Duration();
	        }
        }

        public int SetClipLimits(ClipEntry pClip, long tStart, long tEnd)
        {
            long tDur = pClip.Duration();
            int hr = pClip.SetLimits(tStart, tEnd);
            if (hr < 0 || (tDur == pClip.Duration()))
            {
                return hr;
            }

            // this is called from the same message loop as the end-of-segment processing, so it's safe to 
            // access the current segment
            if (pClip == CurrentClip())
            {
                // send just the stop time to the graph
                // in the hope that it is not too late
                hr = pClip.SetStopTime();
            }

            // clip duration has changed: update start position of
            // all subsequent clips (for current position slider UI)

	        m_tDuration = 0;
            bool bFound = false;
            foreach (ClipEntry pThis in m_Clips)
	        {
                if (pThis == pClip)
                {
                    bFound = true;
                    m_tDuration = pClip.GetStartPosition() + pClip.Duration();
                } 
                else if (bFound)
                {
                    // following clip: adjust
                    pClip.SetStartPosition(m_tDuration);
                    m_tDuration += pClip.Duration();
                }
            }
            return S_OK;
        }

        public void SetLoop(bool bLoop)
        {
	        m_bLoop = bLoop;
        }

        public FilterState GetState()
        {
            FilterState state = FilterState.Stopped;
            IMediaControl pMC = m_pRenderGraph as IMediaControl;
            if (pMC != null)
	        {
		        pMC.GetState(0, out state);
	        }
	        return state;
        }

        public ClipEntry GetClipByIndex(int idx)
        {
            ClipEntry ce;
            if (idx >= 0 && idx < m_Clips.Count)
            {
                ce = (ClipEntry)m_Clips[idx];
            }
            else
            {
                ce = null;
            }

            return ce;
        }

        public void PlayNext(int iClip)
        {
            // synchronised by windows message queue
            m_pPlayNext = iClip;
        }

        #region IDisposable Members

        public void Dispose()
        {
            GC.SuppressFinalize(this);

            Stop();

            if (m_pController != null)
            {
    	        m_pController.BridgeGraphs(null, null);
                Marshal.ReleaseComObject(m_pController);
                m_pController = null;
            }

            foreach(ClipEntry ce in m_Clips)
            {
                ce.Dispose();
            }
            m_Clips.Clear();

            if (m_pRenderGraph != null)
            {
                Marshal.ReleaseComObject(m_pRenderGraph);
                m_pRenderGraph = null;
            }

            if (m_pRenderGraphSourceFilter != null)
            {
                Marshal.ReleaseComObject(m_pRenderGraphSourceFilter);
                m_pRenderGraphSourceFilter = null;
            }

        }

        #endregion
    }
}


// ---------- ClipEntry implementation -----------------

public class ClipEntry : IDisposable
{
    #region Constants

    private const int S_OK = 0;
    private const int E_NOINTERFACE = unchecked((int)0x80000004);

    #endregion

    #region Member variables

    private long m_tOffset;
    private long m_tStart;
    private long m_tStop;
    private bool m_bPrimed;
    private string m_strName;

    private IFilterGraph m_pGraph;
    private IBaseFilter m_pSinkFilter;

    #endregion

    public ClipEntry()
    {
        m_tOffset = 0;
        m_tStart = 0;
        m_tStop = 0;
        m_bPrimed = false;
    }

    public ClipEntry(ClipEntry r)
    {
	    m_tOffset = r.m_tOffset;
	    m_pGraph = r.m_pGraph;
	    m_pSinkFilter = r.m_pSinkFilter;
	    m_strName = r.m_strName;
	    m_tStart = r.m_tStart;
	    m_tStop = r.m_tStop;
        m_bPrimed = r.m_bPrimed;
    }

    public IBaseFilter SinkFilter()
    {
        return m_pSinkFilter;
    }

    public long GetStartPosition()
    {
        return m_tOffset;
    }

    public void SetStartPosition(long tOffset)
    {
        m_tOffset = tOffset;
    }

    public void GetLimits(out long ptStart, out long ptStop)
    {
        ptStart = m_tStart;
        ptStop = m_tStop;
    }

    public IFilterGraph Graph()
    {
        return m_pGraph;
    }

    public string Name()
    {
        return m_strName;
    }

    ClipEntry Copy(ClipEntry r)
    {
	    m_tOffset = r.m_tOffset;
	    m_pGraph = r.m_pGraph;
	    m_pSinkFilter = r.m_pSinkFilter;
        m_strName = r.m_strName;
	    m_tStart = r.m_tStart;
	    m_tStop = r.m_tStop;
        m_bPrimed = r.m_bPrimed;

	    return this;
    }

    public int Create(IGMFBridgeController pController, string path)
    {
        m_bPrimed = false;

        m_pGraph = new FilterGraph() as IGraphBuilder;
	    int hr = pController.CreateSourceGraph(path, m_pGraph, out m_pSinkFilter);

	    m_strName = path.Substring(path.LastIndexOf('\\')+1);

        if (hr < 0)
	    {
            if (m_pGraph != null)
            {
                Marshal.ReleaseComObject(m_pGraph);
                m_pGraph = null;
            }
	    }

	    return hr;
    }

    public int SetLimits(long tStart, long tStop)
    {
	    m_tStart = tStart;
	    m_tStop = tStop;
        m_bPrimed = false;
	    return S_OK;
    }

    public long Duration()
    {
	    if (m_tStop == 0)
	    {
		    long tDur = 0;
            IMediaSeeking pMS = m_pGraph as IMediaSeeking;
            int hr = pMS.GetDuration(out tDur);
            if (hr < 0)
            {
                return 0;
            }
            
		    return tDur - m_tStart;
	    }
	    return m_tStop - m_tStart;
    }

    public long NativeDuration()
    {
        // native duration with no limits applied
	    long tDur = 0;
        IMediaSeeking pMS = m_pGraph as IMediaSeeking;
        int hr = pMS.GetDuration(out tDur);
	    return tDur;
    }

    public long CurrentPosition()
    {
	    // stream time in graph
        IMediaSeeking pMS = m_pGraph as IMediaSeeking;
	    long tNow = 0;
	    pMS.GetCurrentPosition(out tNow);
	    return tNow + m_tStart;
    }

    public int SetPosition(long tStart)
    {
        IMediaSeeking pSeek = m_pGraph as IMediaSeeking;
	    int hr = E_NOINTERFACE;
        if (pSeek != null)
	    {
		    // input time is relative to clip start -- add on offset
		    // from start of media
		    tStart += m_tStart;
		    if (m_tStop == 0)
		    {
			    hr = pSeek.SetPositions(
							    tStart,
                                AMSeekingSeekingFlags.AbsolutePositioning,
                                null,
                                AMSeekingSeekingFlags.NoPositioning);
		    } else {
			    hr = pSeek.SetPositions(
							    tStart,
                                AMSeekingSeekingFlags.AbsolutePositioning, 
							    m_tStop,
							    AMSeekingSeekingFlags.AbsolutePositioning);
		    }
	    }
	    return hr;
    }

    public int SetStopTime()
    {
        // for limits change of active clip: pass the stop time to graph

        IMediaSeeking pSeek = m_pGraph as IMediaSeeking;
	    int hr = E_NOINTERFACE;
        if (pSeek != null)
	    {
		    hr = pSeek.SetPositions(
                            null,
                            AMSeekingSeekingFlags.NoPositioning,
						    m_tStop,
						    AMSeekingSeekingFlags.AbsolutePositioning);
        }
        return hr;
    }

    // in use: so no longer primed
    public void InUse()
    {
        m_bPrimed = false;
    }

    public void Prime()
    {
        Prime(0);
    }

    public void Prime(long tStart)
    {
        if (!m_bPrimed)
        {
            SetPosition(tStart);

            IMediaControl pMC = Graph() as IMediaControl;
            FilterState state;
            pMC.GetState(0, out state);
            if (state != FilterState.Running)
            {
                pMC.Run();
            }
            m_bPrimed = true;
        }
    }

    public void Stop()
    {
        IMediaControl pMC = Graph() as IMediaControl;
        pMC.Stop();
        m_bPrimed = false;
    }

    #region IDisposable Members

    public void Dispose()
    {
        GC.SuppressFinalize(this);

        if (m_pGraph != null)
        {
            IMediaControl pMC = m_pGraph as IMediaControl;
            pMC.Stop();

            Marshal.ReleaseComObject(m_pGraph);
            m_pGraph = null;
        }

        if (m_pSinkFilter != null)
        {
            Marshal.ReleaseComObject(m_pSinkFilter);
            m_pSinkFilter = null;
        }
    }

    #endregion
}
