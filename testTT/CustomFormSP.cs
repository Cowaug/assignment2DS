using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace testTT
{
    public partial class CustomFormSP : Form
    {
        SqlConnection connection;
        SqlCommand command;
        string str = "Data Source=EXOS2NDPC;Initial Catalog=Ass2;Integrated Security=True";
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();
        public CustomFormSP()
        {
            InitializeComponent();
            connection = new SqlConnection(str);
            connection.Open();
            LoadData();
            int i = 0;
            textBox8.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            textBox3.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            textBox4.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
            textBox5.Text = dataGridView1.Rows[i].Cells[4].Value.ToString();
            textBox6.Text = dataGridView1.Rows[i].Cells[5].Value.ToString();
            textBox7.Text = dataGridView1.Rows[i].Cells[6].Value.ToString();
            dateTimePicker1.Text = dataGridView1.Rows[i].Cells[7].Value.ToString();

        }

        void LoadData()
        {
            command = connection.CreateCommand();
            command.CommandText = "Select * from SanPham";
            adapter.SelectCommand = command;
            table.Clear();
            adapter.Fill(table);
            dataGridView1.DataSource = table;
        }
        private void DataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dataGridView1.CurrentRow.Index;
            textBox8.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            textBox3.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            textBox4.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
            textBox5.Text = dataGridView1.Rows[i].Cells[4].Value.ToString();
            textBox6.Text = dataGridView1.Rows[i].Cells[5].Value.ToString();
            textBox7.Text = dataGridView1.Rows[i].Cells[6].Value.ToString();
            dateTimePicker1.Text = dataGridView1.Rows[i].Cells[7].Value.ToString();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "Execute HienSanPhamConHanSuDungItHon @SoNgay";
                command.Parameters.Add("@SoNgay", SqlDbType.Int).Value = int.Parse(textBox9.Text.ToString());
                adapter.SelectCommand = command;
                table.Clear();
                adapter.Fill(table);
                dataGridView1.DataSource = table;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void BtnThem_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "Execute ThemSanPham @MaSP,@TenSP,@GiaSP,@HDSD,@TrongLuong,@ThongTinMoTa,@MaLoai,@HanSuDung";
                command.Parameters.Add("@MaSP", SqlDbType.Char, 8).Value = textBox8.Text.ToString();
                command.Parameters.Add("@TenSP", SqlDbType.VarChar, 100).Value = textBox2.Text.ToString();
                command.Parameters.Add("@GiaSP", SqlDbType.Int).Value = int.Parse(textBox3.Text.ToString());
                command.Parameters.Add("@HDSD", SqlDbType.VarChar, 150).Value = textBox4.Text.ToString();
                command.Parameters.Add("@TrongLuong", SqlDbType.VarChar, 100).Value = textBox5.Text.ToString();
                command.Parameters.Add("@ThongTinMoTa", SqlDbType.VarChar, 150).Value = textBox6.Text.ToString();
                command.Parameters.Add("@MaLoai", SqlDbType.VarChar, 8).Value = textBox7.Text.ToString();
                command.Parameters.Add("@HanSuDung", SqlDbType.DateTime).Value = dateTimePicker1.Value.Year + "-" + dateTimePicker1.Value.Month + "-" + dateTimePicker1.Value.Day;

                command.ExecuteNonQuery();
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "Execute CapNhatSanPham @MaSP,@TenSP,@GiaSP,@HDSD,@TrongLuong,@ThongTinMoTa,@MaLoai,@HanSuDung";
                command.Parameters.Add("@MaSP", SqlDbType.Char, 8).Value = textBox8.Text.ToString();
                command.Parameters.Add("@TenSP", SqlDbType.VarChar, 100).Value = textBox2.Text.ToString();
                command.Parameters.Add("@GiaSP", SqlDbType.Int).Value = int.Parse(textBox3.Text.ToString());
                command.Parameters.Add("@HDSD", SqlDbType.VarChar, 150).Value = textBox4.Text.ToString();
                command.Parameters.Add("@TrongLuong", SqlDbType.VarChar, 100).Value = textBox5.Text.ToString();
                command.Parameters.Add("@ThongTinMoTa", SqlDbType.VarChar, 150).Value = textBox6.Text.ToString();
                command.Parameters.Add("@MaLoai", SqlDbType.VarChar, 8).Value = textBox7.Text.ToString();
                command.Parameters.Add("@HanSuDung", SqlDbType.DateTime).Value = dateTimePicker1.Value.Year + "-" + dateTimePicker1.Value.Month + "-" + dateTimePicker1.Value.Day;

                command.ExecuteNonQuery();
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void Button3_Click_1(object sender, EventArgs e)
        {
            try
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "DELETE FROM SanPham WHERE MaSP = '" + textBox8.Text + "'";

                command.ExecuteNonQuery();
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Button4_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand command = connection.CreateCommand();
                command.CommandText = "SELECT * FROM SanPham WHERE" +
                     //(textBox8.Text == "" ? "" : " MaSP = '" + textBox8.Text.ToString()) + "'" +
                     //(textBox2.Text == "" ? "" : " TenSP = '" + textBox2.Text.ToString()) + "'" +
                     (textBox3.Text == "" ? "" : " GiaSP = " + textBox3.Text.ToString()) //+
                     //(textBox4.Text == "" ? "" : " HDSD = '" + textBox4.Text.ToString()) + "'" +
                     //(textBox5.Text == "" ? "" : " TrongLuong = '" + textBox5.Text.ToString()) + "'" +
                     //(textBox6.Text == "" ? "" : " ThongTinMoTa = '" + textBox6.Text.ToString()) + "'" +
                     //(textBox7.Text == "" ? "" : " MaLoai = '" + textBox7.Text.ToString()) + "'"
                     ;
                adapter.SelectCommand = command;
                table.Clear();
                adapter.Fill(table);
                dataGridView1.DataSource = table;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
