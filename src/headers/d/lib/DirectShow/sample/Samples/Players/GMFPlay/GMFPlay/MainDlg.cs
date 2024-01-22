/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Diagnostics;
using DirectShowLib;

namespace GMFPlay
{
    public partial class MainDlg : Form
    {
        #region Constants

        private const long NANOSECONDS = (1000000000);       // 10 ^ 9
        private const long UNITS = (NANOSECONDS / 100);      // 10 ^ 7
        private const int WM_USER = 0x8000;
        private const int MSG_ENDOFSEGMENT = WM_USER + 100;
        private const int MSG_DSEVENT = WM_USER + 101;
        private const int TB_THUMBTRACK = 0;
        private const int TB_ENDTRACK = 1;
        private const int TB_THUMBPOSITION = 2;

        #endregion

        #region Member variables

        private ClipPlayer m_pPlayer;
        private bool m_bTracking;
        private FilterState m_State;

        #endregion

        public MainDlg()
        {
            InitializeComponent();

            try
            {
                m_pPlayer = new ClipPlayer(this.Handle, MSG_ENDOFSEGMENT, MSG_DSEVENT);
                m_bTracking = false;
                m_State = FilterState.Stopped;
            }
            catch
            {
                MessageBox.Show("Please register GMFBridge.DLL with regsvr32");
            }
        }

        protected override void WndProc(ref Message m)
        {
            switch (m.Msg)
            {
                case MSG_ENDOFSEGMENT:
                    OnEndOfSegment();
                    break;

                case MSG_DSEVENT:
                    OnDSEvent();
                    break;


                // all other messages
                default:
                    // unhandled window message
                    base.WndProc(ref m);
                    break;
            }
        }

        void OnEndOfSegment()
        {
            m_pPlayer.OnEndOfSegment();
        }	
	
        void OnDSEvent()
        {
	        m_pPlayer.OnEvent();
        }

        private void bnClickedAdd_Click(object sender, EventArgs e)
        {
            openFileDialog1.CheckFileExists = true;
            openFileDialog1.ReadOnlyChecked = true;

            if (openFileDialog1.ShowDialog(this) == DialogResult.OK)
            {
                ClipEntry pClip;
                int hr = m_pPlayer.AddClip(openFileDialog1.FileName, out pClip);
                if (hr < 0)
                {
                    MessageBox.Show("Cannot add clip: format not support", "Incompatible Clip");
                    return;
                }

                // duration, limits dlg -- set clip limits (in seconds)
                string sDesc;

                fmLimits dlg = new fmLimits((pClip.Duration() + UNITS - 1) / UNITS);
                dlg.tbStart.Text = "0";
                dlg.tbStop.Text = "";
                if (dlg.ShowDialog() == DialogResult.OK)
                {
                    long tStart = int.Parse(dlg.tbStart.Text) * UNITS;
                    long tStop = pClip.Duration();
                    if (dlg.tbStop.Text.Length > 0 && int.Parse(dlg.tbStop.Text) > 0)
                    {
                        tStop = int.Parse(dlg.tbStop.Text) * UNITS;
                    }
                    m_pPlayer.SetClipLimits(pClip, tStart, tStop);

                    // append range to clip description text
                    sDesc = string.Format("{0} [{1}..{2}]", pClip.Name(), tStart / UNITS, tStop / UNITS);
                    int it = listBox1.Items.Add(sDesc);
                    listBox1.SelectedIndex = it;
                }
            }
        }

        private void bnPlay_Click(object sender, EventArgs e)
        {
            m_pPlayer.Play();
            timer1.Enabled = true;
        }

        private void bnPause_Click(object sender, EventArgs e)
        {
            m_pPlayer.Pause();
        }

        private void bnStop_Click(object sender, EventArgs e)
        {
            m_pPlayer.Stop();
        }

        private void bnLimits_Click(object sender, EventArgs e)
        {
            int idx = listBox1.SelectedIndex;
            ClipEntry pClip = null;
            if (idx != -1)
            {
                pClip = m_pPlayer.GetClipByIndex(idx);
            }

            if (pClip != null)
            {
                // duration, limits dlg -- set clip limits (in seconds)
                long lDur = ((pClip.NativeDuration() + UNITS - 1) / UNITS);
                long tStart, tStop;
                pClip.GetLimits(out tStart, out tStop);
                long lStart = ((tStart + UNITS - 1) / UNITS);
                long lStop = -1;
                if (tStop != 0)
                {
                    lStop = ((tStop + UNITS - 1) / UNITS);

                }

                fmLimits dlg = new fmLimits((pClip.Duration() + UNITS - 1) / UNITS);
                dlg.tbStart.Text = lStart.ToString();
                dlg.tbStop.Text = lStop.ToString();
                if (dlg.ShowDialog() == DialogResult.OK)
                {
                    long tStart2 = int.Parse(dlg.tbStart.Text) * UNITS;
                    long tStop2 = pClip.NativeDuration();
                    if (int.Parse(dlg.tbStop.Text) > 0)
                    {
                        tStop2 = int.Parse(dlg.tbStop.Text) * UNITS;
                    }
                    m_pPlayer.SetClipLimits(pClip, tStart2, tStop2);

                    string sDesc = string.Format("{0} [{1}..{2}]", pClip.Name(), tStart2 / UNITS, tStop2 / UNITS);

                    int n = listBox1.SelectedIndex;

                    listBox1.Items.RemoveAt(n);
                    listBox1.Items.Insert(n, sDesc);
                }
            }
        }

        private void bnPlayNext_Click(object sender, EventArgs e)
        {
            int idx = listBox1.SelectedIndex;

            if (idx != -1)
            {
                m_pPlayer.PlayNext(idx);
            }
        }

        private void cbLoop_CheckedChanged(object sender, EventArgs e)
        {
            m_pPlayer.SetLoop(cbLoop.Checked);
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (!m_bTracking)
            {
                long tDuration = m_pPlayer.TotalDuration();
                if (tDuration > 0)
                {
                    long tNow = Math.Max(m_pPlayer.CurrentPosition(), 0);
                    tNow = Math.Min(tNow, tDuration);
                    trackBar1.Value = (int)(tNow * trackBar1.Maximum / tDuration);
                }
            }
        }

        private void trackBar1_MouseDown(object sender, MouseEventArgs e)
        {
            // on mouse-down, pause the graph
            if (!m_bTracking)
            {
                // stop/pause/run state of render graph
                m_State = m_pPlayer.GetState();
                if (m_State == FilterState.Running)
                {
                    m_pPlayer.Pause();
                }
                m_bTracking = true;
            }
        }

        private void trackBar1_MouseUp(object sender, MouseEventArgs e)
        {
            int position = trackBar1.Value;

            // scale 0..1000 track bar range into total duration
            long tSeek = position * m_pPlayer.TotalDuration() / trackBar1.Maximum;
            m_pPlayer.SetPosition(tSeek);

            if (m_bTracking)
            {
                if (m_State == FilterState.Running)
                {
                    m_pPlayer.Play();
                }
                m_bTracking = false;
            }
        }

        private void trackBar1_ValueChanged(object sender, EventArgs e)
        {
            if (m_bTracking)
            {
                // scale 0..1000 track bar range into total duration
                long tSeek = trackBar1.Value * m_pPlayer.TotalDuration() / trackBar1.Maximum;
                m_pPlayer.SetPosition(tSeek);
                Debug.WriteLine(string.Format("{0} {1} {2} {3}", trackBar1.Value, tSeek, m_pPlayer.CurrentPosition(), m_pPlayer.TotalDuration()));
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool bEnable = false;
            int idx = listBox1.SelectedIndex;

            if ((idx != -1) && (m_pPlayer.GetClipByIndex(idx) != null))
            {
                bEnable = true;
            }

            bnLimits.Enabled = bEnable;
            bnPlayNext.Enabled = bEnable;
        }

        private void MainDlg_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (m_pPlayer != null)
            {
                m_pPlayer.Dispose();
            }
        }
    }
}