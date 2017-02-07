using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIS_V
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                check_multiple_login();
            }
        }

        public void check_multiple_login()
        {
            if (Session["is_login"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                if (Session["is_login"].ToString() == "t")
                {
                    if (Session["role"].ToString() == "user")
                    {
                        Response.Redirect("~/user/Dash.aspx");
                    }
                    else if (Session["role"].ToString() == "admin")
                    {
                        Response.Redirect("~/admin/Dash.aspx");
                    }
                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
    }
}