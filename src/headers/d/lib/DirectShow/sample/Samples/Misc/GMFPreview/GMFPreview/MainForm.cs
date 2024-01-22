/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices.ComTypes;

using DirectShowLib;

namespace GMFPreview
{
    public partial class MainForm : Form
    {
        #region Member variables

        // The video device to use
        private DsDevice m_dev = null;

        // The auto incremented number to tack on the end of the file to make a unique filename
        private int m_indexFile = -1;

        // An instance of the PreviewController class (where all the real work is done)
        private PreviewController m_Previewer = new PreviewController();

        #endregion

        public MainForm()
        {
            InitializeComponent();
        }

        private void bnDevice_Click(object sender, EventArgs e)
        {
            DeviceForm dlg = new DeviceForm();

            // Highlight current device in listbox
            dlg.SelectIndex(m_dev);

            // Put up the dialog to select a device
            DialogResult x = dlg.ShowDialog(this);

            // If a device is selected
            if (x == DialogResult.OK)
            {
                // Store the device
                m_dev = ((VDevice)dlg.lbDevices.SelectedItem).Device;

                // Create the capture graphs from the selected device
                try
                {
                    m_Previewer.SelectDevice(m_dev, gbPreview.Handle);
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message, "GMFPreview capture", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void bnFolder_Click(object sender, EventArgs e)
        {
            // Show the folder browser
            folderBrowserDialog1.ShowDialog(this);
        }

        private void bnCapture_Click(object sender, EventArgs e)
        {
            // If we aren't already capturing
            if (!m_Previewer.Capturing)
            {
                // Make sure a device is selected
                if (!m_Previewer.Selected)
                {
                    bnDevice_Click(sender, e);
                }

                // If we have a device
                if (m_Previewer.Selected)
                {
                    // Generate a name and send it to the m_Previewer
                    MakeNewCaptureFile();

                    // Start the capture graph
                    try
                    {
                        m_Previewer.StartCapture();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "GMFPreview capture", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
        }

        private void bnStopCapture_Click(object sender, EventArgs e)
        {
            // Only stop if we are started
            if (m_Previewer.Capturing)
            {
                try
                {
                    m_Previewer.StopCapture();
                    string s = string.Format("Captured to {0}", m_Previewer.FileName);
                    MessageBox.Show(s, "GMFPreview capture");
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message, "GMFPreview capture", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void MakeNewCaptureFile()
        {
            string sFileName;

            // Find an unused file name
            do
            {
                sFileName = string.Format(@"{0}\Cap{1}.avi", folderBrowserDialog1.SelectedPath, ++m_indexFile);
            } while (File.Exists(sFileName));

            try
            {
                // Tell the previewer what name to use
                m_Previewer.SetNextFilename(sFileName);
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "GMFPreview capture", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
       }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            // Release pointers
            if (m_dev != null)
            {
                m_dev.Dispose();
                m_dev = null;
            }

            if (m_Previewer != null)
            {
                m_Previewer.Dispose();
                m_Previewer = null;
            }
        }
    }
}