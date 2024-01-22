namespace DirectShowLib.Sample
{
  partial class ConfigForm
  {
    /// <summary>
    /// Variable nécessaire au concepteur.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    /// <summary>
    /// Nettoyage des ressources utilisées.
    /// </summary>
    /// <param name="disposing">true si les ressources managées doivent être supprimées ; sinon, false.</param>
    protected override void Dispose(bool disposing)
    {
      if (disposing && (components != null))
      {
        components.Dispose();
      }
      base.Dispose(disposing);
    }

    #region Code généré par le Concepteur Windows Form

    /// <summary>
    /// Méthode requise pour la prise en charge du concepteur - ne modifiez pas
    /// le contenu de cette méthode avec l'éditeur de code.
    /// </summary>
    private void InitializeComponent()
    {
      this.groupBox1 = new System.Windows.Forms.GroupBox();
      this.rbWindowed = new System.Windows.Forms.RadioButton();
      this.rbFullScreen = new System.Windows.Forms.RadioButton();
      this.cbDisplayModes = new System.Windows.Forms.ComboBox();
      this.groupBox2 = new System.Windows.Forms.GroupBox();
      this.rbNoMixing = new System.Windows.Forms.RadioButton();
      this.rbYUVMixing = new System.Windows.Forms.RadioButton();
      this.rbRGBMixing = new System.Windows.Forms.RadioButton();
      this.btOK = new System.Windows.Forms.Button();
      this.btCancel = new System.Windows.Forms.Button();
      this.groupBox1.SuspendLayout();
      this.groupBox2.SuspendLayout();
      this.SuspendLayout();
      // 
      // groupBox1
      // 
      this.groupBox1.Controls.Add(this.cbDisplayModes);
      this.groupBox1.Controls.Add(this.rbFullScreen);
      this.groupBox1.Controls.Add(this.rbWindowed);
      this.groupBox1.Location = new System.Drawing.Point(12, 12);
      this.groupBox1.Name = "groupBox1";
      this.groupBox1.Size = new System.Drawing.Size(276, 78);
      this.groupBox1.TabIndex = 0;
      this.groupBox1.TabStop = false;
      this.groupBox1.Text = "Direct3D window behaviour";
      // 
      // rbWindowed
      // 
      this.rbWindowed.AutoSize = true;
      this.rbWindowed.Checked = true;
      this.rbWindowed.Location = new System.Drawing.Point(6, 19);
      this.rbWindowed.Name = "rbWindowed";
      this.rbWindowed.Size = new System.Drawing.Size(76, 17);
      this.rbWindowed.TabIndex = 0;
      this.rbWindowed.TabStop = true;
      this.rbWindowed.Text = "Windowed";
      this.rbWindowed.UseVisualStyleBackColor = true;
      this.rbWindowed.CheckedChanged += new System.EventHandler(this.rbWindowed_CheckedChanged);
      // 
      // rbFullScreen
      // 
      this.rbFullScreen.AutoSize = true;
      this.rbFullScreen.Location = new System.Drawing.Point(6, 42);
      this.rbFullScreen.Name = "rbFullScreen";
      this.rbFullScreen.Size = new System.Drawing.Size(78, 17);
      this.rbFullScreen.TabIndex = 1;
      this.rbFullScreen.Text = "Full Screen";
      this.rbFullScreen.UseVisualStyleBackColor = true;
      this.rbFullScreen.CheckedChanged += new System.EventHandler(this.rbFullScreen_CheckedChanged);
      // 
      // cbDisplayModes
      // 
      this.cbDisplayModes.Enabled = false;
      this.cbDisplayModes.FormattingEnabled = true;
      this.cbDisplayModes.Location = new System.Drawing.Point(90, 42);
      this.cbDisplayModes.Name = "cbDisplayModes";
      this.cbDisplayModes.Size = new System.Drawing.Size(172, 21);
      this.cbDisplayModes.TabIndex = 2;
      // 
      // groupBox2
      // 
      this.groupBox2.Controls.Add(this.rbRGBMixing);
      this.groupBox2.Controls.Add(this.rbYUVMixing);
      this.groupBox2.Controls.Add(this.rbNoMixing);
      this.groupBox2.Location = new System.Drawing.Point(12, 97);
      this.groupBox2.Name = "groupBox2";
      this.groupBox2.Size = new System.Drawing.Size(276, 93);
      this.groupBox2.TabIndex = 1;
      this.groupBox2.TabStop = false;
      this.groupBox2.Text = "VMR9 mixing configuration";
      // 
      // rbNoMixing
      // 
      this.rbNoMixing.AutoSize = true;
      this.rbNoMixing.Checked = true;
      this.rbNoMixing.Location = new System.Drawing.Point(7, 20);
      this.rbNoMixing.Name = "rbNoMixing";
      this.rbNoMixing.Size = new System.Drawing.Size(102, 17);
      this.rbNoMixing.TabIndex = 0;
      this.rbNoMixing.TabStop = true;
      this.rbNoMixing.Text = "Don\'t use mixing";
      this.rbNoMixing.UseVisualStyleBackColor = true;
      // 
      // rbYUVMixing
      // 
      this.rbYUVMixing.AutoSize = true;
      this.rbYUVMixing.Location = new System.Drawing.Point(6, 44);
      this.rbYUVMixing.Name = "rbYUVMixing";
      this.rbYUVMixing.Size = new System.Drawing.Size(101, 17);
      this.rbYUVMixing.TabIndex = 1;
      this.rbYUVMixing.Text = "Use YUV mixing";
      this.rbYUVMixing.UseVisualStyleBackColor = true;
      // 
      // rbRGBMixing
      // 
      this.rbRGBMixing.AutoSize = true;
      this.rbRGBMixing.Location = new System.Drawing.Point(7, 68);
      this.rbRGBMixing.Name = "rbRGBMixing";
      this.rbRGBMixing.Size = new System.Drawing.Size(102, 17);
      this.rbRGBMixing.TabIndex = 2;
      this.rbRGBMixing.Text = "Use RGB mixing";
      this.rbRGBMixing.UseVisualStyleBackColor = true;
      // 
      // btOK
      // 
      this.btOK.Location = new System.Drawing.Point(12, 196);
      this.btOK.Name = "btOK";
      this.btOK.Size = new System.Drawing.Size(75, 23);
      this.btOK.TabIndex = 2;
      this.btOK.Text = "&OK";
      this.btOK.UseVisualStyleBackColor = true;
      this.btOK.Click += new System.EventHandler(this.btOK_Click);
      // 
      // btCancel
      // 
      this.btCancel.Location = new System.Drawing.Point(93, 196);
      this.btCancel.Name = "btCancel";
      this.btCancel.Size = new System.Drawing.Size(75, 23);
      this.btCancel.TabIndex = 3;
      this.btCancel.Text = "&Cancel";
      this.btCancel.UseVisualStyleBackColor = true;
      this.btCancel.Click += new System.EventHandler(this.btCancel_Click);
      // 
      // ConfigForm
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(300, 227);
      this.Controls.Add(this.btCancel);
      this.Controls.Add(this.btOK);
      this.Controls.Add(this.groupBox2);
      this.Controls.Add(this.groupBox1);
      this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
      this.MaximizeBox = false;
      this.MinimizeBox = false;
      this.Name = "ConfigForm";
      this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
      this.Text = "Configuration Form";
      this.groupBox1.ResumeLayout(false);
      this.groupBox1.PerformLayout();
      this.groupBox2.ResumeLayout(false);
      this.groupBox2.PerformLayout();
      this.ResumeLayout(false);

    }

    #endregion

    private System.Windows.Forms.GroupBox groupBox1;
    private System.Windows.Forms.RadioButton rbWindowed;
    private System.Windows.Forms.ComboBox cbDisplayModes;
    private System.Windows.Forms.RadioButton rbFullScreen;
    private System.Windows.Forms.GroupBox groupBox2;
    private System.Windows.Forms.RadioButton rbRGBMixing;
    private System.Windows.Forms.RadioButton rbYUVMixing;
    private System.Windows.Forms.RadioButton rbNoMixing;
    private System.Windows.Forms.Button btOK;
    private System.Windows.Forms.Button btCancel;
  }
}