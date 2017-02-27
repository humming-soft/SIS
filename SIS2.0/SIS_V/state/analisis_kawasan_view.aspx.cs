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
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //fill_DataTable();
            }
        }

        public void fill_DataTable()
        {
            DataTable dt = bus.fill_Kawasan();
            if (dt.Rows.Count > 0)
            {
                GridKawasan.DataSource = dt;
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
    }
}