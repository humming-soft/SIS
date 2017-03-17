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
    public partial class laporan_harian_incident : System.Web.UI.Page
    {
        bus_sis_ugc4 bus = new bus_sis_ugc4();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["state"].ToString() == null)
            {
                Response.Redirect("../logout");
            }
            bus.sid = int.Parse(Session["state"].ToString());
            if (!IsPostBack)
            {
                log_valid.Visible = false;
                log_empty.Visible = false;
                setAreaList();
                setPartyList();
            }
        }
        protected void setAreaList()
        {
            dt = new DataTable();
            dt = bus.fill_area_list();
            if (dt.Rows.Count > 0)
            {
                dp_kawasan.DataSource = dt;
                dp_kawasan.DataBind();
                dp_kawasan.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }
        }

        protected void setPartyList()
        {
            dt = new DataTable();
            dt = bus.fill_party_list();
            if (dt.Rows.Count > 0)
            {
                dp_parti.DataSource = dt;
                dp_parti.DataBind();
                dp_parti.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            int area_id = (dp_kawasan.SelectedItem.Value != "") ? int.Parse(dp_kawasan.SelectedItem.Value) : -1;
            int party_id = (dp_parti.SelectedItem.Value != "") ? int.Parse(dp_parti.SelectedItem.Value) : -1;

            if (area_id == -1 && party_id == -1)
            {
                log_valid.Visible = true;
                GridDataTable6.DataSource = null;
                GridDataTable6.DataBind();
            }
            else
            {
                log_valid.Visible = false;
                filterIncident(area_id, party_id);
            }
        }

        protected void filterIncident(int area_id, int party_id)
        {
            bus.area_id = area_id;
            bus.party_id = party_id;
            GridDataTable6.DataSource = null;
            GridDataTable6.DataBind();
            dt = new DataTable();
            dt = bus.fill_filtered_incident();
            if (dt.Rows.Count > 0)
            {
                log_empty.Visible = false;
                GridDataTable6.DataSource = dt;
                GridDataTable6.DataBind();
            }
            else
            {
                log_empty.Visible = true;
            }
        }

        protected void GridDataTable6_PreRender(object sender, EventArgs e)
        {
            if (GridDataTable6.Rows.Count > 0)
            {
                GridDataTable6.UseAccessibleHeader = true;
                GridDataTable6.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}