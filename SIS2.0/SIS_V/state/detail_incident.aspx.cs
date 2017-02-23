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
    public partial class detail_incident : System.Web.UI.Page
    {
        int id, state;
        bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        bus_sis_ugc3 bus = new bus_sis_ugc3();
        protected void Page_Load(object sender, EventArgs e)
        {
            id = int.Parse(Session["area"].ToString());
            state = int.Parse(Session["state"].ToString());
            if(!IsPostBack){
               fill_kod_kawasan();
               fill_maklumat_kawasan();
               fill_calon();
               fill_masalah_dalaman_parti();
               fill_keluar_mengundi();
               fill_semasa();
               fill_comment();
            }
        }
        public void fill_kod_kawasan()
        {
            objBUS.state_id = state;
            DataTable dt = objBUS.fill_kod_kawasan();
            if (dt.Rows.Count > 0)
            {
                grid_kodkawasan.DataSource = dt;
                grid_kodkawasan.DataBind();
            }
        }
        public void fill_maklumat_kawasan()
        {
            bus.area_id = id;
            DataTable dt = bus.fill_maklumat_kawasan();
            if (dt.Rows.Count > 0)
            {
                lbl_area_code.Text = dt.Rows[0]["area_code"].ToString();
                lbl_area_name.Text = dt.Rows[0]["area_name"].ToString();
                lbl_no_voters.Text = dt.Rows[0]["total_vote"].ToString();
                lbl_majority.Text = dt.Rows[0]["winner_majority"].ToString();
                lbl_percent_vote.Text = dt.Rows[0]["percent_vote"].ToString();
                lbl_spoilt_vote.Text = dt.Rows[0]["spoilt_vote"].ToString();
                lbl_winner.Text = dt.Rows[0]["winner_name"].ToString();
                lbl_raceFragment.Text = dt.Rows[0]["race_fragment"].ToString();
                lbl_status.Text = dt.Rows[0]["color"].ToString();
            }
        }
        public void fill_calon()
        {
            bus.area_id = id;
            DataTable dt = bus.fill_calon();
            if (dt.Rows.Count > 0)
            {
                lbl_name.Text = dt.Rows[0]["name"].ToString();
                lbl_job.Text = dt.Rows[0]["occupation"].ToString();
                lbl_political_pos.Text = dt.Rows[0]["political_post"].ToString();
                lbl_education.Text = dt.Rows[0]["education"].ToString();
                byte[] bytes = (byte[])dt.Rows[0]["image"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                img_candidate.ImageUrl = "data:image/png;base64," + base64String;
            }
        }
        public void fill_keluar_mengundi()
        {
            bus.area_id = id;
            DataTable dt = bus.fill_keluar_mengundi();
            if (dt.Rows.Count > 0)
            {
                lbl_perc.Text = dt.Rows[0]["percent_turnout_vote"].ToString()+"%";
            }
        }
        public void fill_semasa()
        {
            bus.area_id = id;
            DataTable dt = bus.fill_semasa();
            if (dt.Rows.Count > 0)
            {
                grid_activity.DataSource = dt;
                grid_activity.DataBind();
            }
        }
        public void fill_masalah_dalaman_parti()
        {
            string issue=null;
            bus.state_id = state;
            DataTable dt = bus.fill_masalah_dalaman_parti();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i< dt.Rows.Count;i++ )
                {
                    if (i == dt.Rows.Count-1)
                    {
                        issue += dt.Rows[i]["issue_name"].ToString();
                    }
                    else
                    {
                        issue += dt.Rows[i]["issue_name"].ToString() + ",";
                    }
                }
                lbl_issue.Text = issue;
            }
        }
        public void fill_comment()
        {
            bus.area_id = id;
            DataTable dt = bus.fill_comment();
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["comment"].ToString()=="")
                {
                    lbl_justification.Text = "N/A";
                }
                else
                {
                    lbl_justification.Text = dt.Rows[0]["comment"].ToString();
                }
            }
            else
            {
                lbl_justification.Text = "N/A";
            }
        }
    }
}