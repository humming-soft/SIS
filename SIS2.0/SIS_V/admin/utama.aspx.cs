using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SIS_B;
using System.Web.Services;

namespace SIS_V.admin
{
    public partial class utama : System.Web.UI.Page
    {
        bus_sis_ugc1 bus1 = new bus_sis_ugc1();
        int count,id,hash,Num;
        string Name;
        DataTable dt = new DataTable();
        DataTable table1 = new DataTable();
        DataTable table2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //fillgrid();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = int.Parse(grdinsident1.DataKeys[row.RowIndex].Value.ToString());
            if(id != 0)
            {
                /* 
                 * can use either Server.Transfer or Response.Redirect 
                 * Server.Transfer - url won't change
                 * Response.Redirect - url will change
                */
                Response.Redirect("~/admin/detail_incident.aspx");

                //Server.Transfer("~/admin/detail_incident.aspx");
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