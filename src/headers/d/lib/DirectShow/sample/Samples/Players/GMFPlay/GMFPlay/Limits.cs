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

namespace GMFPlay
{
    public partial class fmLimits : Form
    {
        public fmLimits(long lDuration)
        {
            InitializeComponent();
            label1.Text = string.Format("Duration: {0} seconds", lDuration);
        }

        private void bnOk_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void bnCancel_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}