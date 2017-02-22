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
                //fill_calon();
                //fill_masalah_dalaman_parti();
                //fill_keluar_mengundi();
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
                lbl_raceFragment.Text = dt.Rows[0]["race_fragment"].ToString();
            }
        }
    }
}