using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;
using System.Data;
using System.Web.Security;

namespace SIS_V
{
    public partial class Login : System.Web.UI.Page
    {
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        string hashed;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();

            if(!IsPostBack)
            {
                invalid.Visible = false;
                mulogin.Visible = false;
                stimeout.Visible = false;
                if (Session["message"] != null)
                {
                    if (Session["message"].ToString() == "yes")
                    {
                        Session["message"] = "no";
                        mulogin.Visible = true;
                    }
                }
                if (Session["timeout"] != null)
                {
                    if (Session["timeout"].ToString() == "t")
                    {
                        stimeout.Visible = true;
                        Session.Clear();
                    }
                }
                
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
                   mulogin.Visible = false;
                   stimeout.Visible = false;
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
                Session["election"] = dt.Rows[0][9].ToString();
                Session["election_id"] = dt.Rows[0][10].ToString();
                Session["statename"] = dt.Rows[0][11].ToString();
                Session["is_login"] = "t";
                //Let us now set the authentication cookie so that we can use that later.
                FormsAuthentication.SetAuthCookie(dt.Rows[0][0].ToString(), false);
                SingleSessionPreparation.CreateAndStoreSessionToken(dt.Rows[0][0].ToString());
                if (int.Parse(Session["role"].ToString()) == 1) // Admin
                {
                    Response.Redirect("~/admin/Dash");
                }
                else if (int.Parse(Session["role"].ToString()) == 2) // HQ
                {
                    Response.Redirect("~/hq/WebForm1");
                }
                else if (int.Parse(Session["role"].ToString()) == 3) // State
                {
                    Response.Redirect("~/state/Dash");
                }
                else
                {
                    Response.Redirect("~/unauthorised");
                }
            }
            else
            {
            }
        }
    }
}