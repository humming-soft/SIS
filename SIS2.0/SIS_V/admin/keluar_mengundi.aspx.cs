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
    public partial class keluar_mengundi : System.Web.UI.Page
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
                GridKM.DataSource = dt;
                GridKM.DataBind();
            }
        }

        protected void GridKM_PreRender(object sender, EventArgs e)
        {
            if (GridKM.Rows.Count > 0)
            {
                GridKM.UseAccessibleHeader = true;
                GridKM.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void GridKM_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridKM.EditIndex = e.NewEditIndex;
            fill_DataTable();
        }

        protected void GridKM_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridKM.EditIndex = -1;
            fill_DataTable();
        }
    }
}