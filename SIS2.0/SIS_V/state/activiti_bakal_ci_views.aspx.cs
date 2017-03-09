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
    public partial class activiti_bakal_ci_views : System.Web.UI.Page
    {
        bus_sis_ugc1 bus1 = new bus_sis_ugc1();
        bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        DataTable dt, dt1, dt2, dt3, dt4;
        protected void Page_Load(object sender, EventArgs e)
        {
            invalid.Visible = false;
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
                    GetActivityList();
                    GetLookUpList();
                    GetValidityList();
                    GetCandidateList();
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

        public void GetActivityList()
        {
            dt1 = objBUS.GetActivityList();
            ddlJenis.DataSource = dt1;
            ddlJenis.DataBind();
            ddlJenis.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void GetLookUpList()
        {
            dt2 = objBUS.GetLookUpList();
            ddlSumber.DataSource = dt2;
            ddlSumber.DataBind();
            ddlSumber.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void GetValidityList()
        {
            dt3 = objBUS.GetValidityList();
            ddlTahap.DataSource = dt3;
            ddlTahap.DataBind();
            ddlTahap.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void GetCandidateList()
        {
            dt4 = objBUS.GetCandidateList();
            ddlName.DataSource = dt4;
            ddlName.DataBind();
            ddlName.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bus1.stateid = int.Parse(Session["state"].ToString());
            if (ddlName.SelectedIndex == 0)
            {
                bus1.name = 0;
            }
            else
            {
                bus1.name = int.Parse(ddlName.SelectedValue);
            }
            if (ddlJenis.SelectedIndex == 0)
            {
                bus1.jenis = 0;
            }
            else
            {
                bus1.jenis = int.Parse(ddlJenis.SelectedValue);
            }
            if (ddlSumber.SelectedIndex == 0)
            {
                bus1.sumber = 0;
            }
            else
            {
                bus1.sumber = int.Parse(ddlSumber.SelectedValue);
            }
            if (ddlTahap.SelectedIndex == 0)
            {
                bus1.tahap = 0;
            }
            else
            {
                bus1.tahap = int.Parse(ddlTahap.SelectedValue);
            }
            dt = bus1.GetCandidateList_All();
            if(dt.Rows.Count > 0)
            {
                GridView_Cdetails.DataSource = dt;
                GridView_Cdetails.DataBind();

            }
            else
            {
                GetActivityList();
                GetLookUpList();
                GetValidityList();
                GetCandidateList();
                lblinvalid.Text = "No Records Found!";
                GridView_Cdetails.DataSource = null;
                GridView_Cdetails.DataBind();
                invalid.Visible = true;
            }
        }

        protected void GridView_Cdetails_PreRender(object sender, EventArgs e)
        {
            if (GridView_Cdetails.Rows.Count > 0)
            {
                GridView_Cdetails.UseAccessibleHeader = true;
                GridView_Cdetails.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}