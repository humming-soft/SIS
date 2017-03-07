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
    public partial class activiti_parti_view : System.Web.UI.Page
    {
        bus_sis_ugc3 bus = new bus_sis_ugc3();
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
                if (Session["is_login"].ToString() == "t")
                {
                    state_id = int.Parse(Session["state"].ToString());
                    fill_gridElectionParty();
                }
                else
                {
                    Response.Redirect("~/Login");
                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }

        protected void grid_areaInfoElectionParty_PreRender(object sender, EventArgs e)
        {
            if (grid_areaInfoElectionParty.Rows.Count > 0)
            {
                grid_areaInfoElectionParty.UseAccessibleHeader = true;
                grid_areaInfoElectionParty.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        public void fill_gridElectionParty()
        {
            bus.state_id = int.Parse(Session["state"].ToString());
            DataTable dt = bus.fill_gridElectionParty();
            if (dt.Rows.Count > 0)
            {
                grid_areaInfoElectionParty.DataSource = dt;
                grid_areaInfoElectionParty.DataBind();
            }
        }
    }
}