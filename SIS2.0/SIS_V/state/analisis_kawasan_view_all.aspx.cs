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
    public partial class analisis_kawasan_view_all : System.Web.UI.Page
    {
        bus_sis_ugc3 bus = new bus_sis_ugc3();
        bus_sis_ugc4 bus_alt = new bus_sis_ugc4();
        DataTable one = new DataTable();
        DataTable two = new DataTable();
        DataTable areaAnalysis = new DataTable();
        int area_id;
        string area_name;
        int area_type;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                CheckIsLogin();
                invalid.Visible = false;
                valid.Visible = false;
                log_valid.Visible = false;
            }
        }
        protected void CheckIsLogin()
        {
            if (Session["is_login"] != null)
            {
                if (Session["is_login"].ToString() == "t")
                {
                    fill_kawasan();
                    fill_parlimen_dun();
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
        protected void fill_kawasan()
        {
            DataTable dt1 = bus.fill_kawasan();
            if (dt1.Rows.Count > 0)
            {
                drop_kawasan.DataSource = dt1;
                drop_kawasan.DataBind();
                drop_kawasan.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_kawasan.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void fill_parlimen_dun()
        {
            
            one.Columns.Add("area_name", typeof(string));
            one.Columns.Add("area_id", typeof(int));

            two.Columns.Add("area_name", typeof(string));
            two.Columns.Add("area_id", typeof(int));

            bus.state_id = int.Parse(Session["state"].ToString());
            DataTable dt1 = bus.fill_parlimen_dun();
            int count = dt1.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                area_type = int.Parse(dt1.Rows[i]["area_type"].ToString());
                if (area_type == 1)
                {
                    area_id = int.Parse(dt1.Rows[i]["area_id"].ToString());
                    area_name = dt1.Rows[i]["area_name"].ToString();
                    one.Rows.Add(area_name,area_id);
                }
                if (area_type == 2)
                {
                    area_id = int.Parse(dt1.Rows[i]["area_id"].ToString());
                    area_name = dt1.Rows[i]["area_name"].ToString();
                    two.Rows.Add(area_name, area_id);
                }
            }
            if (one.Rows.Count > 0)
            {
                drop_parlimen.DataSource = one;
                drop_parlimen.DataBind();
                drop_parlimen.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_parlimen.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
            if (two.Rows.Count > 0)
            {
                drop_dun.DataSource = two;
                drop_dun.DataBind();
                drop_dun.Items.Insert(0, new ListItem("---SELECT---", ""));
            }
            else
            {
                drop_dun.Items.Insert(0, new ListItem("---NO DATA---", ""));
            }
        }
        protected void GridKawasan_PreRender(object sender, EventArgs e)
        {
            if (GridKawasan.Rows.Count > 0)
            {
                GridKawasan.UseAccessibleHeader = true;
                GridKawasan.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            GridKawasan.DataSource = null;
            GridKawasan.DataBind();
            bus.state_id = int.Parse(Session["state"].ToString());
            if (drop_kawasan.SelectedValue.ToString() != "" || drop_parlimen.SelectedValue.ToString() != "" || drop_dun.SelectedValue.ToString() != "")
            {
                log_valid.Visible = false;
                if (drop_kawasan.SelectedValue.ToString() != "")
                {
                    bus.area_type = int.Parse(drop_kawasan.SelectedValue.ToString());
                }
                else
                {
                    bus.area_type = -1;
                }
                if (drop_parlimen.SelectedValue.ToString() != "")
                {
                    bus.parlimen_id = int.Parse(drop_parlimen.SelectedValue.ToString());
                }
                else
                {
                    bus.parlimen_id = -1;
                }
                if (drop_dun.SelectedValue.ToString() != "")
                {
                    bus.dun_id = int.Parse(drop_dun.SelectedValue.ToString());
                }
                else
                {
                    bus.dun_id = -1;
                }

                areaAnalysis = bus.fill_area_analysis_ViewAll();
                if (areaAnalysis.Rows.Count > 0)
                {
                    GridKawasan.DataSource = areaAnalysis;
                    GridKawasan.DataBind();
                }
                else
                {
                    GridKawasan.DataSource = null;
                    GridKawasan.DataBind();
                }
            }
            else
            {
                log_valid.Visible = true;
            }
       
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int report_id = int.Parse(GridKawasan.DataKeys[row.RowIndex].Value.ToString());
            Session["report_id"] = report_id;
            Response.Redirect("analisis_kawasan_add");
        }

        protected void GridKawasan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridKawasan.Rows[e.RowIndex];
            bus_alt.rid = int.Parse(GridKawasan.DataKeys[row.RowIndex].Value.ToString());
            if (bus_alt.delete_area_analysis() > 0)
            {
                lblsuccess.Text = "Rekod Dipadam Berjaya!";
                valid.Visible = true;
                invalid.Visible = false;
            }
            else
            {
                lblinvalid.Text = "Ralat Tidak Dijangka, Pemotongan Gagal!";
                valid.Visible = false;
                invalid.Visible = true;
            }

            bus.state_id = int.Parse(Session["state"].ToString());
            if (drop_kawasan.SelectedValue.ToString() != "")
            {
                bus.area_type = int.Parse(drop_kawasan.SelectedValue.ToString());
            }
            else
            {
                bus.area_type = -1;
            }
            if (drop_parlimen.SelectedValue.ToString() != "")
            {
                bus.parlimen_id = int.Parse(drop_parlimen.SelectedValue.ToString());
            }
            else
            {
                bus.parlimen_id = -1;
            }
            if (drop_dun.SelectedValue.ToString() != "")
            {
                bus.dun_id = int.Parse(drop_dun.SelectedValue.ToString());
            }
            else
            {
                bus.dun_id = -1;
            }
            areaAnalysis = bus.fill_area_analysis_ViewAll();
            if (areaAnalysis.Rows.Count > 0)
            {
                GridKawasan.DataSource = areaAnalysis;
                GridKawasan.DataBind();
            }
        }
    }
}