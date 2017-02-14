﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;
using System.Data;

namespace SIS_V
{
    public partial class Login : System.Web.UI.Page
    {
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        string hashed;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                invalid.Visible = false;
            }
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (txtuname.Text != "" && txtpassword.Text != "")
            {
               hashed = encrypt.Encrypt(txtpassword.Text); // hash function
               bus.uname = txtuname.Text;
               bus.pswd = hashed;
               int res = bus.check_login();
               if (res == 0) // authentication success 0 - success , -1 - failed
               {
                   set_sessions();

               }
               else
               {
                   txtuname.Text = "";
                   txtpassword.Text = "";
                   invalid.Visible = true;
               }
            }
            else
            {
                txtuname.Text = "";
                txtpassword.Text = "";
            }
        }

        public void set_sessions()
        {
            bus.uname = txtuname.Text;
            dt = bus.fetch_userdetails();
            if (dt.Rows.Count > 0)
            {
                Session["log_name"] = dt.Rows[0][0].ToString();
                Session["ic"] = dt.Rows[0][2].ToString();
                Session["name"] = dt.Rows[0][3].ToString();
                Session["pos"] = dt.Rows[0][4].ToString();
                Session["regdate"] = dt.Rows[0][5].ToString();
                Session["log_lvl"] = dt.Rows[0][6].ToString();
                Session["state"] = dt.Rows[0][7].ToString();
                Session["role"] = dt.Rows[0][8].ToString();
                Session["is_login"] = "t";
                if (int.Parse(Session["role"].ToString()) == 1) // Admin
                {
                    Response.Redirect("~/admin/Dash.aspx");
                }
                else if (int.Parse(Session["role"].ToString()) == 2) // HQ
                {
                    Response.Redirect("~/hq/WebForm1.aspx");
                }
                else if (int.Parse(Session["role"].ToString()) == 3) // State
                {
                    Response.Redirect("~/state/Dash.aspx");
                }
                else
                {
                    Response.Redirect("~/unauthorised.aspx");
                }
            }
            else
            {
            }
        }
    }
}