﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using PubClass;
namespace AntiMalwareDB
{
    public partial class ResultFrm : Form
    {
        MySqlConnection conn;
        string connString;

        public ResultFrm()
        {
            InitializeComponent();
        }

        private void ResultFrm_Load(object sender, EventArgs e)
        {
            connString = "SERVER= 127.0.0.1;PORT=3306;DATABASE=antivirus_v2;UID=root;PASSWORD=R@dmehr123456";
            try
            {
                conn = new MySqlConnection();
                conn.ConnectionString = connString;
                conn.Open();
                //MessageBox.Show("yep");
            }
            catch (MySqlException ex)
            {
                MessageBox.Show(ex.Message);

            }
            MySqlCommand cmd1 = new MySqlCommand();
            cmd1.Connection = conn;

            cmd1.CommandText = "select * from comodo_antivirus_user inner join comodo_antivirus_notification ON comodo_antivirus_user.user_id = comodo_antivirus_notification.user_id   where username= @name1 ";

            cmd1.Parameters.Clear();
            cmd1.Parameters.AddWithValue("@name1", PubClass.Pub.User_name);
            MySqlDataAdapter da1 = new MySqlDataAdapter();
            DataTable dt1 = new DataTable();
            da1.SelectCommand = cmd1;
            dt1.Reset();
            da1.Fill(dt1);
            cmd1.ExecuteNonQuery();
            if (dt1.Rows.Count == 0)
            {

            }
            else
            {
            txtNotification.Text = dt1.Rows[0]["message"].ToString();

            }
            ///////////////////////////////////////////////////////////////////////////////////
            MySqlCommand cmd2 = new MySqlCommand();
            cmd2.Connection = conn;

            cmd2.CommandText = "select * from comodo_antivirus_remediationaction  where action_id=@action_id";

            cmd2.Parameters.Clear();
            cmd2.Parameters.AddWithValue("@action_id", 1);
            MySqlDataAdapter da2 = new MySqlDataAdapter();
            DataTable dt2 = new DataTable();
            da2.SelectCommand = cmd2;
            dt2.Reset();
            da2.Fill(dt2);
            cmd2.ExecuteNonQuery();
            if (dt2.Rows.Count != 0)
            {
                txtRemDesc.Text = dt2.Rows[0]["description"].ToString();
            }

            //txtRemDesc.Text = dt2.Rows[0]["description"].ToString();

            ///////////////////////////////////////////////////////////////////////////////////////////
            MySqlCommand cmd3 = new MySqlCommand();
            cmd3.Connection = conn;

            //cmd3.CommandText = "select * from comodo_antivirus_userreport inner join comodo_antivirus_scan on comodo_antivirus_userreport.scan =comodo_antivirus_scan.scan_id  inner join ( comodo_antivirus_user on comodo_antivirus_scan.user= comodo_antivirus_user.user_id)  where comodo_antivirus_user.user_id = @user_id";
            cmd3.CommandText = "select * from comodo_antivirus_user inner join comodo_antivirus_log ON comodo_antivirus_user.user_id = comodo_antivirus_log.user_id where username= @name2";
            cmd3.Parameters.Clear();
            cmd3.Parameters.AddWithValue("@name2", PubClass.Pub.User_name);

            cmd3.Parameters.AddWithValue("@user_id", PubClass.Pub.User_id);
            MySqlDataAdapter da3 = new MySqlDataAdapter();
            DataTable dt3 = new DataTable();
            da3.SelectCommand = cmd3;
            dt3.Reset();
            da3.Fill(dt3);
            cmd3.ExecuteNonQuery();
            if (dt1.Rows.Count != 0)
            {
                txtlogmessage.Text= dt3.Rows[0]["message"].ToString();
            }

            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
