// DxText
//
// Written by Richard L Rosenheim
//            richard@rosenheims.com
//            May 21, 2005
//
// Based in a large part upon the DxScan and DxPlayer samples by David Wohlferd
//
// Portions Copyright 2005 - Richard L Rosenheim

using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using DirectShowLib;

namespace DxText
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class DxTextForm : System.Windows.Forms.Form
	{
		internal System.Windows.Forms.Label label1;
		internal System.Windows.Forms.Button button1;
		internal System.Windows.Forms.TextBox textBox1;
		internal System.Windows.Forms.Panel panel1;
		internal System.Windows.Forms.Label label2;
		internal System.Windows.Forms.TextBox textBox2;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public DxTextForm()
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
			this.label1 = new System.Windows.Forms.Label();
			this.button1 = new System.Windows.Forms.Button();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.panel1 = new System.Windows.Forms.Panel();
			this.label2 = new System.Windows.Forms.Label();
			this.textBox2 = new System.Windows.Forms.TextBox();
			this.SuspendLayout();
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(56, 16);
			this.label1.TabIndex = 17;
			this.label1.Text = "FileName";
			this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(8, 80);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(64, 32);
			this.button1.TabIndex = 16;
			this.button1.Text = "Start";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// textBox1
			// 
			this.textBox1.Location = new System.Drawing.Point(64, 8);
			this.textBox1.Name = "textBox1";
			this.textBox1.Size = new System.Drawing.Size(208, 20);
			this.textBox1.TabIndex = 18;
			this.textBox1.Text = "c:\\skiing.avi";
			// 
			// panel1
			// 
			this.panel1.Location = new System.Drawing.Point(8, 120);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(272, 204);
			this.panel1.TabIndex = 15;
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(8, 40);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(56, 16);
			this.label2.TabIndex = 19;
			this.label2.Text = "Text";
			this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// textBox2
			// 
			this.textBox2.Location = new System.Drawing.Point(64, 40);
			this.textBox2.Name = "textBox2";
			this.textBox2.Size = new System.Drawing.Size(208, 20);
			this.textBox2.TabIndex = 20;
			this.textBox2.Text = "Sample";
			// 
			// DxTextForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(304, 334);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.textBox2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.textBox1);
			this.Controls.Add(this.panel1);
			this.Name = "DxTextForm";
			this.Text = "DxText";
			this.ResumeLayout(false);

		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new DxTextForm());
		}

		const int WM_GRAPHNOTIFY = 0x8000 + 1;

		Capture cam = null;
		private IMediaEventEx mediaEvent = null;

		private void button1_Click(object sender, System.EventArgs e)
		{
			if (System.IO.File.Exists(textBox1.Text))
			{
				Cursor.Current = Cursors.WaitCursor;
				button1.Enabled = false;

				if (cam != null)
				{
					cam.Dispose();
					cam = null;
				}

				if (cam == null)
				{
					cam = new Capture(textBox1.Text, textBox2.Text, panel1);

					mediaEvent = cam.MediaEventEx;
					int hr = mediaEvent.SetNotifyWindow(this.Handle, WM_GRAPHNOTIFY, IntPtr.Zero);

					cam.Start();
				} 
			}
		}

	
		private void GraphNotifyEvent(ref Message m)
		{
			EventCode eventCode;
			IntPtr p1, p2;
            int hr;
			//bool closeCam = false;

			hr = mediaEvent.GetEvent(out eventCode, out p1, out p2, 0);
			while (hr == 0)
			{
				// handle the event

				if ((eventCode == EventCode.ErrorAbort) ||
				    (eventCode == EventCode.Complete))
				{
					Cursor.Current = Cursors.Default;
					button1.Enabled = true;

					//closeCam = true;
				}

				// Release parms
				mediaEvent.FreeEventParams(eventCode, p1, p2);

				// check for additional events
				hr = mediaEvent.GetEvent(out eventCode, out p1, out p2, 0);
			}

			// you can dispose of the cam object here, but when you do, the display
			// will disappear.  if you attempt to dispose of the cam object in the
			// loop above, you will cause an exception when a method in mediaEvent
			// is invoked.
			//
			//if (closeCam) 
			//{
			//	cam.Dispose();
			//	cam = null;
			//}
		}

		protected override void WndProc(ref Message m)
		{
			switch (m.Msg)
			{
					// if this is a windows media message
				case WM_GRAPHNOTIFY:
					GraphNotifyEvent(ref m);
					break;

					// all other messages
				default:
					// unhandled window message
					base.WndProc(ref m);
					break;
			}
		}


	}
}
