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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                fill_txtNegeri();
                fill_parlimen();
                fill_Election();
                fill_Party();
                fill_InfoType();
                fill_Drop_Sumber();
                fill_validInfo();
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
                drop_prlimen .DataSource = dt1;
                drop_prlimen.DataBind();
                drop_prlimen.Items.Insert(0, new ListItem("----------------SELECT----------------", ""));
            }
            else
            {

            }
        }
        protected void fill_Election()
        {
            DataTable dt1 = bus.fill_Election();
            if (dt1.Rows.Count > 0)
            {
                drop_pilihnraya.DataSource = dt1;
                drop_pilihnraya.DataBind();
                drop_pilihnraya.Items.Insert(0, new ListItem("----------------SELECT----------------", ""));
            }
            else
            {

            }
        }
        protected void fill_Party()
        {
            DataTable dt1 = bus.fill_Party();
            if (dt1.Rows.Count > 0)
            {
                drop_parti.DataSource = dt1;
                drop_parti.DataBind();
                drop_parti.Items.Insert(0, new ListItem("----------------SELECT----------------", ""));
            }
            else
            {

            }
        }
        protected void fill_InfoType()
        {
            DataTable dt1 = bus.fill_InfoType();
            if (dt1.Rows.Count > 0)
            {
                drop_jenis.DataSource = dt1;
                drop_jenis.DataBind();
                drop_jenis.Items.Insert(0, new ListItem("----------------SELECT----------------", ""));
            }
            else
            {

            }
        }
        protected void fill_Drop_Sumber()
        {
            DataTable dt1 = bus.fill_Drop_Sumber();
            if (dt1.Rows.Count > 0)
            {
                drop_sumber.DataSource = dt1;
                drop_sumber.DataBind();
                drop_sumber.Items.Insert(0, new ListItem("----------------SELECT----------------", ""));
            }
            else
            {

            }
        }
        protected void fill_validInfo()
        {
            DataTable dt1 = bus.fill_validInfo();
            if (dt1.Rows.Count > 0)
            {
                drop_tahap.DataSource = dt1;
                drop_tahap.DataBind();
                drop_tahap.Items.Insert(0, new ListItem("----------------SELECT----------------", ""));
            }
            else
            {

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
            bus.state_id = int.Parse(Session["state"].ToString());
            bus.area_id = int.Parse(drop_prlimen.SelectedValue.ToString());
            bus.polling_District_id = int.Parse(drop_mengudi.SelectedValue.ToString());
            bus.election_id = int.Parse(drop_pilihnraya.SelectedValue.ToString());
            bus.party_id = int.Parse(drop_parti.SelectedValue.ToString());
            bus.activity_id = int.Parse(drop_parti.SelectedValue.ToString());
        }
    }
}