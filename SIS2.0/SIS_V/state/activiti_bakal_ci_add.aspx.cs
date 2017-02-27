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
                GetElectionList();
                GetStateList();
                GetAreaCodeList();
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
    }
}