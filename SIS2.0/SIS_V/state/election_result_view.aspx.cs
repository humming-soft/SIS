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
        int a, b, we, simpan;
        float pe, c;
        protected void Page_Load(object sender, EventArgs e)
        {
            valid.Visible = false;
            invalid.Visible = false;
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
                    txtjkudpu.Attributes.Add("readonly", "readonly");
                    txtper.Attributes.Add("readonly", "readonly");
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
                txtpk.Text = dt.Rows[0][18].ToString();
                txtjpb.Text = dt.Rows[0][8].ToString();
                txtjkud.Text = dt.Rows[0][11].ToString();
                if (String.IsNullOrEmpty(dt.Rows[0][12].ToString()) || String.IsNullOrEmpty(dt.Rows[0][11].ToString()))
                {
                    we = 0;
                }
                else
                {
                    we = int.Parse(dt.Rows[0][12].ToString()) - int.Parse(dt.Rows[0][11].ToString());
                }
                txtjkudpu.Text = we.ToString();
                txtjkudi.Text = dt.Rows[0][15].ToString();
                txtjkutd.Text = dt.Rows[0][13].ToString();
                if (String.IsNullOrEmpty(dt.Rows[0][15].ToString()) || String.IsNullOrEmpty(dt.Rows[0][8].ToString()))
                {
                    pe = 0;
                }
                else
                {
                    a = int.Parse(dt.Rows[0][15].ToString());
                    b = int.Parse(dt.Rows[0][8].ToString());
                    c = (float)a / b;
                    pe = c * 100;
                }
                txtper.Text = pe.ToString("F");
                if (String.IsNullOrEmpty(dt.Rows[0][32].ToString()) || String.IsNullOrEmpty(dt.Rows[0][34].ToString()) || String.IsNullOrEmpty(dt.Rows[0][33].ToString()))
                {
                    lblwinner.Text = "";
                }
                else{
                lblwinner.Text = dt.Rows[0][32].ToString() + " (" + dt.Rows[0][34].ToString() + " - " + dt.Rows[0][33].ToString() + ")";
                }
                txtmajority.Text = dt.Rows[0][9].ToString();
                if (String.IsNullOrEmpty(dt.Rows[0][35].ToString()) || String.IsNullOrEmpty(dt.Rows[0][37].ToString()) || String.IsNullOrEmpty(dt.Rows[0][36].ToString()) || String.IsNullOrEmpty(dt.Rows[0][14].ToString()))
                {
                    lblinc.Text ="";
                }
                else{
                lblinc.Text = dt.Rows[0][35].ToString() + " (" + dt.Rows[0][37].ToString() + " - " + dt.Rows[0][36].ToString() + ") Majoriti : " + dt.Rows[0][14].ToString();
                }
            }
        }
        public void fill_cand_list()
        {
            bus.eid = int.Parse(Session["K_elec_id"].ToString());
            bus.areaid = int.Parse(Session["K_are_id"].ToString());
            bus.resid = int.Parse(Session["K_elec_r_id"].ToString());
            cand = bus.fill_cand_list();
            if (cand.Rows.Count > 0)
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
            if (up == 1)
            {
                //success
                candidate_list.EditIndex = -1;
                lblvalid.Text = "Dikemaskini Berjaya !";
                valid.Visible = true;
                invalid.Visible = false;
                fill_result_list();
                fill_races();
                fill_cand_list();
            }
            else
            {
                //failure
                candidate_list.EditIndex = -1;
                lblinvalid.Text = "Updation Gagal !";
                invalid.Visible = true;
                valid.Visible = false;
                fill_result_list();
                fill_races();
                fill_cand_list();
            }
        }

        protected void btnsimpan_Click(object sender, EventArgs e)
        {
            bus.ele_r_id_u = int.Parse(Session["K_elec_r_id"].ToString());
            if (txtpk.Text.Trim() != "")
            {
                bus.race_frg = txtpk.Text.Trim();
            }
            else
            {
                bus.race_frg = null;
            }
            if (txtjpb.Text.Trim() !="")
            {
            bus.totalvote = int.Parse(txtjpb.Text);
            }
            else
            {
                bus.totalvote = int.Parse(null);
            }
            if (txtjkud.Text.Trim() != "")
            {
                bus.spolit_vote = int.Parse(txtjkud.Text);
            }
            else
            {
                bus.spolit_vote = int.Parse(null);
            }
            if (txtjkudi.Text.Trim() != "")
            {
                bus.turn_vote = int.Parse(txtjkudi.Text);
            }
            else
            {
                bus.turn_vote = int.Parse(null);
            }
            if (txtmajority.Text.Trim() != "")
            {
                bus.majority = int.Parse(txtmajority.Text);
            }
            else
            {
                bus.majority = int.Parse(null);
            }

            simpan = bus.update_simpan();
            if( simpan == 1)
            {
                //success
                Response.Redirect("election_result_list");
            }
            else
            {
                //failure
                lblinvalid.Text = "Update Gagal !";
                invalid.Visible = true;
            }
        }
    }
}