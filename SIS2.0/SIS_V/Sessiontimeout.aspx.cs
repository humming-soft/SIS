﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIS_V
{
    public partial class Sessiontimeout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            logout();
        }

        protected void logout()
        {
            Session.Clear();
            Session["is_login"] = "f";
            Session["timeout"] = "t";
            Response.Redirect("~/Login");
        }
    }
}