using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;
using System.Data;

namespace SIS_V.state
{
    public partial class detail_info : System.Web.UI.Page
    {
        int id, state;
        string atype;
        DataTable dt;
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        protected void Page_Load(object sender, EventArgs e)
        {

            atype = Session["utype"].ToString();
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
                    state = int.Parse(Session["state"].ToString());
                    fill_kod_kawasan();
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
            bus.stateid = state;
            DataTable dt = bus.fill_kodkawasan();
            if (dt.Rows.Count > 0)
            {
                dp_kawasan.DataSource = dt;
                dp_kawasan.DataBind();
                dp_kawasan.Items.Insert(0, new ListItem("---PILIH---", ""));
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (dp_kawasan.SelectedIndex != 0)
            {
                if (atype == "insident")
                {
                    bus.areaid = int.Parse(dp_kawasan.SelectedValue);
                    dt = bus.fill_incident();
                    if (dt.Rows.Count > 0)
                    {
                        GridView_All.DataSource = dt;
                        GridView_All.DataBind();
                    }
                }
                else
                {
                    bus.areaid = int.Parse(dp_kawasan.SelectedValue);
                    dt = bus.fill_issue();
                    if (dt.Rows.Count > 0)
                    {
                        GridView_All.DataSource = dt;
                        GridView_All.DataBind();
                    }
                }
            }
        }

        protected void GridView_All_PreRender(object sender, EventArgs e)
        {
            if (GridView_All.Rows.Count > 0)
            {
                GridView_All.UseAccessibleHeader = true;
                GridView_All.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}