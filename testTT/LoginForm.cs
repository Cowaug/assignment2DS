using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace testTT
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
            this.ActiveControl = label1;
        }

        public static string userName;
        public string passWord;
        private void btnLogin_Click(object sender, EventArgs e)
        {
            userName = txtUserName.Text;
            passWord = txtPassWord.Text;
            txtUserName.Clear();
            txtPassWord.Clear();
            if (Login(userName, passWord))
            {
                MainForm f = new MainForm();
                f.ShowDialog();
                this.Hide();
                this.Dispose();                
            }
        }
        bool Login(string userName, string passWord)
        {
            if (userName == "admin" && passWord == "admin123")
                return true;
            return false;
        }

    }
}

