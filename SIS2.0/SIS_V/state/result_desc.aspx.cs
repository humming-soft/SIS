using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;

namespace SIS_V.state
{
    public partial class result_desc : System.Web.UI.Page
    {
        bus_sis_ugc3 objBus = new bus_sis_ugc3();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckIsLogin();
            }
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
                    objBus.coalition_id = int.Parse(Session["coalition_id"].ToString());
                    objBus.area_type = int.Parse(Session["area_type"].ToString());
                    objBus.state_id = int.Parse(Session["state"].ToString());
                    objBus.elec_id = int.Parse(Session["election_id"].ToString());
                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }
    }
}