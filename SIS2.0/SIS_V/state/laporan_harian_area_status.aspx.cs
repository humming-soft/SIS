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
    public partial class laporan_harian_areastatus : System.Web.UI.Page
    {
        bus_sis_ugc4 bus = new bus_sis_ugc4();
        DataTable dt = new DataTable();
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
                invalid.Visible = false;
                valid.Visible = false;
                setAreaList();
                setStatus();
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
                dp_kawasan.Items.Insert(0, new ListItem("-----SELECT-----", ""));
            }
        }

        protected void setStatus()
        {
            dt = new DataTable();
            dt = bus.fill_status();
            if (dt.Rows.Count > 0)
            {
                dp_status.DataSource = dt;
                dp_status.DataBind();
                dp_status.Items.Insert(0, new ListItem("-----SELECT-----", ""));
            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            int area_id = (dp_kawasan.SelectedItem.Value != "") ? int.Parse(dp_kawasan.SelectedItem.Value) : -1;
            string status = (dp_status.SelectedItem.Value != "") ? dp_status.SelectedItem.Value : "null";

            if (area_id == -1 && status == "null")
            {
                log_valid.Visible = true;
                GridDataTable7.DataSource = null;
                GridDataTable7.DataBind();
            }
            else
            {
                log_valid.Visible = false;
                filterIssue(area_id, status);
            }
        }

        protected void filterIssue(int area_id, string status)
        {
            bus.area_id = area_id;
            bus.status = status;
            GridDataTable7.DataSource = null;
            GridDataTable7.DataBind();
            dt = new DataTable();
            dt = bus.fill_filtered_status();
            if (dt.Rows.Count > 0)
            {
                log_empty.Visible = false;
                GridDataTable7.DataSource = dt;
                GridDataTable7.DataBind();
            }
            else
            {
                log_empty.Visible = true;
            }
        }

        protected void GridDataTable7_PreRender(object sender, EventArgs e)
        {
            if (GridDataTable7.Rows.Count > 0)
            {
                GridDataTable7.UseAccessibleHeader = true;
                GridDataTable7.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int report_id = int.Parse(GridDataTable7.DataKeys[row.RowIndex].Value.ToString());
            Session["report_id"] = report_id;
            Response.Redirect("analisis_kawasan_add");
        }

        protected void GridDataTable7_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridDataTable7.Rows[e.RowIndex];
            bus.rid = int.Parse(GridDataTable7.DataKeys[row.RowIndex].Value.ToString());
            if (bus.delete_area_analysis() > 0)
            {
                lblsuccess.Text = "Rekod Dipadam Berjaya!";
                valid.Visible = true;
            }
            else
            {
                lblinvalid.Text = "Ralat Tidak Dijangka, Pemotongan Gagal!";
                invalid.Visible = true;
            }
            int area_id = (dp_kawasan.SelectedItem.Value != "") ? int.Parse(dp_kawasan.SelectedItem.Value) : -1;
            string status = (dp_status.SelectedItem.Value != "") ? dp_status.SelectedItem.Value : "null";

            if (area_id == -1 && status == "null")
            {
                log_valid.Visible = true;
                GridDataTable7.DataSource = null;
                GridDataTable7.DataBind();
            }
            else
            {
                log_valid.Visible = false;
                filterIssue(area_id, status);
            }
        }
    }
}