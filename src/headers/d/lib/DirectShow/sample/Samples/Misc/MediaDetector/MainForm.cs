using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

using DirectShowLib;

namespace DirectShowLib.Samples
{
  public partial class MainForm : Form
  {
    public MainForm()
    {
      InitializeComponent();
    }

    private void MainForm_DragEnter(object sender, DragEventArgs e)
    {
      // Display a link icon
      e.Effect = DragDropEffects.Link;
    }

    private void MainForm_DragDrop(object sender, DragEventArgs e)
    {
      // Retrieve the files droped into the form
      string[] fileNames = (string[])e.Data.GetData("FileNameW");

      // Get the description of this file
      MediaDescription mediaDesc = MediaDetector.GetDescription(fileNames[0]);

      // Display the returned description
      propertyGrid1.SelectedObject = mediaDesc;
      pictureBox1.Image = mediaDesc.Snapshot;
    }
  }
}