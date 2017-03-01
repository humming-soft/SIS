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
            final.Columns.Add("comments", typeof(string));

            if (dt.Rows.Count > 0)
            {

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string base64String = "";
                    byte[] bytes = (byte[])dt.Rows[i]["image"];
                    if (bytes.Length > 0)
                    {
                        base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    }
                    else
                    {
                        base64String = "/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxEQDg8QDw4RDhAQEA8QDxAOFRkPDxAPFhYWFhUSExUYHiggGBooJxUTITEhJSktLi4uFx8/ODMtNygtLisBCgoKDQ0NGg0NGisZExkrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAMAArwMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABgcBBAUDAv/EADcQAAIBAgIJAgUCBAcAAAAAAAABAgMRBBIFBhMhMUFRUpFhcSKBobHBMoJiktHhFBYjQmNyc//EABUBAQEAAAAAAAAAAAAAAAAAAAAB/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8AskAFQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHxVqRhFyk1GK4t7kcLG6zRTapQz/AMU/hXyXFgSAEMnrBiHwlGPpGK/JmGsOIXGUZe8V+AJkCJ/5jndPIk1xUW8k1zTT4P1TN7R+sFPI1Vk01JqLtdyhybtz5Ad4HjhsVCqr05qS9OK90ewAAAAAAAAAAAAAAAAA18di40abnPguCXGT5JGwRDWfF562RP4aSt+572/sgNHSGkJ15Zpvcv0xX6Y+3r6mqAUAAAMxk0002mndNbncwAJhq/pR14yjPfUhbf3R6+51yF6uVcuJh/Fmg/mrr7E0IAAAAAAAAAAAAAAAACK+xlVTqTklZSlJ73d8eLLBK6qRyyafFNp/J2A+QAUAAAAAG1op2xFH/wBYfcnpAtFRviKK/wCWH0d/wT0gAAAAAAAAAAAAAAAAEI08of4mpkfF/FytPnYm5CdYaeXFVPXLLyl/cDnAAoAAAAAOrq1CLxMcz3pScVbjK305kyIhqtTviG+2En5siXkAAAAAAAAAAAAAAAAAietsLV4S7qa8pv8AqiWGrpSkpUKqsm9nO3o7cvAECABQAAAAWAkWp8N9aXRQj897f4JKfFGmoxSSSsle27fY+yAAAAAAAAAAAAAAAAAYlG6afNNeTIArqpTcZOL3OLaa9VuPk7WtdOKrxaSvKF5W63auzilAAADY0fRc61KCV7zjf2Tu/oma5ItUKcW6smlmWVLqk73t4QElYAIAAAAAAAAAAAAAAAAB81JqKcpNJJXbe5JGvjNIUqX65pPtW+XhEY01ph17RgnCmt7T4yfV/wBANDHYjaValTuk2vbl9LHgAUAAAN7QmKVLEQk3aL+GT6RfP7GiALGTMkU0Lp3ZR2dVOUF+iS3uK6W5okmFxlOqr05qXouK91xIPcAAAAAAAAA8MZi4Uo56krLh1bfRID3PmpNRV5NRS4uTsiM4zWaT3UoKC7p/FLxwX1OJiMROo71Jub5ZuXsuQEqxmsdKG6CdV+nwx8s4eM05WqXWbZxf+2nu+vE5oAAAoAAAAAAAAGYtppp2a4NbmvZmAB1cHrBWp7pNVV0n+r+Y7uD0/RqbpN0pdJ8P5iGggsaLuk07p8Gt6fszJX+ExlSk/wDTm49Ut8X7rgzuYPWflWp/vp/mL/DAkgPPD141IqcJZovg0egAiGtOJzV1BcKcbfue9/jwS2pNRi5PhFNv2SuV7Wquc5TfGUnJ/MD4ABQAAAAAAAAAAAAAAAAAAAAASHVHE2lUpPg1nj7rc/x4JMQHRmI2denPkpJS/wCr3P7k+IOVrLiMmGkr2c2oL24v7EMzLqix3FPik/dXMbNdsfCArnMuqGZdUWNs12x8IbNdsfCArnMuqGZdUWNs12x8IbNdsfCArnMuqGZdUWNs12x8IbNdsfCArnMuqGZdUWNs12x8IbNdsfCArnMuqGZdUWNs12x8IbNdsfCArnMuqGZdUWNs12x8IbNdsfCArnMuqGZdUWNs12x8IbNdsfCArnMuqGZdUWNs12x8IbNdsfCArnMuqGZdUWNs12x8IbNdsfCArnMuqJ5ojEbTD05Xu8tn7rc/sbWRdsfCMpW4K3tuA//Z";
                    }
                    cand_image = "data:image/png;base64," + base64String;               
                    final.Rows.Add(dt.Rows[i]["name"].ToString(), cand_image, dt.Rows[i]["choice_no_name"].ToString(), dt.Rows[i]["occupation"].ToString(), dt.Rows[i]["political_post"].ToString(), dt.Rows[i]["party_shortcode"].ToString(), dt.Rows[i]["education"].ToString(), dt.Rows[i]["election_id"].ToString(), dt.Rows[i]["election_name"].ToString(),dt.Rows[i]["comments"].ToString());
                }

                lblelection.Text = dt.Rows[0]["election_name"].ToString();
                DataList1.DataSource = final;
                DataList1.DataBind();
            }
        }

        //[WebMethod]
        //public static List<Candidate> fill_candidates(int areaid)
        //{
        //    List<Candidate> candidate = new List<Candidate>();
        //    bus_sis_ugc1 buspar = new bus_sis_ugc1();
        //    buspar.areaid = areaid;
        //    DataTable dt = buspar.fill_candidates();
        //    if (dt.Rows.Count > 0)
        //    {
        //        for (int i = 0; i < dt.Rows.Count; i++)
        //        {
        //            Candidate _Candidate = new Candidate();
        //            _Candidate.name = dt.Rows[i]["name"].ToString();
        //            _Candidate.imag = dt.Rows[i]["image"].ToString();
        //            _Candidate.choice = dt.Rows[i]["choice_no_name"].ToString();
        //            _Candidate.job = dt.Rows[i]["occupation"].ToString();
        //            _Candidate.position = dt.Rows[i]["political_post"].ToString();
        //            _Candidate.education = dt.Rows[i]["education"].ToString();
        //            _Candidate.comment = dt.Rows[i]["election_id"].ToString();
        //            _Candidate.ename = dt.Rows[i]["election_name"].ToString();
        //            candidate.Add(_Candidate);
        //        }
        //        return candidate;
        //    }
        //    else
        //    {
        //        return null;
        //    }
        //}
    }
}