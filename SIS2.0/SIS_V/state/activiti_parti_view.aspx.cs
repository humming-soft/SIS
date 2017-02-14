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
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill_DataTable();
            }
        }

        public void fill_DataTable()
        {
            DataTable dt = bus.fill_DataTable();
            if (dt.Rows.Count > 0)
            {
                GridDataTable2.DataSource = dt;
                GridDataTable2.DataBind();
            }
        }
        protected void GridDataTable2_PreRender(object sender, EventArgs e)
        {
            if (GridDataTable2.Rows.Count > 0)
            {
                GridDataTable2.UseAccessibleHeader = true;
                GridDataTable2.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}