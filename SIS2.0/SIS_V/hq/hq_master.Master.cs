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

namespace SIS_V.hq
{
    public partial class hq_master : System.Web.UI.MasterPage
    {
        bus_sis_ugc2 objBUS1 = new bus_sis_ugc2();
        bus_sis_ugc3 objBUS2 = new bus_sis_ugc3();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            checker();
            //setstatename();
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
                case "HQ_ParlimenTumpuan":
                    Session["pre_page"] = "Parlimen Tumpuan";
                    Session["pre_url"] = "HQ_ParlimenTumpuan";
                    dash.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Dashboard";
                    breadcrum_child.InnerText = "Parlimen Tumpuan";
                    breadcrum_child.Attributes["class"] = "b-600";
                    child_li.Attributes["class"] = "active";
                    grant_child_li.Visible = false;
                    break;
                case "HQ_Detail_Incident":
                    dash.Attributes["class"] = "has-submenu active";
                    breadcrum_parent.InnerText = "Dashboard";
                    breadcrum_child.InnerText = Session["pre_page"].ToString();
                    breadcrum_child.Attributes["href"] = Session["pre_url"].ToString();
                    breadcrum_grant_child.InnerText = "Maklumat Kawasan";
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