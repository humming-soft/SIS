using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIS_V.state
{
    public partial class Dash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckIsLogin();
        }
        protected void CheckIsLogin()
        {
            if (Session["is_login"] != null)
            {
                if (Session["is_login"].ToString() == "f")
                {
                    Response.Redirect("~/Login");
                }
                else
                {

                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }
    }
}