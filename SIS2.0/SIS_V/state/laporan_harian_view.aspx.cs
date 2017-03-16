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
    public partial class laporan_harian_view : System.Web.UI.Page
    {
        bus_sis_ugc1 bus1 = new bus_sis_ugc1();
        bus_sis_ugc4 bus4 = new bus_sis_ugc4();
        DataTable table1 = new DataTable();
        DataTable issues = new DataTable();
        DataTable promises = new DataTable();
        DataTable incident = new DataTable();
        DataTable area_status = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["state"] == null)
            {
                Response.Redirect("../logout");
            }
            if (!IsPostBack)
            {
                fill_lamporan();
                Session["report_id"] = "";
                invalid.Visible = false;
                valid.Visible = false;
            }
        }

        public void fill_lamporan()
        {
            bus4.sid = int.Parse(Session["state"].ToString());
            table1 = bus4.fill_lamporan();
            issues = bus4.fill_issues();
            promises = bus4.fill_promises();
            incident = bus4.fill_incident();
            area_status = bus4.fill_area_status();
            if (table1.Rows.Count > 0)
            {
                GridDataTable3.DataSource = table1;
                GridDataTable3.DataBind();
            }
            if (issues.Rows.Count > 0)
            {
                GridDataTable4.DataSource = issues;
                GridDataTable4.DataBind();
            }
            if (promises.Rows.Count > 0)
            {
                GridDataTable5.DataSource = promises;
                GridDataTable5.DataBind();
            }
            if (incident.Rows.Count > 0)
            {
                GridDataTable6.DataSource = incident;
                GridDataTable6.DataBind();
            }
            if (area_status.Rows.Count > 0)
            {
                GridDataTable7.DataSource = area_status;
                GridDataTable7.DataBind();
            }
        }

        protected void GridDataTable3_PreRender(object sender, EventArgs e)
        {
            if (GridDataTable3.Rows.Count > 0)
            {
                GridDataTable3.UseAccessibleHeader = true;
                GridDataTable3.HeaderRow.TableSection = TableRowSection.TableHeader;
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

        protected void GridDataTable5_PreRender(object sender, EventArgs e)
        {
            if (GridDataTable5.Rows.Count > 0)
            {
                GridDataTable5.UseAccessibleHeader = true;
                GridDataTable5.HeaderRow.TableSection = TableRowSection.TableHeader;
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
        protected void GridDataTable7_PreRender(object sender, EventArgs e)
        {
            if (GridDataTable7.Rows.Count > 0)
            {
                GridDataTable7.UseAccessibleHeader = true;
                GridDataTable7.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void GridDataTable7_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridDataTable7.Rows[e.RowIndex];
            bus4.rid = int.Parse(GridDataTable7.DataKeys[row.RowIndex].Value.ToString());
            if (bus4.delete_area_analysis() > 0)
            {
                lblsuccess.Text = "Rekod Dipadam Berjaya!";
                valid.Visible = true;
            }else{
                lblinvalid.Text = "Ralat Tidak Dijangka, Pemotongan Gagal!";
                invalid.Visible = true;
            }
            fill_lamporan();
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int report_id = int.Parse(GridDataTable7.DataKeys[row.RowIndex].Value.ToString());
            Session["report_id"] = report_id;
            Response.Redirect("analisis_kawasan_add");
        }
    }
}