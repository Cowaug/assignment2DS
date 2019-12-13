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
    public partial class NhanVienForm : Form
    {
        public NhanVienForm()
        {
            InitializeComponent();
        }

        private void NhanVienForm_Load(object sender, EventArgs e)
        {
            data_NhanVien_table.DataSource = GetTable();
            ADD_NV_pnl.Visible = false;
            
        }

        public DataTable GetTable()
        {
            DataTable data_table_1;
            string query = "EXEC HIEN_THI_TAT_CA_NV";
            data_table_1 = DataProvider.Instance.GetDataTable(query);
            return data_table_1;
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void ADD_NV_Click(object sender, EventArgs e)
        {
          //  string query = "EXEC DANG_KY_NHAN_VIEN '" + textBox3.Text"','" + textBox4.Text"'             ";
        }
    }
}
