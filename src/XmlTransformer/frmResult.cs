using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace XmlTransformer
{
    public partial class frmResult : Form
    {
        private readonly string _result;

        public frmResult(string result)
        {
            InitializeComponent();
            _result = result;
        }

        private void frmResult_Load(object sender, EventArgs e)
        {
            txtResult.Text = _result;
        }
    }
}
