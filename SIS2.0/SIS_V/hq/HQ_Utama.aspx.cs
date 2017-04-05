using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SIS_B;
using System.Web.Services;

namespace SIS_V.hq
{
    public partial class HQ_Utama : System.Web.UI.Page
    {
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
        [WebMethod]

        public static List<Election> electionInfo()
        {
            List<Election> electioninfo = new List<Election>();
            bus_sis_ugc4 bus4 = new bus_sis_ugc4();
            DateTime dtvalue;
            DataTable dt = bus4.currentElectionInfo();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dtvalue = DateTime.Parse(dt.Rows[i]["election_date"].ToString());
                string avvv = dtvalue.ToString("yyyy-MM-dd");
                Election election = new Election();
                election.electionName = dt.Rows[i]["election_name"].ToString();
                election.electionDate = avvv;
                electioninfo.Add(election);
            }
            return electioninfo;
        }
    }
}