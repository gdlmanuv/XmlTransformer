using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;
using System.Xml.Xsl;

namespace XmlTransformer
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            var xmlPath = Path.Combine("Data", "SaveResult.xml");
            var xslPath = Path.Combine("Data", "FTSRes-v1.4.xsl");

            if (File.Exists(xmlPath))
            {
                txtXml.Text = XDocument.Parse(File.ReadAllText(xmlPath)).ToString();
            }

            if (File.Exists(xslPath))
            {
                txtXsl.Text = XDocument.Parse(File.ReadAllText(xslPath)).ToString();
            }
        }

        private void btnTransform_Click(object sender, EventArgs e)
        {
            try
            {
                using (var xmlStringReader = new StringReader(txtXml.Text))
                {
                    var xmlXPathDocument = new XPathDocument(xmlStringReader);

                    using (var transformedXmlStringWriter = new StringWriter())
                    {
                        using (var transformedXmlXmlTextWriter = new XmlTextWriter(transformedXmlStringWriter))
                        {
                            using (var xslStringReader = new StringReader(txtXsl.Text))
                            {
                                using (var xslXmlReader = XmlReader.Create(xslStringReader))
                                {
                                    var xslCompiledTransform = new XslCompiledTransform();
                                    xslCompiledTransform.Load(xslXmlReader, new XsltSettings(false, true), null);
                                    xslCompiledTransform.Transform(xmlXPathDocument, null, transformedXmlXmlTextWriter);
                                    var result = XElement.Parse(transformedXmlStringWriter.ToString()).ToString();

                                    using (var frmResult = new frmResult(result))
                                    {
                                        frmResult.StartPosition = FormStartPosition.CenterParent;
                                        frmResult.ShowDialog();
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
