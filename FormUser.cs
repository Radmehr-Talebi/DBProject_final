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
using System.Data.SqlClient;
using PubClass;

namespace AntiMalwareDB
{
    
    public partial class FormUser : Form
    {

        MySqlConnection conn;
        string connString;
        public FormUser()
        {
            InitializeComponent();
        }

        private void FormUser_Load(object sender, EventArgs e)
        {
           
        }
        //private void insert(string name)
        //{
        //    string query = "INSERT INTO comodo_user (`username`) VALUES ('"+name+"')";

        //    try
        //    {
        //        if (this.conn != null)
        //        {
        //            MySqlCommand cmd = new MySqlCommand(query, conn);
        //            cmd.ExecuteNonQuery();
        //            MessageBox.Show("Added succesfully");
        //            conn.Close();
        //        }
        //        else
        //        {
        //            MessageBox.Show("not added");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show(ex.Message);
        //    }
        //}

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
               
                if (this.conn != null)
                {
                    // MySqlCommand cmd = new MySqlCommand(query, conn);
                    //string sql = "select * from comodo_user where username=@name and password=@password";
                    string sql = "select * from comodo_antivirus_user INNER JOIN comodo_antivirus_deviceinformation ON comodo_antivirus_user.user_id = comodo_antivirus_deviceinformation.user_id where username=@name and password=@password";
                    //string sql = "select * from comodo_user where username=@name and password=@password";

                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Connection = conn;
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@name", txtUsername.Text);
                   
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    MySqlDataAdapter da1 = new MySqlDataAdapter();
                    DataTable dt1 = new DataTable();
                    da1.SelectCommand = cmd;
                    dt1.Reset();
                    da1.Fill(dt1);
                   // cmd.ExecuteReader();
                    cmd.ExecuteNonQuery();
                    //cmd.EndExecuteReader();
                    txtEmail.Text = dt1.Rows[0]["email"].ToString();
                    //txtDeviceName.Text= dt1.Rows[0]["device_name"].ToString();

                    txtFirstname.Text = dt1.Rows[0]["first_name"].ToString();
                    txtLastname.Text = dt1.Rows[0]["last_name"].ToString();
                    txtBirthday.Text = dt1.Rows[0]["date_of_birth"].ToString();

                    txtDeviceName.Text = dt1.Rows[0]["device_name"].ToString();
                    txtDevice_type.Text = dt1.Rows[0]["device_type"].ToString();
                    txtOp_System.Text= dt1.Rows[0]["operating_system"].ToString();
                    ////////////////////////////////////////////////////////////////////////////////
                    MessageBox.Show("sign in was successful !");
                    PubClass.Pub.User_id = Convert.ToInt32(dt1.Rows[0]["user_id"]);
                    PubClass.Pub.User_name= dt1.Rows[0]["username"].ToString();

                }
                else
                {
                    MessageBox.Show("not signed");

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
        }

        private void btnsignup_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.conn != null)
                {
                    // MySqlCommand cmd = new MySqlCommand(query, conn);
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = conn;


                    cmd.CommandText = "INSERT INTO comodo_antivirus_user   (`username`, `email`, `password`,`first_name`,`last_name`,`date_of_birth`,`created_at`,`updated_at`) VALUES (@name, @email, @password,@first_name,@last_name,@date_of_birth,@created_at,@updated_at) ";

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@name", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@first_name", txtFirstname.Text);
                    cmd.Parameters.AddWithValue("@date_of_birth", txtBirthday.Text);
                    cmd.Parameters.AddWithValue("@created_at", DateTime.Now.ToString("yyyy-MM-dd"));
                    cmd.Parameters.AddWithValue("@updated_at", DateTime.Now.ToString("yyyy-MM-dd"));



                    cmd.Parameters.AddWithValue("@last_name", txtLastname.Text);

                    cmd.ExecuteNonQuery();
                    

                    // cmd1.CommandText = "select * from comodo_user where username=@name and password = @password ";
                    MySqlCommand cmd1 = new MySqlCommand();
                    cmd1.Connection = conn;

                    cmd1.CommandText = "select * from comodo_antivirus_user where username= @name1 ";

                    cmd1.Parameters.Clear();
                    cmd1.Parameters.AddWithValue("@name1", txtUsername.Text);
                    MySqlDataAdapter da1 = new MySqlDataAdapter();
                    DataTable dt1 = new DataTable();
                    da1.SelectCommand = cmd1;
                    dt1.Reset();
                    da1.Fill(dt1);
                    cmd1.ExecuteNonQuery();
                    int UID = Convert.ToInt32( dt1.Rows[0]["user_id"]);
                   // MessageBox.Show(UID.ToString());

                    ////////////////////////////////////////////////////////////

                    MySqlCommand cmd2 = new MySqlCommand();
                    cmd2.Connection = conn;

                 

                    cmd2.CommandText = "INSERT INTO comodo_antivirus_deviceinformation  (`device_name`, `user_id`,`device_type`,`operating_system`) VALUES (@name2, @user_id,@device_type,@operating_system) ";

                    cmd2.Parameters.Clear();
                    cmd2.Parameters.AddWithValue("@device_type", txtDevice_type.Text.ToString());
                    cmd2.Parameters.AddWithValue("@operating_system", txtOp_System.Text.ToString());

                    cmd2.Parameters.AddWithValue("@name2", txtDeviceName.Text.ToString());
                    cmd2.Parameters.AddWithValue("@user_id", UID);
                    //cmd2.Parameters.AddWithValue("@password", txtPassword.Text);

                    cmd2.ExecuteNonQuery();
                    MessageBox.Show("sign up was successful !");
                    //conn.Close();
                }
                else
                {
                    MessageBox.Show("not added");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            //insert(txtUsername.Text);

            // string query = "INSERT INTO comodo_user (`username`) VALUES ('@name')";

        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            connString = "SERVER= 127.0.0.1;PORT=3306;DATABASE=antivirus_v2;UID=root;PASSWORD=R@dmehr123456";
            try
            {
                conn = new MySqlConnection();
                conn.ConnectionString = connString;
                conn.Open();
                MessageBox.Show("Connected");
            }
            catch (MySqlException ex)
            {
                MessageBox.Show(ex.Message);

            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {

            string sql = "select * from comodo_antivirus_user where username=@name and password=@password ";

            MySqlCommand cmd1 = new MySqlCommand(sql, conn);
            cmd1.Connection = conn;
            //cmd1.CommandText = "INSERT INTO comodo_user  (`username`, `email`, `password`) VALUES (@name, @email, @password) ";
            cmd1.Parameters.Clear();
            cmd1.Parameters.AddWithValue("@name", txtUsername.Text);
            //cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd1.Parameters.AddWithValue("@password", txtPassword.Text);
            MySqlDataAdapter da1 = new MySqlDataAdapter();
            DataTable dt1 = new DataTable();
            da1.SelectCommand = cmd1;
            dt1.Reset();
            da1.Fill(dt1);
            // cmd.ExecuteReader();
            cmd1.ExecuteNonQuery();


            if (dt1.Rows.Count == 0)
            {
                MessageBox.Show("no username found for update!");
            }
            else
            {


                try {



                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "update comodo_antivirus_user set email = @email , password=@password, first_name=@first_name,last_name=@last_name , date_of_birth=@date_of_birth, updated_at=@updated_at   where (username=@name) ";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@name", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@first_name", txtFirstname.Text);
                    cmd.Parameters.AddWithValue("@date_of_birth", txtBirthday.Text.ToString());
                    cmd.Parameters.AddWithValue("@updated_at", DateTime.Now.ToString("yyyy-MM-dd"));


                    cmd.Parameters.AddWithValue("@last_name", txtLastname.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Updated!");
                    }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message);

                }
            }
        }
    }
}
