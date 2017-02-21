using SIS_B;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SIS_V.state
{
    public partial class status_kawasan : System.Web.UI.Page
    {
        bus_sis_ugc4 bus4 = new bus_sis_ugc4();
        DataTable districts = new DataTable();
        DataTable subDistricts = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDistrictStatus();
                loadSubDistrictStatus();
            }

        }

        public void loadDistrictStatus()
        {
            bus4.sid = int.Parse(Session["state"].ToString());
            bus4.areaType = 1;
            districts = bus4.fill_status_districts();
            if (districts.Rows.Count > 0)
            {
                int[] status = new int[3];
                status[0]=0;
                status[1]=0;
                status[2]=0;
                foreach (DataRow row in districts.Rows)
                {
                    if (row["color"].Equals("HITAM")) { status[0] += 1; }
                    else if (row["color"].Equals("KELABU")) { status[1] += 1; }
                    else if (row["color"].Equals("PUTIH")) { status[2] += 1; }
                }
                statusblack.InnerHtml = status[0].ToString();
                statusgray.InnerHtml = status[1].ToString();
                statuswhite.InnerHtml = status[2].ToString();
                status_kawasan_dist.DataSource = districts;
                status_kawasan_dist.DataBind();
            }
        }

        public void loadSubDistrictStatus()
        {

            bus4.sid = int.Parse(Session["state"].ToString());
            bus4.areaType = 2;
            subDistricts = bus4.fill_status_districts();
            if (subDistricts.Rows.Count > 0)
            {
                int[] status = new int[3];
                status[0] = 0;
                status[1] = 0;
                status[2] = 0;
                foreach (DataRow row in subDistricts.Rows)
                {
                    if (row["color"].Equals("HITAM")) { status[0] += 1; }
                    else if (row["color"].Equals("KELABU")) { status[1] += 1; }
                    else if (row["color"].Equals("PUTIH")) { status[2] += 1; }
                }
                statusblack_sd.InnerHtml = status[0].ToString();
                statusgray_sd.InnerHtml = status[1].ToString();
                statuswhite_sd.InnerHtml = status[2].ToString();
                status_kawasan_subdist.DataSource = subDistricts;
                status_kawasan_subdist.DataBind();
            }
        }

        protected void status_kawasan_dist_PreRender(object sender, EventArgs e)
        {
            if (status_kawasan_dist.Rows.Count > 0)
            {
                status_kawasan_dist.UseAccessibleHeader = true;
                status_kawasan_dist.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void status_kawasan_subdist_PreRender(object sender, EventArgs e)
        {
            if (status_kawasan_subdist.Rows.Count > 0)
            {
                status_kawasan_subdist.UseAccessibleHeader = true;
                status_kawasan_subdist.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}