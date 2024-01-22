/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

Written by oohansen@gmail.com
Adapted by snarfle@sourceforge.net
*****************************************************************************/

using System;
using System.Windows.Forms;
using System.Runtime.InteropServices;

using DirectShowLib;

namespace DirectShowLib.Samples
{
    /// <summary>
    /// Summary description for Form1.
    /// </summary>
    public class Form1 : System.Windows.Forms.Form
    {
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.ComboBox comboBox2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown nudChannel;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components = null;

        //A (modified) definition of OleCreatePropertyFrame found here: http://groups.google.no/group/microsoft.public.dotnet.languages.csharp/browse_thread/thread/db794e9779144a46/55dbed2bab4cd772?lnk=st&q=[DllImport(%22olepro32.dll%22)]&rnum=1&hl=no#55dbed2bab4cd772
        [DllImport("oleaut32.dll", CharSet=CharSet.Unicode, ExactSpelling=true)]
        public static extern int OleCreatePropertyFrame( 
            IntPtr hwndOwner, 
            int x, 
            int y, 
            [MarshalAs(UnmanagedType.LPWStr)] string lpszCaption, 
            int cObjects, 
            [MarshalAs(UnmanagedType.Interface, ArraySubType=UnmanagedType.IUnknown)] 
            ref object ppUnk, 
            int cPages, 
            IntPtr lpPageClsID, 
            int lcid, 
            int dwReserved, 
            IntPtr lpvReserved);

        IMediaControl mediaControl = null;
        IGraphBuilder graphBuilder = null;
        IBaseFilter theDevice = null;
        IBaseFilter theCompressor = null;
        IAMTVTuner tuner = null;
        IBaseFilter crossbar = null;

#if DEBUG
        // Allow you to "Connect to remote graph" from GraphEdit
        DsROTEntry m_rot = null;
#endif

        public Form1()
        {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

            //
            // TODO: Add any constructor code after InitializeComponent call
            //

            //enumerate Video Input filters and add them to comboBox1
            foreach (DsDevice ds in DsDevice.GetDevicesOfCat(FilterCategory.VideoInputDevice))
            {
                comboBox1.Items.Add(ds.Name);
            }

            comboBox2.Items.Add("<None>");

            //enumerate Video Compressor filters and add them to comboBox1
            foreach (DsDevice ds in DsDevice.GetDevicesOfCat(FilterCategory.VideoCompressorCategory))
            {
                comboBox2.Items.Add(ds.Name);
            }

            //Select first combobox item
            if (comboBox1.Items.Count > 0)
            {
                comboBox1.SelectedIndex = 0;
            }

            //Select first combobox item
            if (comboBox2.Items.Count > 0)
            {
                comboBox2.SelectedIndex = 0;
            }
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.nudChannel = new System.Windows.Forms.NumericUpDown();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.button5 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.nudChannel)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // comboBox1
            // 
            this.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox1.Location = new System.Drawing.Point(8, 8);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(256, 21);
            this.comboBox1.TabIndex = 0;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // comboBox2
            // 
            this.comboBox2.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox2.Location = new System.Drawing.Point(8, 40);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(256, 21);
            this.comboBox2.TabIndex = 1;
            this.comboBox2.SelectedIndexChanged += new System.EventHandler(this.comboBox2_SelectedIndexChanged);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(264, 8);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(120, 24);
            this.button1.TabIndex = 2;
            this.button1.Text = "Show property pages";
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(264, 40);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(120, 24);
            this.button2.TabIndex = 3;
            this.button2.Text = "Show property pages";
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(32, 400);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(96, 23);
            this.button3.TabIndex = 4;
            this.button3.Text = "Record";
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(8, 368);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(384, 20);
            this.textBox1.TabIndex = 6;
            this.textBox1.Text = "c:\\test.avi";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.Black;
            this.panel1.Location = new System.Drawing.Point(8, 72);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(384, 288);
            this.panel1.TabIndex = 7;
            // 
            // nudChannel
            // 
            this.nudChannel.Location = new System.Drawing.Point(64, 11);
            this.nudChannel.Name = "nudChannel";
            this.nudChannel.Size = new System.Drawing.Size(40, 20);
            this.nudChannel.TabIndex = 8;
            this.nudChannel.Value = new decimal(new int[] {
            5,
            0,
            0,
            0});
            this.nudChannel.ValueChanged += new System.EventHandler(this.OnValueChanged);
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(8, 11);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(48, 16);
            this.label1.TabIndex = 9;
            this.label1.Text = "Channel";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.button2);
            this.groupBox1.Controls.Add(this.button1);
            this.groupBox1.Controls.Add(this.comboBox2);
            this.groupBox1.Controls.Add(this.comboBox1);
            this.groupBox1.Location = new System.Drawing.Point(3, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(392, 68);
            this.groupBox1.TabIndex = 10;
            this.groupBox1.TabStop = false;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.button5);
            this.groupBox2.Controls.Add(this.button4);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Controls.Add(this.nudChannel);
            this.groupBox2.Enabled = false;
            this.groupBox2.Location = new System.Drawing.Point(152, 390);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(240, 40);
            this.groupBox2.TabIndex = 11;
            this.groupBox2.TabStop = false;
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(168, 11);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(64, 23);
            this.button5.TabIndex = 11;
            this.button5.Text = "CrossBar";
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(112, 11);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(48, 23);
            this.button4.TabIndex = 10;
            this.button4.Text = "Tuner";
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // Form1
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(402, 432);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.button3);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form1";
            this.Text = "DsTuner";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            ((System.ComponentModel.ISupportInitialize)(this.nudChannel)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

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

        /// <summary>
        /// Stop recording and release the graph
        /// </summary>
        public void StopRecord()
        {
            //Stop the Graph
            mediaControl.Stop();

#if DEBUG
            if (m_rot != null)
            {
                m_rot.Dispose();
                m_rot = null;
            }
#endif		

            //Release COM objects
            Marshal.ReleaseComObject(graphBuilder);
            graphBuilder = null;

            if (tuner != null)
            {
                Marshal.ReleaseComObject(tuner);
                tuner = null;
            }

            if (crossbar != null)
            {
                Marshal.ReleaseComObject(crossbar);
                crossbar = null;
            }
        }

        /// <summary>
        /// Start recording
        /// </summary>
        public void Record()
        {
            if (mediaControl != null)
            {
                //Run the graph
                mediaControl.Run();
            }
        }

        /// <summary>
        /// Initialize the graph
        /// </summary>
        public void InitGraph()
        {
            if (theDevice == null)
                return;

            object o;

            //Create the Graph
            graphBuilder = (IGraphBuilder) new FilterGraph();
			
#if DEBUG
            m_rot = new DsROTEntry(graphBuilder);
#endif

            //Create the Capture Graph Builder
            ICaptureGraphBuilder2 captureGraphBuilder = null;
            captureGraphBuilder = (ICaptureGraphBuilder2) new CaptureGraphBuilder2();
			
            //Create the media control for controlling the graph
            mediaControl = (IMediaControl) this.graphBuilder;

            // Attach the filter graph to the capture graph
            int hr = captureGraphBuilder.SetFiltergraph(this.graphBuilder);
            DsError.ThrowExceptionForHR(hr);

            //Add the Video input device to the graph
            hr = graphBuilder.AddFilter(theDevice, "source filter");
            DsError.ThrowExceptionForHR(hr);

            //Add the Video compressor filter to the graph
            if (theCompressor != null)
            {
                hr = graphBuilder.AddFilter(theCompressor, "compressor filter");
                DsError.ThrowExceptionForHR(hr);
            }

            //Create the file writer part of the graph. SetOutputFileName does this for us, and returns the mux and sink
            IBaseFilter mux;
            IFileSinkFilter sink;
            hr = captureGraphBuilder.SetOutputFileName(MediaSubType.Avi, textBox1.Text, out mux, out sink);
            DsError.ThrowExceptionForHR(hr);

            //Connect the device and compressor to the mux to render the capture part of the graph
            hr = captureGraphBuilder.RenderStream(PinCategory.Capture, MediaType.Video, theDevice, theCompressor, mux);
            DsError.ThrowExceptionForHR(hr);

            //Render any preview pin of the device
            hr = captureGraphBuilder.RenderStream(PinCategory.Preview, MediaType.Video, theDevice, null, null);
            DsError.ThrowExceptionForHR(hr);

            tuner = null;
            crossbar = null;

            hr = captureGraphBuilder.FindInterface(null, null, theDevice, typeof(IAMTVTuner).GUID, out o);
            if (hr >= 0)
            {
                tuner = (IAMTVTuner)o;
                o = null;

                hr = captureGraphBuilder.FindInterface(null, null, theDevice, typeof(IAMCrossbar).GUID, out o);
                if (hr >= 0)
                {
                    crossbar = (IBaseFilter)o;
                    o = null;
                }
            }
			
            //get the video window from the graph
            IVideoWindow videoWindow = null;
            videoWindow = (IVideoWindow) graphBuilder;

            //Set the owener of the videoWindow to an IntPtr of some sort (the Handle of any control - could be a form / button etc.)
            hr = videoWindow.put_Owner(panel1.Handle);
            DsError.ThrowExceptionForHR(hr);

            //Set the style of the video window
            hr = videoWindow.put_WindowStyle(WindowStyle.Child | WindowStyle.ClipChildren);
            DsError.ThrowExceptionForHR(hr);

            // Position video window in client rect of main application window
            hr = videoWindow.SetWindowPosition(0, 0, panel1.Width, panel1.Height);
            DsError.ThrowExceptionForHR(hr);

            // Make the video window visible
            hr = videoWindow.put_Visible(OABool.True);
            DsError.ThrowExceptionForHR(hr);

            Marshal.ReleaseComObject(mux);
            Marshal.ReleaseComObject(sink);
            Marshal.ReleaseComObject(captureGraphBuilder);
        }


        /// <summary>
        /// Enumerates all filters of the selected category and returns the IBaseFilter for the 
        /// filter described in friendlyname
        /// </summary>
        /// <param name="category">Category of the filter</param>
        /// <param name="friendlyname">Friendly name of the filter</param>
        /// <returns>IBaseFilter for the device</returns>
        private IBaseFilter CreateFilter(Guid category, string friendlyname)
        {
            object source = null;
            Guid iid = typeof(IBaseFilter).GUID;
            foreach (DsDevice device in DsDevice.GetDevicesOfCat(category))
            {
                if (device.Name.CompareTo(friendlyname) == 0)
                {
                    device.Mon.BindToObject(null, null, ref iid, out source);
                    break;
                }
            }

            return (IBaseFilter)source;
        }


        /// <summary>
        /// Displays a property page for a filter
        /// </summary>
        /// <param name="dev">The filter for which to display a property page</param>
        private void DisplayPropertyPage(IBaseFilter dev)
        {
            //Get the ISpecifyPropertyPages for the filter
            ISpecifyPropertyPages pProp = dev as ISpecifyPropertyPages;
            int hr = 0;

            if (pProp == null)
            {
                //If the filter doesn't implement ISpecifyPropertyPages, try displaying IAMVfwCompressDialogs instead!
                IAMVfwCompressDialogs compressDialog = dev as IAMVfwCompressDialogs;
                if (compressDialog != null)
                {

                    hr = compressDialog.ShowDialog(VfwCompressDialogs.Config, IntPtr.Zero);
                    DsError.ThrowExceptionForHR(hr);
                }
                else
                {
                    MessageBox.Show("Item has no property page", "No Property Page", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                return;
            }

            //Get the name of the filter from the FilterInfo struct
            FilterInfo filterInfo;
            hr = dev.QueryFilterInfo(out filterInfo); 
            DsError.ThrowExceptionForHR(hr);

            // Get the propertypages from the property bag
            DsCAUUID caGUID;
            hr = pProp.GetPages(out caGUID);
            DsError.ThrowExceptionForHR(hr);

            //Create and display the OlePropertyFrame
            object oDevice = (object)dev;
            hr = OleCreatePropertyFrame(this.Handle, 0, 0, filterInfo.achName, 1, ref oDevice, caGUID.cElems, caGUID.pElems, 0, 0, IntPtr.Zero);
            DsError.ThrowExceptionForHR(hr);

            Marshal.ReleaseComObject(oDevice);

            if (filterInfo.pGraph != null)
            {
                Marshal.ReleaseComObject(filterInfo.pGraph);
            }

            // Release COM objects
            Marshal.FreeCoTaskMem(caGUID.pElems);
        }

        private void button1_Click(object sender, System.EventArgs e)
        {
            //Display property page for the selected video input device
            DisplayPropertyPage(theDevice);
        }

        private void button2_Click(object sender, System.EventArgs e)
        {
            //Display property page for the selected video compressor
            DisplayPropertyPage(theCompressor);		
        }

        private void button3_Click(object sender, System.EventArgs e)
        {
            if (button3.Text == "Record")
            {
                InitGraph();
                SetChannel();
                Record();
                button3.Text = "Stop";
                textBox1.Enabled = false;
                groupBox1.Enabled = false;
            }
            else
            {
                textBox1.Enabled = true;
                groupBox1.Enabled = true;
                groupBox2.Enabled = false;
                StopRecord();
                button3.Text = "Record";
            }
        }

        private void SetChannel()
        {
            if (tuner != null)
            {
                groupBox2.Enabled = true;
                OnValueChanged(null, null);
            }
            else
            {
                groupBox2.Enabled = false;
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //Release COM objects
            if (theDevice != null)
            {
                Marshal.ReleaseComObject(theDevice);
                theDevice = null;
            }
            //Create the filter for the selected video input device
            string devicepath = comboBox1.SelectedItem.ToString();
            theDevice = CreateFilter(FilterCategory.VideoInputDevice, devicepath);
        }

        private void comboBox2_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //Release COM objects
            if (theCompressor != null)
            {
                Marshal.ReleaseComObject(theCompressor);
                theCompressor = null;
            }
            //Create the filter for the selected video compressor
            string devicepath = comboBox2.SelectedItem.ToString();
            theCompressor = CreateFilter(FilterCategory.VideoCompressorCategory, devicepath);
        }

        private void OnValueChanged(object sender, System.EventArgs e)
        {
            int hr;

            hr = tuner.put_Channel((int)nudChannel.Value, 0, 0);
            DsError.ThrowExceptionForHR(hr);
        }

        private void button4_Click(object sender, System.EventArgs e)
        {
            mediaControl.Pause();
            IBaseFilter ibf = (IBaseFilter)tuner;
            DisplayPropertyPage(ibf);
            mediaControl.Run();
        }

        private void button5_Click(object sender, System.EventArgs e)
        {
            mediaControl.Pause();
            DisplayPropertyPage(crossbar);
            mediaControl.Run();
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (button3.Text != "Record")
            {
                StopRecord();
            }
        }
    }
}
