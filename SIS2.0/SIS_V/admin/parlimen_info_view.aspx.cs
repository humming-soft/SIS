using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SIS_B;

namespace SIS_V.admin
{
    public partial class parlimen_info_view : System.Web.UI.Page
    {
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        protected void Page_Load(object sender, EventArgs e)
        {
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