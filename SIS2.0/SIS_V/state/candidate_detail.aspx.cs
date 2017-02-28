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
        DataTable final = new DataTable();
        string cand_image;

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
            buspar.areaid = int.Parse(Session["area_id"].ToString());
            DataTable dt = buspar.fill_candidates();

            final.Columns.Add("name", typeof(string));
            final.Columns.Add("image", typeof(string));
            final.Columns.Add("choice_no_name", typeof(string));
            final.Columns.Add("occupation", typeof(string));
            final.Columns.Add("political_post", typeof(string));
            final.Columns.Add("party_shortcode", typeof(string));
            final.Columns.Add("education", typeof(string));
            final.Columns.Add("election_id", typeof(string));
            final.Columns.Add("election_name", typeof(string));

            if (dt.Rows.Count > 0)
            {

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    byte[] bytes = (byte[])dt.Rows[i]["image"];
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    cand_image = "data:image/png;base64," + base64String;

                    final.Rows.Add(dt.Rows[i]["name"].ToString(), cand_image, dt.Rows[i]["choice_no_name"].ToString(), dt.Rows[i]["occupation"].ToString(), dt.Rows[i]["political_post"].ToString(), dt.Rows[i]["party_shortcode"].ToString(), dt.Rows[i]["education"].ToString(), dt.Rows[i]["election_id"].ToString(), dt.Rows[i]["election_name"].ToString());
                }

                lblelection.Text = dt.Rows[0]["election_name"].ToString();
                DataList1.DataSource = final;
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