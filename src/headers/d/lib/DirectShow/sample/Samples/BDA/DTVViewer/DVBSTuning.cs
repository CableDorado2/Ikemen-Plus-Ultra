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
	/// Description résumée de DVBSTuning.
	/// </summary>
	public class DVBSTuning : Form, ITuningSelector
	{
    private System.Windows.Forms.Button button1;
    private System.Windows.Forms.Label label6;
    private System.Windows.Forms.Label label5;
    private System.Windows.Forms.Label label4;
    private System.Windows.Forms.Label label3;
    private System.Windows.Forms.Label label2;
    private System.Windows.Forms.Label label1;
    private System.Windows.Forms.TextBox textSID;
    private System.Windows.Forms.TextBox textTSID;
    private System.Windows.Forms.TextBox textONID;
    private System.Windows.Forms.TextBox textCarrierFreq;
    private System.Windows.Forms.TextBox textSymbolRate;
    private System.Windows.Forms.Label label7;
    private System.Windows.Forms.ComboBox comboSigPol;

    /// <summary>
		/// Variable nécessaire au concepteur.
		/// </summary>
		private System.ComponentModel.Container components = null;

    private IDVBSTuningSpace tuningSpace = null;
    private IDVBTuneRequest tuneRequest = null;

		public DVBSTuning()
		{
      InitializeComponent();

      int hr = 0;

      this.tuningSpace = (IDVBSTuningSpace) new DVBSTuningSpace();
      hr = this.tuningSpace.put_UniqueName("DVBS TuningSpace");
      hr = this.tuningSpace.put_FriendlyName("DVBS TuningSpace");
      hr = this.tuningSpace.put__NetworkType(typeof(DVBSNetworkProvider).GUID);
      hr = this.tuningSpace.put_SystemType(DVBSystemType.Satellite);
      hr = this.tuningSpace.put_LowOscillator(9750000);
      hr = this.tuningSpace.put_HighOscillator(10600000);

      ITuneRequest tr = null;

      hr = this.tuningSpace.CreateTuneRequest(out tr);
      DsError.ThrowExceptionForHR(hr);

      this.tuneRequest = (IDVBTuneRequest) tr;

      hr = this.tuneRequest.put_ONID(-1);
      hr = this.tuneRequest.put_TSID(-1);
      hr = this.tuneRequest.put_SID(-1);

      IDVBSLocator locator = (IDVBSLocator) new DVBSLocator();
      hr = locator.put_CarrierFrequency(-1);
      hr = locator.put_SymbolRate(-1);
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
      this.button1 = new System.Windows.Forms.Button();
      this.label5 = new System.Windows.Forms.Label();
      this.label4 = new System.Windows.Forms.Label();
      this.label3 = new System.Windows.Forms.Label();
      this.label2 = new System.Windows.Forms.Label();
      this.label1 = new System.Windows.Forms.Label();
      this.textSID = new System.Windows.Forms.TextBox();
      this.textTSID = new System.Windows.Forms.TextBox();
      this.textONID = new System.Windows.Forms.TextBox();
      this.textCarrierFreq = new System.Windows.Forms.TextBox();
      this.label6 = new System.Windows.Forms.Label();
      this.textSymbolRate = new System.Windows.Forms.TextBox();
      this.label7 = new System.Windows.Forms.Label();
      this.comboSigPol = new System.Windows.Forms.ComboBox();
      this.SuspendLayout();
      // 
      // button1
      // 
      this.button1.FlatStyle = System.Windows.Forms.FlatStyle.System;
      this.button1.Location = new System.Drawing.Point(224, 136);
      this.button1.Name = "button1";
      this.button1.Size = new System.Drawing.Size(48, 23);
      this.button1.TabIndex = 8;
      this.button1.Text = "Go";
      this.button1.Click += new System.EventHandler(this.button1_Click);
      // 
      // label5
      // 
      this.label5.Location = new System.Drawing.Point(216, 16);
      this.label5.Name = "label5";
      this.label5.Size = new System.Drawing.Size(32, 23);
      this.label5.TabIndex = 18;
      this.label5.Text = "Khz";
      // 
      // label4
      // 
      this.label4.Location = new System.Drawing.Point(8, 136);
      this.label4.Name = "label4";
      this.label4.Size = new System.Drawing.Size(104, 23);
      this.label4.TabIndex = 17;
      this.label4.Text = "SID";
      // 
      // label3
      // 
      this.label3.Location = new System.Drawing.Point(8, 112);
      this.label3.Name = "label3";
      this.label3.Size = new System.Drawing.Size(104, 23);
      this.label3.TabIndex = 16;
      this.label3.Text = "TSID";
      // 
      // label2
      // 
      this.label2.Location = new System.Drawing.Point(8, 88);
      this.label2.Name = "label2";
      this.label2.Size = new System.Drawing.Size(104, 23);
      this.label2.TabIndex = 15;
      this.label2.Text = "ONID";
      // 
      // label1
      // 
      this.label1.Location = new System.Drawing.Point(8, 16);
      this.label1.Name = "label1";
      this.label1.Size = new System.Drawing.Size(104, 24);
      this.label1.TabIndex = 14;
      this.label1.Text = "Carrier Frequency";
      // 
      // textSID
      // 
      this.textSID.Location = new System.Drawing.Point(112, 136);
      this.textSID.Name = "textSID";
      this.textSID.TabIndex = 6;
      this.textSID.Text = "";
      // 
      // textTSID
      // 
      this.textTSID.Location = new System.Drawing.Point(112, 112);
      this.textTSID.Name = "textTSID";
      this.textTSID.TabIndex = 5;
      this.textTSID.Text = "";
      // 
      // textONID
      // 
      this.textONID.Location = new System.Drawing.Point(112, 88);
      this.textONID.Name = "textONID";
      this.textONID.TabIndex = 4;
      this.textONID.Text = "";
      // 
      // textCarrierFreq
      // 
      this.textCarrierFreq.Location = new System.Drawing.Point(112, 16);
      this.textCarrierFreq.Name = "textCarrierFreq";
      this.textCarrierFreq.TabIndex = 1;
      this.textCarrierFreq.Text = "";
      // 
      // label6
      // 
      this.label6.Location = new System.Drawing.Point(8, 64);
      this.label6.Name = "label6";
      this.label6.Size = new System.Drawing.Size(104, 23);
      this.label6.TabIndex = 21;
      this.label6.Text = "Symbol Rate";
      // 
      // textSymbolRate
      // 
      this.textSymbolRate.Location = new System.Drawing.Point(112, 64);
      this.textSymbolRate.Name = "textSymbolRate";
      this.textSymbolRate.TabIndex = 3;
      this.textSymbolRate.Text = "";
      // 
      // label7
      // 
      this.label7.Location = new System.Drawing.Point(8, 40);
      this.label7.Name = "label7";
      this.label7.Size = new System.Drawing.Size(104, 23);
      this.label7.TabIndex = 23;
      this.label7.Text = "Signal Polarisation";
      // 
      // comboSigPol
      // 
      this.comboSigPol.Items.AddRange(Enum.GetNames(typeof(Polarisation)));
      this.comboSigPol.DropDownStyle = ComboBoxStyle.DropDownList;
      this.comboSigPol.Location = new System.Drawing.Point(112, 40);
      this.comboSigPol.Name = "comboSigPol";
      this.comboSigPol.Size = new System.Drawing.Size(96, 21);
      this.comboSigPol.TabIndex = 2;
      // 
      // DVBSTuning
      // 
      this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
      this.ClientSize = new System.Drawing.Size(280, 166);
      this.Controls.Add(this.comboSigPol);
      this.Controls.Add(this.label7);
      this.Controls.Add(this.label6);
      this.Controls.Add(this.textSymbolRate);
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
      this.Name = "DVBSTuning";
      this.Text = "DVBS Tuning";
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
      int freq, symbolRate;
      Polarisation sigPol;
      int onid, tsid, sid;


      hr = this.tuneRequest.get_Locator(out locator);

      hr = locator.get_CarrierFrequency(out freq);
      hr = (locator as IDVBSLocator).get_SignalPolarisation(out sigPol);
      hr = locator.get_SymbolRate(out symbolRate);

      hr = this.tuneRequest.get_ONID(out onid);
      hr = this.tuneRequest.get_TSID(out tsid);
      hr = this.tuneRequest.get_SID(out sid);

      textCarrierFreq.Text = freq.ToString();
      comboSigPol.Text = sigPol.ToString();
      textSymbolRate.Text = symbolRate.ToString();
      textONID.Text = onid.ToString();
      textTSID.Text = tsid.ToString();
      textSID.Text = sid.ToString();

      this.ShowDialog();

      if (this.DialogResult == DialogResult.OK)
      {
        hr = locator.put_CarrierFrequency(Convert.ToInt32(textCarrierFreq.Text));
        sigPol = (Polarisation) Enum.Parse(typeof(Polarisation), comboSigPol.Text);
        hr = (locator as IDVBSLocator).put_SignalPolarisation(sigPol);
        hr = locator.put_SymbolRate(Convert.ToInt32(textSymbolRate.Text));
/*
        hr = (locator as IDVBSLocator).put_InnerFEC(FECMethod.Viterbi);
        hr = (locator as IDVBSLocator).put_InnerFECRate(BinaryConvolutionCodeRate.Rate2_3);
        hr = (locator as IDVBSLocator).put_OuterFEC(FECMethod.Viterbi);
        hr = (locator as IDVBSLocator).put_OuterFECRate(BinaryConvolutionCodeRate.Rate2_3);
*/

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
