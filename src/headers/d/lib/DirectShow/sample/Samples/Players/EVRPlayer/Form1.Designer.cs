namespace EVRPlayer
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.panVideoWin = new System.Windows.Forms.Panel();
            this.bnPlay = new System.Windows.Forms.Button();
            this.bnPause = new System.Windows.Forms.Button();
            this.bnStop = new System.Windows.Forms.Button();
            this.bnFrameStep = new System.Windows.Forms.Button();
            this.seekbar = new System.Windows.Forms.TrackBar();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.SubpicSize = new System.Windows.Forms.TrackBar();
            this.label1 = new System.Windows.Forms.Label();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.openFileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.subpictureToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.evToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.seekbar)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.SubpicSize)).BeginInit();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panVideoWin
            // 
            this.panVideoWin.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panVideoWin.Location = new System.Drawing.Point(5, 56);
            this.panVideoWin.Name = "panVideoWin";
            this.panVideoWin.Size = new System.Drawing.Size(355, 242);
            this.panVideoWin.TabIndex = 97;
            this.panVideoWin.Paint += new System.Windows.Forms.PaintEventHandler(this.panVideoWin_Paint);
            this.panVideoWin.MouseMove += new System.Windows.Forms.MouseEventHandler(this.panVideoWin_MouseMove);
            this.panVideoWin.MouseDown += new System.Windows.Forms.MouseEventHandler(this.panVideoWin_MouseDown);
            this.panVideoWin.MouseUp += new System.Windows.Forms.MouseEventHandler(this.panVideoWin_MouseUp);
            // 
            // bnPlay
            // 
            this.bnPlay.Enabled = false;
            this.bnPlay.Location = new System.Drawing.Point(7, 308);
            this.bnPlay.Name = "bnPlay";
            this.bnPlay.Size = new System.Drawing.Size(75, 23);
            this.bnPlay.TabIndex = 1;
            this.bnPlay.Text = "Play";
            this.bnPlay.UseVisualStyleBackColor = true;
            this.bnPlay.Click += new System.EventHandler(this.bnPlay_Click);
            // 
            // bnPause
            // 
            this.bnPause.Enabled = false;
            this.bnPause.Location = new System.Drawing.Point(98, 308);
            this.bnPause.Name = "bnPause";
            this.bnPause.Size = new System.Drawing.Size(75, 23);
            this.bnPause.TabIndex = 2;
            this.bnPause.Text = "Pause";
            this.bnPause.UseVisualStyleBackColor = true;
            this.bnPause.Click += new System.EventHandler(this.bnPause_Click);
            // 
            // bnStop
            // 
            this.bnStop.Enabled = false;
            this.bnStop.Location = new System.Drawing.Point(189, 308);
            this.bnStop.Name = "bnStop";
            this.bnStop.Size = new System.Drawing.Size(75, 23);
            this.bnStop.TabIndex = 3;
            this.bnStop.Text = "Stop";
            this.bnStop.UseVisualStyleBackColor = true;
            this.bnStop.Click += new System.EventHandler(this.bnStop_Click);
            // 
            // bnFrameStep
            // 
            this.bnFrameStep.Enabled = false;
            this.bnFrameStep.Location = new System.Drawing.Point(280, 308);
            this.bnFrameStep.Name = "bnFrameStep";
            this.bnFrameStep.Size = new System.Drawing.Size(75, 23);
            this.bnFrameStep.TabIndex = 4;
            this.bnFrameStep.Text = "Step";
            this.bnFrameStep.UseVisualStyleBackColor = true;
            this.bnFrameStep.Click += new System.EventHandler(this.bnStep_Click);
            // 
            // seekbar
            // 
            this.seekbar.Enabled = false;
            this.seekbar.Location = new System.Drawing.Point(7, 337);
            this.seekbar.Name = "seekbar";
            this.seekbar.Size = new System.Drawing.Size(350, 45);
            this.seekbar.TabIndex = 5;
            this.seekbar.TickStyle = System.Windows.Forms.TickStyle.None;
            this.seekbar.MouseCaptureChanged += new System.EventHandler(this.seekbar_MouseCaptureChanged);
            this.seekbar.Scroll += new System.EventHandler(this.seekbar_Scroll);
            this.seekbar.MouseDown += new System.Windows.Forms.MouseEventHandler(this.seekbar_MouseDown);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.SubpicSize);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(7, 363);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(350, 77);
            this.groupBox1.TabIndex = 99;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Subpicture stream";
            // 
            // SubpicSize
            // 
            this.SubpicSize.Enabled = false;
            this.SubpicSize.Location = new System.Drawing.Point(39, 22);
            this.SubpicSize.Maximum = 100;
            this.SubpicSize.Name = "SubpicSize";
            this.SubpicSize.Size = new System.Drawing.Size(305, 45);
            this.SubpicSize.TabIndex = 6;
            this.SubpicSize.TickFrequency = 10;
            this.SubpicSize.Value = 65;
            this.SubpicSize.Scroll += new System.EventHandler(this.SubpicSize_Scroll);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(5, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(38, 13);
            this.label1.TabIndex = 98;
            this.label1.Text = "Size %";
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackColor = System.Drawing.SystemColors.MenuBar;
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
            this.menuStrip1.Size = new System.Drawing.Size(364, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // fileToolStripMenuItem
            // 
            this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.openFileToolStripMenuItem,
            this.subpictureToolStripMenuItem,
            this.evToolStripMenuItem,
            this.toolStripSeparator1,
            this.exitToolStripMenuItem});
            this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
            this.fileToolStripMenuItem.Text = "&File";
            // 
            // openFileToolStripMenuItem
            // 
            this.openFileToolStripMenuItem.Name = "openFileToolStripMenuItem";
            this.openFileToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.O)));
            this.openFileToolStripMenuItem.Size = new System.Drawing.Size(167, 22);
            this.openFileToolStripMenuItem.Text = "&Open File";
            this.openFileToolStripMenuItem.Click += new System.EventHandler(this.openFileToolStripMenuItem_Click);
            // 
            // subpictureToolStripMenuItem
            // 
            this.subpictureToolStripMenuItem.Name = "subpictureToolStripMenuItem";
            this.subpictureToolStripMenuItem.Size = new System.Drawing.Size(167, 22);
            this.subpictureToolStripMenuItem.Text = "&Subpicture";
            this.subpictureToolStripMenuItem.Click += new System.EventHandler(this.subpictureToolStripMenuItem_Click);
            // 
            // evToolStripMenuItem
            // 
            this.evToolStripMenuItem.Name = "evToolStripMenuItem";
            this.evToolStripMenuItem.Size = new System.Drawing.Size(167, 22);
            this.evToolStripMenuItem.Text = "&EVR Presenter";
            this.evToolStripMenuItem.Click += new System.EventHandler(this.evToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(164, 6);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.Q)));
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(167, 22);
            this.exitToolStripMenuItem.Text = "E&xit";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // timer1
            // 
            this.timer1.Interval = 200;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(72, 35);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(220, 13);
            this.label2.TabIndex = 96;
            this.label2.Text = "Click and drag the box that has the clock in it";
            this.label2.Visible = false;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(364, 461);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.seekbar);
            this.Controls.Add(this.bnFrameStep);
            this.Controls.Add(this.bnStop);
            this.Controls.Add(this.bnPause);
            this.Controls.Add(this.bnPlay);
            this.Controls.Add(this.panVideoWin);
            this.Controls.Add(this.menuStrip1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MainMenuStrip = this.menuStrip1;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "Form1";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            ((System.ComponentModel.ISupportInitialize)(this.seekbar)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.SubpicSize)).EndInit();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panVideoWin;
        private System.Windows.Forms.Button bnPlay;
        private System.Windows.Forms.Button bnPause;
        private System.Windows.Forms.Button bnStop;
        private System.Windows.Forms.Button bnFrameStep;
        private System.Windows.Forms.TrackBar seekbar;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TrackBar SubpicSize;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem openFileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem subpictureToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem evToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Label label2;
    }
}

