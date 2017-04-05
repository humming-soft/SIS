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
    public partial class election_result : System.Web.UI.Page
    {
        bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            //invalid.Visible = false;
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

        [WebMethod]
        public static List<Penyandang> GetPenyandang(int area_id, int election_id)
        {
            List<Penyandang> penyandang = new List<Penyandang>();
            bus_sis_ugc2 objBUS = new bus_sis_ugc2();
            objBUS.area_id = area_id;
            objBUS.election_id = election_id;
            DataTable dt = objBUS.GetPenyandang();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Penyandang _Penyandang = new Penyandang();
                _Penyandang.winner_name = dt.Rows[i]["winner_name"].ToString();
                penyandang.Add(_Penyandang);
            }
            return penyandang;
        }
    }
}