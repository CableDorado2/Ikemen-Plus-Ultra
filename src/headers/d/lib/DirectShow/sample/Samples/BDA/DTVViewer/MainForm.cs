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
using System.Windows.Forms;
using System.Data;

namespace DirectShowLib.Sample
{
	/// <summary>
	/// Description résumée de Form1.
	/// </summary>
	public class MainForm : Form
	{
    private System.Windows.Forms.MainMenu mainMenu;
    private System.Windows.Forms.MenuItem menuFile;
    private System.Windows.Forms.MenuItem menuItem1;
    private System.Windows.Forms.MenuItem menuFileExit;
    private System.Windows.Forms.MenuItem menuNetworkDVBT;
    private System.Windows.Forms.MenuItem menuNetworkDVBS;
    private System.Windows.Forms.MenuItem menuItem2;
    private System.Windows.Forms.MenuItem menuDigitalTV;
    private System.Windows.Forms.MenuItem menuDigitalTVBuildGraph;
    private System.Windows.Forms.MenuItem menuFileSaveGraph;
    private System.Windows.Forms.MenuItem menuDigitalTVDoTuneRequest;
    private System.Windows.Forms.MenuItem menuDigitalTVDecomposeGraph;

		private System.ComponentModel.Container components = null;

    private ITuningSelector tuningSelector = null;
    private System.Windows.Forms.MenuItem menuHelp;
    private System.Windows.Forms.MenuItem menuHelpAbout;
    private BDAGraphBuilder bdaGraphBuilder = null;

		public MainForm()
		{
			InitializeComponent();
		}

		/// <summary>
		/// Nettoyage des ressources utilisées.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}

        if (this.bdaGraphBuilder != null)
        {
          this.bdaGraphBuilder.Dispose();
          this.bdaGraphBuilder = null;
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
      this.mainMenu = new System.Windows.Forms.MainMenu();
      this.menuFile = new System.Windows.Forms.MenuItem();
      this.menuFileSaveGraph = new System.Windows.Forms.MenuItem();
      this.menuItem1 = new System.Windows.Forms.MenuItem();
      this.menuFileExit = new System.Windows.Forms.MenuItem();
      this.menuDigitalTV = new System.Windows.Forms.MenuItem();
      this.menuNetworkDVBT = new System.Windows.Forms.MenuItem();
      this.menuNetworkDVBS = new System.Windows.Forms.MenuItem();
      this.menuItem2 = new System.Windows.Forms.MenuItem();
      this.menuDigitalTVBuildGraph = new System.Windows.Forms.MenuItem();
      this.menuDigitalTVDoTuneRequest = new System.Windows.Forms.MenuItem();
      this.menuDigitalTVDecomposeGraph = new System.Windows.Forms.MenuItem();
      this.menuHelp = new System.Windows.Forms.MenuItem();
      this.menuHelpAbout = new System.Windows.Forms.MenuItem();
      // 
      // mainMenu
      // 
      this.mainMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                             this.menuFile,
                                                                             this.menuDigitalTV,
                                                                             this.menuHelp});
      // 
      // menuFile
      // 
      this.menuFile.Index = 0;
      this.menuFile.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                             this.menuFileSaveGraph,
                                                                             this.menuItem1,
                                                                             this.menuFileExit});
      this.menuFile.Text = "&File";
      // 
      // menuFileSaveGraph
      // 
      this.menuFileSaveGraph.Enabled = false;
      this.menuFileSaveGraph.Index = 0;
      this.menuFileSaveGraph.Text = "Save Graph";
      this.menuFileSaveGraph.Click += new System.EventHandler(this.menuFileSaveGraph_Click);
      // 
      // menuItem1
      // 
      this.menuItem1.Index = 1;
      this.menuItem1.Text = "-";
      // 
      // menuFileExit
      // 
      this.menuFileExit.Index = 2;
      this.menuFileExit.Text = "&Exit";
      this.menuFileExit.Click += new System.EventHandler(this.menuFileExit_Click);
      // 
      // menuDigitalTV
      // 
      this.menuDigitalTV.Index = 1;
      this.menuDigitalTV.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                                  this.menuNetworkDVBT,
                                                                                  this.menuNetworkDVBS,
                                                                                  this.menuItem2,
                                                                                  this.menuDigitalTVBuildGraph,
                                                                                  this.menuDigitalTVDoTuneRequest,
                                                                                  this.menuDigitalTVDecomposeGraph});
      this.menuDigitalTV.Text = "&Digital TV";
      // 
      // menuNetworkDVBT
      // 
      this.menuNetworkDVBT.Index = 0;
      this.menuNetworkDVBT.Text = "DVB-T";
      this.menuNetworkDVBT.Click += new System.EventHandler(this.menuNetworkDVBT_Click);
      // 
      // menuNetworkDVBS
      // 
      this.menuNetworkDVBS.Index = 1;
      this.menuNetworkDVBS.Text = "DVB-S";
      this.menuNetworkDVBS.Click += new System.EventHandler(this.menuNetworkDVBS_Click);
      // 
      // menuItem2
      // 
      this.menuItem2.Index = 2;
      this.menuItem2.Text = "-";
      // 
      // menuDigitalTVBuildGraph
      // 
      this.menuDigitalTVBuildGraph.Enabled = false;
      this.menuDigitalTVBuildGraph.Index = 3;
      this.menuDigitalTVBuildGraph.Text = "Build Graph";
      this.menuDigitalTVBuildGraph.Click += new System.EventHandler(this.menuDigitalTVBuildGraph_Click);
      // 
      // menuDigitalTVDoTuneRequest
      // 
      this.menuDigitalTVDoTuneRequest.Enabled = false;
      this.menuDigitalTVDoTuneRequest.Index = 4;
      this.menuDigitalTVDoTuneRequest.Text = "Do a Tune Request";
      this.menuDigitalTVDoTuneRequest.Click += new System.EventHandler(this.menuDigitalTVDoTuneRequest_Click);
      // 
      // menuDigitalTVDecomposeGraph
      // 
      this.menuDigitalTVDecomposeGraph.Enabled = false;
      this.menuDigitalTVDecomposeGraph.Index = 5;
      this.menuDigitalTVDecomposeGraph.Text = "Decompose Graph";
      this.menuDigitalTVDecomposeGraph.Click += new System.EventHandler(this.menuDigitalTVDecomposeGraph_Click);
      // 
      // menuHelp
      // 
      this.menuHelp.Index = 2;
      this.menuHelp.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
                                                                             this.menuHelpAbout});
      this.menuHelp.Text = "Help";
      // 
      // menuHelpAbout
      // 
      this.menuHelpAbout.Index = 0;
      this.menuHelpAbout.Text = "About...";
      this.menuHelpAbout.Click += new System.EventHandler(this.menuHelpAbout_Click);
      // 
      // MainForm
      // 
      this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
      this.ClientSize = new System.Drawing.Size(640, 480);
      this.Menu = this.mainMenu;
      this.Name = "MainForm";
      this.Text = "DTV Viewer";

    }
		#endregion

    private void menuFileSaveGraph_Click(object sender, System.EventArgs e)
    {
      using (SaveFileDialog saveFileDialog = new SaveFileDialog())
      {
        saveFileDialog.Filter = "Filter Graph (*.grf)|*.grf";

        if (saveFileDialog.ShowDialog() == DialogResult.OK)
        {
          this.bdaGraphBuilder.SaveGraph(saveFileDialog.FileName);
        }
      }
    }

    private void menuFileExit_Click(object sender, System.EventArgs e)
    {
      this.Close();
    }

    private void menuNetworkDVBT_Click(object sender, System.EventArgs e)
    {
      this.tuningSelector = new DVBTTuning();
      this.menuNetworkDVBT.Checked = true;
      this.menuNetworkDVBS.Enabled = false;
      this.menuDigitalTVBuildGraph.Enabled = true;
    }

    private void menuNetworkDVBS_Click(object sender, System.EventArgs e)
    {
      this.tuningSelector = new DVBSTuning();
      this.menuNetworkDVBS.Checked = true;
      this.menuNetworkDVBT.Enabled = false;
      this.menuDigitalTVBuildGraph.Enabled = true;
    }

    private void menuDigitalTVBuildGraph_Click(object sender, System.EventArgs e)
    {
      if (this.tuningSelector.TuneSelect() == true)
      {
        this.bdaGraphBuilder = new BDAGraphBuilder(this);
        this.bdaGraphBuilder.BuildGraph(this.tuningSelector.TuningSpace);
        this.bdaGraphBuilder.SubmitTuneRequest(this.tuningSelector.TuneRequest);
        this.bdaGraphBuilder.RunGraph();
      }

      this.menuDigitalTVBuildGraph.Enabled = false;
      this.menuFileSaveGraph.Enabled = true;
      this.menuDigitalTVDoTuneRequest.Enabled = true;
      this.menuDigitalTVDecomposeGraph.Enabled = true;
    }

    private void menuDigitalTVDoTuneRequest_Click(object sender, System.EventArgs e)
    {
      if (this.tuningSelector.TuneSelect() == true)
      {
        this.bdaGraphBuilder.SubmitTuneRequest(this.tuningSelector.TuneRequest);
      }
    }

    private void menuDigitalTVDecomposeGraph_Click(object sender, System.EventArgs e)
    {
      this.bdaGraphBuilder.Dispose();
      this.bdaGraphBuilder = null;

      this.menuNetworkDVBT.Checked = false;
      this.menuNetworkDVBT.Enabled = true;
      this.menuNetworkDVBS.Checked = false;
      this.menuNetworkDVBS.Enabled = true;

      this.menuFileSaveGraph.Enabled = false;
      this.menuDigitalTVBuildGraph.Enabled = false;
      this.menuDigitalTVDoTuneRequest.Enabled = false;
      this.menuDigitalTVDecomposeGraph.Enabled = false;
    }

    private void menuHelpAbout_Click(object sender, System.EventArgs e)
    {
      AboutBox.Show("Basic Digital TV Viewer", "This sample is a basic Digital TV Viewer for DVB-T and DVB-S networks");
    }
	}
}
