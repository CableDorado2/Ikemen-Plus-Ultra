/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Runtime.InteropServices;
using System.Windows.Forms;

using DirectShowLib;

namespace DirectShowLib.Sample
{
  internal enum PlayState
  {
    Stopped, 
    Paused, 
    Running, 
    Init
  };

  internal enum MediaType
  {
    Audio,
    Video
  }

  public class MainForm : System.Windows.Forms.Form
  {
    private const int WMGraphNotify = 0x0400 + 13;
    private const int VolumeFull = 0;
    private const int VolumeSilence = -10000;

    private IGraphBuilder graphBuilder = null;
    private IMediaControl mediaControl = null;
    private IMediaEventEx mediaEventEx = null;
    private IVideoWindow  videoWindow = null;
    private IBasicAudio   basicAudio = null;
    private IBasicVideo   basicVideo = null;
    private IMediaSeeking mediaSeeking = null;
    private IMediaPosition mediaPosition = null;
    private IVideoFrameStep frameStep = null;

    private string filename = string.Empty;
    private bool isAudioOnly = false;
    private bool isFullScreen = false;
    private int currentVolume = VolumeFull;
    private PlayState currentState = PlayState.Stopped;
    private double currentPlaybackRate = 1.0;

    private IntPtr hDrain = IntPtr.Zero;

#if DEBUG
    private DsROTEntry rot = null;
#endif

    private System.Windows.Forms.MainMenu mainMenu1;
    private System.Windows.Forms.MenuItem menuItem1;
    private System.Windows.Forms.MenuItem menuItem4;
    private System.Windows.Forms.MenuItem menuItem6;
    private System.Windows.Forms.MenuItem menuItem10;
    private System.Windows.Forms.MenuItem menuItem12;
    private System.Windows.Forms.MenuItem menuItem17;
    private System.Windows.Forms.MenuItem menuItem19;
    private System.Windows.Forms.MenuItem menuItem22;
    private System.Windows.Forms.MenuItem menuItem26;
    private System.Windows.Forms.MenuItem menuFileOpenClip;
    private System.Windows.Forms.MenuItem menuFileClose;
    private System.Windows.Forms.MenuItem menuFileExit;
    private System.Windows.Forms.MenuItem menuFilePause;
    private System.Windows.Forms.MenuItem menuFileStop;
    private System.Windows.Forms.MenuItem menuFileMute;
    private System.Windows.Forms.MenuItem menuSingleStep;
    private System.Windows.Forms.MenuItem menuFileSizeHalf;
    private System.Windows.Forms.MenuItem menuFileSizeThreeQuarter;
    private System.Windows.Forms.MenuItem menuFileSizeNormal;
    private System.Windows.Forms.MenuItem menuFileSizeDouble;
    private System.Windows.Forms.MenuItem menuFileFullScreen;
    private System.Windows.Forms.MenuItem menuRateIncrease;
    private System.Windows.Forms.MenuItem menuRateDecrease;
    private System.Windows.Forms.MenuItem menuRateNormal;
    private System.Windows.Forms.MenuItem menuRateHalf;
    private System.Windows.Forms.MenuItem menuRateDouble;
    private System.Windows.Forms.MenuItem menuHelpAbout;
    private System.Windows.Forms.OpenFileDialog openFileDialog1;

    /// <summary>
    /// Variable nécessaire au concepteur.
    /// </summary>
    private System.ComponentModel.Container components = null;

    public MainForm()
    {
      //
      // Requis pour la prise en charge du Concepteur Windows Forms
      //
      InitializeComponent();

      //
      // TODO : ajoutez le code du constructeur après l'appel à InitializeComponent
      //
    }

    /// <summary>
    /// Nettoyage des ressources utilisées.
    /// </summary>
    protected override void Dispose( bool disposing )
    {
      if( disposing )
      {
        if (components != null) 
        {
          components.Dispose();
        }
      }
      base.Dispose( disposing );
    }


    #region Code généré par le Concepteur Windows Form
    /// <summary>
    /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
    /// le contenu de cette méthode avec l'éditeur de code.
    /// </summary>
    private void InitializeComponent()
    {
      this.mainMenu1 = new System.Windows.Forms.MainMenu();
      this.menuItem1 = new System.Windows.Forms.MenuItem();
      this.menuFileOpenClip = new System.Windows.Forms.MenuItem();
      this.menuFileClose = new System.Windows.Forms.MenuItem();
      this.menuItem4 = new System.Windows.Forms.MenuItem();
      this.menuFileExit = new System.Windows.Forms.MenuItem();
      this.menuItem6 = new System.Windows.Forms.MenuItem();
      this.menuFilePause = new System.Windows.Forms.MenuItem();
      this.menuFileStop = new System.Windows.Forms.MenuItem();
      this.menuFileMute = new System.Windows.Forms.MenuItem();
      this.menuItem10 = new System.Windows.Forms.MenuItem();
      this.menuSingleStep = new System.Windows.Forms.MenuItem();
      this.menuItem12 = new System.Windows.Forms.MenuItem();
      this.menuFileSizeHalf = new System.Windows.Forms.MenuItem();
      this.menuFileSizeThreeQuarter = new System.Windows.Forms.MenuItem();
      this.menuFileSizeNormal = new System.Windows.Forms.MenuItem();
      this.menuFileSizeDouble = new System.Windows.Forms.MenuItem();
      this.menuItem17 = new System.Windows.Forms.MenuItem();
      this.menuFileFullScreen = new System.Windows.Forms.MenuItem();
      this.menuItem19 = new System.Windows.Forms.MenuItem();
      this.menuRateIncrease = new System.Windows.Forms.MenuItem();
      this.menuRateDecrease = new System.Windows.Forms.MenuItem();
      this.menuItem22 = new System.Windows.Forms.MenuItem();
      this.menuRateNormal = new System.Windows.Forms.MenuItem();
      this.menuRateHalf = new System.Windows.Forms.MenuItem();
      this.menuRateDouble = new System.Windows.Forms.MenuItem();
      this.menuItem26 = new System.Windows.Forms.MenuItem();
      this.menuHelpAbout = new System.Windows.Forms.MenuItem();
      this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
      // 
      // mainMenu1
      // 
      this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                              this.menuItem1,
                                                                              this.menuItem6,
                                                                              this.menuItem19,
                                                                              this.menuItem26});
      // 
      // menuItem1
      // 
      this.menuItem1.Index = 0;
      this.menuItem1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                              this.menuFileOpenClip,
                                                                              this.menuFileClose,
                                                                              this.menuItem4,
                                                                              this.menuFileExit});
      this.menuItem1.Text = "File";
      // 
      // menuFileOpenClip
      // 
      this.menuFileOpenClip.Index = 0;
      this.menuFileOpenClip.Text = "Open clip...";
      this.menuFileOpenClip.Click += new System.EventHandler(this.menuFileOpenClip_Click);
      // 
      // menuFileClose
      // 
      this.menuFileClose.Index = 1;
      this.menuFileClose.Text = "Close clip";
      this.menuFileClose.Click += new System.EventHandler(this.menuFileClose_Click);
      // 
      // menuItem4
      // 
      this.menuItem4.Index = 2;
      this.menuItem4.Text = "-";
      // 
      // menuFileExit
      // 
      this.menuFileExit.Index = 3;
      this.menuFileExit.Text = "Exit";
      this.menuFileExit.Click += new System.EventHandler(this.menuFileExit_Click);
      // 
      // menuItem6
      // 
      this.menuItem6.Index = 1;
      this.menuItem6.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                              this.menuFilePause,
                                                                              this.menuFileStop,
                                                                              this.menuFileMute,
                                                                              this.menuItem10,
                                                                              this.menuSingleStep,
                                                                              this.menuItem12,
                                                                              this.menuFileSizeHalf,
                                                                              this.menuFileSizeThreeQuarter,
                                                                              this.menuFileSizeNormal,
                                                                              this.menuFileSizeDouble,
                                                                              this.menuItem17,
                                                                              this.menuFileFullScreen});
      this.menuItem6.Text = "Control";
      // 
      // menuFilePause
      // 
      this.menuFilePause.Index = 0;
      this.menuFilePause.Text = "Play/Pause";
      this.menuFilePause.Click += new System.EventHandler(this.menuFilePause_Click);
      // 
      // menuFileStop
      // 
      this.menuFileStop.Index = 1;
      this.menuFileStop.Text = "Stop";
      this.menuFileStop.Click += new System.EventHandler(this.menuFileStop_Click);
      // 
      // menuFileMute
      // 
      this.menuFileMute.Index = 2;
      this.menuFileMute.Text = "Mute/Unmute";
      this.menuFileMute.Click += new System.EventHandler(this.menuFileMute_Click);
      // 
      // menuItem10
      // 
      this.menuItem10.Index = 3;
      this.menuItem10.Text = "-";
      // 
      // menuSingleStep
      // 
      this.menuSingleStep.Index = 4;
      this.menuSingleStep.Text = "Single Frame Step";
      this.menuSingleStep.Click += new System.EventHandler(this.menuSingleStep_Click);
      // 
      // menuItem12
      // 
      this.menuItem12.Index = 5;
      this.menuItem12.Text = "-";
      // 
      // menuFileSizeHalf
      // 
      this.menuFileSizeHalf.Index = 6;
      this.menuFileSizeHalf.Text = "Half size (50%)";
      this.menuFileSizeHalf.Click += new System.EventHandler(this.menuFileSize_Click);
      // 
      // menuFileSizeThreeQuarter
      // 
      this.menuFileSizeThreeQuarter.Index = 7;
      this.menuFileSizeThreeQuarter.Text = "Three-quarter size (75%)";
      this.menuFileSizeThreeQuarter.Click += new System.EventHandler(this.menuFileSize_Click);
      // 
      // menuFileSizeNormal
      // 
      this.menuFileSizeNormal.Index = 8;
      this.menuFileSizeNormal.Text = "Normal size (100%)";
      this.menuFileSizeNormal.Click += new System.EventHandler(this.menuFileSize_Click);
      // 
      // menuFileSizeDouble
      // 
      this.menuFileSizeDouble.Index = 9;
      this.menuFileSizeDouble.Text = "Double size (200%)";
      this.menuFileSizeDouble.Click += new System.EventHandler(this.menuFileSize_Click);
      // 
      // menuItem17
      // 
      this.menuItem17.Index = 10;
      this.menuItem17.Text = "-";
      // 
      // menuFileFullScreen
      // 
      this.menuFileFullScreen.Index = 11;
      this.menuFileFullScreen.Text = "Full Screen";
      this.menuFileFullScreen.Click += new System.EventHandler(this.menuFileFullScreen_Click);
      // 
      // menuItem19
      // 
      this.menuItem19.Index = 2;
      this.menuItem19.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                               this.menuRateIncrease,
                                                                               this.menuRateDecrease,
                                                                               this.menuItem22,
                                                                               this.menuRateNormal,
                                                                               this.menuRateHalf,
                                                                               this.menuRateDouble});
      this.menuItem19.Text = "Rate";
      // 
      // menuRateIncrease
      // 
      this.menuRateIncrease.Index = 0;
      this.menuRateIncrease.Text = "Increase Playback Rate";
      this.menuRateIncrease.Click += new System.EventHandler(this.menuRate_Click);
      // 
      // menuRateDecrease
      // 
      this.menuRateDecrease.Index = 1;
      this.menuRateDecrease.Text = "Decrease Playback Rate";
      this.menuRateDecrease.Click += new System.EventHandler(this.menuRate_Click);
      // 
      // menuItem22
      // 
      this.menuItem22.Index = 2;
      this.menuItem22.Text = "-";
      // 
      // menuRateNormal
      // 
      this.menuRateNormal.Index = 3;
      this.menuRateNormal.Text = "Normal Playback Rate";
      this.menuRateNormal.Click += new System.EventHandler(this.menuRate_Click);
      // 
      // menuRateHalf
      // 
      this.menuRateHalf.Index = 4;
      this.menuRateHalf.Text = "Half Playback Rate";
      this.menuRateHalf.Click += new System.EventHandler(this.menuRate_Click);
      // 
      // menuRateDouble
      // 
      this.menuRateDouble.Index = 5;
      this.menuRateDouble.Text = "Double Playback Rate";
      this.menuRateDouble.Click += new System.EventHandler(this.menuRate_Click);
      // 
      // menuItem26
      // 
      this.menuItem26.Index = 3;
      this.menuItem26.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                               this.menuHelpAbout});
      this.menuItem26.Text = "Help";
      // 
      // menuHelpAbout
      // 
      this.menuHelpAbout.Index = 0;
      this.menuHelpAbout.Text = "About";
      this.menuHelpAbout.Click += new System.EventHandler(this.menuHelpAbout_Click);
      // 
      // openFileDialog1
      // 
      this.openFileDialog1.Filter = @"Video Files (*.avi; *.qt; *.mov; *.mpg; *.mpeg; *.m1v)|*.avi; *.qt; *.mov; *.mpg; *.mpeg; *.m1v|Audio files (*.wav; *.mpa; *.mp2; *.mp3; *.au; *.aif; *.aiff; *.snd)|*.wav; *.mpa; *.mp2; *.mp3; *.au; *.aif; *.aiff; *.snd|MIDI Files (*.mid, *.midi, *.rmi)|*.mid; *.midi; *.rmi|Image Files (*.jpg, *.bmp, *.gif, *.tga)|*.jpg; *.bmp; *.gif; *.tga|All Files (*.*)|*.*";
      // 
      // MainForm
      // 
      this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
      this.ClientSize = new System.Drawing.Size(240, 120);
      this.Menu = this.mainMenu1;
      this.Name = "MainForm";
      this.Text = "PlayWnd Media Player";
      this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.MainForm_KeyDown);
      this.Resize += new System.EventHandler(this.MainForm_Resize);
      this.Closing += new System.ComponentModel.CancelEventHandler(this.MainForm_Closing);
      this.Move += new System.EventHandler(this.MainForm_Move);

    }
    #endregion

    /*
     * Graph creation and destruction methods
     */

    private void OpenClip()
    {
      try
      {
        // If no filename specified by command line, show file open dialog
        if (this.filename == string.Empty)
        {
          UpdateMainTitle();

          this.filename = GetClipFileName();
          if (this.filename == string.Empty)
            return;
        }

        // Reset status variables
        this.currentState = PlayState.Stopped;
        this.currentVolume = VolumeFull;

        // Start playing the media file
        PlayMovieInWindow(this.filename);
      }
      catch
      {
        CloseClip();
      }
    }

    private void PlayMovieInWindow(string filename)
    {
      int hr = 0;

      if (filename == string.Empty)
        return;

      this.graphBuilder = (IGraphBuilder) new FilterGraph();

      // Have the graph builder construct its the appropriate graph automatically
      hr = this.graphBuilder.RenderFile(filename, null);
      DsError.ThrowExceptionForHR(hr);

      // QueryInterface for DirectShow interfaces
      this.mediaControl = (IMediaControl) this.graphBuilder;
      this.mediaEventEx = (IMediaEventEx) this.graphBuilder;
      this.mediaSeeking = (IMediaSeeking) this.graphBuilder;
      this.mediaPosition = (IMediaPosition) this.graphBuilder;

      // Query for video interfaces, which may not be relevant for audio files
      this.videoWindow = this.graphBuilder as IVideoWindow;
      this.basicVideo = this.graphBuilder as IBasicVideo;

      // Query for audio interfaces, which may not be relevant for video-only files
      this.basicAudio = this.graphBuilder as IBasicAudio;

      // Is this an audio-only file (no video component)?
      CheckVisibility();

      // Have the graph signal event via window callbacks for performance
      hr = this.mediaEventEx.SetNotifyWindow(this.Handle, WMGraphNotify, IntPtr.Zero);
      DsError.ThrowExceptionForHR(hr);

      if (!this.isAudioOnly)
      {
        // Setup the video window
        hr = this.videoWindow.put_Owner(this.Handle);
        DsError.ThrowExceptionForHR(hr);

        hr = this.videoWindow.put_WindowStyle(WindowStyle.Child | WindowStyle.ClipSiblings | WindowStyle.ClipChildren);
        DsError.ThrowExceptionForHR(hr);

        hr = InitVideoWindow(1, 1);
        DsError.ThrowExceptionForHR(hr);

        GetFrameStepInterface();
      }
      else
      {
        // Initialize the default player size and enable playback menu items
        hr = InitPlayerWindow();
        DsError.ThrowExceptionForHR(hr);

        EnablePlaybackMenu(true, MediaType.Audio);
      }

      // Complete window initialization
      CheckSizeMenu(menuFileSizeNormal);
      this.isFullScreen = false;
      this.currentPlaybackRate = 1.0;
      UpdateMainTitle();

#if DEBUG
      rot = new DsROTEntry(this.graphBuilder);
#endif

      this.Focus();

      // Run the graph to play the media file
      hr = this.mediaControl.Run();
      DsError.ThrowExceptionForHR(hr);

      this.currentState=PlayState.Running;
    }

    private void CloseClip()
    {
      int hr = 0;

      // Stop media playback
      if(this.mediaControl != null)
        hr = this.mediaControl.Stop();

      // Clear global flags
      this.currentState = PlayState.Stopped;
      this.isAudioOnly = true;
      this.isFullScreen = false;

      // Free DirectShow interfaces
      CloseInterfaces();

      // Clear file name to allow selection of new file with open dialog
      this.filename = string.Empty;

      // No current media state
      this.currentState = PlayState.Init;

      UpdateMainTitle();
      InitPlayerWindow();
    }

    private int InitVideoWindow(int nMultiplier, int nDivider)
    {
      int hr = 0;
      int lHeight, lWidth;

      if (this.basicVideo == null)
        return 0;

      // Read the default video size
      hr = this.basicVideo.GetVideoSize(out lWidth, out lHeight);
      if (hr == DsResults.E_NoInterface)
        return 0;

      EnablePlaybackMenu(true, MediaType.Video);

      // Account for requests of normal, half, or double size
      lWidth  = lWidth  * nMultiplier / nDivider;
      lHeight = lHeight * nMultiplier / nDivider;

      this.ClientSize = new Size(lWidth, lHeight);
      Application.DoEvents();

      hr = this.videoWindow.SetWindowPosition(0, 0, lWidth, lHeight);

      return hr;
    }

    private void MoveVideoWindow()
    {
      int hr = 0;

      // Track the movement of the container window and resize as needed
      if (this.videoWindow != null)
      {
        hr = this.videoWindow.SetWindowPosition(
          this.ClientRectangle.Left,
          this.ClientRectangle.Top,
          this.ClientRectangle.Width,
          this.ClientRectangle.Height
          );
        DsError.ThrowExceptionForHR(hr);
      }
    }

    private void CheckVisibility()
    {
      int hr = 0;
      OABool lVisible;

      if ((this.videoWindow == null) || (this.basicVideo == null))
      {
        // Audio-only files have no video interfaces.  This might also
        // be a file whose video component uses an unknown video codec.
        this.isAudioOnly = true;
        return;
      }
      else
      {
        // Clear the global flag
        this.isAudioOnly = false;
      }

      hr = this.videoWindow.get_Visible(out lVisible);
      if (hr < 0)
      {
        // If this is an audio-only clip, get_Visible() won't work.
        //
        // Also, if this video is encoded with an unsupported codec,
        // we won't see any video, although the audio will work if it is
        // of a supported format.
        if (hr == unchecked((int) 0x80004002)) //E_NOINTERFACE
        {
          this.isAudioOnly = true;
        }
        else
          DsError.ThrowExceptionForHR(hr);
      }
    }

    //
    // Some video renderers support stepping media frame by frame with the
    // IVideoFrameStep interface.  See the interface documentation for more
    // details on frame stepping.
    //
    private bool GetFrameStepInterface()
    {
      int hr = 0;

      IVideoFrameStep frameStepTest = null;

      // Get the frame step interface, if supported
      frameStepTest = (IVideoFrameStep) this.graphBuilder;

      // Check if this decoder can step
      hr = frameStepTest.CanStep(0, null);
      if (hr == 0)
      {
        this.frameStep = frameStepTest;
        return true;
      }
      else
      {
        // BUG 1560263 found by husakm (thanks)...
        // Marshal.ReleaseComObject(frameStepTest);
        this.frameStep = null;
        return false;
      }
    }

    private void CloseInterfaces()
    {
      int hr = 0;

      try
      {
        lock(this)
        {
          // Relinquish ownership (IMPORTANT!) after hiding video window
          if (!this.isAudioOnly)
          {
            hr = this.videoWindow.put_Visible(OABool.False);
            DsError.ThrowExceptionForHR(hr);
            hr = this.videoWindow.put_Owner(IntPtr.Zero);
            DsError.ThrowExceptionForHR(hr);
          }

          if (this.mediaEventEx != null)
          {
            hr = this.mediaEventEx.SetNotifyWindow(IntPtr.Zero, 0, IntPtr.Zero);
            DsError.ThrowExceptionForHR(hr);
          }

#if DEBUG
          if (rot != null)
          {
            rot.Dispose();
            rot = null;
          }
#endif
          // Release and zero DirectShow interfaces
          if (this.mediaEventEx != null)
            this.mediaEventEx = null;
          if (this.mediaSeeking != null) 
            this.mediaSeeking = null;
          if (this.mediaPosition != null) 
            this.mediaPosition = null;
          if (this.mediaControl != null) 
            this.mediaControl = null;
          if (this.basicAudio != null) 
            this.basicAudio = null;
          if (this.basicVideo != null) 
            this.basicVideo = null;
          if (this.videoWindow != null) 
            this.videoWindow = null;
          if (this.frameStep != null) 
            this.frameStep = null;
          if (this.graphBuilder != null) 
            Marshal.ReleaseComObject(this.graphBuilder); this.graphBuilder = null;

          GC.Collect();
        }
      }
      catch
      {
      }
    }

    /*
     * Media Related methods
     */

    private void PauseClip()
    {
      if (this.mediaControl == null)
        return;

      // Toggle play/pause behavior
      if((this.currentState == PlayState.Paused) || (this.currentState == PlayState.Stopped))
      {
        if (this.mediaControl.Run() >= 0)
          this.currentState = PlayState.Running;
      }
      else
      {
        if (this.mediaControl.Pause() >= 0)
          this.currentState = PlayState.Paused;
      }

      UpdateMainTitle();
    }

    private void StopClip()
    {
      int hr = 0;
      DsLong pos = new DsLong(0);

      if ((this.mediaControl == null) || (this.mediaSeeking == null))
        return;

      // Stop and reset postion to beginning
      if((this.currentState == PlayState.Paused) || (this.currentState == PlayState.Running))
      {
        hr = this.mediaControl.Stop();
        this.currentState = PlayState.Stopped;

        // Seek to the beginning
        hr = this.mediaSeeking.SetPositions(pos, AMSeekingSeekingFlags.AbsolutePositioning, null, AMSeekingSeekingFlags.NoPositioning);

        // Display the first frame to indicate the reset condition
        hr = this.mediaControl.Pause();
      }
      UpdateMainTitle();
    }

    private int ToggleMute()
    {
      int hr = 0;

      if ((this.graphBuilder == null) || (this.basicAudio == null))
        return 0;

      // Read current volume
      hr = this.basicAudio.get_Volume(out this.currentVolume);
      if (hr == -1) //E_NOTIMPL
      {
        // Fail quietly if this is a video-only media file
        return 0;
      }
      else if (hr < 0)
      {
        return hr;
      }

      // Switch volume levels
      if (this.currentVolume == VolumeFull)
        this.currentVolume = VolumeSilence;
      else
        this.currentVolume = VolumeFull;

      // Set new volume
      hr = this.basicAudio.put_Volume(this.currentVolume);

      UpdateMainTitle();
      return hr;
    }

    private int ToggleFullScreen()
    {
      int hr = 0;
      OABool lMode;

      // Don't bother with full-screen for audio-only files
      if ((this.isAudioOnly) || (this.videoWindow == null))
        return 0;

      // Read current state
      hr = this.videoWindow.get_FullScreenMode(out lMode);
      DsError.ThrowExceptionForHR(hr);

      if (lMode == OABool.False)
      {
        // Save current message drain
        hr = this.videoWindow.get_MessageDrain(out hDrain);
        DsError.ThrowExceptionForHR(hr);

        // Set message drain to application main window
        hr = this.videoWindow.put_MessageDrain(this.Handle);
        DsError.ThrowExceptionForHR(hr);

        // Switch to full-screen mode
        lMode = OABool.True;
        hr = this.videoWindow.put_FullScreenMode(lMode);
        DsError.ThrowExceptionForHR(hr);
        this.isFullScreen = true;
      }
      else
      {
        // Switch back to windowed mode
        lMode = OABool.False;
        hr = this.videoWindow.put_FullScreenMode(lMode);
        DsError.ThrowExceptionForHR(hr);

        // Undo change of message drain
        hr = this.videoWindow.put_MessageDrain(hDrain);
        DsError.ThrowExceptionForHR(hr);

        // Reset video window
        hr = this.videoWindow.SetWindowForeground(OABool.True);
        DsError.ThrowExceptionForHR(hr);

        // Reclaim keyboard focus for player application
        //this.Focus();
        this.isFullScreen = false;
      }

      return hr;
    }

    private int StepOneFrame()
    {
      int hr = 0;

      // If the Frame Stepping interface exists, use it to step one frame
      if (this.frameStep != null)
      {
        // The graph must be paused for frame stepping to work
        if (this.currentState != PlayState.Paused)
          PauseClip();

        // Step the requested number of frames, if supported
        hr = this.frameStep.Step(1, null);
      }

      return hr;
    }

    private int StepFrames(int nFramesToStep)
    {
      int hr = 0;

      // If the Frame Stepping interface exists, use it to step frames
      if (this.frameStep != null)
      {
        // The renderer may not support frame stepping for more than one
        // frame at a time, so check for support.  S_OK indicates that the
        // renderer can step nFramesToStep successfully.
        hr = this.frameStep.CanStep(nFramesToStep, null);
        if (hr == 0)
        {
          // The graph must be paused for frame stepping to work
          if (this.currentState != PlayState.Paused)
            PauseClip();

          // Step the requested number of frames, if supported
          hr = this.frameStep.Step(nFramesToStep, null);
        }
      }

      return hr;
    }

    private int ModifyRate(double dRateAdjust)
    {
      int hr = 0;
      double dRate;

      // If the IMediaPosition interface exists, use it to set rate
      if ((this.mediaPosition != null) && (dRateAdjust != 0.0))
      {
        hr = this.mediaPosition.get_Rate(out dRate);
        if (hr == 0)
        {
          // Add current rate to adjustment value
          double dNewRate = dRate + dRateAdjust;
          hr = this.mediaPosition.put_Rate(dNewRate);

          // Save global rate
          if (hr == 0)
          {
            this.currentPlaybackRate = dNewRate;
            UpdateMainTitle();
          }
        }
      }

      return hr;
    }

    private int SetRate(double rate)
    {
      int hr = 0;

      // If the IMediaPosition interface exists, use it to set rate
      if (this.mediaPosition != null)
      {
        hr = this.mediaPosition.put_Rate(rate);
        if (hr >= 0)
        {
          this.currentPlaybackRate = rate;
          UpdateMainTitle();
        }
      }

      return hr;
    }

    private void HandleGraphEvent()
    {
      int hr = 0;
      EventCode evCode;
      IntPtr evParam1, evParam2;

      // Make sure that we don't access the media event interface
      // after it has already been released.
      if (this.mediaEventEx == null)
        return;

      // Process all queued events
      while(this.mediaEventEx.GetEvent(out evCode, out evParam1, out evParam2, 0) == 0)
      {
        // Free memory associated with callback, since we're not using it
        hr = this.mediaEventEx.FreeEventParams(evCode, evParam1, evParam2);

        // If this is the end of the clip, reset to beginning
        if(evCode == EventCode.Complete)
        {
          DsLong pos = new DsLong(0);
          // Reset to first frame of movie
          hr = this.mediaSeeking.SetPositions(pos, AMSeekingSeekingFlags.AbsolutePositioning, 
            null, AMSeekingSeekingFlags.NoPositioning);
          if (hr < 0)
          {
            // Some custom filters (like the Windows CE MIDI filter)
            // may not implement seeking interfaces (IMediaSeeking)
            // to allow seeking to the start.  In that case, just stop
            // and restart for the same effect.  This should not be
            // necessary in most cases.
            hr = this.mediaControl.Stop();
            hr = this.mediaControl.Run();
          }
        }
      }
    }

    /*
     * WinForm Related methods
     */

    protected override void WndProc(ref Message m)
    {
      switch (m.Msg)
      {
        case WMGraphNotify :
        {
          HandleGraphEvent();
          break;
        }
      }

      // Pass this message to the video window for notification of system changes
      if (this.videoWindow != null)
        this.videoWindow.NotifyOwnerMessage(m.HWnd, m.Msg, m.WParam, m.LParam);

      base.WndProc (ref m);
    }

    private string GetClipFileName()
    {
      if (openFileDialog1.ShowDialog() == DialogResult.OK)
      {
        return openFileDialog1.FileName;
      }
      else 
        return string.Empty;
    }

    private int InitPlayerWindow()
    {
      // Reset to a default size for audio and after closing a clip
      this.ClientSize = new Size(240, 120);

      // Check the 'full size' menu item
      CheckSizeMenu(menuFileSizeNormal);
      EnablePlaybackMenu(false, MediaType.Audio);

      return 0;
    }

    private void UpdateMainTitle()
    {
      // If no file is loaded, just show the application title
      if (this.filename == string.Empty)
        this.Text = "PlayWnd Media Player";
      else
      {
        string media = (isAudioOnly) ? "Audio" : "Video";
        string muted = (currentVolume == VolumeSilence) ? "Mute" : "";
        string paused = (currentState == PlayState.Paused) ? "Paused" : "";

        this.Text = String.Format("{0} [{1}] {2}{3}", System.IO.Path.GetFileName(this.filename), media, muted, paused);
      }
    }

    private void CheckSizeMenu(MenuItem item)
    {
      menuFileSizeHalf.Checked = false;
      menuFileSizeThreeQuarter.Checked = false;
      menuFileSizeNormal.Checked = false;
      menuFileSizeDouble.Checked = false;

      item.Checked = true;
    }

    private void EnablePlaybackMenu(bool bEnable, MediaType nMediaType)
    {
      // Enable/disable menu items related to playback (pause, stop, mute)
      menuFilePause.Enabled = bEnable;
      menuFileStop.Enabled = bEnable;
      menuFileMute.Enabled = bEnable;
      menuRateIncrease.Enabled = bEnable;
      menuRateDecrease.Enabled = bEnable;
      menuRateNormal.Enabled = bEnable;
      menuRateHalf.Enabled = bEnable;
      menuRateDouble.Enabled = bEnable;

      // Enable/disable menu items related to video size
      bool isVideo = (nMediaType == MediaType.Video) ? true : false;

      menuSingleStep.Enabled = isVideo;
      menuFileSizeHalf.Enabled = isVideo;
      menuFileSizeDouble.Enabled = isVideo;
      menuFileSizeNormal.Enabled = isVideo;
      menuFileSizeThreeQuarter.Enabled = isVideo;
      menuFileFullScreen.Enabled = isVideo;
    }
    
    private void MainForm_KeyDown(object sender, System.Windows.Forms.KeyEventArgs e)
    {
      switch(e.KeyCode)
      {
        case Keys.Space :
        {
          StepOneFrame();
          break;
        }
        case Keys.Left :
        {
          ModifyRate(-0.25);
          break;
        }
        case Keys.Right :
        {
          ModifyRate(+0.25);
          break;
        }
        case Keys.Down :
        {
          SetRate(1.0);
          break;
        }
        case Keys.P :
        {
          PauseClip();
          break;
        }
        case Keys.S :
        {
          StopClip();
          break;
        }
        case Keys.M :
        {
          ToggleMute();
          break;
        }
        case Keys.F:
        case Keys.Return:
        {
          ToggleFullScreen();
          break;
        }
        case Keys.H :
        {
          InitVideoWindow(1, 2);
          CheckSizeMenu(menuFileSizeHalf);
          break;
        }
        case Keys.N :
        {
          InitVideoWindow(1, 1);
          CheckSizeMenu(menuFileSizeNormal);
          break;
        }
        case Keys.D :
        {
          InitVideoWindow(2, 1);
          CheckSizeMenu(menuFileSizeDouble);
          break;
        }
        case Keys.T :
        {
          InitVideoWindow(3, 4);
          CheckSizeMenu(menuFileSizeThreeQuarter);
          break;
        }
        case Keys.Escape :
        {
          if (this.isFullScreen)
            ToggleFullScreen();
          else
            CloseClip();
          break;
        }
        case Keys.F12 | Keys.Q | Keys.X :
        {
          CloseClip();
          break;
        }
      }
    }
   
    private void menuFileOpenClip_Click(object sender, System.EventArgs e)
    {
      // If we have ANY file open, close it and shut down DirectShow
      if (this.currentState != PlayState.Init)
        CloseClip();

      // Open the new clip
      OpenClip();
    }

    private void menuFileClose_Click(object sender, System.EventArgs e)
    {
      CloseClip();
    }

    private void menuFileExit_Click(object sender, System.EventArgs e)
    {
      CloseClip();
      this.Close();
    }

    private void menuFilePause_Click(object sender, System.EventArgs e)
    {
      PauseClip();
    }

    private void menuFileStop_Click(object sender, System.EventArgs e)
    {
      StopClip();
    }

    private void menuFileMute_Click(object sender, System.EventArgs e)
    {
      ToggleMute();
    }

    private void menuFileFullScreen_Click(object sender, System.EventArgs e)
    {
      ToggleFullScreen();
    }

    private void menuFileSize_Click(object sender, System.EventArgs e)
    {
      if (sender == menuFileSizeHalf) InitVideoWindow(1, 2);
      if (sender == menuFileSizeNormal) InitVideoWindow(1, 1);
      if (sender == menuFileSizeDouble) InitVideoWindow(2, 1);
      if (sender == menuFileSizeThreeQuarter) InitVideoWindow(3, 4);

      CheckSizeMenu((MenuItem) sender);
    }

    private void menuSingleStep_Click(object sender, System.EventArgs e)
    {
      StepOneFrame();
    }

    private void menuRate_Click(object sender, System.EventArgs e)
    {
      if (sender == menuRateDecrease) ModifyRate(-0.25);
      if (sender == menuRateIncrease) ModifyRate(+0.25);
      if (sender == menuRateNormal) SetRate(1.0);
      if (sender == menuRateHalf) SetRate(0.5);
      if (sender == menuRateDouble) SetRate(2.0);
    }

    private void MainForm_Move(object sender, System.EventArgs e)
    {
      if (!this.isAudioOnly)
        MoveVideoWindow();
    }

    private void MainForm_Resize(object sender, System.EventArgs e)
    {
      if (!this.isAudioOnly)
        MoveVideoWindow();
    }

    private void MainForm_Closing(object sender, System.ComponentModel.CancelEventArgs e)
    {
      StopClip();
      CloseInterfaces();
    }

    private void menuHelpAbout_Click(object sender, System.EventArgs e)
    {
      string title = "About PlayWnd Media Player";
      string text = "DirectShow.Net PlayWindow Sample";

      AboutBox.Show(title, text);
    }

    /// <summary>
    /// Main entry point
    /// </summary>
    [STAThread]
    static void Main(string[] args) 
    {
      // Enable XP style controls
      Application.EnableVisualStyles();
      Application.DoEvents();

      using(MainForm form = new MainForm())
      {
        if (args.Length > 0)
          form.filename = args[0];

        form.Show();
        form.OpenClip();

        Application.Run(form);
      }
    }

  }
}
