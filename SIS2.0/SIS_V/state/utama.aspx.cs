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
        int count, id, Num, count1, id1;
        string Name, Name1, ciname1;
        DataTable dt = new DataTable();
        DataTable table1 = new DataTable();
        DataTable table2 = new DataTable();

        DataTable dtisu = new DataTable();
        DataTable isu1 = new DataTable();
        DataTable isu2 = new DataTable();
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
                    jumlah_insiden();
                    isu_utama();
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
                count = dt.Rows.Count / 2;
                if (dt.Rows.Count == 1)
                {
                    ins1.Attributes["class"] = "col-xs-12 col-sm-6 col-md-6 col-lg-12 rest-height-250 mCustomScrollbar m-b-15";
                    ins2.Attributes["style"] = "height: 250px; overflow-y: auto;display:none";
                }

                table1.Columns.Add("id", typeof(int));
                table1.Columns.Add("Area", typeof(string));
                table1.Columns.Add("Num", typeof(string));

                table2.Columns.Add("id", typeof(int));
                table2.Columns.Add("Area", typeof(string));
                table2.Columns.Add("Num", typeof(string));

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    id = 0; Name = ""; Num = 0;
                    id = int.Parse(dt.Rows[i]["id"].ToString());
                    Name = dt.Rows[i]["aname"].ToString();
                    Num = int.Parse(dt.Rows[i]["Num"].ToString());
                    if (i < count)
                    {
                        table1.Rows.Add(id, Name, Num);
                    }
                    else if (i >= count && i < (count * 2))
                    {
                        table2.Rows.Add(id, Name, Num);
                    }
                    else
                    {
                        if (dt.Rows.Count == 1)
                        {
                            table1.Rows.Add(id, Name, Num);
                        }
                        else if (dt.Rows.Count == 2)
                        {
                            if (i == 0)
                            {
                                table1.Rows.Add(id, Name, Num);
                            }
                            else
                            {
                                table2.Rows.Add(id, Name, Num);
                            }

                        }
                        else
                        {
                            table1.Rows.Add(id, Name, Num);
                        }
                    }

                }
                grdinsident1.DataSource = table1;
                grdinsident1.DataBind();

                grdinsident2.DataSource = table2;
                grdinsident2.DataBind();
            }
            else
            {

            }
        }

        protected void lnkgrdinsid1_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = int.Parse(grdinsident1.DataKeys[row.RowIndex].Value.ToString());
            if (id != 0)
            {
                Session["area"] = id;
                Session["utype"] = "insident";
                Response.Redirect("~/state/detail_info");
            }
        }
        protected void lnkgrdinsid2_Click(object sender, EventArgs e)
        {
            LinkButton lnk1 = sender as LinkButton;
            GridViewRow row = lnk1.NamingContainer as GridViewRow;
            int id1 = int.Parse(grdinsident2.DataKeys[row.RowIndex].Value.ToString());
            if (id1 != 0)
            {
                Session["area"] = id1;
                Session["utype"] = "insident";
                Response.Redirect("~/state/detail_info");
            }
        }
        public void isu_utama()
        {
            bus1.stateid = int.Parse(Session["state"].ToString());
            dtisu = bus1.isu_utama();
            if (dtisu.Rows.Count > 0)
            {
                count1 = dtisu.Rows.Count / 2;
                if (dtisu.Rows.Count == 1)
                {
                    issu1.Attributes["class"] = "col-xs-12 col-sm-6 col-md-6 col-lg-12 rest-height-250 mCustomScrollbar m-b-15";
                    issu2.Attributes["style"] = "height: 250px; overflow-y: auto;display:none";
                }

                isu1.Columns.Add("id1", typeof(int));
                isu1.Columns.Add("Name1", typeof(string));
                isu1.Columns.Add("ciname1", typeof(string));

                isu2.Columns.Add("id1", typeof(int));
                isu2.Columns.Add("Name1", typeof(string));
                isu2.Columns.Add("ciname1", typeof(string));

                for (int i = 0; i < dtisu.Rows.Count; i++)
                {
                    id1 = 0; Name1 = ""; ciname1 = "";
                    id1 = int.Parse(dtisu.Rows[i]["area_id"].ToString());
                    Name1 = dtisu.Rows[i]["name"].ToString();
                    ciname1 = dtisu.Rows[i]["ciname"].ToString();
                    if (i < count1)
                    {
                        isu1.Rows.Add(id1, Name1, ciname1);
                    }
                    else if (i >= count1 && i < (count1 * 2))
                    {
                        isu2.Rows.Add(id1, Name1, ciname1);
                    }
                    else
                    {
                        if (dtisu.Rows.Count == 1)
                        {
                            isu1.Rows.Add(id1, Name1, ciname1);
                        }
                        else if (dtisu.Rows.Count == 2)
                        {
                            if (i == 0)
                            {
                                isu1.Rows.Add(id1, Name1, ciname1);
                            }
                            else
                            {
                                isu2.Rows.Add(id1, Name1, ciname1);
                            }

                        }
                        else
                        {
                            isu1.Rows.Add(id1, Name1, ciname1);
                        }
                    }

                }
                grdisu1.DataSource = isu1;
                grdisu1.DataBind();

                grdisu2.DataSource = isu2;
                grdisu2.DataBind();
            }
            else
            {

            }
        }

        protected void lnkisu1_Click(object sender, EventArgs e)
        {
            LinkButton lnk2 = sender as LinkButton;
            GridViewRow row = lnk2.NamingContainer as GridViewRow;
            int id2 = int.Parse(grdisu1.DataKeys[row.RowIndex].Value.ToString());
            if (id2 != 0)
            {
                Session["area"] = id2;
                Session["utype"] = "issue";
                Response.Redirect("~/state/detail_info");
            }
        }
        protected void lnkisu2_Click(object sender, EventArgs e)
        {
            LinkButton lnk3 = sender as LinkButton;
            GridViewRow row = lnk3.NamingContainer as GridViewRow;
            int id3 = int.Parse(grdisu2.DataKeys[row.RowIndex].Value.ToString());
            if (id3 != 0)
            {
                Session["area"] = id3;
                Session["utype"] = "issue";
                Response.Redirect("~/state/detail_info");
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