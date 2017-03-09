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
        bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckIsLogin();
            }
        }


        protected void CheckIsLogin()
        {
            if (Session["is_login"] != null)
            {
                if (Session["is_login"].ToString() == "t")
                {
                    FillActivitiDataTable();
                }
                else
                {
                    Response.Redirect("~/Login");
                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }
        public void FillActivitiDataTable()
        {
            objBUS.state_id = int.Parse(Session["state"].ToString());
            DataTable dt = objBUS.FillActivitiDataTable();
            if (dt.Rows.Count > 0)
            {
                GridDataTable.DataSource = dt;
                GridDataTable.DataBind();
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