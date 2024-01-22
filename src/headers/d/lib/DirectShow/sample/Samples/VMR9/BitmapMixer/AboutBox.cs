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
using System.Reflection;
using System.Windows.Forms;

using DirectShowLib;

namespace DirectShowLib.Sample
{
	internal class AboutBoxWnd : Form
	{
    public System.Windows.Forms.Label label1;
    private System.Windows.Forms.Button button1;
    private System.Windows.Forms.Label label2;
    private System.Windows.Forms.LinkLabel linkLabel1;
    private System.Windows.Forms.Label label3;
    private System.Windows.Forms.Label label4;
		private System.ComponentModel.Container components = null;

		public AboutBoxWnd()
		{
			InitializeComponent();

      Type t = typeof(IGraphBuilder);
      label3.Text += t.Assembly.GetName().Version;
		}

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
      this.label1 = new System.Windows.Forms.Label();
      this.button1 = new System.Windows.Forms.Button();
      this.label2 = new System.Windows.Forms.Label();
      this.linkLabel1 = new System.Windows.Forms.LinkLabel();
      this.label3 = new System.Windows.Forms.Label();
      this.label4 = new System.Windows.Forms.Label();
      this.SuspendLayout();
      // 
      // label1
      // 
      this.label1.FlatStyle = System.Windows.Forms.FlatStyle.System;
      this.label1.Location = new System.Drawing.Point(8, 8);
      this.label1.Name = "label1";
      this.label1.Size = new System.Drawing.Size(272, 40);
      this.label1.TabIndex = 1;
      // 
      // button1
      // 
      this.button1.FlatStyle = System.Windows.Forms.FlatStyle.System;
      this.button1.Location = new System.Drawing.Point(288, 8);
      this.button1.Name = "button1";
      this.button1.TabIndex = 0;
      this.button1.Text = "OK";
      this.button1.Click += new System.EventHandler(this.button1_Click);
      // 
      // label2
      // 
      this.label2.FlatStyle = System.Windows.Forms.FlatStyle.System;
      this.label2.Location = new System.Drawing.Point(8, 64);
      this.label2.Name = "label2";
      this.label2.Size = new System.Drawing.Size(160, 16);
      this.label2.TabIndex = 2;
      this.label2.Text = "Library source code release under";
      // 
      // linkLabel1
      // 
      this.linkLabel1.FlatStyle = System.Windows.Forms.FlatStyle.System;
      this.linkLabel1.Location = new System.Drawing.Point(184, 64);
      this.linkLabel1.Name = "linkLabel1";
      this.linkLabel1.Size = new System.Drawing.Size(160, 16);
      this.linkLabel1.TabIndex = 3;
      this.linkLabel1.TabStop = true;
      this.linkLabel1.Text = "Lesser General Public License";
      this.linkLabel1.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel1_LinkClicked);
      // 
      // label3
      // 
      this.label3.FlatStyle = System.Windows.Forms.FlatStyle.System;
      this.label3.Location = new System.Drawing.Point(8, 48);
      this.label3.Name = "label3";
      this.label3.Size = new System.Drawing.Size(320, 16);
      this.label3.TabIndex = 4;
      this.label3.Text = "DirectShowLib Version : ";
      // 
      // label4
      // 
      this.label4.FlatStyle = System.Windows.Forms.FlatStyle.System;
      this.label4.Location = new System.Drawing.Point(8, 80);
      this.label4.Name = "label4";
      this.label4.Size = new System.Drawing.Size(264, 16);
      this.label4.TabIndex = 5;
      this.label4.Text = "Sample source code release under Public Domain";
      // 
      // AboutBoxWnd
      // 
      this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
      this.ClientSize = new System.Drawing.Size(372, 104);
      this.Controls.Add(this.label4);
      this.Controls.Add(this.label3);
      this.Controls.Add(this.linkLabel1);
      this.Controls.Add(this.label2);
      this.Controls.Add(this.button1);
      this.Controls.Add(this.label1);
      this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
      this.MaximizeBox = false;
      this.MinimizeBox = false;
      this.Name = "AboutBoxWnd";
      this.ShowInTaskbar = false;
      this.Text = "AboutBox";
      this.ResumeLayout(false);

    }
		#endregion

    private void button1_Click(object sender, System.EventArgs e)
    {
      this.Close();
    }

    private void linkLabel1_LinkClicked(object sender, System.Windows.Forms.LinkLabelLinkClickedEventArgs e)
    {
      System.Diagnostics.Process.Start("http://www.gnu.org/copyleft/lesser.txt");
    }
  }

  public class AboutBox
  {
    public static void Show(string title, string text)
    {
      using (AboutBoxWnd form = new AboutBoxWnd())
      {
        form.Text = title;
        form.label1.Text = text;
        form.ShowDialog();
      }
    }
  }
}
