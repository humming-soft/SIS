using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;
using System.Data;

namespace SIS_V.hq
{
    public partial class HQ_Detail_Incident : System.Web.UI.Page
    {
        int id, state;
        int state_id;
        bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        bus_sis_ugc3 bus = new bus_sis_ugc3();
        DataTable activity = new DataTable();
        DataTable isu = new DataTable();
        DataTable janji = new DataTable();
        DataTable insiden = new DataTable();
        int number;
        string issue;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                log_activity.Visible = false;
                log_isu.Visible = false;
                log_janji.Visible = false;
                log_insiden.Visible = false;
                CheckIsLogin();
            }
        }
        protected void CheckIsLogin()
        {
            if (Session["is_login"] != null)
            {
                if (Session["is_login"].ToString() == "t")
                {
                    state_id = int.Parse(Session["state"].ToString());
                    id = int.Parse(Session["area"].ToString());
                    state = int.Parse(Session["state"].ToString());
                    fill_kod_kawasan();
                    fill_maklumat_kawasan();
                    fill_calon();
                    fill_masalah_dalaman_parti();
                    fill_keluar_mengundi();
                    fill_semasa();
                    fill_comment();
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
        public void fill_kod_kawasan()
        {
            objBUS.state_id = state;
            DataTable dt = objBUS.fill_kod_kawasan();
            if (dt.Rows.Count > 0)
            {
                grid_kodkawasan.DataSource = dt;
                grid_kodkawasan.DataBind();
            }
        }
        public void fill_maklumat_kawasan()
        {
            bus.area_id = id;
            DataTable dt = bus.fill_maklumat_kawasan();
            if (dt.Rows.Count > 0)
            {
                lbl_area_code.Text = dt.Rows[0]["area_code"].ToString();
                lbl_area_name.Text = dt.Rows[0]["area_name"].ToString();
                lbl_no_voters.Text = dt.Rows[0]["total_vote"].ToString();
                lbl_majority.Text = dt.Rows[0]["winner_majority"].ToString();
                lbl_percent_vote.Text = dt.Rows[0]["percent_vote"].ToString();
                lbl_spoilt_vote.Text = dt.Rows[0]["spoilt_vote"].ToString();
                lbl_winner.Text = dt.Rows[0]["winner_name"].ToString();
                lbl_raceFragment.Text = dt.Rows[0]["race_fragment"].ToString();
                lbl_status.Text = dt.Rows[0]["color"].ToString();
            }
        }
        public void fill_calon()
        {
            bus.area_id = id;
            DataTable dt = bus.fill_calon();
            if (dt.Rows.Count > 0)
            {
                lbl_name.Text = dt.Rows[0]["name"].ToString();
                lbl_job.Text = dt.Rows[0]["occupation"].ToString();
                lbl_political_pos.Text = dt.Rows[0]["political_post"].ToString();
                lbl_education.Text = dt.Rows[0]["education"].ToString();
                byte[] bytes = (byte[])dt.Rows[0]["image"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                img_candidate.ImageUrl = "data:image/png;base64," + base64String;
            }
        }
        public void fill_keluar_mengundi()
        {
            bus.area_id = id;
            DataTable dt = bus.fill_keluar_mengundi();
            if (dt.Rows.Count > 0)
            {
                lbl_perc.Text = dt.Rows[0]["percent_turnout_vote"].ToString() + "%";
            }
        }
        public void fill_semasa()
        {
            int activity_id;
            bus.area_id = id;
            DataTable dt = bus.fill_semasa();

            activity.Columns.Add("number", typeof(int));
            activity.Columns.Add("issue", typeof(string));

            isu.Columns.Add("number", typeof(int));
            isu.Columns.Add("issue", typeof(string));

            janji.Columns.Add("number", typeof(int));
            janji.Columns.Add("issue", typeof(string));

            insiden.Columns.Add("number", typeof(int));
            insiden.Columns.Add("issue", typeof(string));
            int a_count = 1;
            int i_count = 1;
            int j_count = 1;
            int in_count = 1;
            for (int j = 0; j < dt.Rows.Count; j++)
            {
                activity_id = int.Parse(dt.Rows[j]["activity_id"].ToString());
                if (activity_id != 6 && activity_id != 10 && activity_id != 14)
                {
                    number = a_count;
                    issue = dt.Rows[j]["details"].ToString();
                    activity.Rows.Add(number, issue);
                    a_count++;
                }

                if (activity_id == 6)
                {
                    number = i_count;
                    issue = dt.Rows[j]["details"].ToString();
                    isu.Rows.Add(number, issue);
                    i_count++;
                }
                if (activity_id == 14)
                {
                    number = j_count;
                    issue = dt.Rows[j]["details"].ToString();
                    janji.Rows.Add(number, issue);
                    j_count++;
                }
                if (activity_id == 10)
                {
                    //number = int.Parse(dt.Rows[j]["#"].ToString());
                    number = in_count;
                    issue = dt.Rows[j]["details"].ToString();
                    insiden.Rows.Add(number, issue);
                    in_count++;
                }
            }
            if (activity.Rows.Count > 0)
            {
                activity_scroll.Visible = true;
                grid_activity.DataSource = activity;
                grid_activity.DataBind();
            }
            else
            {
                log_activity.Visible = true;
                activity_scroll.Visible = false;
            }
            if (isu.Rows.Count > 0)
            {
                isu_scroll.Visible = true;
                grid_isu.DataSource = isu;
                grid_isu.DataBind();
            }
            else
            {
                log_isu.Visible = true;
                isu_scroll.Visible = false;
            }
            if (janji.Rows.Count > 0)
            {
                janji_scroll.Visible = true;
                grid_janji.DataSource = janji;
                grid_janji.DataBind();
            }
            else
            {
                log_janji.Visible = true;
                janji_scroll.Visible = false;
            }
            if (insiden.Rows.Count > 0)
            {
                insiden_scroll.Visible = true;
                grid_insiden.DataSource = insiden;
                grid_insiden.DataBind();
            }
            else
            {
                log_insiden.Visible = true;
                insiden_scroll.Visible = false;
            }

        }
        public void fill_masalah_dalaman_parti()
        {
            string issue = null;
            bus.state_id = state;
            DataTable dt = bus.fill_masalah_dalaman_parti();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (i == dt.Rows.Count - 1)
                    {
                        issue += dt.Rows[i]["issue_name"].ToString();
                    }
                    else
                    {
                        issue += dt.Rows[i]["issue_name"].ToString() + ",";
                    }
                }
                lbl_issue.Text = issue;
            }
        }
        public void fill_comment()
        {
            bus.area_id = id;
            DataTable dt = bus.fill_comment();
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["comment"].ToString() == "")
                {
                    lbl_justification.Text = "Tiada Data";
                }
                else
                {
                    lbl_justification.Text = dt.Rows[0]["comment"].ToString();
                }
            }
            else
            {
                lbl_justification.Text = "Tiada Data";
            }
        }

        protected void grid_kodkawasan_PreRender(object sender, EventArgs e)
        {
            if (grid_kodkawasan.Rows.Count > 0)
            {
                grid_kodkawasan.UseAccessibleHeader = true;
                grid_kodkawasan.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void grid_activity_PreRender(object sender, EventArgs e)
        {
            if (grid_activity.Rows.Count > 0)
            {
                grid_activity.UseAccessibleHeader = true;
                grid_activity.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void link_area_name_sktwo_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = int.Parse(grid_kodkawasan.DataKeys[row.RowIndex].Value.ToString());
            Session["area"] = id;
            Response.Redirect("detail_incident");
        }

        protected void grid_isu_PreRender(object sender, EventArgs e)
        {
            if (grid_isu.Rows.Count > 0)
            {
                grid_isu.UseAccessibleHeader = true;
                grid_isu.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void grid_janji_PreRender(object sender, EventArgs e)
        {
            if (grid_janji.Rows.Count > 0)
            {
                grid_janji.UseAccessibleHeader = true;
                grid_janji.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void grid_insiden_PreRender(object sender, EventArgs e)
        {
            if (grid_insiden.Rows.Count > 0)
            {
                grid_insiden.UseAccessibleHeader = true;
                grid_insiden.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}