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
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;

        private IFilterGraph2 graphBuilder = null;
        private IMediaParams m_param = null;
        private System.Windows.Forms.TextBox textBox1;
        private DsROTEntry m_rot = null;

        public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
            BuildGraph(this.panel1);
#if !USING_NET11
            textBox1.Text = "Running this code under the debugger in vs 2005 will give VERY poor performance.  Use \"Debug/Start without Debugging\" or use the unsafe code from the readme for decent performance.";
#endif
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
            if (m_param != null)
            {
                Marshal.ReleaseComObject(m_param);
                m_param = null;
            }

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
            this.button1 = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.button1.Location = new System.Drawing.Point(8, 294);
            this.button1.Name = "button1";
            this.button1.TabIndex = 0;
            this.button1.Text = "Start";
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
                | System.Windows.Forms.AnchorStyles.Right)));
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(296, 216);
            this.panel1.TabIndex = 1;
            // 
            // button2
            // 
            this.button2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.button2.Location = new System.Drawing.Point(104, 294);
            this.button2.Name = "button2";
            this.button2.TabIndex = 2;
            this.button2.Text = "FlipX";
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.button3.Location = new System.Drawing.Point(208, 294);
            this.button3.Name = "button3";
            this.button3.TabIndex = 3;
            this.button3.Text = "FlipY";
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // textBox1
            // 
            this.textBox1.Enabled = false;
            this.textBox1.Location = new System.Drawing.Point(8, 224);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(280, 64);
            this.textBox1.TabIndex = 4;
            this.textBox1.Text = "";
            // 
            // Form1
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(292, 324);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.button1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "DMOFlip Test";
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

            // Run this graph (just for fun)
            hr = (graphBuilder as IMediaControl).Run();
            DsError.ThrowExceptionForHR(hr);
        }

        private void BuildGraph(Control hControl)
        {
            int hr;
            DsDevice [] devs;
            IBaseFilter ibfSource = null;
            IBaseFilter dmoFilter = null;
            IBaseFilter ibfRender = null;
            IDMOWrapperFilter dmoWrapperFilter = null;

            ICaptureGraphBuilder2 icgb = (ICaptureGraphBuilder2)new CaptureGraphBuilder2();

            graphBuilder = (IFilterGraph2) new FilterGraph();
#if DEBUG
            m_rot = new DsROTEntry(graphBuilder);
#endif

            hr = icgb.SetFiltergraph(graphBuilder);
            DsError.ThrowExceptionForHR(hr);

            devs = DsDevice.GetDevicesOfCat(FilterCategory.VideoInputDevice);

            if (devs.Length < 1)
            {
                throw new Exception("This sample requires a capture device.  If you don't " + 
                    "have a capture device, change the BuildGraph routine to use AddSourceFilter " +
                    "and use a file.");
            }

            // Add a source filter
            hr = graphBuilder.AddSourceFilterForMoniker(devs[0].Mon, null, "Video Input Device", out ibfSource);
            DsError.ThrowExceptionForHR(hr);

            // Add a DMO Wrapper Filter
            dmoFilter = (IBaseFilter) new DMOWrapperFilter();
            dmoWrapperFilter = (IDMOWrapperFilter) dmoFilter;

            // Since I know the guid of the DMO I am looking for, I *could* do this.
            //hr = dmoWrapperFilter.Init(new Guid("{7EF28FD7-E88F-45bb-9CDD-8A62956F2D75}"), DMOCatergory.VideoEffect);
            //DMOError.ThrowExceptionForHR(hr);

            // But it is more useful to show how to scan for the DMO
            Guid g = FindGuid("DmoFlip", DMOCategory.VideoEffect);

            hr = dmoWrapperFilter.Init(g, DMOCategory.VideoEffect);
            DMOError.ThrowExceptionForHR(hr);

            SetDMOParams(dmoFilter);

            // Add it to the Graph
            hr = graphBuilder.AddFilter(dmoFilter, "DMO Filter");
            DsError.ThrowExceptionForHR(hr);

            ibfRender = (IBaseFilter)new VideoRenderer();
            hr = graphBuilder.AddFilter(ibfRender, "renderer");
            DsError.ThrowExceptionForHR(hr);

            hr = icgb.RenderStream(null, null, ibfSource, dmoFilter, ibfRender);
            DsError.ThrowExceptionForHR(hr);

            ConfigVideo(graphBuilder as IVideoWindow, hControl);

            Marshal.ReleaseComObject(ibfSource);
            Marshal.ReleaseComObject(ibfRender);
        }

        private Guid FindGuid(string gn, Guid cat)
        {
            int hr;

            IEnumDMO pEnum;
            Guid [] g2 = new Guid[1];
            string [] sn = new String[1];

            hr = DMOUtils.DMOEnum(cat, 0, 0, null, 0, null, out pEnum);
            DMOError.ThrowExceptionForHR(hr);

            try
            {
                do
                {
                    hr = pEnum.Next(1, g2, sn, IntPtr.Zero);
                } while (hr == 0 && sn[0] != gn);

                // Handle any serious errors
                DMOError.ThrowExceptionForHR(hr);

                if (hr != 0)
                {
                    throw new Exception("Cannot find " + gn);
                }
            }
            finally
            {
                Marshal.ReleaseComObject(pEnum);
            }

            return g2[0];
        }

        private void ConfigVideo(IVideoWindow ivw, Control hControl)
        {
            int hr;

            hr = ivw.put_Owner(hControl.Handle);
            DsError.ThrowExceptionForHR(hr);

            hr = ivw.put_WindowStyle(WindowStyle.Child | WindowStyle.ClipChildren | WindowStyle.ClipSiblings);
            DsError.ThrowExceptionForHR( hr );

            // Yes, make it visible
            hr = ivw.put_Visible( OABool.True );
            DsError.ThrowExceptionForHR( hr );

            // Move to upper left corner
            Rectangle rc = hControl.ClientRectangle;
            hr = ivw.SetWindowPosition( 0, 0, rc.Right, rc.Bottom );
            DsError.ThrowExceptionForHR( hr );

        }

        private void SetDMOParams(IBaseFilter dmoWrapperFilter)
        {
            int hr;
            Guid g;
            int i;
            int pc;
            ParamInfo pInfo;
            IMediaParamInfo paramInfo = dmoWrapperFilter as IMediaParamInfo;

            // With a little effort, a generic parameter handling routine
            // could be produced.  You know the number of parameters (GetParamCount),
            // the type of the parameter (pInfo.mpType), the range of values for
            // int and float (pInfo.mpdMinValue, pInfo.mpdMaxValue), if the parameter is an
            // enum, you have the strings (GetParamText).

            hr = paramInfo.GetParamCount(out pc);
            DMOError.ThrowExceptionForHR(hr);

            // Walk all the parameters
            for (int pCur = 0; pCur< pc; pCur++)
            {
                IntPtr ip;

                hr = paramInfo.GetParamInfo(pCur, out pInfo);
                DMOError.ThrowExceptionForHR(hr);

                hr = paramInfo.GetParamText(0, out ip);
                DMOError.ThrowExceptionForHR(hr);

                try
                {
                    string sName, sUnits;
                    string [] sEnum;
                    ParseParamText(ip, out sName, out sUnits, out sEnum);

                    Debug.WriteLine(string.Format("Parameter name: {0}", sName));
                    Debug.WriteLine(string.Format("Parameter units: {0}", sUnits));

                    // Not all params will have enumerated strings.
                    if (pInfo.mpType == MPType.ENUM)
                    {
                        // The final entry in "splitted" will be a blank (used to terminate the list).
                        for (int x=0; x < sEnum.Length; x++)
                        {
                            Debug.WriteLine(string.Format("Parameter Enum strings: {0} = {1}", x, sEnum[x]));
                        }
                    }
                }
                finally
                {
                    Marshal.FreeCoTaskMem(ip);
                }
            }

            hr = paramInfo.GetCurrentTimeFormat(out g, out i);
            DMOError.ThrowExceptionForHR(hr);

            hr = paramInfo.GetSupportedTimeFormat(0, out g);
            DMOError.ThrowExceptionForHR(hr);

            MPData o = new MPData();
            m_param = dmoWrapperFilter as IMediaParams;

            o.vInt = 0;
            hr = m_param.SetParam(0, o);
            DMOError.ThrowExceptionForHR(hr);
        }


        private void button2_Click(object sender, System.EventArgs e)
        {
            int hr;
            MPData o;

            hr = m_param.GetParam(0, out o);
            DMOError.ThrowExceptionForHR(hr);

            o.vInt ^= 2;

            hr = m_param.SetParam(0, o);
            DMOError.ThrowExceptionForHR(hr);
        }

        private void button3_Click(object sender, System.EventArgs e)
        {
            int hr;
            MPData o;

            hr = m_param.GetParam(0, out o);
            DMOError.ThrowExceptionForHR(hr);

            o.vInt ^= 1;

            hr = m_param.SetParam(0, o);
            DMOError.ThrowExceptionForHR(hr);
        }

        // Break an the pointer to some ParamText into usable fields
        private void ParseParamText(IntPtr ip, out string ParamName, out string ParamUnits, out string [] ParamEnum)
        {
            int iCount = 0;
            string s;

            // Up to the first null is the display name
            ParamName = Marshal.PtrToStringUni(ip);
            ip = (IntPtr)(ip.ToInt32() + ((ParamName.Length + 1) * 2));

            // Next is the units
            ParamUnits = Marshal.PtrToStringUni(ip);
            ip = (IntPtr)(ip.ToInt32() + ((ParamUnits.Length + 1) * 2));

            // Following, there may b zero or more enum strings.  First we count them.
            IntPtr ip2 = ip;
            while (Marshal.ReadInt16(ip2) != 0) // Terminate on a zero length string
            {
                s = Marshal.PtrToStringUni(ip2);
                ip2 = (IntPtr)(ip2.ToInt32() + ((s.Length + 1) * 2));
                iCount++;
            }

            // Now we allocate the array, and copy the values in.
            ParamEnum = new string[iCount];
            for(int x=0; x < iCount; x++)
            {
                ParamEnum[x] = Marshal.PtrToStringUni(ip);
                ip = (IntPtr)(ip.ToInt32() + ((ParamEnum[x].Length + 1) * 2));
            }
        }

    }
}
