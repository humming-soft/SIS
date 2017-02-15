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
    public partial class parlimen_info_view : System.Web.UI.Page
    {
        bus_sis_ugc2 bus = new bus_sis_ugc2();
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
                GridPinfo.DataSource = dt;
                GridPinfo.DataBind();
            }
        }
        protected void GridPinfo_PreRender(object sender, EventArgs e)
        {
            if (GridPinfo.Rows.Count > 0)
            {
                GridPinfo.UseAccessibleHeader = true;
                GridPinfo.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}