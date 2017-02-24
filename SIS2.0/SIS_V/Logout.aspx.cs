using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace SIS_V
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                logout();
            }
            else
            {
                logout();
            }

        }

        public void logout()
        {
            if (Request.QueryString["ml"] != null)
            {
                if (Request.QueryString["ml"].ToString() == "5jg90sjrkkms0-8jj")
                {
                    Session.Clear();
                    Session["message"] = "yes";
                    Response.Redirect("~/Login");
                }
            } else {
                Session.Clear();
                Session["is_login"] = "f";
                Response.Redirect("~/Mainpage");

            }
        }
    }
}