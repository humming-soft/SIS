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
    public partial class tetapan_pentadbir_view : System.Web.UI.Page
    {
        bus_sis_ugc3 bus = new bus_sis_ugc3();
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
                    fill_state();
                    fill_role();
                    fill_DataTable_user();
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
        public void fill_DataTable_user()
        {
            DataTable dt = bus.fill_user();
            if (dt.Rows.Count > 0)
            {
                grid_user.DataSource = dt;
                grid_user.DataBind();
            }
        }
        protected void fill_state()
        {
            DataTable dt1 = bus.fetch_states();
            if (dt1.Rows.Count > 0)
            {
                drop_state.DataSource = dt1;
                drop_state.DataBind();
                drop_state.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }
            else
            {

            }
        }
        protected void fill_role()
        {
            DataTable dt1 = bus.fetch_role();
            if (dt1.Rows.Count > 0)
            {
                drop_role.DataSource = dt1;
                drop_role.DataBind();
                drop_role.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }
            else
            {

            }
        }
        protected void Gridteta_PreRender(object sender, EventArgs e)
        {
            if (grid_user.Rows.Count > 0)
            {
                grid_user.UseAccessibleHeader = true;
                grid_user.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        //protected void lnkcp_Click(object sender, EventArgs e)
        //{
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#sis-password-change-modal').modal();", true);

        //}

        //protected void lnkdelete_Click(object sender, EventArgs e)
        //{
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#sis-user-edit-modal').modal();", true);
        //}
    }
}