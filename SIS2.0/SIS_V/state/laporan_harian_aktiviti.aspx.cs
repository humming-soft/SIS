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
    public partial class laporan_harian_more : System.Web.UI.Page
    {
        bus_sis_ugc4 bus = new bus_sis_ugc4();
        DataTable areaList = new DataTable();
        DataTable activityTypeList = new DataTable();
        DataTable partyList = new DataTable();
        DataTable activity = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["state"] == null)
            {
                Response.Redirect("../logout");
            }
            bus.sid = int.Parse(Session["state"].ToString());
            if (!IsPostBack)
            {
                log_valid.Visible = false;
                log_empty.Visible = false;
                setAreaList();
                setActivityType();
                setPartyList();
            }
        }
        protected void setAreaList()
        {
            areaList = bus.fill_area_list();
            if (areaList.Rows.Count > 0)
            {
                dp_kawasan.DataSource = areaList;
                dp_kawasan.DataBind();
                dp_kawasan.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }
        }
        protected void setActivityType()
        {
            bus.areaTypes = new List<int>(new int[] { 1, 2, 3, 4, 5, 6, 10, 12, 13, 14 });
            activityTypeList = bus.fill_activity_type();
            if (activityTypeList.Rows.Count > 0)
            {
                dp_aktiviti.DataSource = activityTypeList;
                dp_aktiviti.DataBind();
                dp_aktiviti.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }
        }

        protected void setPartyList()
        {
            partyList = bus.fill_party_list();
            if (partyList.Rows.Count > 0)
            {
                dp_parti.DataSource = partyList;
                dp_parti.DataBind();
                dp_parti.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }

        }

        protected void GridDtActivity_PreRender(object sender, EventArgs e)
        {
            if (GridDataTable3.Rows.Count > 0)
            {
                GridDataTable3.UseAccessibleHeader = true;
                GridDataTable3.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }


        protected void btn_submit_Click(object sender, EventArgs e)
        {
            int area_id = (dp_kawasan.SelectedItem.Value != "") ? int.Parse(dp_kawasan.SelectedItem.Value) : -1;
            int activity_id = (dp_aktiviti.SelectedItem.Value != "") ? int.Parse(dp_aktiviti.SelectedItem.Value) : -1;
            int party_id = (dp_parti.SelectedItem.Value != "") ? int.Parse(dp_parti.SelectedItem.Value) : -1;

            if (area_id == -1 && activity_id == -1 && party_id == -1)
            {
                log_valid.Visible = true;
                GridDataTable3.DataSource = null;
                GridDataTable3.DataBind();
            }
            else
            {
                log_valid.Visible = false;
                filterActivity(area_id,activity_id,party_id);
            }
        }

        protected void filterActivity(int area_id, int activity_id, int party_id)
        {
            bus.area_id = area_id;
            bus.activity_id = activity_id;
            bus.party_id = party_id;
            GridDataTable3.DataSource = null;
            GridDataTable3.DataBind();
            activity = bus.fill_filtered_list();
            if (activity.Rows.Count > 0)
            {
                log_empty.Visible = false;
                GridDataTable3.DataSource = activity;
                GridDataTable3.DataBind();
            }
            else
            {
                log_empty.Visible = true;
            }
        }
    }
}