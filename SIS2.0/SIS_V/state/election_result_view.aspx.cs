using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;
using System.Data;
using System.Web.Services;

namespace SIS_V.state
{
    public partial class election_result_view : System.Web.UI.Page
    {
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        DataTable dt, cand;
        int  a, b;
        float pe,c;
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
                    txtpk.Attributes.Add("readonly", "readonly");
                    fill_result_list();
                    fill_races();
                    fill_cand_list();
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

        public void fill_result_list()
        {
            bus.eid = int.Parse(Session["K_elec_id"].ToString());
            bus.areaid = int.Parse(Session["K_are_id"].ToString());
            dt = bus.getDetails();
            if (dt.Rows.Count > 0)
            {
                txtjpb.Text = dt.Rows[0][8].ToString();
                txtjkud.Text = dt.Rows[0][11].ToString();
                int we = int.Parse(dt.Rows[0][12].ToString()) - int.Parse(dt.Rows[0][11].ToString());
                txtjkudpu.Text = we.ToString();
                txtjkudi.Text = dt.Rows[0][15].ToString();
                txtjkutd.Text = dt.Rows[0][13].ToString();
                a = int.Parse(dt.Rows[0][15].ToString());
                b = int.Parse(dt.Rows[0][8].ToString());
                c = (float)a / b;
                pe = c * 100;
                txtper.Text = pe.ToString("F");
                lblwinner.Text = dt.Rows[0][32].ToString() + " (" + dt.Rows[0][34].ToString() + " - " + dt.Rows[0][33].ToString() + ")";
                txtmajority.Text = dt.Rows[0][9].ToString();
                lblinc.Text = dt.Rows[0][35].ToString() + " (" + dt.Rows[0][37].ToString() + " - " + dt.Rows[0][36].ToString() + ") Majoriti : " + dt.Rows[0][14].ToString();
            }
        }
        public void fill_cand_list()
        {
            bus.eid = int.Parse(Session["K_elec_id"].ToString());
            bus.areaid = int.Parse(Session["K_are_id"].ToString());
            bus.resid = int.Parse(Session["K_elec_r_id"].ToString());
            cand = bus.fill_cand_list();
            if(cand.Rows.Count > 0)
            {
                candidate_list.DataSource = cand;
                candidate_list.DataBind();
            }
            else
            {
                candidate_list.DataSource = null;
                candidate_list.DataBind();
            }
        }
        public void fill_races()
        {
            DataTable races = bus.fill_races();
            if (races.Rows.Count > 0)
            {
                ddlraces.DataSource = races;
                ddlraces.DataBind();
                ddlraces.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }
        }

        protected void candidate_list_RowEditing(object sender, GridViewEditEventArgs e)
        {
            candidate_list.EditIndex = e.NewEditIndex;
            fill_cand_list();
        }

        protected void candidate_list_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            candidate_list.EditIndex = -1;
            fill_cand_list();
        }

        protected void candidate_list_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = candidate_list.Rows[e.RowIndex];
            bus.ele_r_id_u = int.Parse(candidate_list.DataKeys[e.RowIndex].Values[0].ToString());
            bus.votes = int.Parse(((TextBox)candidate_list.Rows[e.RowIndex].FindControl("txtvotes")).Text);
            CheckBox chk = (CheckBox)row.FindControl("chkwinner");
            if (chk != null && chk.Checked)
            {
                bus.winn = 1;
            }
            else
            {
                bus.winn = 0;
            }
            bus.cand_id_u = int.Parse(candidate_list.DataKeys[e.RowIndex].Values[1].ToString());
            bus.party_id_u = int.Parse(candidate_list.DataKeys[e.RowIndex].Values[2].ToString());
            bus.coal_id_u = int.Parse(candidate_list.DataKeys[e.RowIndex].Values[3].ToString());
            int up = bus.update_details();
            if(up == 1)
            {
                //success
                candidate_list.EditIndex = -1;
                fill_result_list();
                fill_races();
                fill_cand_list();
            }
            else
            {
                //failure
                candidate_list.EditIndex = -1;
                fill_result_list();
                fill_races();
                fill_cand_list();
            }
        }
    }
}