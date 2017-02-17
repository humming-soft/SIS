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
    public partial class activiti_bakal_ci_view : System.Web.UI.Page
    {
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }


        protected void GridDataTable_PreRender(object sender, EventArgs e)
        {
            if (GridDataTable.Rows.Count > 0)
            {
                GridDataTable.UseAccessibleHeader = true;
                GridDataTable.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}