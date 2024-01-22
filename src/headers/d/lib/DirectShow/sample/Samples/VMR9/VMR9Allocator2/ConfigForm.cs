using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

using Microsoft.DirectX.Direct3D;

namespace DirectShowLib.Sample
{
  /// <summary>
  /// Helper struture to pass selected preferences
  /// </summary>
  public struct Configuration
  {
    public bool IsWindowed;
    public DisplayMode Mode;
    public bool IsUsingMixing;
    public bool UseYUVMixing;
  }

  /// <summary>
  /// Helper Structure to display video modes in the combo
  /// </summary>
  public struct Mode
  {
    public DisplayMode mode;

    public Mode(DisplayMode mode)
    {
      this.mode = mode;
    }

    public override string ToString()
    {
      return string.Format("{0} x {1} : {2} @ {3}Hz", mode.Width, mode.Height, mode.Format, mode.RefreshRate);
    }
  }

  public partial class ConfigForm : Form
  {
    public Configuration config = new Configuration();

    public ConfigForm()
    {
      InitializeComponent();

      FillComboWithDisplayModes();
    }

    private void FillComboWithDisplayModes()
    {
      foreach (DisplayMode displayMode in Manager.Adapters.Default.SupportedDisplayModes)
      {
        cbDisplayModes.Items.Add(new Mode(displayMode));
      }
    }

    private void rbWindowed_CheckedChanged(object sender, EventArgs e)
    {
      cbDisplayModes.Enabled = false;
    }

    private void rbFullScreen_CheckedChanged(object sender, EventArgs e)
    {
      cbDisplayModes.Enabled = true;
    }

    private void btOK_Click(object sender, EventArgs e)
    {
      config.IsWindowed = rbWindowed.Checked;
      if (rbFullScreen.Checked)
      {
        config.Mode = ((Mode)cbDisplayModes.SelectedItem).mode;
      }
      config.IsUsingMixing = !rbNoMixing.Checked;
      config.UseYUVMixing = rbYUVMixing.Checked;

      this.DialogResult = DialogResult.OK;
      this.Close();
    }

    private void btCancel_Click(object sender, EventArgs e)
    {
      this.DialogResult = DialogResult.Cancel;
      this.Close();
    }
  }
}