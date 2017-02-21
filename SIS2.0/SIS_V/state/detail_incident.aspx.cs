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
        int id;
        bus_sis_ugc3 bus = new bus_sis_ugc3();
        protected void Page_Load(object sender, EventArgs e)
        {
             id= int.Parse(Session["area"].ToString());
            if(!IsPostBack){
                fill_kod_kawasan();
                //fill_maklumat_kawasan();
                //fill_calon();
                //fill_masalah_dalaman_parti();
                //fill_keluar_mengundi();
            }
        }
        public void fill_kod_kawasan()
        {
            DataTable dt = bus.fill_kod_kawasan();
            bus.area_id = id;
            if (dt.Rows.Count > 0)
            {
                grid_kodkawasan.DataSource = dt;
                grid_kodkawasan.DataBind();
            }
        }
    }
}