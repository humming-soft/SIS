using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIS_V.admin
{
    public partial class Admin_Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetCurrentPage();
            }
        }

        private void SetCurrentPage()
        {
            var pageName = GetPageName();

            switch (pageName)
            {
                case "utama.aspx":
                    dash.Attributes["class"] = "has-submenu active";
                    break;
                case "activiti_bakal_ci_view.aspx":
                    prapiliha.Attributes["class"] = "has-submenu active";
                    break;
                //case "JournalList.aspx":
                //    design.Attributes["class"] = "has-submenu active";
                //    design2.Attributes["class"] = "active";
                //    break;
                //case "Journal.aspx":
                //    design.Attributes["class"] = "has-submenu active";
                //    design2.Attributes["class"] = "active";
                //    break;
                //case "start_journal.aspx":
                //    design.Attributes["class"] = "has-submenu active";
                //    design1.Attributes["class"] = "active";
                //    break;
                //case "Report1.aspx":
                //    report.Attributes["class"] = "has-submenu active";
                //    report1.Attributes["class"] = "active";
                //    break;
                //case "Report2.aspx":
                //    report.Attributes["class"] = "has-submenu active";
                //    report2.Attributes["class"] = "active";
                //    break;
            }
        }

        private string GetPageName()
        {
            return Request.Url.ToString().Split('/').Last();
        }
    }
}