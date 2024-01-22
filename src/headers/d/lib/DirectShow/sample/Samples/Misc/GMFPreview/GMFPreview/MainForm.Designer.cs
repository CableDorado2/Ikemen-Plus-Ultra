namespace GMFPreview
{
    partial class MainForm
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
            this.gbPreview = new System.Windows.Forms.GroupBox();
            this.bnDevice = new System.Windows.Forms.Button();
            this.bnFolder = new System.Windows.Forms.Button();
            this.bnCapture = new System.Windows.Forms.Button();
            this.bnStopCapture = new System.Windows.Forms.Button();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.SuspendLayout();
            // 
            // gbPreview
            // 
            this.gbPreview.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.gbPreview.Location = new System.Drawing.Point(11, 11);
            this.gbPreview.Name = "gbPreview";
            this.gbPreview.Size = new System.Drawing.Size(347, 302);
            this.gbPreview.TabIndex = 0;
            this.gbPreview.TabStop = false;
            this.gbPreview.Text = "Preview Window";
            // 
            // bnDevice
            // 
            this.bnDevice.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.bnDevice.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bnDevice.Location = new System.Drawing.Point(411, 11);
            this.bnDevice.Name = "bnDevice";
            this.bnDevice.Size = new System.Drawing.Size(75, 23);
            this.bnDevice.TabIndex = 1;
            this.bnDevice.Text = "Device...";
            this.bnDevice.UseVisualStyleBackColor = true;
            this.bnDevice.Click += new System.EventHandler(this.bnDevice_Click);
            // 
            // bnFolder
            // 
            this.bnFolder.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.bnFolder.Location = new System.Drawing.Point(411, 42);
            this.bnFolder.Name = "bnFolder";
            this.bnFolder.Size = new System.Drawing.Size(75, 23);
            this.bnFolder.TabIndex = 2;
            this.bnFolder.Text = "Folder...";
            this.bnFolder.UseVisualStyleBackColor = true;
            this.bnFolder.Click += new System.EventHandler(this.bnFolder_Click);
            // 
            // bnCapture
            // 
            this.bnCapture.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.bnCapture.Location = new System.Drawing.Point(411, 106);
            this.bnCapture.Name = "bnCapture";
            this.bnCapture.Size = new System.Drawing.Size(75, 23);
            this.bnCapture.TabIndex = 3;
            this.bnCapture.Text = "Capture";
            this.bnCapture.UseVisualStyleBackColor = true;
            this.bnCapture.Click += new System.EventHandler(this.bnCapture_Click);
            // 
            // bnStopCapture
            // 
            this.bnStopCapture.FlatStyle = System.Windows.Forms.FlatStyle.System;
            this.bnStopCapture.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.bnStopCapture.Location = new System.Drawing.Point(411, 137);
            this.bnStopCapture.Margin = new System.Windows.Forms.Padding(0);
            this.bnStopCapture.Name = "bnStopCapture";
            this.bnStopCapture.Size = new System.Drawing.Size(75, 23);
            this.bnStopCapture.TabIndex = 4;
            this.bnStopCapture.Text = "Stop Capture";
            this.bnStopCapture.UseVisualStyleBackColor = true;
            this.bnStopCapture.Click += new System.EventHandler(this.bnStopCapture_Click);
            // 
            // folderBrowserDialog1
            // 
            this.folderBrowserDialog1.Description = "Specify output directory for capture files";
            this.folderBrowserDialog1.SelectedPath = "c:\\";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(497, 332);
            this.Controls.Add(this.bnStopCapture);
            this.Controls.Add(this.bnCapture);
            this.Controls.Add(this.bnFolder);
            this.Controls.Add(this.bnDevice);
            this.Controls.Add(this.gbPreview);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "GMFPreview";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbPreview;
        private System.Windows.Forms.Button bnDevice;
        private System.Windows.Forms.Button bnFolder;
        private System.Windows.Forms.Button bnCapture;
        private System.Windows.Forms.Button bnStopCapture;
        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;

    }
}

