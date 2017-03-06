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
    public partial class percentage_voters : System.Web.UI.Page
    {
        bus_sis_ugc4 bus4 = new bus_sis_ugc4();
        DataSet turnout = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill_turnout();
            }
        }

        public void fill_turnout()
        {
            bus4.sid = int.Parse(Session["state"].ToString());
            turnout = bus4.fill_turnout();
            if (turnout.Tables.Count > 0)
            {
                OuterDataList.DataSource = turnout.Tables[0];
                OuterDataList.DataBind();
            }


        }

        protected void OuterDataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                DataList InnerDataList = e.Item.FindControl("InnerDataList") as DataList;
                InnerDataList.DataSource = drv.CreateChildView("SubDistRelation");
                InnerDataList.DataBind();
            }
        }

        protected void InnerDataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                DataList MainDataList = e.Item.FindControl("MainDataList") as DataList;
                MainDataList.DataSource = drv.CreateChildView("VotersRelation");           
                MainDataList.DataBind();
            }
        }
    }
}