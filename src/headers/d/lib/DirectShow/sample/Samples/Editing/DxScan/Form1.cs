/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Windows.Forms;

namespace DxScan
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
        // Application-defined message to notify app of filtergraph events
        public const int WM_GRAPHNOTIFY = 0x8000 + 1;

        private System.Windows.Forms.Button StartStop;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox tbFileName;
        private System.Windows.Forms.TextBox tbFrameNum;
        private System.Windows.Forms.TextBox tbBlacks;
        private System.ComponentModel.IContainer components;

		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
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

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.components = new System.ComponentModel.Container();
            this.StartStop = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.tbFileName = new System.Windows.Forms.TextBox();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.tbFrameNum = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.tbBlacks = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // StartStop
            // 
            this.StartStop.Location = new System.Drawing.Point(96, 112);
            this.StartStop.Name = "StartStop";
            this.StartStop.Size = new System.Drawing.Size(75, 40);
            this.StartStop.TabIndex = 2;
            this.StartStop.Text = "Start";
            this.StartStop.Click += new System.EventHandler(this.StartStop_Click);
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(8, 8);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(72, 16);
            this.label1.TabIndex = 4;
            this.label1.Text = "Source file";
            // 
            // tbFileName
            // 
            this.tbFileName.Location = new System.Drawing.Point(24, 32);
            this.tbFileName.Name = "tbFileName";
            this.tbFileName.Size = new System.Drawing.Size(232, 20);
            this.tbFileName.TabIndex = 5;
            this.tbFileName.Text = "c:\\foo.mpg";
            // 
            // timer1
            // 
            this.timer1.Interval = 1000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // tbFrameNum
            // 
            this.tbFrameNum.Location = new System.Drawing.Point(160, 160);
            this.tbFrameNum.Name = "tbFrameNum";
            this.tbFrameNum.ReadOnly = true;
            this.tbFrameNum.Size = new System.Drawing.Size(48, 20);
            this.tbFrameNum.TabIndex = 6;
            this.tbFrameNum.Text = "";
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(56, 160);
            this.label2.Name = "label2";
            this.label2.TabIndex = 7;
            this.label2.Text = "Scanning Frame #";
            // 
            // tbBlacks
            // 
            this.tbBlacks.Location = new System.Drawing.Point(160, 192);
            this.tbBlacks.Name = "tbBlacks";
            this.tbBlacks.ReadOnly = true;
            this.tbBlacks.Size = new System.Drawing.Size(48, 20);
            this.tbBlacks.TabIndex = 8;
            this.tbBlacks.Text = "";
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(56, 192);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(96, 23);
            this.label3.TabIndex = 9;
            this.label3.Text = "# of black frames";
            // 
            // Form1
            // 
            this.AcceptButton = this.StartStop;
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(292, 262);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.tbBlacks);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tbFrameNum);
            this.Controls.Add(this.tbFileName);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.StartStop);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Form1";
            this.Text = "DxScan";
            this.ResumeLayout(false);

        }
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
        [STAThread]
        static void Main() 
        {
            Application.Run(new Form1());
        }

        Capture cam = null;

        private void StartStop_Click(object sender, System.EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;

            cam = new Capture(tbFileName.Text);

            // Start displaying statistics
            timer1.Enabled = true;
            cam.Start();
            cam.WaitUntilDone();
            timer1.Enabled = false;

            // Final update
            tbFrameNum.Text = cam.m_Count.ToString();
            tbBlacks.Text = cam.m_Blacks.ToString();

            lock (this)
            {
                cam.Dispose();
                cam = null;
            }

            Cursor.Current = Cursors.Default;
        }

        private void timer1_Tick(object sender, System.EventArgs e)
        {
            if (cam != null)
            {
                tbFrameNum.Text = cam.m_Count.ToString();
                tbBlacks.Text = cam.m_Blacks.ToString();
            }
        }
	}
}
