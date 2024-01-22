/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Windows.Forms;

using DirectShowLib;

namespace GMFPreview
{
    public partial class DeviceForm : Form
    {
        public DeviceForm()
        {
            InitializeComponent();

            // Load the listbox with video capture device names
            DsDevice[] devs = DsDevice.GetDevicesOfCat(FilterCategory.VideoInputDevice);

            foreach (DsDevice dev in devs)
            {
                lbDevices.Items.Add(new VDevice(dev));
            }

            if (devs.Length > 0)
            {
                lbDevices.SelectedIndex = 0;
                bnOK.Enabled = true;
            }
            else
            {
                bnOK.Enabled = false;
            }
        }

        private void bnOK_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void bnCancel_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void lbDevices_DoubleClick(object sender, EventArgs e)
        {
            DialogResult = DialogResult.OK;
            Close();
        }

        public void SelectIndex(DsDevice dev)
        {
            // Highlight the specified device (if we can find it)
            if (dev != null)
            {
                for (int x = 0; x < lbDevices.Items.Count; x++)
                {
                    VDevice d = lbDevices.Items[x] as VDevice;
                    if (d.Device.DevicePath == dev.DevicePath)
                    {
                        lbDevices.SelectedIndex = x;
                        break;
                    }
                }
            }
        }
    }

    // A wrapper class to put DsDevices into a listbox
    public class VDevice
    {
        private DsDevice m_dev;

        public VDevice(DsDevice dev)
        {
            m_dev = dev;
        }

        public DsDevice Device
        {
            get
            {
                return m_dev;
            }
        }

        public override string ToString()
        {
            return m_dev.Name;
        }
    }
}