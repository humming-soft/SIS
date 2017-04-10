using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SIS_B;

namespace SIS_V.state
{
    public partial class result_desc : System.Web.UI.Page
    {
        bus_sis_ugc3 objBus = new bus_sis_ugc3();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                norec_1.Visible = false;
                norec_2.Visible = false;
                CheckIsLogin();
            }
        }
        protected void CheckIsLogin()
        {
            if (Session["is_login"] != null)
            {
                if (Session["is_login"].ToString() == "f")
                {
                    Response.Redirect("~/Login");
                }
                else
                {

                    lbl_state_name.Text = (int.Parse(Session["area_type"].ToString()) == 1) ? "PARLIMEN NEGERI " + Session["statename"].ToString() : "DUN NEGERI " + Session["statename"].ToString();
                    lbl_ele_name.Text = Session["election"].ToString();
                    objBus.coalition_id = int.Parse(Session["coalition_id"].ToString());
                    objBus.area_type = int.Parse(Session["area_type"].ToString());
                    objBus.state_id = int.Parse(Session["state"].ToString());
                    objBus.elec_id = int.Parse(Session["election_id"].ToString());
                    fill_scoresheet();
                }
            }
            else
            {
                Response.Redirect("~/Login");
            }
        }
        public void fill_scoresheet()
        {
            DataSet ds = objBus.fill_scoresheet();
            if (ds.Tables[0].Rows.Count == 0)
            {
                norec_1.Visible = true;
                norec_2.Visible = true;
            }
            else
            {
                string per="00.00%";
                double percentage;
                double tot_vote;
                double turnout_vote;
                string total_vote1;
                string turnout_vote1;
                string accepted_vote1;
                string unreturned_vote1;
                string spoilt_vote1;
                string majority_incumbent1;
                ds.Tables[0].Columns.Add("perccetage", typeof(string));
                ds.Tables[0].Columns.Add("total_vote1", typeof(string));
                ds.Tables[0].Columns.Add("turnout_vote1", typeof(string));
                ds.Tables[0].Columns.Add("accepted_vote1", typeof(string));
                ds.Tables[0].Columns.Add("unreturned_vote1", typeof(string));
                ds.Tables[0].Columns.Add("spoilt_vote1", typeof(string));
                ds.Tables[0].Columns.Add("majority_incumbent1", typeof(string));
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        total_vote1 = (ds.Tables[0].Rows[i]["total_vote"].ToString() == "" || int.Parse(ds.Tables[0].Rows[i]["total_vote"].ToString()) <= 0) ? "0" : String.Format("{0:n0}", int.Parse(ds.Tables[0].Rows[i]["total_vote"].ToString()));
                        turnout_vote1 = (ds.Tables[0].Rows[i]["turnout_vote"].ToString() == "" || int.Parse(ds.Tables[0].Rows[i]["turnout_vote"].ToString()) <= 0) ? "0" : String.Format("{0:n0}", int.Parse(ds.Tables[0].Rows[i]["turnout_vote"].ToString()));
                        accepted_vote1 = (ds.Tables[0].Rows[i]["accepted_vote"].ToString() == "" || int.Parse(ds.Tables[0].Rows[i]["accepted_vote"].ToString()) <= 0) ? "0" : String.Format("{0:n0}", int.Parse(ds.Tables[0].Rows[i]["accepted_vote"].ToString()));
                        unreturned_vote1 = (ds.Tables[0].Rows[i]["unreturned_vote"].ToString() == "" || int.Parse(ds.Tables[0].Rows[i]["unreturned_vote"].ToString()) <= 0) ? "0" : String.Format("{0:n0}", int.Parse(ds.Tables[0].Rows[i]["unreturned_vote"].ToString()));
                        spoilt_vote1 = (ds.Tables[0].Rows[i]["spoilt_vote"].ToString() == "" || int.Parse(ds.Tables[0].Rows[i]["spoilt_vote"].ToString()) <= 0) ? "0" : String.Format("{0:n0}", int.Parse(ds.Tables[0].Rows[i]["spoilt_vote"].ToString()));
                        majority_incumbent1 = (ds.Tables[0].Rows[i]["majority_incumbent"].ToString() == "" || int.Parse(ds.Tables[0].Rows[i]["majority_incumbent"].ToString()) <= 0) ? "0" : String.Format("{0:n0}", int.Parse(ds.Tables[0].Rows[i]["majority_incumbent"].ToString())); 
                        tot_vote=0.00;
                        turnout_vote=0.00;
                        if (ds.Tables[0].Rows[i]["total_vote"].ToString() == "" && ds.Tables[0].Rows[i]["turnout_vote"].ToString() == ""  )
                        {
                            tot_vote = 0.00;
                            turnout_vote = 0.00;
                        }
                        else
                        {
                            if (ds.Tables[0].Rows[i]["total_vote"].ToString() == "" || int.Parse(ds.Tables[0].Rows[i]["total_vote"].ToString()) < 0)
                            {
                                tot_vote = 0.00;
                            }
                            else
                            {
                                tot_vote = double.Parse(ds.Tables[0].Rows[i]["total_vote"].ToString());
                            }
                            if (ds.Tables[0].Rows[i]["turnout_vote"].ToString() == "" || int.Parse(ds.Tables[0].Rows[i]["turnout_vote"].ToString()) < 0)
                            {
                                turnout_vote = 0.00;
                            }
                            else
                            {
                                turnout_vote = double.Parse(ds.Tables[0].Rows[i]["turnout_vote"].ToString());
                            }
                        }
                        percentage = ((turnout_vote / tot_vote) * 100);
                        per = Math.Round(Convert.ToDecimal(percentage), 1).ToString() + "%";
                        ds.Tables[0].Rows[i]["perccetage"] = per;
                        ds.Tables[0].Rows[i]["total_vote1"] = total_vote1;
                        ds.Tables[0].Rows[i]["turnout_vote1"] = turnout_vote1;
                        ds.Tables[0].Rows[i]["accepted_vote1"] = accepted_vote1;
                        ds.Tables[0].Rows[i]["unreturned_vote1"] = unreturned_vote1;
                        ds.Tables[0].Rows[i]["spoilt_vote1"] = spoilt_vote1;
                        ds.Tables[0].Rows[i]["majority_incumbent1"] = majority_incumbent1;

                    }
                }
                dtlst_scoresheet.DataSource = ds.Tables[0];
                dtlst_scoresheet.DataBind();
                dtlst_gazetted.DataSource = ds.Tables[0];
                dtlst_gazetted.DataBind();
            }
        }
        protected void dtlst_scoresheet_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                DataTable lstResult = new DataTable();
                string diff = "";
                lstResult.Columns.Add("candidate_name", typeof(string));
                lstResult.Columns.Add("party_shortcode", typeof(string));
                lstResult.Columns.Add("coalition_shortcode", typeof(string));
                lstResult.Columns.Add("vote", typeof(string));
                lstResult.Columns.Add("difference_result", typeof(string));
                DataRowView drv = e.Item.DataItem as DataRowView;
                DataList dtlst_scoresheet_others = e.Item.FindControl("dtlst_scoresheet_others") as DataList;
                DataTable tempdt = new DataTable();
                tempdt = drv.CreateChildView("election_relation").ToTable();
                if (tempdt.Rows.Count > 0)
                {
                    for (int i = 0; i < tempdt.Rows.Count; i++)
                    {
                       
                        if (tempdt.Rows[i]["dif"].ToString() == "")
                        {
                            diff = "";
                        }
                        else
                        {
                            diff = "(Majority : " + tempdt.Rows[i]["dif"].ToString() + ") : Pemenang.";
                        }
                        lstResult.Rows.Add(tempdt.Rows[i]["c_name"].ToString(), tempdt.Rows[i]["p_short_code"].ToString(),
                             tempdt.Rows[i]["c_short_code"].ToString(), tempdt.Rows[i]["vote"].ToString(), diff);
                    }

                }
                 dtlst_scoresheet_others.DataSource = lstResult;
                 dtlst_scoresheet_others.DataBind();
            }
        }
    }
}