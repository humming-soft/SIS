using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using SIS_B;
namespace SIS_V.state
{
    public partial class Win_Candidate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        //public static List<Parliment_WC> parlimen_w(int sid)
        //{
        //    List<Parliment_WC> parlimen_w = new List<Parliment_WC>();
        //    bus_sis_ugc1 buspar = new bus_sis_ugc1();
        //    buspar.stateid = sid;
        //    DataTable dt = buspar.parlimen();
        //    for (int i = 0; i < dt.Rows.Count; i++)
        //    {
        //        Parliment_WC _ParlimentW = new Parliment_WC();
        //        _ParlimentW.Color_code = int.Parse(dt.Rows[i]["analysis_color_id"].ToString());
        //        _ParlimentW.Color_Value = dt.Rows[i]["count_analysis"].ToString();
        //        parlimen_w.Add(_ParlimentW);
        //    }
        //    return parlimen_w;
        //}

        public static List<Parliment> parlimen(int sid)
        {
            List<Parliment> parliment = new List<Parliment>();
            bus_sis_ugc1 buspar = new bus_sis_ugc1();
            buspar.stateid = sid;
            DataTable dtWC = buspar.parlimen_WC();
            for (int i = 0; i < dtWC.Rows.Count; i++)
            {
                Parliment _Parliment = new Parliment();
                _Parliment.area_id = int.Parse(dtWC.Rows[i]["area_id"].ToString());
                _Parliment.area_type = int.Parse(dtWC.Rows[i]["area_type"].ToString());
                _Parliment.area_code = dtWC.Rows[i]["area_code"].ToString();
                _Parliment.area_name = dtWC.Rows[i]["area_name"].ToString();
                _Parliment.parent_id = int.Parse(dtWC.Rows[i]["parent_id"].ToString());
                parliment.Add(_Parliment);
            }
            return parliment;
        }
    }
}