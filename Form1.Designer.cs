﻿
namespace AntiMalwareDB
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
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.btnConnect = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.txtMalFile = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtMalName = new System.Windows.Forms.TextBox();
            this.btnscan = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.txtThreatDesc = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.txtThreatSeverity = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.txtCatName = new System.Windows.Forms.TextBox();
            this.txtCatDesc = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txtThreatName = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.txtsha256 = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.txtmd5 = new System.Windows.Forms.TextBox();
            this.btnResult = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // btnConnect
            // 
            this.btnConnect.Location = new System.Drawing.Point(12, 303);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new System.Drawing.Size(143, 48);
            this.btnConnect.TabIndex = 2;
            this.btnConnect.Text = "Connnect";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(12, 249);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(143, 48);
            this.button1.TabIndex = 5;
            this.button1.Text = "Login";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // txtMalFile
            // 
            this.txtMalFile.Location = new System.Drawing.Point(71, 73);
            this.txtMalFile.Name = "txtMalFile";
            this.txtMalFile.Size = new System.Drawing.Size(205, 22);
            this.txtMalFile.TabIndex = 6;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(8, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(147, 20);
            this.label1.TabIndex = 7;
            this.label1.Text = "Malware Sample";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(31, 76);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(34, 17);
            this.label2.TabIndex = 8;
            this.label2.Text = "File:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(16, 108);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(49, 17);
            this.label3.TabIndex = 9;
            this.label3.Text = "Name:";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // txtMalName
            // 
            this.txtMalName.Location = new System.Drawing.Point(71, 108);
            this.txtMalName.Name = "txtMalName";
            this.txtMalName.Size = new System.Drawing.Size(205, 22);
            this.txtMalName.TabIndex = 10;
            // 
            // btnscan
            // 
            this.btnscan.Location = new System.Drawing.Point(12, 357);
            this.btnscan.Name = "btnscan";
            this.btnscan.Size = new System.Drawing.Size(143, 48);
            this.btnscan.TabIndex = 11;
            this.btnscan.Text = "Scan";
            this.btnscan.UseVisualStyleBackColor = true;
            this.btnscan.Click += new System.EventHandler(this.btnscan_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(415, 21);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(63, 20);
            this.label4.TabIndex = 12;
            this.label4.Text = "Threat";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(418, 87);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(83, 17);
            this.label5.TabIndex = 13;
            this.label5.Text = "Description:";
            // 
            // txtThreatDesc
            // 
            this.txtThreatDesc.Location = new System.Drawing.Point(517, 87);
            this.txtThreatDesc.Name = "txtThreatDesc";
            this.txtThreatDesc.Size = new System.Drawing.Size(205, 22);
            this.txtThreatDesc.TabIndex = 14;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(440, 124);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(61, 17);
            this.label7.TabIndex = 17;
            this.label7.Text = "severity:";
            // 
            // txtThreatSeverity
            // 
            this.txtThreatSeverity.Location = new System.Drawing.Point(517, 124);
            this.txtThreatSeverity.Name = "txtThreatSeverity";
            this.txtThreatSeverity.Size = new System.Drawing.Size(120, 22);
            this.txtThreatSeverity.TabIndex = 18;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(391, 178);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(110, 17);
            this.label9.TabIndex = 21;
            this.label9.Text = "Category Name:";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(357, 228);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(144, 17);
            this.label10.TabIndex = 22;
            this.label10.Text = "Category Description:";
            // 
            // txtCatName
            // 
            this.txtCatName.Location = new System.Drawing.Point(517, 178);
            this.txtCatName.Name = "txtCatName";
            this.txtCatName.Size = new System.Drawing.Size(120, 22);
            this.txtCatName.TabIndex = 23;
            // 
            // txtCatDesc
            // 
            this.txtCatDesc.Location = new System.Drawing.Point(517, 228);
            this.txtCatDesc.Name = "txtCatDesc";
            this.txtCatDesc.Size = new System.Drawing.Size(120, 22);
            this.txtCatDesc.TabIndex = 24;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(452, 57);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(49, 17);
            this.label11.TabIndex = 25;
            this.label11.Text = "Name:";
            // 
            // txtThreatName
            // 
            this.txtThreatName.Location = new System.Drawing.Point(517, 59);
            this.txtThreatName.Name = "txtThreatName";
            this.txtThreatName.Size = new System.Drawing.Size(120, 22);
            this.txtThreatName.TabIndex = 26;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(6, 147);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(59, 17);
            this.label12.TabIndex = 27;
            this.label12.Text = "sha256:";
            // 
            // txtsha256
            // 
            this.txtsha256.Location = new System.Drawing.Point(71, 147);
            this.txtsha256.Name = "txtsha256";
            this.txtsha256.Size = new System.Drawing.Size(205, 22);
            this.txtsha256.TabIndex = 28;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.Location = new System.Drawing.Point(26, 189);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(39, 17);
            this.label13.TabIndex = 29;
            this.label13.Text = "md5:";
            // 
            // txtmd5
            // 
            this.txtmd5.Location = new System.Drawing.Point(71, 189);
            this.txtmd5.Name = "txtmd5";
            this.txtmd5.Size = new System.Drawing.Size(205, 22);
            this.txtmd5.TabIndex = 30;
            // 
            // btnResult
            // 
            this.btnResult.Location = new System.Drawing.Point(13, 411);
            this.btnResult.Name = "btnResult";
            this.btnResult.Size = new System.Drawing.Size(142, 48);
            this.btnResult.TabIndex = 31;
            this.btnResult.Text = "Show Result";
            this.btnResult.UseVisualStyleBackColor = true;
            this.btnResult.Click += new System.EventHandler(this.btnResult_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(739, 474);
            this.Controls.Add(this.btnResult);
            this.Controls.Add(this.txtmd5);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.txtsha256);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.txtThreatName);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.txtCatDesc);
            this.Controls.Add(this.txtCatName);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.txtThreatSeverity);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.txtThreatDesc);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnscan);
            this.Controls.Add(this.txtMalName);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtMalFile);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btnConnect);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.Button btnConnect;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox txtMalFile;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtMalName;
        private System.Windows.Forms.Button btnscan;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtThreatDesc;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtThreatSeverity;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox txtCatName;
        private System.Windows.Forms.TextBox txtCatDesc;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox txtThreatName;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox txtsha256;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TextBox txtmd5;
        private System.Windows.Forms.Button btnResult;
    }
}

