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
    public partial class laporan_harian_issue : System.Web.UI.Page
    {
        bus_sis_ugc4 bus = new bus_sis_ugc4();
        DataTable areaList = new DataTable();
        DataTable issueList = new DataTable();
        DataTable sourceList;
        DataTable partyList = new DataTable();
        DataTable issues = new DataTable();
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
                setIssueList();
                setSource();
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

        protected void setIssueList()
        {
            issueList = bus.fill_issue_list();
            if (issueList.Rows.Count > 0)
            {
                dp_category.DataSource = issueList;
                dp_category.DataBind();
                dp_category.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }
        }

        protected void setSource()
        {
            sourceList = new DataTable();
            sourceList = bus.fill_info_source();
            if (sourceList.Rows.Count > 0)
            {
                dp_source.DataSource = sourceList;
                dp_source.DataBind();
                dp_source.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }


        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            int area_id = (dp_kawasan.SelectedItem.Value != "") ? int.Parse(dp_kawasan.SelectedItem.Value) : -1;
            int issue_id = (dp_category.SelectedItem.Value != "") ? int.Parse(dp_category.SelectedItem.Value) : -1;
            int lookup_id = (dp_source.SelectedItem.Value != "") ? int.Parse(dp_source.SelectedItem.Value) : -1;
            int party_id = (dp_parti.SelectedItem.Value != "") ? int.Parse(dp_parti.SelectedItem.Value) : -1;

            if (area_id == -1 && issue_id == -1 && lookup_id == -1 && party_id == -1)
            {
                log_valid.Visible = true;
                GridDataTable4.DataSource = null;
                GridDataTable4.DataBind();
            }
            else
            {
                log_valid.Visible = false;
                filterIssue(area_id, issue_id, lookup_id, party_id);
            }
        }

        protected void filterIssue(int area_id, int issue_id, int lookup_id, int party_id)
        {
            bus.area_id = area_id;
            bus.current_issue_id = issue_id;
            bus.lookup_id = lookup_id;
            bus.party_id = party_id;
            GridDataTable4.DataSource = null;
            GridDataTable4.DataBind();
            issues = bus.fill_filtered_lssue();
            if (issues.Rows.Count > 0)
            {
                log_empty.Visible = false;
                GridDataTable4.DataSource = issues;
                GridDataTable4.DataBind();
            }
            else
            {
                log_empty.Visible = true;
            }
        }

        protected void GridDataTable4_PreRender(object sender, EventArgs e)
        {
            if (GridDataTable4.Rows.Count > 0)
            {
                GridDataTable4.UseAccessibleHeader = true;
                GridDataTable4.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}