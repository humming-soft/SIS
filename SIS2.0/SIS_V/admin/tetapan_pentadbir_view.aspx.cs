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
        bus_sis_ugc3 bus = new bus_sis_ugc3();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill_state();
                fill_role();
                fill_DataTable_user();
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
                drop_state.Items.Insert(0, new ListItem("-----SELECT-----", ""));
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
                drop_role.Items.Insert(0, new ListItem("-----SELECT-----", ""));
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
        protected void btn_edit_Click1(object sender, EventArgs e)
        {
            bus.log_name = txt_log_name.Text.Trim();
            bus.name = txt_user_name.Text.Trim();
            bus.icnumber = txt_ic_number.Text.Trim();
            bus.position = txt_position.Text.Trim();
            bus.role = int.Parse(drop_role.SelectedValue.ToString());
            bus.state = int.Parse(drop_state.SelectedValue.ToString());
            int r = bus.update_user();
            if (r == 0)
            {
                Response.Redirect("~/admin/tetapan_pentadbir_view.aspx");
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