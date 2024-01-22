#region license

/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

#endregion

using System;
using System.Diagnostics;
using System.Drawing;
using System.Windows.Forms;
using System.Runtime.InteropServices;

using DirectShowLib;
using DirectShowLib.DMO;

namespace FormDMO
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{

        private IFilterGraph2 graphBuilder = null;
        private DsROTEntry m_rot = null;

        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rbLeft;
        private System.Windows.Forms.RadioButton rbRight;
        private System.Windows.Forms.TextBox tbFileName;

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
			base.Dispose( disposing );

            if (m_rot != null)
            {
                m_rot.Dispose();
                m_rot = null;
            }
            if (graphBuilder != null)
            {
                (graphBuilder as IMediaControl).Stop();
                Marshal.ReleaseComObject(graphBuilder);
                graphBuilder = null;
            }
        }

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.btnStart = new System.Windows.Forms.Button();
            this.tbFileName = new System.Windows.Forms.TextBox();
            this.rbLeft = new System.Windows.Forms.RadioButton();
            this.rbRight = new System.Windows.Forms.RadioButton();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnStart
            // 
            this.btnStart.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnStart.Location = new System.Drawing.Point(80, 136);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(75, 40);
            this.btnStart.TabIndex = 0;
            this.btnStart.Text = "Start";
            this.btnStart.Click += new System.EventHandler(this.button1_Click);
            // 
            // tbFileName
            // 
            this.tbFileName.Location = new System.Drawing.Point(16, 24);
            this.tbFileName.Name = "tbFileName";
            this.tbFileName.Size = new System.Drawing.Size(216, 20);
            this.tbFileName.TabIndex = 1;
            this.tbFileName.Text = "c:\\l2.wav";
            // 
            // rbLeft
            // 
            this.rbLeft.Checked = true;
            this.rbLeft.Location = new System.Drawing.Point(24, 16);
            this.rbLeft.Name = "rbLeft";
            this.rbLeft.Size = new System.Drawing.Size(56, 24);
            this.rbLeft.TabIndex = 2;
            this.rbLeft.TabStop = true;
            this.rbLeft.Text = "Left";
            // 
            // rbRight
            // 
            this.rbRight.Location = new System.Drawing.Point(24, 40);
            this.rbRight.Name = "rbRight";
            this.rbRight.Size = new System.Drawing.Size(56, 24);
            this.rbRight.TabIndex = 3;
            this.rbRight.Text = "Right";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rbLeft);
            this.groupBox1.Controls.Add(this.rbRight);
            this.groupBox1.Location = new System.Drawing.Point(24, 56);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(184, 72);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Channel";
            // 
            // Form1
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(242, 188);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.tbFileName);
            this.Controls.Add(this.btnStart);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "DMOSplit Test";
            this.groupBox1.ResumeLayout(false);
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


        private void button1_Click(object sender, System.EventArgs e)
        {
            int hr;

            if (tbFileName.Enabled)
            {
                BuildGraph(tbFileName.Text, rbLeft.Checked);

                // Run this graph
                hr = (graphBuilder as IMediaControl).Run();
                DsError.ThrowExceptionForHR(hr);
                tbFileName.Enabled = false;
                groupBox1.Enabled = false;
                btnStart.Text = "Stop";
            }
            else
            {
                hr = (graphBuilder as IMediaControl).Stop();
                groupBox1.Enabled = true;
                tbFileName.Enabled = true;
                Marshal.ReleaseComObject(graphBuilder);
                graphBuilder = null;
                btnStart.Text = "Start";
            }
        }

        private void BuildGraph(string sFileName, bool bLeft)
        {
            int hr;
            IBaseFilter ibfFile = null;
            IBaseFilter ibfFilter = null;
            IBaseFilter ibfRender = null;
            IDMOWrapperFilter dmoWrapperFilter = null;

            ICaptureGraphBuilder2 icgb = (ICaptureGraphBuilder2)new CaptureGraphBuilder2();

            graphBuilder = (IFilterGraph2) new FilterGraph();
#if DEBUG
            m_rot = new DsROTEntry(graphBuilder);
#endif

            hr = icgb.SetFiltergraph(graphBuilder);
            DsError.ThrowExceptionForHR(hr);

            // Add a DMO Wrapper Filter
            ibfFilter = (IBaseFilter) new DMOWrapperFilter();
            dmoWrapperFilter = (IDMOWrapperFilter) ibfFilter;

            // Since I know the guid of the DMO I am looking for, I can do this.
            hr = dmoWrapperFilter.Init(new Guid("{EAB6CBA9-78DD-4ae4-9A69-1CE1C55369F6}"), DMOCategory.AudioEffect);
            DMOError.ThrowExceptionForHR(hr);

            // Add it to the Graph
            hr = graphBuilder.AddFilter(ibfFilter, "DMO Filter");
            DsError.ThrowExceptionForHR(hr);

            ibfRender = (IBaseFilter)new AudioRender();
            hr = graphBuilder.AddFilter(ibfRender, "Renderer");
            DsError.ThrowExceptionForHR(hr);

            ibfFile = (IBaseFilter)new AsyncReader();
            hr = graphBuilder.AddFilter(ibfFile, "Reader");
            DsError.ThrowExceptionForHR(hr);

            IFileSourceFilter ifileSink = (IFileSourceFilter)ibfFile;
            hr = ifileSink.Load(sFileName, null);
            DsError.ThrowExceptionForHR(hr);

            hr = icgb.RenderStream(null, null, ibfFile, null, ibfFilter);
            DsError.ThrowExceptionForHR(hr);

            IPin iPin = DsFindPin.ByDirection(ibfFilter, PinDirection.Output, bLeft ? 0 : 1);

            hr = icgb.RenderStream(null, null, iPin, null, ibfRender);
            DsError.ThrowExceptionForHR(hr);

            Marshal.ReleaseComObject(ibfRender);
            Marshal.ReleaseComObject(dmoWrapperFilter);
            Marshal.ReleaseComObject(iPin);
        }
    }
}
