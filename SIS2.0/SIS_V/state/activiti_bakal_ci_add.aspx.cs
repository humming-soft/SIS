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
    public partial class activiti_bakal_ci_add : System.Web.UI.Page
    {
        bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                invalid.Visible = false;
                GetElectionList();
                GetStateList();
                GetAreaCodeList();
                GetActivityList();
                GetLookUpList();
                GetValidityList();
                GetCandidateList();
            }
        }

        public void GetElectionList()
        {
            dt = objBUS.GetElectionList();
            ddlPilihanraya.DataSource = dt;
            ddlPilihanraya.DataBind();
            ddlPilihanraya.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void GetStateList()
        {
            objBUS.state_id = int.Parse(Session["state"].ToString());
            dt = objBUS.GetStateList();
            ddlNegeri.DataSource = dt;
            ddlNegeri.DataBind();
            ddlNegeri.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void GetAreaCodeList()
        {
            objBUS.state_id = int.Parse(Session["state"].ToString());
            dt = objBUS.GetAreaCodeList();
            ddlParlimen.DataSource = dt;
            ddlParlimen.DataBind();
            ddlParlimen.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        [WebMethod]
        public static List<Daerah> GetPollingDistrict(int area_id)
        {
            List<Daerah> daerah = new List<Daerah>();
            bus_sis_ugc2 objBUS = new bus_sis_ugc2();
            objBUS.area_id = area_id;
            DataTable dt = objBUS.GetPollingDistrict();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Daerah _Daerah = new Daerah();
                _Daerah.polling_district_id = int.Parse(dt.Rows[i]["polling_district_id"].ToString());
                _Daerah.polling_district_name = dt.Rows[i]["polling_district_name"].ToString();
                daerah.Add(_Daerah);
            }
            return daerah;
        }

        public void GetActivityList()
        {
            dt = objBUS.GetActivityList();
            ddlJenis.DataSource = dt;
            ddlJenis.DataBind();
            ddlJenis.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void GetLookUpList()
        {
            dt = objBUS.GetLookUpList();
            ddlSumber.DataSource = dt;
            ddlSumber.DataBind();
            ddlSumber.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void GetValidityList()
        {
            dt = objBUS.GetValidityList();
            ddlTahap.DataSource = dt;
            ddlTahap.DataBind();
            ddlTahap.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void GetCandidateList()
        {
            dt = objBUS.GetCandidateList();
            ddlName.DataSource = dt;
            ddlName.DataBind();
            ddlName.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlPilihanraya.SelectedValue != "" && ddlNegeri.SelectedValue != "" && ddlParlimen.SelectedValue != "" && ddlName.SelectedValue != "" && ddlJenis.SelectedValue != "" && ddlSumber.SelectedValue != "" && ddlTahap.SelectedValue != "" && dtTarikh.Text != "" && txtButiran.Text != "")
            {
                objBUS.pilihanraya = int.Parse(ddlPilihanraya.SelectedValue);
                objBUS.negeri = int.Parse(ddlNegeri.SelectedValue);
                objBUS.parlimen = int.Parse(ddlParlimen.SelectedValue);
                if (ddlDaerah.SelectedValue != "") { 
                    objBUS.daerah = int.Parse(ddlDaerah.SelectedValue);
                }
                else
                {
                    objBUS.daerah = -1;
                }
                objBUS.name = ddlName.SelectedValue.Trim();
                objBUS.jenis = int.Parse(ddlJenis.SelectedValue);
                objBUS.sumber = int.Parse(ddlSumber.SelectedValue);
                objBUS.tahap = int.Parse(ddlTahap.SelectedValue);
                objBUS.tarikh_masa = DateTime.ParseExact(dtTarikh.Text, "dd/MM/yyyy HH:mm", null);
                objBUS.butiran = txtButiran.Text;
                int chk = objBUS.SaveCandidateAreaDetails();
                if (chk == 0)
                {
                    Response.Redirect("activiti_bakal_ci_view");
                }
            }
            else
            {
                invalid.Visible = true;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
        }
    }
}