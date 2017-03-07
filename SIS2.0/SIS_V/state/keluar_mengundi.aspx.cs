using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SIS_B;
using System.Web.Services;

namespace SIS_V.state
{
    public partial class keluar_mengundi : System.Web.UI.Page
    {
        bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        DataTable dt;
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
                    FillDetails();
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

        public void FillDetails()
        {
            objBUS.state_id = int.Parse(Session["state"].ToString());
            dt = objBUS.GetStateList();
            lblNageri.Text = dt.Rows[0]["state_name"].ToString();
            lblPilihanraya.Text = Session["election"].ToString();
        }

        [WebMethod]
        public static List<Area> GetAreaList(int area_type_id)
        {
            List<Area> area = new List<Area>();
            bus_sis_ugc2 objBUS = new bus_sis_ugc2();
            objBUS.area_type_id = area_type_id;
            DataTable dt = objBUS.GetAreaList();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Area _Area = new Area();
                _Area.area_id = int.Parse(dt.Rows[i]["area_id"].ToString());
                _Area.area_name = dt.Rows[i]["area_name"].ToString();
                area.Add(_Area);
            }
            return area;
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
        }

        protected void GridKM_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridKM.EditIndex = -1;
        }
    }
}