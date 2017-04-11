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
    public partial class election_result_list : System.Web.UI.Page
    {
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                invalid.Visible = false;
                valid.Visible = false;
                txtPil.Attributes.Add("readonly", "readonly");
                txtNegeri.Attributes.Add("readonly", "readonly");
                CheckIsLogin();

            }
        }
        protected void CheckIsLogin()
        {
            if (Session["is_login"] != null)
            {
                if (Session["is_login"].ToString() == "t")
                {
                    txtPil.Text = Session["election"].ToString();
                    txtNegeri.Text = Session["statename"].ToString();
                    fill_area();
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
        public void fill_area()
        {
            objBUS.state_id = int.Parse(Session["state"].ToString());
            dt = objBUS.GetArea();
            if (dt.Rows.Count > 0)
            {
                ddlArea.DataSource = dt;
                ddlArea.DataBind();
                ddlArea.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            invalid.Visible = false;
            valid.Visible = false;
            bus.eid = int.Parse(Session["election_id"].ToString());
            bus.areaid = int.Parse(ddlArea.SelectedValue);
            DataTable lst = bus.getDetails();
            if(lst.Rows.Count > 0)
            {
                GrdDetails.DataSource = lst;
                GrdDetails.DataBind();
            }
        }

        protected void GrdDetails_PreRender(object sender, EventArgs e)
        {
            if (GrdDetails.Rows.Count > 0)
            {
                GrdDetails.UseAccessibleHeader = true;
                GrdDetails.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int elec_id = int.Parse(GrdDetails.DataKeys[row.RowIndex].Values[0].ToString());
            int stat_id = int.Parse(GrdDetails.DataKeys[row.RowIndex].Values[1].ToString());
            int are_id = int.Parse(GrdDetails.DataKeys[row.RowIndex].Values[2].ToString());
            int res_id = int.Parse(GrdDetails.DataKeys[row.RowIndex].Values[3].ToString());
            Session["K_elec_id"] = elec_id;
            Session["K_stat_id"] = stat_id;
            Session["K_are_id"] = are_id;
            Session["K_elec_r_id"] = res_id;
            Response.Redirect("election_result_view");
        }
        protected void delete_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            objBUS.election_result_id = int.Parse(GrdDetails.DataKeys[row.RowIndex].Values[3].ToString());
            int result = objBUS.DeleteElectionResultData();
            if (result != -1)
            {
                valid.Visible = true;
                lblvalid.Text = "Berjaya dipadamkan !";

                GrdDetails.DataSource = null;
                GrdDetails.DataBind();
            }
            else
            {
                invalid.Visible = true;
                lblinvalid.Text = "Tidak dapat membuang. Sila cuba lagi !";
            }
        }
    }
}