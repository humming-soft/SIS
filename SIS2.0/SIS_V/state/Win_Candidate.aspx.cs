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

        public static List<Parliment> parlimen_WC(int sid)
        {
            List<Parliment> parliment = new List<Parliment>();
            List<string> obj = new List<string>();
            bus_sis_ugc1 buspar = new bus_sis_ugc1();

            buspar.stateid = sid;
            DataTable dtWC = buspar.parlimen_WC();

            buspar.stateid = sid;
            DataTable dtWCd = buspar.dun_WC();

            for (int i = 0; i < dtWC.Rows.Count; i++)
            {
                Parliment _Parliment = new Parliment();
                _Parliment.par_id = int.Parse(dtWC.Rows[i]["area_id"].ToString());
                _Parliment.p_area_type = int.Parse(dtWC.Rows[i]["area_type"].ToString());
                _Parliment.par_code = dtWC.Rows[i]["area_code"].ToString();
                _Parliment.par_name = dtWC.Rows[i]["area_code"].ToString() + " - " +dtWC.Rows[i]["area_name"].ToString();
                _Parliment.p_parent_id = int.Parse(dtWC.Rows[i]["parent_id"].ToString());
                obj = new List<string>();
                for (int j = 0; j < dtWCd.Rows.Count; j++)
                {
                    if (int.Parse(dtWCd.Rows[j]["parent_id"].ToString()) == int.Parse(dtWC.Rows[i]["area_id"].ToString()))
                    {
                        obj.Add(dtWCd.Rows[j]["area_code"].ToString() + " - " + dtWCd.Rows[j]["area_name"].ToString());                    
                    }

                }
                _Parliment.dun = obj;
                parliment.Add(_Parliment);
            }
            return parliment;
        }

    }
}