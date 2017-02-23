using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;
using System.Data;

namespace SIS_V.admin
{
    public partial class tetapan_pentadbir_add : System.Web.UI.Page
    {

        bus_sis_ugc3 bus = new bus_sis_ugc3();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                log_valid.Visible = false;
                log_uname.Visible = false;
                fill_state();
                fill_role();
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
        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (txt_log_name.Text.Trim() == "" || txt_user_name.Text.Trim() == "" || txt_ic_number.Text.Trim() == "" || txt_position.Text.Trim() == "" ||
               drop_role.SelectedValue.ToString() == "" || drop_state.SelectedValue.ToString() == "")
            {
                log_valid.Visible = true;
            }
            else
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
                if (r == -1)
                {
                    log_uname.Visible = true;
                }
            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
           txt_log_name.Text="";
           txt_user_name.Text="";
           txt_ic_number.Text= "" ;
           txt_position.Text= "" ;
           fill_state();
           fill_role();
        }

    }
}