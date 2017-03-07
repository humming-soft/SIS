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
    public partial class activiti_parti_add : System.Web.UI.Page
    {
        bus_sis_ugc3 bus = new bus_sis_ugc3();
        int state_id;
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
                    state_id = int.Parse(Session["state"].ToString());
                    txt_datetime.Attributes.Add("readonly", "readonly");
                    log_valid.Visible = false;
                    fill_txtNegeri();
                    fill_parlimen();
                    fill_Election();
                    fill_Party();
                    fill_InfoType();
                    fill_Drop_Sumber();
                    fill_validInfo();
                    fill_category();
                    fill_drop_sumber_isu();
                    fill_drop_status();
                    fill_drop_statusjanji();
                    fill_agency();
                    fill_pertubuhan();
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
        protected void fill_txtNegeri()
        {
            bus.state_id = int.Parse(Session["state"].ToString());
            DataTable dt = bus.fill_Negeri();
            if (dt.Rows.Count > 0)
            {
                txt_negeri.Text = dt.Rows[0]["state_name"].ToString();
            }
            else
            {

            }
        }
        protected void fill_parlimen()
        {
            DataTable dt1 = bus.fill_parlimen();
            if (dt1.Rows.Count > 0)
            {
                drop_prlimen.DataSource = dt1;
                drop_prlimen.DataBind();
                drop_prlimen.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_prlimen.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_Election()
        {
            DataTable dt1 = bus.fill_Election();
            if (dt1.Rows.Count > 0)
            {
                drop_pilihnraya.DataSource = dt1;
                drop_pilihnraya.DataBind();
                drop_pilihnraya.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_pilihnraya.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_Party()
        {
            DataTable dt1 = bus.fill_Party();
            if (dt1.Rows.Count > 0)
            {
                drop_parti.DataSource = dt1;
                drop_parti.DataBind();
                drop_parti.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_parti.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_InfoType()
        {
            DataTable dt1 = bus.fill_InfoType();
            if (dt1.Rows.Count > 0)
            {
                drop_jenis.DataSource = dt1;
                drop_jenis.DataBind();
                drop_jenis.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_jenis.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_Drop_Sumber()
        {
            DataTable dt1 = bus.fill_Drop_Sumber();
            if (dt1.Rows.Count > 0)
            {
                drop_sumber.DataSource = dt1;
                drop_sumber.DataBind();
                drop_sumber.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_sumber.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_validInfo()
        {
            DataTable dt1 = bus.fill_validInfo();
            if (dt1.Rows.Count > 0)
            {
                drop_tahap.DataSource = dt1;
                drop_tahap.DataBind();
                drop_tahap.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_tahap.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_category()
        {
            DataTable dt1 = bus.fill_category();
            if (dt1.Rows.Count > 0)
            {
                drop_category.DataSource = dt1;
                drop_category.DataBind();
                drop_category.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_category.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_drop_sumber_isu()
        {
            DataTable dt1 = bus.fill_drop_sumber_isu();
            if (dt1.Rows.Count > 0)
            {
                drop_sumbar_isu.DataSource = dt1;
                drop_sumbar_isu.DataBind();
                drop_sumbar_isu.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_sumbar_isu.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }

        protected void fill_drop_status()
        {
            DataTable dt1 = bus.fill_drop_status();
            if (dt1.Rows.Count > 0)
            {
                drop_status.DataSource = dt1;
                drop_status.DataBind();
                drop_status.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_status.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_drop_statusjanji()
        {
            DataTable dt1 = bus.fill_drop_statusjanji();
            if (dt1.Rows.Count > 0)
            {
                drop_statusjanji.DataSource = dt1;
                drop_statusjanji.DataBind();
                drop_statusjanji.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_statusjanji.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_agency()
        {
            DataTable dt1 = bus.fill_agency();
            if (dt1.Rows.Count > 0)
            {
                drop_agency.DataSource = dt1;
                drop_agency.DataBind();
                drop_agency.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_agency.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_pertubuhan()
        {
            DataTable dt1 = bus.fill_pertubuhan();
            if (dt1.Rows.Count > 0)
            {
                drop_prtubuhan.DataSource = dt1;
                drop_prtubuhan.DataBind();
                drop_prtubuhan.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_prtubuhan.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        [WebMethod]
        public static List<District> vot_district(int area_id)
        {
            List<District> distInfo = new List<District>();
            bus_sis_ugc3 bus = new bus_sis_ugc3();
            bus.area_id = area_id;
            DataTable dt = bus.DistrictInfo();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                District dist = new District();
                dist.Dist_id = int.Parse(dt.Rows[i]["polling_district_id"].ToString());
                dist.dist_name = dt.Rows[i]["polling_district_name"].ToString();
                distInfo.Add(dist);
            }
            return distInfo;
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            int flag = 0;
            if (txt_detail.Text.Trim() == "" || txt_datetime.Text.Trim() == "" || drop_prlimen.SelectedValue.ToString() == "" || drop_pilihnraya.SelectedValue.ToString() == "" ||
                drop_parti.SelectedValue.ToString() == "" || drop_jenis.SelectedValue.ToString() == "" || drop_sumber.SelectedValue.ToString() == "" || drop_tahap.SelectedValue.ToString() == "")
            {
                log_valid.Visible = true;
                flag = 1;
            }
            if (drop_jenis.SelectedValue.ToString() != "")
            {
                int act_id = int.Parse(drop_jenis.SelectedValue.ToString());
                if (act_id == 6)
                {
                    if (drop_category.SelectedValue.ToString() == "" || drop_sumbar_isu.SelectedValue.ToString() == "")
                    {
                        hd_valid.Value ="0";
                        log_valid.Visible = true;
                        flag = 1;
                    }
                }
                if (act_id == 14)
                {
                    if (drop_status.SelectedValue.ToString() == "" || drop_statusjanji.SelectedValue.ToString() == "")
                    {
                        hd_valid.Value = "1";
                        flag = 1;
                        log_valid.Visible = true;
                    }
                }
            }
            if (drop_sumbar_isu.SelectedValue.ToString()!="")
            {
                int issueid = int.Parse(drop_sumbar_isu.SelectedValue.ToString());
                if (issueid == 230)
                {
                    if (drop_agency.SelectedValue.ToString() == "")
                    {
                        hd_valid.Value = "1";
                        flag = 1;
                        log_valid.Visible = true;
                    }
                }
                if (issueid == 234)
                {
                    if (drop_prtubuhan.SelectedValue.ToString() == "")
                    {
                        hd_valid.Value = "1";
                        flag = 1;
                        log_valid.Visible = true;
                    }
                }
            }
            if (drop_statusjanji.SelectedValue.ToString() != "")
            {
                int issueid = int.Parse(drop_statusjanji.SelectedValue.ToString());
                if (issueid == 254)
                {
                    if (drop_agency.SelectedValue.ToString() == "")
                    {
                        hd_valid.Value = "1";
                        flag = 1;
                        log_valid.Visible = true;
                    }
                }
                if (issueid == 256)
                {
                    if (drop_prtubuhan.SelectedValue.ToString() == "")
                    {
                        hd_valid.Value = "1";
                        flag = 1;
                        log_valid.Visible = true;
                    }
                }
            }
            if (flag==0)
            {
                bus.state_id = int.Parse(Session["state"].ToString());
                bus.detail = txt_detail.Text.Trim();
                bus.ele_date = Convert.ToDateTime(txt_datetime.Text.Trim());
                bus.area_id = int.Parse(drop_prlimen.SelectedValue.ToString());
                bus.info_source = int.Parse(drop_sumber.SelectedValue.ToString());
                bus.info_valdity = int.Parse(drop_tahap.SelectedValue.ToString());
                if (drop_mengudi.SelectedValue.ToString() != "")
                {
                    bus.polling_District_id = int.Parse(drop_mengudi.SelectedValue.ToString());
                }
                else
                {
                    bus.polling_District_id = -1;
                }
                bus.election_id = int.Parse(drop_pilihnraya.SelectedValue.ToString());
                bus.party_id = int.Parse(drop_parti.SelectedValue.ToString());
                int activityid = int.Parse(drop_jenis.SelectedValue.ToString());
                bus.activity_id = activityid;
                if (activityid == 6)
                {
                    bus.current_issue_id = int.Parse(drop_category.SelectedValue.ToString());
                    int issue_source = int.Parse(drop_sumbar_isu.SelectedValue.ToString());
                    bus.issue_source = issue_source;
                    if (issue_source == 230)
                    {
                        bus.info_source_agency_id = int.Parse(drop_agency.SelectedValue.ToString());
                    }
                    if (issue_source == 234)
                    {
                        bus.info_source_ngo_id = int.Parse(drop_prtubuhan.SelectedValue.ToString());
                    }
                }
                if (activityid == 14)
                {
                    bus.action_status = int.Parse(drop_status.SelectedValue.ToString());
                    int id = int.Parse(drop_statusjanji.SelectedValue.ToString());
                    bus.source_election_status = id;
                    if (id == 254)
                    {
                        bus.source_election_status_agency_id= int.Parse(drop_agency.SelectedValue.ToString());
                    }
                    if (id == 256)
                    {
                        bus.source_election_status_ngo_id= int.Parse(drop_prtubuhan.SelectedValue.ToString());
                    }
                }
                int res =bus.areaInfoElectionParty();
                if (res == 0)
                {
                    Response.Redirect("activiti_parti_view");
                }
            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            txt_detail.Text= "" ;
            txt_datetime.Text= "";
            fill_txtNegeri();
            fill_parlimen();
            fill_Election();
            fill_Party();
            fill_InfoType();
            fill_Drop_Sumber();
            fill_validInfo();
            fill_category();
            fill_drop_sumber_isu();
            fill_drop_status();
            fill_drop_statusjanji();
            fill_agency();
            fill_pertubuhan();
        }
    }
}