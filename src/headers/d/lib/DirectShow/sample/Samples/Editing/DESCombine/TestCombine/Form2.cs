/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

Written by snarfle@sourceforge.net
*****************************************************************************/

using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace TestConverter
{
	/// <summary>
	/// Summary description for Form2.
	/// </summary>
	public class Form2 : System.Windows.Forms.Form
	{
        private System.Windows.Forms.Label label3;
        public System.Windows.Forms.TextBox tbAudioFile;
        private System.Windows.Forms.Button btnAudio;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnVideo;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        public System.Windows.Forms.TextBox tbVideoFile;
        private System.Windows.Forms.Button btnOk;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label12;
        public System.Windows.Forms.TextBox tbStart;
        public System.Windows.Forms.TextBox tbEnd;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label14;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form2()
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
				if(components != null)
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
            this.label3 = new System.Windows.Forms.Label();
            this.tbAudioFile = new System.Windows.Forms.TextBox();
            this.btnAudio = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.tbVideoFile = new System.Windows.Forms.TextBox();
            this.btnVideo = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.btnOk = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.label12 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.tbEnd = new System.Windows.Forms.TextBox();
            this.tbStart = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(6, 49);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(100, 16);
            this.label3.TabIndex = 21;
            this.label3.Text = "Audio File Name";
            // 
            // tbAudioFile
            // 
            this.tbAudioFile.Location = new System.Drawing.Point(8, 69);
            this.tbAudioFile.Name = "tbAudioFile";
            this.tbAudioFile.Size = new System.Drawing.Size(248, 20);
            this.tbAudioFile.TabIndex = 4;
            this.tbAudioFile.Text = "";
            // 
            // btnAudio
            // 
            this.btnAudio.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
            this.btnAudio.Location = new System.Drawing.Point(264, 68);
            this.btnAudio.Name = "btnAudio";
            this.btnAudio.Size = new System.Drawing.Size(24, 23);
            this.btnAudio.TabIndex = 5;
            this.btnAudio.Text = "...";
            this.btnAudio.Click += new System.EventHandler(this.btnAudio_Click);
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(8, 8);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 16);
            this.label1.TabIndex = 24;
            this.label1.Text = "Video File Name";
            // 
            // tbVideoFile
            // 
            this.tbVideoFile.Location = new System.Drawing.Point(8, 24);
            this.tbVideoFile.Name = "tbVideoFile";
            this.tbVideoFile.Size = new System.Drawing.Size(248, 20);
            this.tbVideoFile.TabIndex = 1;
            this.tbVideoFile.Text = "";
            // 
            // btnVideo
            // 
            this.btnVideo.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((System.Byte)(0)));
            this.btnVideo.Location = new System.Drawing.Point(264, 23);
            this.btnVideo.Name = "btnVideo";
            this.btnVideo.Size = new System.Drawing.Size(24, 23);
            this.btnVideo.TabIndex = 2;
            this.btnVideo.Text = "...";
            this.btnVideo.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnOk
            // 
            this.btnOk.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.btnOk.Location = new System.Drawing.Point(40, 160);
            this.btnOk.Name = "btnOk";
            this.btnOk.Size = new System.Drawing.Size(80, 32);
            this.btnOk.TabIndex = 20;
            this.btnOk.Text = "Ok";
            // 
            // btnCancel
            // 
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Location = new System.Drawing.Point(184, 160);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(72, 32);
            this.btnCancel.TabIndex = 21;
            this.btnCancel.Text = "Cancel";
            // 
            // label12
            // 
            this.label12.Location = new System.Drawing.Point(48, 128);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(56, 23);
            this.label12.TabIndex = 3;
            this.label12.Text = "End Time";
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(48, 104);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(56, 23);
            this.label5.TabIndex = 2;
            this.label5.Text = "Start Time";
            // 
            // tbEnd
            // 
            this.tbEnd.Location = new System.Drawing.Point(112, 128);
            this.tbEnd.Name = "tbEnd";
            this.tbEnd.Size = new System.Drawing.Size(48, 20);
            this.tbEnd.TabIndex = 9;
            this.tbEnd.Text = "-1";
            this.tbEnd.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // tbStart
            // 
            this.tbStart.Location = new System.Drawing.Point(112, 104);
            this.tbStart.Name = "tbStart";
            this.tbStart.Size = new System.Drawing.Size(48, 20);
            this.tbStart.TabIndex = 8;
            this.tbStart.Text = "0";
            this.tbStart.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label13
            // 
            this.label13.Location = new System.Drawing.Point(168, 104);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(32, 16);
            this.label13.TabIndex = 4;
            this.label13.Text = "secs";
            this.label13.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label14
            // 
            this.label14.Location = new System.Drawing.Point(168, 128);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(32, 23);
            this.label14.TabIndex = 5;
            this.label14.Text = "secs";
            this.label14.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // Form2
            // 
            this.AcceptButton = this.btnOk;
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.CancelButton = this.btnCancel;
            this.ClientSize = new System.Drawing.Size(296, 204);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnOk);
            this.Controls.Add(this.tbVideoFile);
            this.Controls.Add(this.tbAudioFile);
            this.Controls.Add(this.tbStart);
            this.Controls.Add(this.tbEnd);
            this.Controls.Add(this.btnVideo);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnAudio);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.label13);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "Form2";
            this.Text = "Add Files";
            this.ResumeLayout(false);

        }
		#endregion

        private void btnAudio_Click(object sender, System.EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "All Files (*.*)|*.*";
            ofd.Multiselect = false;
            ofd.CheckFileExists = true;
            DialogResult r = ofd.ShowDialog();
            if (r == DialogResult.OK)
            {
                tbAudioFile.Text = ofd.FileName;
            }
        }

        private void button1_Click(object sender, System.EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "All Files (*.*)|*.*";
            ofd.Multiselect = false;
            ofd.CheckFileExists = true;
            DialogResult r = ofd.ShowDialog();
            if (r == DialogResult.OK)
            {
                tbVideoFile.Text = ofd.FileName;
            }
        }
	}
}
