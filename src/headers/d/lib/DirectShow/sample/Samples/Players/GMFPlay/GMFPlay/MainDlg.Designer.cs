namespace GMFPlay
{
    partial class MainDlg
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
            this.bnClickedAdd = new System.Windows.Forms.Button();
            this.bnPlay = new System.Windows.Forms.Button();
            this.bnPause = new System.Windows.Forms.Button();
            this.bnStop = new System.Windows.Forms.Button();
            this.bnLimits = new System.Windows.Forms.Button();
            this.bnPlayNext = new System.Windows.Forms.Button();
            this.cbLoop = new System.Windows.Forms.CheckBox();
            this.trackBar1 = new System.Windows.Forms.TrackBar();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.trackBar1)).BeginInit();
            this.SuspendLayout();
            // 
            // bnClickedAdd
            // 
            this.bnClickedAdd.Location = new System.Drawing.Point(407, 16);
            this.bnClickedAdd.Name = "bnClickedAdd";
            this.bnClickedAdd.Size = new System.Drawing.Size(95, 29);
            this.bnClickedAdd.TabIndex = 0;
            this.bnClickedAdd.Text = "&Add Clip...";
            this.bnClickedAdd.UseVisualStyleBackColor = true;
            this.bnClickedAdd.Click += new System.EventHandler(this.bnClickedAdd_Click);
            // 
            // bnPlay
            // 
            this.bnPlay.Location = new System.Drawing.Point(407, 52);
            this.bnPlay.Name = "bnPlay";
            this.bnPlay.Size = new System.Drawing.Size(95, 29);
            this.bnPlay.TabIndex = 1;
            this.bnPlay.Text = "&Play";
            this.bnPlay.UseVisualStyleBackColor = true;
            this.bnPlay.Click += new System.EventHandler(this.bnPlay_Click);
            // 
            // bnPause
            // 
            this.bnPause.Location = new System.Drawing.Point(407, 88);
            this.bnPause.Name = "bnPause";
            this.bnPause.Size = new System.Drawing.Size(95, 29);
            this.bnPause.TabIndex = 2;
            this.bnPause.Text = "P&ause";
            this.bnPause.UseVisualStyleBackColor = true;
            this.bnPause.Click += new System.EventHandler(this.bnPause_Click);
            // 
            // bnStop
            // 
            this.bnStop.Location = new System.Drawing.Point(407, 124);
            this.bnStop.Name = "bnStop";
            this.bnStop.Size = new System.Drawing.Size(95, 29);
            this.bnStop.TabIndex = 3;
            this.bnStop.Text = "&Stop";
            this.bnStop.UseVisualStyleBackColor = true;
            this.bnStop.Click += new System.EventHandler(this.bnStop_Click);
            // 
            // bnLimits
            // 
            this.bnLimits.Enabled = false;
            this.bnLimits.Location = new System.Drawing.Point(407, 160);
            this.bnLimits.Name = "bnLimits";
            this.bnLimits.Size = new System.Drawing.Size(95, 29);
            this.bnLimits.TabIndex = 4;
            this.bnLimits.Text = "&Limits";
            this.bnLimits.UseVisualStyleBackColor = true;
            this.bnLimits.Click += new System.EventHandler(this.bnLimits_Click);
            // 
            // bnPlayNext
            // 
            this.bnPlayNext.Enabled = false;
            this.bnPlayNext.Location = new System.Drawing.Point(407, 196);
            this.bnPlayNext.Name = "bnPlayNext";
            this.bnPlayNext.Size = new System.Drawing.Size(95, 29);
            this.bnPlayNext.TabIndex = 5;
            this.bnPlayNext.Text = "Play &Next";
            this.bnPlayNext.UseVisualStyleBackColor = true;
            this.bnPlayNext.Click += new System.EventHandler(this.bnPlayNext_Click);
            // 
            // cbLoop
            // 
            this.cbLoop.AutoSize = true;
            this.cbLoop.Location = new System.Drawing.Point(413, 267);
            this.cbLoop.Name = "cbLoop";
            this.cbLoop.Size = new System.Drawing.Size(62, 21);
            this.cbLoop.TabIndex = 6;
            this.cbLoop.Text = "Loop";
            this.cbLoop.UseVisualStyleBackColor = true;
            this.cbLoop.CheckedChanged += new System.EventHandler(this.cbLoop_CheckedChanged);
            // 
            // trackBar1
            // 
            this.trackBar1.Location = new System.Drawing.Point(12, 322);
            this.trackBar1.Maximum = 1000;
            this.trackBar1.Name = "trackBar1";
            this.trackBar1.Size = new System.Drawing.Size(490, 64);
            this.trackBar1.TabIndex = 7;
            this.trackBar1.TickStyle = System.Windows.Forms.TickStyle.None;
            this.trackBar1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.trackBar1_MouseDown);
            this.trackBar1.ValueChanged += new System.EventHandler(this.trackBar1_ValueChanged);
            this.trackBar1.MouseUp += new System.Windows.Forms.MouseEventHandler(this.trackBar1_MouseUp);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 16;
            this.listBox1.Location = new System.Drawing.Point(12, 16);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(378, 276);
            this.listBox1.TabIndex = 8;
            this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // timer1
            // 
            this.timer1.Interval = 200;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // MainDlg
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(523, 387);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.trackBar1);
            this.Controls.Add(this.cbLoop);
            this.Controls.Add(this.bnPlayNext);
            this.Controls.Add(this.bnLimits);
            this.Controls.Add(this.bnStop);
            this.Controls.Add(this.bnPause);
            this.Controls.Add(this.bnPlay);
            this.Controls.Add(this.bnClickedAdd);
            this.MaximizeBox = false;
            this.Name = "MainDlg";
            this.Text = "GMF Player Demo";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.MainDlg_FormClosing);
            ((System.ComponentModel.ISupportInitialize)(this.trackBar1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button bnClickedAdd;
        private System.Windows.Forms.Button bnPlay;
        private System.Windows.Forms.Button bnPause;
        private System.Windows.Forms.Button bnStop;
        private System.Windows.Forms.Button bnLimits;
        private System.Windows.Forms.Button bnPlayNext;
        private System.Windows.Forms.CheckBox cbLoop;
        private System.Windows.Forms.TrackBar trackBar1;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Timer timer1;
    }
}

