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
    public partial class activiti_parti_view_all : System.Web.UI.Page
    {
        bus_sis_ugc3 bus = new bus_sis_ugc3();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckIsLogin();
                log_valid.Visible = false;
            }
        }
        protected void CheckIsLogin()
        {
            if (Session["is_login"] != null)
            {
                if (Session["is_login"].ToString() == "t")
                {
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
                    //fill_dun();
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
                lbl_negeri.Text = dt.Rows[0]["state_name"].ToString();
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
        protected void grid_areaInfoElectionParty_PreRender(object sender, EventArgs e)
        {
            if (grid_areaInfoElectionParty.Rows.Count > 0)
            {
                grid_areaInfoElectionParty.UseAccessibleHeader = true;
                grid_areaInfoElectionParty.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }


        protected void btn_submit_Click(object sender, EventArgs e)
        {
            grid_areaInfoElectionParty.DataSource = null;
            grid_areaInfoElectionParty.DataBind();
            bus.state_id = int.Parse(Session["state"].ToString());
            if (drop_prlimen.SelectedValue.ToString() != "" || drop_sumber.SelectedValue.ToString() != ""
                || drop_tahap.SelectedValue.ToString() != "" || drop_mengudi.SelectedValue.ToString() != "" 
                || drop_pilihnraya.SelectedValue.ToString() != "" || drop_parti.SelectedValue.ToString() != ""
                || drop_jenis.SelectedValue.ToString() != "" || drop_category.SelectedValue.ToString() != "" 
                || drop_sumbar_isu.SelectedValue.ToString() != "" || drop_agency.SelectedValue.ToString() != "" 
                || drop_prtubuhan.SelectedValue.ToString() != "" )
            {
                    log_valid.Visible = false;
                    if (drop_prlimen.SelectedValue.ToString() != "")
                    {
                        bus.area_id = int.Parse(drop_prlimen.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.area_id = -1;
                    }
                    if (drop_sumber.SelectedValue.ToString() != "")
                    {
                        bus.info_source = int.Parse(drop_sumber.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.info_source = -1;
                    }
                    if (drop_tahap.SelectedValue.ToString() != "")
                    {
                        bus.info_valdity = int.Parse(drop_tahap.SelectedValue.ToString());
                    } else
                    {
                        bus.info_valdity = -1;
                    }
                    if (drop_mengudi.SelectedValue.ToString() != "")
                    {
                        bus.polling_District_id = int.Parse(drop_mengudi.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.polling_District_id = -1;
                    }
                    if (drop_pilihnraya.SelectedValue.ToString() != "")
                    {
                        bus.election_id = int.Parse(drop_pilihnraya.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.election_id = -1;
                    } 
                    if (drop_parti.SelectedValue.ToString() != "")
                    {
                        bus.party_id = int.Parse(drop_parti.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.party_id = -1;
                    }
                    if (drop_jenis.SelectedValue.ToString() != "")
                    {

                        bus.activity_id = int.Parse(drop_jenis.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.activity_id = -1;
                    }
                    if (drop_category.SelectedValue.ToString() != "")
                    {
                        bus.current_issue_id = int.Parse(drop_category.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.current_issue_id = -1;
                    }
                    if (drop_sumbar_isu.SelectedValue.ToString() != "")
                    {
                        bus.issue_source = int.Parse(drop_sumbar_isu.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.issue_source = -1;
                    }
                    if (drop_agency.SelectedValue.ToString() != "")
                    {
                        bus.info_source_agency_id = int.Parse(drop_agency.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.info_source_agency_id = -1;
                    }
                    if (drop_prtubuhan.SelectedValue.ToString() != "")
                    {
                        bus.info_source_ngo_id = int.Parse(drop_prtubuhan.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.info_source_ngo_id = -1;
                    }

                    if (drop_status.SelectedValue.ToString() != "")
                    {
                        bus.action_status = int.Parse(drop_status.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.action_status = -1;
                    }
                    if (drop_statusjanji.SelectedValue.ToString() != "")
                    {
                        bus.source_election_status = int.Parse(drop_statusjanji.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.source_election_status = -1;
                    }
                    if (drop_agency.SelectedValue.ToString() != "")
                    {
                        bus.source_election_status_agency_id = int.Parse(drop_agency.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.source_election_status_agency_id = -1;
                    }
                    if (drop_prtubuhan.SelectedValue.ToString() != "")
                    {
                        bus.source_election_status_ngo_id = int.Parse(drop_prtubuhan.SelectedValue.ToString());
                    }
                    else
                    {
                        bus.source_election_status_ngo_id = -1;
                    }
                    }
                    else{
                        log_valid.Visible = true;
                    }
            DataTable data = bus.fill_gridElectionParty_viewAll();
            if (data.Rows.Count > 0)
            {
                grid_areaInfoElectionParty.DataSource = data;
                grid_areaInfoElectionParty.DataBind();
            }else{
                grid_areaInfoElectionParty.DataSource = null;
                grid_areaInfoElectionParty.DataBind();
            }
        }
    }
}