/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Runtime.InteropServices;
using System.Windows.Forms;

using DirectShowLib;
using DirectShowLib.BDA;

namespace DirectShowLib.Sample
{
	/// <summary>
	/// Description résumée de DVBTTuning.
	/// </summary>
	public class DVBTTuning : Form, ITuningSelector
	{
    private System.Windows.Forms.Label label1;
    private System.Windows.Forms.Label label2;
    private System.Windows.Forms.Label label3;
    private System.Windows.Forms.Label label4;
    private System.Windows.Forms.Label label5;
    private System.Windows.Forms.Button button1;
    private System.Windows.Forms.TextBox textCarrierFreq;
    private System.Windows.Forms.TextBox textONID;
    private System.Windows.Forms.TextBox textTSID;
    private System.Windows.Forms.TextBox textSID;

    /// <summary>
		/// Variable nécessaire au concepteur.
		/// </summary>
		private System.ComponentModel.Container components = null;

    private IDVBTuningSpace tuningSpace = null;
    private IDVBTuneRequest tuneRequest = null;

		public DVBTTuning()
		{
      InitializeComponent();

      int hr = 0;

      this.tuningSpace = (IDVBTuningSpace) new DVBTuningSpace();
      hr = this.tuningSpace.put_UniqueName("DVBT TuningSpace");
      hr = this.tuningSpace.put_FriendlyName("DVBT TuningSpace");
      hr = this.tuningSpace.put__NetworkType(typeof(DVBTNetworkProvider).GUID);
      hr = this.tuningSpace.put_SystemType(DVBSystemType.Terrestrial);

      ITuneRequest tr = null;

      hr = this.tuningSpace.CreateTuneRequest(out tr);
      DsError.ThrowExceptionForHR(hr);

      this.tuneRequest = (IDVBTuneRequest) tr;

      hr = this.tuneRequest.put_ONID(-1);
      hr = this.tuneRequest.put_TSID(-1);
      hr = this.tuneRequest.put_SID(-1);

      IDVBTLocator locator = (IDVBTLocator) new DVBTLocator();
      hr = locator.put_CarrierFrequency(-1);
      hr = tr.put_Locator(locator as ILocator);
		}

		/// <summary>
		/// Nettoyage des ressources utilisées.
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

		#region Code généré par le Concepteur Windows Form
		/// <summary>
		/// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
		/// le contenu de cette méthode avec l'éditeur de code.
		/// </summary>
		private void InitializeComponent()
		{
      this.textCarrierFreq = new System.Windows.Forms.TextBox();
      this.textONID = new System.Windows.Forms.TextBox();
      this.textTSID = new System.Windows.Forms.TextBox();
      this.textSID = new System.Windows.Forms.TextBox();
      this.label1 = new System.Windows.Forms.Label();
      this.label2 = new System.Windows.Forms.Label();
      this.label3 = new System.Windows.Forms.Label();
      this.label4 = new System.Windows.Forms.Label();
      this.label5 = new System.Windows.Forms.Label();
      this.button1 = new System.Windows.Forms.Button();
      this.SuspendLayout();
      // 
      // textCarrierFreq
      // 
      this.textCarrierFreq.Location = new System.Drawing.Point(104, 16);
      this.textCarrierFreq.Name = "textCarrierFreq";
      this.textCarrierFreq.TabIndex = 0;
      this.textCarrierFreq.Text = "";
      // 
      // textONID
      // 
      this.textONID.Location = new System.Drawing.Point(104, 40);
      this.textONID.Name = "textONID";
      this.textONID.TabIndex = 1;
      this.textONID.Text = "";
      // 
      // textTSID
      // 
      this.textTSID.Location = new System.Drawing.Point(104, 64);
      this.textTSID.Name = "textTSID";
      this.textTSID.TabIndex = 2;
      this.textTSID.Text = "";
      // 
      // textSID
      // 
      this.textSID.Location = new System.Drawing.Point(104, 88);
      this.textSID.Name = "textSID";
      this.textSID.TabIndex = 3;
      this.textSID.Text = "";
      // 
      // label1
      // 
      this.label1.Location = new System.Drawing.Point(8, 16);
      this.label1.Name = "label1";
      this.label1.Size = new System.Drawing.Size(96, 24);
      this.label1.TabIndex = 4;
      this.label1.Text = "Carrier Frequency";
      // 
      // label2
      // 
      this.label2.Location = new System.Drawing.Point(8, 40);
      this.label2.Name = "label2";
      this.label2.Size = new System.Drawing.Size(96, 23);
      this.label2.TabIndex = 5;
      this.label2.Text = "ONID";
      // 
      // label3
      // 
      this.label3.Location = new System.Drawing.Point(8, 64);
      this.label3.Name = "label3";
      this.label3.Size = new System.Drawing.Size(96, 23);
      this.label3.TabIndex = 6;
      this.label3.Text = "TSID";
      // 
      // label4
      // 
      this.label4.Location = new System.Drawing.Point(8, 88);
      this.label4.Name = "label4";
      this.label4.Size = new System.Drawing.Size(96, 23);
      this.label4.TabIndex = 7;
      this.label4.Text = "SID";
      // 
      // label5
      // 
      this.label5.Location = new System.Drawing.Point(208, 16);
      this.label5.Name = "label5";
      this.label5.Size = new System.Drawing.Size(32, 23);
      this.label5.TabIndex = 8;
      this.label5.Text = "Khz";
      // 
      // button1
      // 
      this.button1.FlatStyle = System.Windows.Forms.FlatStyle.System;
      this.button1.Location = new System.Drawing.Point(216, 88);
      this.button1.Name = "button1";
      this.button1.Size = new System.Drawing.Size(48, 23);
      this.button1.TabIndex = 9;
      this.button1.Text = "Go";
      this.button1.Click += new System.EventHandler(this.button1_Click);
      // 
      // DVBTTuning
      // 
      this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
      this.ClientSize = new System.Drawing.Size(274, 120);
      this.Controls.Add(this.button1);
      this.Controls.Add(this.label5);
      this.Controls.Add(this.label4);
      this.Controls.Add(this.label3);
      this.Controls.Add(this.label2);
      this.Controls.Add(this.label1);
      this.Controls.Add(this.textSID);
      this.Controls.Add(this.textTSID);
      this.Controls.Add(this.textONID);
      this.Controls.Add(this.textCarrierFreq);
      this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
      this.MaximizeBox = false;
      this.MinimizeBox = false;
      this.Name = "DVBTTuning";
      this.Text = "DVBT Tuning";
      this.ResumeLayout(false);

    }
		#endregion

    private void button1_Click(object sender, System.EventArgs e)
    {
      this.DialogResult = DialogResult.OK;
    }

    #region Membres de ITuningSelector

    public DirectShowLib.BDA.ITuningSpace TuningSpace
    {
      get
      {
        return (this.tuningSpace as ITuningSpace);
      }
    }

    public DirectShowLib.BDA.ITuneRequest TuneRequest
    {
      get
      {
        return (this.tuneRequest as ITuneRequest);
      }
    }

    public bool TuneSelect()
    {
      int hr = 0;
      ILocator locator;
      int freq;
      int onid, tsid, sid;


      hr = this.tuneRequest.get_Locator(out locator);

      hr = locator.get_CarrierFrequency(out freq);

      hr = this.tuneRequest.get_ONID(out onid);
      hr = this.tuneRequest.get_TSID(out tsid);
      hr = this.tuneRequest.get_SID(out sid);

      textCarrierFreq.Text = freq.ToString();
      textONID.Text = onid.ToString();
      textTSID.Text = tsid.ToString();
      textSID.Text = sid.ToString();

      this.ShowDialog();

      if (this.DialogResult == DialogResult.OK)
      {
        hr = locator.put_CarrierFrequency(Convert.ToInt32(textCarrierFreq.Text));
        hr = this.tuneRequest.put_Locator(locator);
        Marshal.ReleaseComObject(locator);

        hr = this.tuneRequest.put_ONID(Convert.ToInt32(textONID.Text));
        hr = this.tuneRequest.put_TSID(Convert.ToInt32(textTSID.Text));
        hr = this.tuneRequest.put_SID(Convert.ToInt32(textSID.Text));
        return true;
      }
      else
      {
        Marshal.ReleaseComObject(locator);
        return false;
      }
    }

    #endregion

  }
}
