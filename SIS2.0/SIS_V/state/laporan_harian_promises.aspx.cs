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
    public partial class laporan_harian_promises : System.Web.UI.Page
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

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            int area_id = (dp_kawasan.SelectedItem.Value != "") ? int.Parse(dp_kawasan.SelectedItem.Value) : -1;

            if (area_id == -1)
            {
                log_valid.Visible = true;
                GridDataTable5.DataSource = null;
                GridDataTable5.DataBind();
            }
            else
            {
                log_valid.Visible = false;
                filterPromises(area_id);
            }
        }

        protected void filterPromises(int area_id)
        {
            dt = new DataTable();
            bus.area_id = area_id;
            GridDataTable5.DataSource = null;
            GridDataTable5.DataBind();
            dt = bus.fill_filtered_promises();
            if (dt.Rows.Count > 0)
            {
                log_empty.Visible = false;
                GridDataTable5.DataSource = dt;
                GridDataTable5.DataBind();
            }
            else
            {
                log_empty.Visible = true;
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
    }
}