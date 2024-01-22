/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.IO;
using System.Diagnostics;
using System.Threading;
using System.Drawing.Imaging;
using DirectShowLib;

namespace DxPlay
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.TextBox tbFileName;
        private System.ComponentModel.IContainer components = null;
        private TextBox textBox1;

        DxPlay m_play = null;

        public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

#if USING_NET20
            TextBox.CheckForIllegalCrossThreadCalls = false;
            textBox1.Text = "Running this code under the debugger in vs 2005 will give VERY poor performance.  Use \"Debug/Start without Debugging\" for decent performance.";
#endif
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
            // Make sure to release the DxPlay object to avoid hanging
            if (m_play != null)
            {
                m_play.Dispose();
            }
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.btnStart = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.tbFileName = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // btnStart
            // 
            this.btnStart.Location = new System.Drawing.Point(8, 37);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(57, 32);
            this.btnStart.TabIndex = 1;
            this.btnStart.Text = "Start";
            this.btnStart.Click += new System.EventHandler(this.btnStart_Click);
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(0, 8);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(88, 16);
            this.label1.TabIndex = 2;
            this.label1.Text = "Source Files dir";
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel1.Location = new System.Drawing.Point(8, 88);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(320, 240);
            this.panel1.TabIndex = 10;
            // 
            // tbFileName
            // 
            this.tbFileName.Location = new System.Drawing.Point(88, 8);
            this.tbFileName.Name = "tbFileName";
            this.tbFileName.Size = new System.Drawing.Size(208, 20);
            this.tbFileName.TabIndex = 9;
            this.tbFileName.Text = "c:\\vss\\catchpic";
            // 
            // textBox1
            // 
            this.textBox1.Enabled = false;
            this.textBox1.Location = new System.Drawing.Point(71, 37);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(256, 45);
            this.textBox1.TabIndex = 11;
            // 
            // Form1
            // 
            this.AcceptButton = this.btnStart;
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(336, 338);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnStart);
            this.Controls.Add(this.tbFileName);
            this.Name = "Form1";
            this.Text = "DxPlay";
            this.Closing += new System.ComponentModel.CancelEventHandler(this.Form1_Closing);
            this.ResumeLayout(false);
            this.PerformLayout();

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[MTAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}

		private void btnStart_Click(object sender, System.EventArgs e)
        {
            // If we have no class open
            if (m_play == null)
            {
                try
                {
                    m_play = new DxPlay(tbFileName.Text, panel1);
					m_play.Completed +=new EventHandler(m_play_Completed);

					m_play.Start();

                    btnStart.Text = "Stop";
                    tbFileName.Enabled = false;

                }
                catch(COMException ce)
                {
                    MessageBox.Show("Failed create DxPlay: " + ce.Message, "Open Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                m_play.Stop();
            }
        }

		private void Form1_Closing(object sender, System.ComponentModel.CancelEventArgs e)
		{
            if (m_play != null)
			{
				m_play.Stop();
				m_play = null;
			}
		}

		private void m_play_Completed(object sender, EventArgs e)
		{
			DxPlay.CompletedArgs c = e as DxPlay.CompletedArgs;
			if (m_play != null)
			{
				m_play.Dispose();
				m_play = null;
			}
			tbFileName.Enabled = true;
			btnStart.Text = "Start";
		}
	}
}
