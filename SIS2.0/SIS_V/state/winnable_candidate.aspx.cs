using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using SIS_B;

namespace SIS_V.state
{
    public partial class winnable_candidate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id"] != null)
                {
                    Session["area_wc_id"] = Request["id"];
                    Response.Redirect("candidate_detail");
                }
            }
        }

    }
}