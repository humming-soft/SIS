using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace SIS_V.state
{
    public partial class state_master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
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
                    }
                }
            }
            catch (NullReferenceException)
            {
                FormsAuthentication.SignOut();
                FormsAuthentication.RedirectToLoginPage();
            }

        }
    }
}