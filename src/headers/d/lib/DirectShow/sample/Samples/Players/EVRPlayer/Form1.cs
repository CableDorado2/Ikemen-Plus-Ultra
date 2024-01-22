/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released
as public domain.  It is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.
*****************************************************************************/

using System;
using System.Diagnostics;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Threading;

namespace EVRPlayer
{
    public partial class Form1 : Form, GraphEventCallback
    {
        #region Members

        const int FRAME_STEP_INCREMENT = 5;   // How many frames to step, when frame-stepping.
        const int ONE_MSEC = 10000;   // The number of 100-ns in 1 msec
        const int WM_GRAPH_EVENT = 0x8000 + 1;

        Guid m_PresenterCLSID = new Guid("DD1BE413-E999-47f1-A107-9BC1F3DCB6C7");

        // The c++ sample EVRPresenter's CLSID
        //Guid m_PresenterCLSID = new Guid(0x9707fc9c, 0x807b, 0x41e3, 0x98, 0xa8, 0x75, 0x17, 0x6f, 0x95, 0xa0, 0x62);

        DShowPlayer m_pPlayer;
        PlaybackState m_state;

        bool m_bFrameStepping;   // TRUE if a frame step is in progress.
        bool m_bDrag; // TRUE if a drag is in progress

        #endregion

        public Form1()
        {
            InitializeComponent();

            m_state = PlaybackState.Closed;
            m_pPlayer = new DShowPlayer(panVideoWin, Handle, WM_GRAPH_EVENT);
            m_bDrag = false;
        }

        protected override void WndProc(ref Message m)
        {
            switch (m.Msg)
            {
                // A message arrived from the graph
                case WM_GRAPH_EVENT:
                    {
                        m_pPlayer.HandleGraphEvent(this);
                        break;
                    }
                default:
                    {
                        base.WndProc(ref m);
                        break;
                    }
            }
        }

        private void openFileToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Invoker I = new Invoker();

            // Show the File Open dialog.
            DialogResult dr = I.Invoke();

            if (dr == DialogResult.OK)
            {
                m_pPlayer.OpenFile(I.FileName(), Guid.Empty);
                SubpicSize_Scroll(null, null);

                // Update the state of the UI. (Regardless of success/failure code)
                UpdateUI();

                // Invalidate the video window, in case there is an old video
                // frame from the previous file and there is no video now. (eg, the
                // new file is audio only, or we failed to open this file.)
                panVideoWin.Invalidate();

                // Update the seek bar to match the current state.
                UpdateSeekBar();
            }
        }

        private void subpictureToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SubpicSize.Enabled = true;
            m_pPlayer.OpenOverlay(Guid.Empty);
            SubpicSize_Scroll(null, null);

            // Update the state of the UI. (Regardless of success/failure code)
            UpdateUI();

            // Invalidate the video window, in case there is an old video
            // frame from the previous file and there is no video now. (eg, the
            // new file is audio only, or we failed to open this file.)
            panVideoWin.Invalidate();

            // Update the seek bar to match the current state.
            UpdateSeekBar();
        }

        private void evToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Invoker I = new Invoker();

            // Show the File Open dialog.
            DialogResult dr = I.Invoke();

            if (dr == DialogResult.OK)
            {
                m_pPlayer.OpenFile(I.FileName(), m_PresenterCLSID);
                SubpicSize_Scroll(null, null);

                // Update the state of the UI. (Regardless of success/failure code)
                UpdateUI();

                // Invalidate the video window, in case there is an old video
                // frame from the previous file and there is no video now. (eg, the
                // new file is audio only, or we failed to open this file.)
                panVideoWin.Invalidate();

                // Update the seek bar to match the current state.
                UpdateSeekBar();
            }
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (m_pPlayer != null)
            {
                m_pPlayer.Dispose();
                m_pPlayer = null;
            }
            Application.Exit();
        }

        private void bnPlay_Click(object sender, EventArgs e)
        {
            m_pPlayer.Play();

            UpdateUI();
        }

        private void bnStop_Click(object sender, EventArgs e)
        {
            m_pPlayer.Stop();

            // Seek back to the start.
            if (m_pPlayer.CanSeek())
            {
                m_pPlayer.SetPosition(0);
            }

            UpdateUI();
        }

        private void bnPause_Click(object sender, EventArgs e)
        {
            m_pPlayer.Pause();

            UpdateUI();
        }

        private void bnStep_Click(object sender, EventArgs e)
        {
            m_pPlayer.Step(FRAME_STEP_INCREMENT);

            m_bFrameStepping = true;
            UpdateUI();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            // If the player can seek, update the seek bar with the current position.
            if (m_pPlayer.CanSeek())
            {
                long timeNow;

                m_pPlayer.GetCurrentPosition(out timeNow);
                seekbar.Value = (int)(timeNow / ONE_MSEC);
            }
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (m_pPlayer != null)
            {
                m_pPlayer.Dispose();
                m_pPlayer = null;
            }
        }

        private void seekbar_Scroll(object sender, EventArgs e)
        {
            // Update the position continuously.
            m_pPlayer.SetPosition(ONE_MSEC * seekbar.Value);
        }

        private void seekbar_MouseCaptureChanged(object sender, EventArgs e)
        {
            if (m_state == PlaybackState.Stopped)
            {
                m_pPlayer.Stop();
            }
            else if (m_state == PlaybackState.Running)
            {
                m_pPlayer.Play();
            }
        }

        private void seekbar_MouseDown(object sender, MouseEventArgs e)
        {
            // Pause when the scroll action begins.
            m_state = m_pPlayer.State();
            m_pPlayer.Pause();
        }

        private void SubpicSize_Scroll(object sender, EventArgs e)
        {
            // Scale the subpicture.
            float fNewSize = (float)SubpicSize.Value / 100.0f;

            m_pPlayer.SetScale(fNewSize);

        }

        private void panVideoWin_MouseDown(object sender, MouseEventArgs e)
        {
            if (m_pPlayer.HasSubstream())
            {
                // Test whether the user clicked on the substream image.
                if (m_pPlayer.HitTest(new Point(e.X, e.Y)))
                {
                    m_bDrag = true;
                    panVideoWin.Capture = true;
                }
            }
        }

        private void panVideoWin_MouseUp(object sender, MouseEventArgs e)
        {
            if (m_bDrag)
            {
                panVideoWin.Capture = false;
                m_bDrag = false;
            }
        }

        private void panVideoWin_MouseMove(object sender, MouseEventArgs e)
        {
            if (m_bDrag)
            {
                m_pPlayer.Track(new Point(e.X, e.Y));
            }
        }

        private void UpdateUI()
        {
            bool bPlay = false;
            bool bPause = false;
            bool bStop = false;
            bool bFrameStep = false;

            switch (m_pPlayer.State())
            {
                case PlaybackState.Running:
                    bPause = true;
                    bStop = true;
                    bFrameStep = true;
                    break;

                case PlaybackState.Paused:
                    bPlay = true;
                    bStop = true;
                    bFrameStep = true;
                    break;

                case PlaybackState.Stopped:
                    bPlay = true;
                    bFrameStep = true;
                    break;
            }

            bnPlay.Enabled = bPlay;
            bnPause.Enabled = bPause;
            bnStop.Enabled = bStop;
            bnFrameStep.Enabled = (bFrameStep && !m_bFrameStepping);

            // Trackbar to resize the substream.
            SubpicSize.Enabled = m_pPlayer.HasSubstream();
            label2.Visible = SubpicSize.Enabled;
        }

        private void UpdateSeekBar()
        {
            // If the player can seek, set the seekbar range and start the time.
            // Otherwise, disable the seekbar.
            if (m_pPlayer.CanSeek())
            {
                seekbar.Enabled = true;

                long rtDuration;
                m_pPlayer.GetStopTime(out rtDuration);

                seekbar.Maximum = (int)(rtDuration / ONE_MSEC);
                seekbar.LargeChange = seekbar.Maximum / 10;

                // Start the timer
                timer1.Enabled = true;
            }
            else
            {
                seekbar.Enabled = false;

                // Stop the old timer, if any.
                timer1.Enabled = false;
            }
        }

        private void NotifyError(string sMessage, int hrStatus)
        {
            MessageBox.Show(sMessage + " 0x" + hrStatus.ToString("x"), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }

        private void panVideoWin_Paint(object sender, PaintEventArgs e)
        {
            m_pPlayer.RepaintVideo();
        }

        #region GraphEventCallback Members

        public void OnGraphEvent(DirectShowLib.EventCode eventCode, IntPtr param1, IntPtr param2)
        {
            Debug.WriteLine(eventCode);
            switch (eventCode)
            {
                case DirectShowLib.EventCode.Complete:
                    bnStop_Click(null, null);
                    break;

                case DirectShowLib.EventCode.StepComplete:
                    // Frame stepping has completed.
                    m_bFrameStepping = false;
                    UpdateUI();
                    break;

                case DirectShowLib.EventCode.ErrorAbort:
                    NotifyError("An error occurred during playback.", param1.ToInt32());
                    UpdateUI();
                    break;

                default:
                    break;
            }
        }

        #endregion
    }

    /// <summary>
    /// Opens a specified FileOpenDialog box on an STA thread
    /// </summary>
    public class Invoker
    {
        private string m_FileName;
        private DialogResult m_InvokeResult;

        // Constructor is passed the dialog to use
        public Invoker()
        {
            m_InvokeResult = DialogResult.None;
            m_FileName = null;
        }

        // Start the thread and get the result
        public DialogResult Invoke()
        {
            Thread thdInvokeThread;

            // No reason to waste a thread if we aren't MTA
            if (Thread.CurrentThread.GetApartmentState() == ApartmentState.MTA)
            {
                thdInvokeThread = new Thread(new ThreadStart(InvokeMethod));
                thdInvokeThread.SetApartmentState(ApartmentState.STA);

                thdInvokeThread.Start();
                thdInvokeThread.Join();
                thdInvokeThread = null;
            }
            else
            {
                // If we are already STA, just invoke the method
                InvokeMethod();
            }

            return m_InvokeResult;
        }

        public string FileName()
        {
            return m_FileName;
        }

        // The thread entry point
        private void InvokeMethod()
        {
            OpenFileDialog ofDialog = new OpenFileDialog();

            m_InvokeResult = ofDialog.ShowDialog();

            if (m_InvokeResult == DialogResult.OK)
            {
                m_FileName = ofDialog.FileName;
            }
        }
    }
}
