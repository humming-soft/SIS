using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIS_V
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (txtuname.Text != "" && txtpassword.Text != "" && txtuname.Text == "admin" && txtpassword.Text == "password")
            {
                Response.Redirect("~/admin/Dash.aspx");
            }
            else
            {
                txtuname.Text = "";
                txtpassword.Text = "";
            }
        }
    }
}