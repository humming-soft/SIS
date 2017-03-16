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
            setstatename();
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
                    Session["pre_page"] = "Dashboard Utama";
                    Session["pre_url"] = "utama";
                    dash.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Dashboard";
                    breadcrum_child.InnerText = "Dashboard Utama";
                    breadcrum_child.Attributes["class"] = "b-600";
                    grant_child_li.Visible = false;
                    child_li.Attributes["class"] = "active";
                    break;
                case "kawasan_operasi":
                    Session["pre_page"] = "Parlimen Tumpuan";
                    Session["pre_url"] = "kawasan_operasi";
                    dash.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Dashboard";
                    breadcrum_child.InnerText = "Parlimen Tumpuan";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "parlimen_tumpuan":
                    Session["pre_page"] = "Parlimen Tumpuan BN VS Pembangkang";
                    Session["pre_url"] = "parlimen_tumpuan";
                    dash.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Dashboard";
                    breadcrum_child.InnerText = "Parlimen Tumpuan BN VS Pembangkang";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "detail_incident":
                    dash.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Dashboard";
                    breadcrum_child.InnerText = Session["pre_page"].ToString();
                    breadcrum_child.Attributes["href"] = Session["pre_url"].ToString();
                    breadcrum_grant_child.InnerText = "Maklumat Kawasan";
                    grant_child_li.Attributes["class"] = "active";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    break;
                case "detail_info":
                    dash.Attributes["class"] = "has-submenu active";
                    break;
                case "status_kawasan":
                    dash.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Dashboard";
                    breadcrum_child.InnerText = "Rumusan Status Kawasan";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "Win_Candidate":
                    dash.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Dashboard";
                    breadcrum_child.InnerText = "Winnable Candidate";
                    breadcrum_child.Attributes["class"] = "b-600";
                    grant_child_li.Visible = false;
                    child_li.Attributes["class"] = "active";
                    break;
                case "candidate_detail":
                    dash.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Dashboard";
                    breadcrum_child.InnerText = "Winnable Candidate";
                    breadcrum_child.Attributes["href"] = "Win_Candidate";
                    breadcrum_grant_child.InnerText = "Candidate Details";
                    grant_child_li.Attributes["class"] = "active";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    break;
                case "percentage_voters":
                    dash.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Dashboard";
                    breadcrum_child.InnerText = "Peratusan Keluar Mengundi";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "activiti_bakal_ci_view":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    break;
                case "activiti_bakal_ci_add":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Aktiviti Bakal Calon / Individu";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "activiti_parti_view":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Aktiviti Parti Bertanding";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "activiti_parti_add":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Aktiviti Parti Bertanding";
                    breadcrum_grant_child.InnerText = "Tambah Maklumat Parti Bertanding";
                    breadcrum_child.Attributes["href"] = "activiti_parti_view";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    grant_child_li.Attributes["class"] = "active";
                    break;
                case "activiti_parti_view_all":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Aktiviti Parti Bertanding";
                    breadcrum_grant_child.InnerText = "Paparan Tambah Maklumat Parti Bertanding";
                    breadcrum_child.Attributes["href"] = "activiti_parti_view";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    grant_child_li.Attributes["class"] = "active";
                    break;
                case "laporan_harian_add":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Laporan Harian Dari Negeri";
                    breadcrum_grant_child.InnerText = "Tambah";
                    grant_child_li.Attributes["class"] = "active";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    break;
                case "laporan_harian_view":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Laporan Harian Dari Negeri";
                    breadcrum_grant_child.InnerText = "Parparan";
                    grant_child_li.Attributes["class"] = "active";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    break;
                case "keluar_mengundi":
                    pilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pilihanraya";
                    breadcrum_child.InnerText = "Keluar Mengundi";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "analisis_kawasan_view":
                    analisis.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Analisis Kawasan";
                    breadcrum_parent.Attributes["class"] = "b-600";
                    child_li.Visible = false;
                    grant_child_li.Visible = false;
                    break;
                case "analisis_kawasan_add":
                    analisis.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Analisis Kawasan";
                    breadcrum_parent.Attributes["href"] = "analisis_kawasan_view";
                    breadcrum_child.InnerText = "Tambah Maklumat Analisis Kawasan";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "analisis_kawasan_view_all":
                    analisis.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Analisis Kawasan";
                    breadcrum_parent.Attributes["href"] = "analisis_kawasan_view";
                    breadcrum_child.InnerText = "Carian Terperinci";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "parlimen_info_view":
                    tetapan.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Tetapan";
                    breadcrum_child.InnerText = "Parlimen Info";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "parlimen_info_add":
                    tetapan.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Tetapan";
                    breadcrum_child.InnerText = "Parlimen Info";
                    breadcrum_child.Attributes["href"] = "parlimen_info_view";
                    breadcrum_grant_child.InnerText = "Maklumat Tererinci Kawasan Parlimen";
                    grant_child_li.Attributes["class"] = "active";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    break;
                case "laporan_harian_aktiviti":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Laporan Harian Dari Negeri";
                    breadcrum_child.Attributes["href"] = "laporan_harian_view";
                    breadcrum_grant_child.InnerText = "Paparan laporan Harian Aktiviti";
                    grant_child_li.Attributes["class"] = "active";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    break;
                case "laporan_harian_issue":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Laporan Harian Dari Negeri";
                    breadcrum_child.Attributes["href"] = "laporan_harian_view";
                    breadcrum_grant_child.InnerText = "Paparan Laporan Harian Isu-Isu";
                    grant_child_li.Attributes["class"] = "active";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    break;
                case "laporan_harian_incident":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Laporan Harian Dari Negeri";
                    breadcrum_child.Attributes["href"] = "laporan_harian_view";
                    breadcrum_grant_child.InnerText = "Paparan Laporan Harian Insiden";
                    grant_child_li.Attributes["class"] = "active";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    break;
                case "laporan_harian_promises":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Laporan Harian Dari Negeri";
                    breadcrum_child.Attributes["href"] = "laporan_harian_view";
                    breadcrum_grant_child.InnerText = "Paparan Laporan Harian Janji Pilihanraya";
                    grant_child_li.Attributes["class"] = "active";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    break;
                case "laporan_harian_area_status":
                    prapilihanraya.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Pra-Pilihanraya";
                    breadcrum_child.InnerText = "Laporan Harian Dari Negeri";
                    breadcrum_child.Attributes["href"] = "laporan_harian_view";
                    breadcrum_grant_child.InnerText = "Paparan Laporan Harian Analysis Status Kawasan";
                    grant_child_li.Attributes["class"] = "active";
                    breadcrum_grant_child.Attributes["class"] = "b-600";
                    break;
                    
            }
        }

        private string GetPageName()
        {
            return Request.Url.ToString().Split('/').Last();
        }

        private void setstatename()
        {
            statename.InnerHtml = "STATE : " + Session["statename"].ToString().ToUpper();
        }

    }
}