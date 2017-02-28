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
    public partial class analisis_kawasan_view : System.Web.UI.Page
    {
        bus_sis_ugc4 bus = new bus_sis_ugc4();
        DataTable areaAnalysis = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAreaAnalysis();
                Session["report_id"] = "";
            }
        }

        public void fillAreaAnalysis()
        {
            bus.sid = int.Parse(Session["state"].ToString());
            areaAnalysis = bus.fill_area_analysis();

            if (areaAnalysis.Rows.Count > 0)
            {
                GridKawasan.DataSource = areaAnalysis;
                GridKawasan.DataBind();
            }
           
        }

        protected void GridKawasan_PreRender(object sender, EventArgs e)
        {
            if (GridKawasan.Rows.Count > 0)
            {
                GridKawasan.UseAccessibleHeader = true;
                GridKawasan.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int report_id = int.Parse(GridKawasan.DataKeys[row.RowIndex].Value.ToString());
            Session["report_id"] = report_id;
            Response.Redirect("analisis_kawasan_add");
        }
    }
}