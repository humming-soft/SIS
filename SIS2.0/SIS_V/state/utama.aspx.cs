using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SIS_B;
using System.Web.Services;

namespace SIS_V.state
{
    public partial class utama : System.Web.UI.Page
    {
        bus_sis_ugc1 bus1 = new bus_sis_ugc1();
        int count, id, hash, Num;
        string Name;
        DataTable dt = new DataTable();
        DataTable table1 = new DataTable();
        DataTable table2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                jumlah_insiden();
            }
        }

        [WebMethod]

        public static List<Parliment> parlimen(int sid)
        {
            List<Parliment> parliment = new List<Parliment>();
            bus_sis_ugc1 buspar = new bus_sis_ugc1();
            buspar.stateid = sid;
            DataTable dt = buspar.parlimen();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Parliment _Parliment = new Parliment();
                _Parliment.Color_code = int.Parse(dt.Rows[i]["analysis_color_id"].ToString());
                _Parliment.Color_Value = dt.Rows[i]["count_analysis"].ToString();
                parliment.Add(_Parliment);
            }
            return parliment;
        }

        [WebMethod]

        public static List<Parliment> dun(int sid)
        {
            List<Parliment> parliment = new List<Parliment>();
            bus_sis_ugc1 buspar = new bus_sis_ugc1();
            buspar.stateid = sid;
            DataTable dt = buspar.dun();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Parliment _Parliment = new Parliment();
                _Parliment.Color_code = int.Parse(dt.Rows[i]["analysis_color_id"].ToString());
                _Parliment.Color_Value = dt.Rows[i]["count_analysis"].ToString();
                parliment.Add(_Parliment);
            }
            return parliment;
        }
        [WebMethod]
        public static List<ParlimentChart> situasi(int sid, int aid)
        {
            List<ParlimentChart> pc = new List<ParlimentChart>();
            bus_sis_ugc1 busparc = new bus_sis_ugc1();
            busparc.areaid = aid;
            busparc.stateid = sid;
            DataTable dtpc = busparc.situasi();
            for (int i = 0; i < dtpc.Rows.Count; i++)
            {
                ParlimentChart _pc = new ParlimentChart();
                _pc.State = dtpc.Rows[i]["State_Name"].ToString();
                _pc.Color_Code = int.Parse(dtpc.Rows[i]["Analysis_Color_Id"].ToString());
                _pc.Color_Value = int.Parse(dtpc.Rows[i]["Count_Analysis"].ToString());
                pc.Add(_pc);
            }
            return pc;
        }
        public void jumlah_insiden()
        {
            bus1.stateid = int.Parse(Session["state"].ToString());
            dt = bus1.jumlah_insiden();
            if (dt.Rows.Count > 0)
            {
        //        count = dt.Rows.Count / 2;

        //        table1.Columns.Add("id", typeof(int));
        //        table1.Columns.Add("#", typeof(int));
        //        table1.Columns.Add("Name", typeof(string));
        //        table1.Columns.Add("Num", typeof(int));

        //        table2.Columns.Add("id", typeof(int));
        //        table2.Columns.Add("#", typeof(int));
        //        table2.Columns.Add("Name", typeof(string));
        //        table2.Columns.Add("Num", typeof(int));

        //        for (int i = 0; i < dt.Rows.Count; i++)
        //        {
        //            id = 0; hash = 0; Name = ""; Num = 0;
        //            id = int.Parse(dt.Rows[i]["id"].ToString());
        //            hash = int.Parse(dt.Rows[i]["#"].ToString());
        //            Name = dt.Rows[i]["Name"].ToString();
        //            Num = int.Parse(dt.Rows[i]["Num"].ToString());
        //            if (i < count)
        //            {
        //                table1.Rows.Add(id, hash, Name, Num);
        //            }
        //            else
        //            {
        //                table2.Rows.Add(id, hash, Name, Num);
        //            }
        //        }
                grdinsident1.DataSource = dt;
                grdinsident1.DataBind();

                grdinsident2.DataSource = dt;
                grdinsident2.DataBind();
            }

            //grdinsident1.DataSource = table1;
            //grdinsident1.DataBind();

            //grdinsident2.DataSource = table2;
            //grdinsident2.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = int.Parse(grdinsident1.DataKeys[row.RowIndex].Value.ToString());
            if (id != 0)
            {
                /* 
                 * can use either Server.Transfer or Response.Redirect 
                 * Server.Transfer - url won't change
                 * Response.Redirect - url will change
                */
                Response.Redirect("~/state/detail_incident.aspx");

                //Server.Transfer("~/state/detail_incident.aspx");
            }
        }
    }
}