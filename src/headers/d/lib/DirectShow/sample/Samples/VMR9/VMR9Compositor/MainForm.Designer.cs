namespace DirectShowLib.Sample
{
  partial class MainForm
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
      System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
      this.menuStrip1 = new System.Windows.Forms.MenuStrip();
      this.menuFile = new System.Windows.Forms.ToolStripMenuItem();
      this.menuFileOpen = new System.Windows.Forms.ToolStripMenuItem();
      this.menuFileClose = new System.Windows.Forms.ToolStripMenuItem();
      this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
      this.menuFileQuit = new System.Windows.Forms.ToolStripMenuItem();
      this.menuAbout = new System.Windows.Forms.ToolStripMenuItem();
      this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
      this.renderingPanel = new System.Windows.Forms.Panel();
      this.menuStrip1.SuspendLayout();
      this.SuspendLayout();
      // 
      // menuStrip1
      // 
      this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuFile,
            this.menuAbout});
      this.menuStrip1.Location = new System.Drawing.Point(0, 0);
      this.menuStrip1.Name = "menuStrip1";
      this.menuStrip1.Size = new System.Drawing.Size(640, 24);
      this.menuStrip1.TabIndex = 0;
      this.menuStrip1.Text = "menuStrip1";
      // 
      // menuFile
      // 
      this.menuFile.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuFileOpen,
            this.menuFileClose,
            this.toolStripSeparator1,
            this.menuFileQuit});
      this.menuFile.Name = "menuFile";
      this.menuFile.Size = new System.Drawing.Size(35, 20);
      this.menuFile.Text = "&File";
      this.menuFile.TextDirection = System.Windows.Forms.ToolStripTextDirection.Horizontal;
      // 
      // menuFileOpen
      // 
      this.menuFileOpen.Name = "menuFileOpen";
      this.menuFileOpen.Size = new System.Drawing.Size(111, 22);
      this.menuFileOpen.Text = "&Open";
      this.menuFileOpen.Click += new System.EventHandler(this.menuFileOpen_Click);
      // 
      // menuFileClose
      // 
      this.menuFileClose.Name = "menuFileClose";
      this.menuFileClose.Size = new System.Drawing.Size(152, 22);
      this.menuFileClose.Text = "&Close";
      this.menuFileClose.Click += new System.EventHandler(this.menuFileClose_Click);
      // 
      // toolStripSeparator1
      // 
      this.toolStripSeparator1.Name = "toolStripSeparator1";
      this.toolStripSeparator1.Size = new System.Drawing.Size(108, 6);
      // 
      // menuFileQuit
      // 
      this.menuFileQuit.Name = "menuFileQuit";
      this.menuFileQuit.Size = new System.Drawing.Size(111, 22);
      this.menuFileQuit.Text = "&Quit";
      this.menuFileQuit.Click += new System.EventHandler(this.menuFileQuit_Click);
      // 
      // menuAbout
      // 
      this.menuAbout.Name = "menuAbout";
      this.menuAbout.Size = new System.Drawing.Size(48, 20);
      this.menuAbout.Text = "&About";
      this.menuAbout.Click += new System.EventHandler(this.menuAbout_Click);
      // 
      // openFileDialog1
      // 
      this.openFileDialog1.Filter = resources.GetString("openFileDialog1.Filter");
      // 
      // renderingPanel
      // 
      this.renderingPanel.Dock = System.Windows.Forms.DockStyle.Fill;
      this.renderingPanel.Location = new System.Drawing.Point(0, 24);
      this.renderingPanel.Name = "renderingPanel";
      this.renderingPanel.Size = new System.Drawing.Size(640, 456);
      this.renderingPanel.TabIndex = 1;
      // 
      // MainForm
      // 
      this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
      this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
      this.ClientSize = new System.Drawing.Size(640, 480);
      this.Controls.Add(this.renderingPanel);
      this.Controls.Add(this.menuStrip1);
      this.MainMenuStrip = this.menuStrip1;
      this.Name = "MainForm";
      this.Text = "VMR9 Compositor";
      this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MainForm_FormClosing);
      this.menuStrip1.ResumeLayout(false);
      this.menuStrip1.PerformLayout();
      this.ResumeLayout(false);
      this.PerformLayout();

    }

    #endregion

    private System.Windows.Forms.MenuStrip menuStrip1;
    private System.Windows.Forms.ToolStripMenuItem menuFile;
    private System.Windows.Forms.ToolStripMenuItem menuFileOpen;
    private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
    private System.Windows.Forms.ToolStripMenuItem menuFileQuit;
    private System.Windows.Forms.ToolStripMenuItem menuFileClose;
    private System.Windows.Forms.OpenFileDialog openFileDialog1;
    private System.Windows.Forms.ToolStripMenuItem menuAbout;
    private System.Windows.Forms.Panel renderingPanel;
  }
}

