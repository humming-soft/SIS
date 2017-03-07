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
        DataTable dt, dt1;
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
                    //ddlAreaList.SelectedIndex = Convert.ToInt32(Session["ddlSelection"]);
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
        //protected void ddlChanged(object sender, EventArgs e)
        //{
        //    Session["ddlSelection"] = ddlAreaList.SelectedIndex;
        //}

        [WebMethod]
        public static List<Area> GetAreaList(int area_type_id, int sid)
        {
            List<Area> area = new List<Area>();
            bus_sis_ugc2 objBUS = new bus_sis_ugc2();
            objBUS.area_type_id = area_type_id;
            objBUS.state_id = sid;
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            fill_grid();
        }

        protected void fill_grid()
        {
            objBUS.area_id = int.Parse(Request.Form[ddlAreaList.UniqueID]);
            dt1 = objBUS.GetPollingDetails();
            if (dt1.Rows.Count > 0)
            {
                GridKM.DataSource = dt1;
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
            fill_grid();
        }

        protected void GridKM_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridKM.EditIndex = -1;
            fill_grid();
        }

        protected void GridKM_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            objBUS.polling_district_id = int.Parse(GridKM.DataKeys[e.RowIndex].Value.ToString());
            objBUS.no_of_vote = int.Parse(((TextBox)GridKM.Rows[e.RowIndex].FindControl("txtVotes")).Text);
            int chk = objBUS.UpdateNoVote();
            if (chk == 0)
            {
                GridKM.EditIndex = -1;
                fill_grid();
            }
        }
    }
}