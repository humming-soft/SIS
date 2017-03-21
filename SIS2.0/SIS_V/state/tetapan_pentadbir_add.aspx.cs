using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;
using System.Data;

namespace SIS_V.state
{
    public partial class tetapan_pentadbir_add : System.Web.UI.Page
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
        protected void btn_add_Click(object sender, EventArgs e)
        {
            bus.log_name = txt_log_name.Text.Trim();
            bus.name = txt_user_name.Text.Trim();
            bus.icnumber = txt_ic_number.Text.Trim();
            bus.position = txt_position.Text.Trim();
            bus.role = int.Parse(drop_role.SelectedValue.ToString());
            bus.state = int.Parse(drop_state.SelectedValue.ToString());
            int r = bus.insert_user();
            if (r == 0)
            {
                Response.Redirect("~/admin/tetapan_pentadbir_view");
            }
        }

    }
}