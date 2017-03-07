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
        string hashed;
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
                    log_valid.Visible = false;
                    valid_empty.Visible = false;
                    valid_match.Visible = false;
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
            if (txt_log_name.Text.Trim() == "" || txt_user_name.Text.Trim() == "" || txt_ic_number.Text.Trim() == "" || txt_position.Text.Trim() == "" ||
                 drop_role.SelectedValue.ToString() == "" || drop_state.SelectedValue.ToString() == "")
            {
                log_valid.Visible = true;
                hd_validation.Value = "0";
            }
            else
            {
                hd_validation.Value = "1";
                bus.log_name = txt_log_name.Text.Trim();
                bus.name = txt_user_name.Text.Trim();
                bus.icnumber = txt_ic_number.Text.Trim();
                bus.position = txt_position.Text.Trim();
                bus.role = int.Parse(drop_role.SelectedValue.ToString());
                bus.state = int.Parse(drop_state.SelectedValue.ToString());
                int r = bus.update_user();
                if (r == 0)
                {
                    Response.Redirect("~/admin/tetapan_pentadbir_view");
                }
            }
        }

        protected void btn_resetpass_Click(object sender, EventArgs e)
        {
            if (txt_pass.Text.Trim() == "" || txt_con_pass.Text.Trim() == "")
            {
                valid_empty.Visible = true;
                valid_match.Visible = false;
                hd_password.Value = "0";
            }
            else
            {
                string pass = txt_pass.Text.Trim();
                string con_pass = txt_con_pass.Text.Trim();
                if (pass == con_pass)
                {
                    hashed = encrypt.Encrypt(txt_con_pass.Text);
                    bus.pass = hashed;
                    bus.log_name = hd_pass.Value.Trim().ToString();
                    int r = bus.update_password();
                    if (r == 0)
                    {
                        Response.Redirect("~/admin/tetapan_pentadbir_view");
                        hd_password.Value = "1";
                    }
                }
                else
                {
                    valid_match.Visible = true;
                    valid_empty.Visible = false;
                    hd_password.Value = "0";
                }
            }
        }
    }
}