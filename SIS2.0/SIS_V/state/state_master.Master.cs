using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Services;
using SIS_B;
using System.Data;

namespace SIS_V.state
{
    public partial class state_master : System.Web.UI.MasterPage
    {
        bus_sis_ugc2 objBUS1 = new bus_sis_ugc2();
        bus_sis_ugc3 objBUS2 = new bus_sis_ugc3();
        DataTable dt;

        string log_name;
        protected void Page_Load(object sender, EventArgs e)
        {
            checker();
            SetCurrentPage();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();

            if (!IsPostBack)
            {        
                valid_empty.Visible = false;
                valid_match.Visible = false;
                GetUserDetails();
            }
         
        }

        public void GetUserDetails()
        {
            objBUS1.log_name = Session["log_name"].ToString();
            dt = objBUS1.GetUserDetails();

            if (dt.Rows.Count > 0)
            {
                txtLogName.Text = dt.Rows[0]["log_name"].ToString();
                txtFullName.Text = dt.Rows[0]["fullname"].ToString();
                txtIC.Text = dt.Rows[0]["icnumber"].ToString();
                txtPosition.Text = dt.Rows[0]["position"].ToString();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtNewPassword.Text.Trim() == "" || txtConfirmPassword.Text.Trim() == "")
            {
                valid_empty.Visible = true;
                valid_match.Visible = false;
                //hd_password.Value = "0";
            }
            else
            {
                string pass = txtNewPassword.Text.Trim();
                string con_pass = txtConfirmPassword.Text.Trim();
                if (pass == con_pass)
                {
                    string hashed = encrypt.Encrypt(txtConfirmPassword.Text);
                    objBUS2.pass = hashed;
                    objBUS2.log_name = Session["log_name"].ToString();
                    int result = objBUS2.update_password();
                    if (result == 0)
                    {
                        Response.Redirect("utama");
                        //hd_password.Value = "1";
                    }
                }
                else
                {
                    valid_match.Visible = true;
                    valid_empty.Visible = false;
                    //hd_password.Value = "0";
                }
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        protected void checker()
        {
            HttpContext context = HttpContext.Current;
            // CheckSession() inlined
            try
            {
                if (context.Session["is_login"].ToString() != null)
                {
                    if (!"t".Equals(context.Session["is_login"].ToString()))
                    {
                        FormsAuthentication.SignOut();
                        FormsAuthentication.RedirectToLoginPage();
                        Response.End();
                    }
                }
            }
            catch (NullReferenceException)
            {
                FormsAuthentication.SignOut();
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        private void SetCurrentPage()
        {
            var pageName = GetPageName();

            switch (pageName)
            {
                case "utama":
                    dash.Attributes["class"] = "has-submenu active";
                    break;
                case "kawasan_operasi":
                    dash.Attributes["class"] = "has-submenu active";
                    break;
                case "parlimen_tumpuan":
                    dash.Attributes["class"] = "has-submenu active";
                    break;
                case "detail_incident":
                    dash.Attributes["class"] = "has-submenu active";
                    break;
                case "status_kawasan":
                    dash.Attributes["class"] = "has-submenu active";
                    break;
                case "Win_Candidate":
                    dash.Attributes["class"] = "has-submenu active";
                    break;
                case "candidate_detail":
                    dash.Attributes["class"] = "has-submenu active";
                    break;
                case "percentage_voters":
                    dash.Attributes["class"] = "has-submenu active";
                    break;
                case "activiti_bakal_ci_view":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    break;
                case "activiti_bakal_ci_add":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    break;
                case "activiti_parti_view":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    break;
                case "activiti_parti_add":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    break;
                case "laporan_harian_add":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    break;
                case "laporan_harian_view":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    break;
            }
        }

        private string GetPageName()
        {
            return Request.Url.ToString().Split('/').Last();
        }


    }
}