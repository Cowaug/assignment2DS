using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace testTT
{
    public partial class DonHang : Form
    {
        public DonHang()
        {
            InitializeComponent();
        }

        private void DonHang_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = GetTable();
        }

        public DataTable GetTable()
        {
            DataTable data_table_1;
            string query = "EXEC HIEN_THI_TAT_CA_HOA_DON";
            data_table_1 = DataProvider.Instance.GetDataTable(query);
            return data_table_1;
        }
    }
}
