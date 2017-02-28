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
    public partial class candidate_detail : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill_can();
            }
        }

        public void fill_can()
        {
            bus_sis_ugc1 buspar = new bus_sis_ugc1();
            buspar.areaid = 134;
            DataTable dt = buspar.fill_candidates();

            if (dt.Rows.Count > 0)
            {
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
        }

        [WebMethod]
        public static List<Candidate> fill_candidates(int areaid)
        {
            List<Candidate> candidate = new List<Candidate>();
            bus_sis_ugc1 buspar = new bus_sis_ugc1();
            buspar.areaid = areaid;
            DataTable dt = buspar.fill_candidates();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Candidate _Candidate = new Candidate();
                    _Candidate.name = dt.Rows[i]["name"].ToString();
                    _Candidate.imag = dt.Rows[i]["image"].ToString();
                    _Candidate.choice = dt.Rows[i]["choice_no_name"].ToString();
                    _Candidate.job = dt.Rows[i]["occupation"].ToString();
                    _Candidate.position = dt.Rows[i]["political_post"].ToString();
                    _Candidate.education = dt.Rows[i]["education"].ToString();
                    _Candidate.comment = dt.Rows[i]["election_id"].ToString();
                    _Candidate.ename = dt.Rows[i]["election_name"].ToString();
                    candidate.Add(_Candidate);
                }
                return candidate;
            }
            else
            {
                return null;
            }
        }
    }
}