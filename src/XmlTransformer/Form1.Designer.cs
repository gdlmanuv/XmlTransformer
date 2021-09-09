namespace XmlTransformer
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
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.txtXml = new System.Windows.Forms.RichTextBox();
            this.txtXsl = new System.Windows.Forms.RichTextBox();
            this.btnTransform = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.splitContainer1.Location = new System.Drawing.Point(12, 12);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.txtXml);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.txtXsl);
            this.splitContainer1.Size = new System.Drawing.Size(776, 406);
            this.splitContainer1.SplitterDistance = 384;
            this.splitContainer1.TabIndex = 0;
            // 
            // txtXml
            // 
            this.txtXml.AcceptsTab = true;
            this.txtXml.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtXml.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtXml.Location = new System.Drawing.Point(0, 0);
            this.txtXml.Name = "txtXml";
            this.txtXml.Size = new System.Drawing.Size(384, 406);
            this.txtXml.TabIndex = 0;
            this.txtXml.Text = "";
            this.txtXml.WordWrap = false;
            // 
            // txtXsl
            // 
            this.txtXsl.AcceptsTab = true;
            this.txtXsl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtXsl.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.5F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtXsl.Location = new System.Drawing.Point(0, 0);
            this.txtXsl.Name = "txtXsl";
            this.txtXsl.Size = new System.Drawing.Size(388, 406);
            this.txtXsl.TabIndex = 0;
            this.txtXsl.Text = "";
            this.txtXsl.WordWrap = false;
            // 
            // btnTransform
            // 
            this.btnTransform.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnTransform.Location = new System.Drawing.Point(642, 424);
            this.btnTransform.Name = "btnTransform";
            this.btnTransform.Size = new System.Drawing.Size(146, 23);
            this.btnTransform.TabIndex = 0;
            this.btnTransform.Text = "Transform XML";
            this.btnTransform.UseVisualStyleBackColor = true;
            this.btnTransform.Click += new System.EventHandler(this.btnTransform_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 459);
            this.Controls.Add(this.btnTransform);
            this.Controls.Add(this.splitContainer1);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Form1_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.RichTextBox txtXml;
        private System.Windows.Forms.RichTextBox txtXsl;
        private System.Windows.Forms.Button btnTransform;
    }
}

