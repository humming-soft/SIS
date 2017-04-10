using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;
using System.Data;
using System.Web.Services;

namespace SIS_V.state
{
    public partial class election_result : System.Web.UI.Page
    {
        bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            invalid.Visible = false;
            valid.Visible = false;
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
                    txtPil.Text = Session["election"].ToString();
                    txtNegeri.Text = Session["statename"].ToString();
                    fill_area();
                    btnPadam.Visible = false;
                    //BindColumnToGridview();
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

        public void fill_area()
        {
            objBUS.state_id = int.Parse(Session["state"].ToString());
            dt = objBUS.GetArea();
            if (dt.Rows.Count > 0)
            {
                ddlArea.DataSource = dt;
                ddlArea.DataBind();
                ddlArea.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }
        }

        //[WebMethod]
        //public static List<Penyandang> GetPenyandang(int area_id, int election_id)
        //{
        //    List<Penyandang> penyandang = new List<Penyandang>();
        //    bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        //    objBUS.area_id = area_id;
        //    objBUS.election_id = election_id;
        //    DataTable dt = objBUS.GetPenyandang();
        //    for (int i = 0; i < dt.Rows.Count; i++)
        //    {
        //        Penyandang _Penyandang = new Penyandang();
        //        _Penyandang.winner_name = dt.Rows[i]["winner_name"].ToString();
        //        penyandang.Add(_Penyandang);
        //    }
        //    return penyandang;
        //}

        //private void BindColumnToGridview()
        //{
        //    DataTable dt = new DataTable();
        //    dt.Columns.Add("election_result_id");
        //    dt.Columns.Add("candidate_id");
        //    dt.Columns.Add("candidate_name");
        //    dt.Columns.Add("party_id");
        //    dt.Columns.Add("party_shortcode");
        //    dt.Columns.Add("coalition_id");
        //    dt.Columns.Add("no_of_vote");
        //    dt.Rows.Add();
        //    CanDetails.DataSource = dt;
        //    CanDetails.DataBind();
        //    //CanDetails.Rows[0].Visible = false;
        //}

        //[WebMethod]
        //public static ElectionCandidate[] GetCandidate(int area_id, int election_id)
        //{
        //    DataTable dt = new DataTable();
        //    List<ElectionCandidate> details = new List<ElectionCandidate>();
        //    bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        //    objBUS.area_id = area_id;
        //    objBUS.election_id = election_id;
        //    dt = objBUS.GetElectionCandidate();
        //            foreach (DataRow dtrow in dt.Rows)
        //            {
        //                ElectionCandidate can = new ElectionCandidate();
        //                can.candidate_name = dtrow["candidate_name"].ToString();
        //                can.party_shortcode = dtrow["party_shortcode"].ToString();
        //                can.candidate_id = int.Parse(dtrow["candidate_id"].ToString());
        //                can.election_result_id = int.Parse(dtrow["election_result_id"].ToString());
        //                can.party_id = int.Parse(dtrow["party_id"].ToString());
        //                can.coalition_id = int.Parse(dtrow["coalition_id"].ToString());
        //                can.no_of_vote = int.Parse(dtrow["no_of_vote"].ToString());
        //                details.Add(can);
        //            }
        //    return details.ToArray();
        //}
        protected void CanDetails_PreRender(object sender, EventArgs e)
        {
            if (CanDetails.Rows.Count > 0)
            {
                CanDetails.UseAccessibleHeader = true;
                CanDetails.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        //protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(CanDetails, "Select$" + e.Row.RowIndex);
        //        e.Row.ToolTip = "Click to select this row.";
        //    }
        //}

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                // Hiding the Select Button Cell in Header Row.
                e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Hiding the Select Button Cells showing for each Data Row. 
                e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");

                // Attaching one onclick event for the entire row, so that it will
                // fire SelectedIndexChanged, while we click anywhere on the row.
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.CanDetails, "Select$" + e.Row.RowIndex);
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ddlName.SelectedIndex = 0;
            foreach (GridViewRow row in CanDetails.Rows)
            {
                if (row.RowIndex == CanDetails.SelectedIndex)
                {
                    txtCanName.Text = row.Cells[1].Text + " - " + row.Cells[2].Text;
                    Session["election_res_id"] = row.Cells[3].Text;
                    Session["can_id"] = row.Cells[4].Text;
                    btnPadam.Visible = true;
                }
                else
                {
                }
            }
        }
        //protected void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    if (ddlArea.SelectedIndex != 0)
        //    {
        //        invalid.Visible = false;
        //        fill_candidate();
        //        fill_cand_list();
        //        fill_search_list();
        //    }
        //    else
        //    {
        //        CanDetails.DataSource = null;
        //        CanDetails.DataBind();
        //        txtCanName.Text = "";
        //        btnPadam.Visible = false;
        //        invalid.Visible = true;
        //        lblinvalid.Text = "Anda mempunyai beberapa kesilapan dalam pengisian borang. Sila isikan butiran yang diperlukan !";

        //    }
        //}

        protected void ddlArea_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlArea.SelectedIndex != 0)
            {
                invalid.Visible = false;
                fill_candidate();
                fill_cand_list();
                fill_search_list();
            }
            else
            {
                CanDetails.DataSource = null;
                CanDetails.DataBind();
                txtCanName.Text = "";
                btnPadam.Visible = false;
                lblPen.Text = "";
                ddlName.SelectedIndex = 0;
                invalid.Visible = true;
                lblinvalid.Text = "Sila isi Kawasan!";

            }
        }
        protected void fill_candidate()
        {
            DataTable dt_can = new DataTable();
            objBUS.area_id = int.Parse(ddlArea.SelectedValue);
            objBUS.election_id = int.Parse(Session["election_id"].ToString());
            dt_can = objBUS.GetPenyandang();
            if (dt_can.Rows.Count > 0)
            {
                lblPen.Text = dt_can.Rows[0]["winner_name"].ToString();
            }
        }
        protected void fill_cand_list()
        {
            DataTable dt_cand_list = new DataTable();
            objBUS.area_id = int.Parse(ddlArea.SelectedValue);
            objBUS.election_id = int.Parse(Session["election_id"].ToString());
            dt_cand_list = objBUS.GetElectionCandidate();
            if (dt_cand_list.Rows.Count > 0)
            {
                CanDetails.DataSource = dt_cand_list;
                CanDetails.DataBind();
                //CanDetails.Columns[2].Visible = false;
                //CanDetails.Columns[3].Visible = false;
            }
            else
            {
                CanDetails.DataSource = null;
                CanDetails.DataBind();
                txtCanName.Text = "";
                invalid.Visible = true;
                lblinvalid.Text = "Maklumat calon kawasan yang dipilih tidak availabe. Sila masukkan butiran !";
            }
        }
        protected void fill_search_list()
        {
            DataTable dt_cand_name = new DataTable();
            dt_cand_name = objBUS.GetAllCandidateNames();
            if (dt_cand_name.Rows.Count > 0)
            {
                ddlName.DataSource = dt_cand_name;
                ddlName.DataBind();
                ddlName.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }
        }
        protected void ddlName_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            invalid.Visible = false;
            valid.Visible = false;
            objBUS.area_id = int.Parse(ddlArea.SelectedValue);
            objBUS.election_id = int.Parse(Session["election_id"].ToString());
            int chk = objBUS.InsertElectionResult();
            if (chk != -1)
            {
                int election_result_id = chk;
                objBUS.election_result_id = election_result_id;
                objBUS.candidate_id = int.Parse(ddlName.SelectedValue);
                int res = objBUS.InsertElectionResultCandidateVal();
                if (res != -1)
                {
                    DataTable dt_cand_list = new DataTable();
                    dt_cand_list = objBUS.GetElectionCandidate();
                    if (dt_cand_list.Rows.Count > 0)
                    {
                        CanDetails.DataSource = dt_cand_list;
                        CanDetails.DataBind();
                        //CanDetails.Columns[2].Visible = false;
                        //CanDetails.Columns[3].Visible = false;
                        string[] stringSeparators = new string[] {"~~"};
                        string[] words = ddlName.SelectedItem.ToString().Split(stringSeparators, StringSplitOptions.None);
                        txtCanName.Text = "";
                        txtCanName.Text = words[0] + " - " + words[2];
                    }
                    valid.Visible = true;
                    lblvalid.Text = "Calon berjaya diletakkan !";
                }
                else
                {
                    invalid.Visible = true;
                    lblinvalid.Text = "Calon sudah wujud di kawasan lain !";
                }
            }
        }
        protected void btnPadam_Click(object sender, EventArgs e)
        {
            invalid.Visible = false;
            if ((Session["election_res_id"].ToString() != "") && (Session["can_id"].ToString() != ""))
            {
                ddlName.SelectedIndex = 0;
                objBUS.election_result_id = int.Parse(Session["election_res_id"].ToString());
                objBUS.candidate_id = int.Parse(Session["can_id"].ToString());
                int result = objBUS.DeleteElectionResultCandidate();
                if (result != -1)
                {
                    valid.Visible = true;
                    lblvalid.Text = "Calon berjaya dipadamkan !";
                    txtCanName.Text = "";
                    //
                    DataTable dt_cand_list = new DataTable();
                    objBUS.area_id = int.Parse(ddlArea.SelectedValue);
                    objBUS.election_id = int.Parse(Session["election_id"].ToString());
                    dt_cand_list = objBUS.GetElectionCandidate();
                    if (dt_cand_list.Rows.Count > 0)
                    {
                        CanDetails.DataSource = dt_cand_list;
                        CanDetails.DataBind();
                        //CanDetails.Columns[2].Visible = false;
                        //CanDetails.Columns[3].Visible = false;
                    }
                    else
                    {
                        CanDetails.DataSource = null;
                        CanDetails.DataBind();
                        txtCanName.Text = "";
                        btnPadam.Visible = false;
                    }
                    //
                }
                else
                {
                    invalid.Visible = true;
                    lblinvalid.Text = "Tidak dapat membuang calon. Sila cuba lagi !";
                }
            }
        }

    }
}