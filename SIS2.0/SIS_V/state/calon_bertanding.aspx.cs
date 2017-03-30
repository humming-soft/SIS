using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SIS_B;

namespace SIS_V.state
{
    public partial class calon_bertanding : System.Web.UI.Page
    {
        bus_sis_ugc3 objBus = new bus_sis_ugc3();
        DataTable dt = new DataTable();
        int state_id;
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
                    state_id = int.Parse(Session["state"].ToString());
                    //fill_can(state_id);
                    
                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }
        public void fill_can(int wid)
        {

            objBus.state_id = state_id;
            DataSet ds = objBus.fill_calon_candidates();

        }


    }
}
    