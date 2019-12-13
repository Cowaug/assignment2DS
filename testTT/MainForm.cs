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
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void BtnProduct_Click(object sender, EventArgs e)
        {
            CustomFormSP f = new CustomFormSP();
            f.ShowDialog();
        }

        private void BtnEmployee_Click(object sender, EventArgs e)
        {
            NhanVienForm f = new NhanVienForm();
            f.ShowDialog();
        }

        private void BtnCustomer_Click(object sender, EventArgs e)
        {
            KhachHang f = new KhachHang();
            f.ShowDialog();
        }

        private void BtnOrder_Click(object sender, EventArgs e)
        {

            DonHang f = new DonHang();
            f.ShowDialog();
        }
    }
}
