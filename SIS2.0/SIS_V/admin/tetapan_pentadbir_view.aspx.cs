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
    public partial class tetapan_pentadbir_view : System.Web.UI.Page
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
                Gridteta.DataSource = dt;
                Gridteta.DataBind();
            }
        }

        protected void Gridteta_PreRender(object sender, EventArgs e)
        {
            if (Gridteta.Rows.Count > 0)
            {
                Gridteta.UseAccessibleHeader = true;
                Gridteta.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void lnkcp_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#sis-password-change-modal').modal();", true);

        }

        protected void lnkdelete_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#sis-user-edit-modal').modal();", true);
        }
    }
}