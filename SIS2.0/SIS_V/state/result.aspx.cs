using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;
using System.Data;

namespace SIS_V.state
{
    public partial class result : System.Web.UI.Page
    {
        bus_sis_ugc3 bus = new bus_sis_ugc3();
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
                    
                    ele_name.Text = Session["election"].ToString();
                    elec_name.Text = Session["election"].ToString();
                    fill_election_details();

                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }
        public void fill_election_details()
        {
            bus.state_id = int.Parse(Session["state"].ToString());
            bus.elec_id = int.Parse(Session["election_id"].ToString());
            DataTable dt_election = bus.fill_election_details();
            if (dt_election.Rows.Count > 0)
            {
                ele_date.Text = dt_election.Rows[0]["ele_date"].ToString();
                ele_campign_start.Text = dt_election.Rows[0]["star_date"].ToString();
                ele_campign_end.Text = dt_election.Rows[0]["end_date"].ToString();
                ele_details.Text = dt_election.Rows[0]["remarks"].ToString();
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("result_view");
        }
    }
}