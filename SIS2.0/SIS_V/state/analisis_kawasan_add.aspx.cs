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
    public partial class analisis_kawasan_add : System.Web.UI.Page
    {
        bus_sis_ugc4 bus = new bus_sis_ugc4();
        DataTable record = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                invalid.Visible = false;
                valid.Visible = false;
                getIndividualRecord();
            }
        }

        private void getIndividualRecord()
        {
            if (Session["report_id"] != null)
            {
                bus.rid = int.Parse(Session["report_id"].ToString());
                record = bus.get_area_analysis();
                if (record.Rows.Count > 0)
                {
                    foreach (DataRow row in record.Rows)
                    {
                        LabParlimen.Text = row["dist"].ToString();
                        LabDun.Text = row["subdist"].ToString();
                        LabStatus.Text = row["color"].ToString();
                        LabDate.Text = row["date"].ToString();
                        TextComment.Text = row["comment"].ToString();
                        recordId.Value = Session["report_id"].ToString();

                    }
                }
            }
            else
            {
                Response.Redirect("analisis_kawasan_view");
            }
           
        }

        protected void saveJustification_Click(object sender, EventArgs e)
        {
            bus.comment = TextComment.Text;
            bus.rid = int.Parse(recordId.Value);
            if (bus.update_area_analysis() == 1)
            {
                lblsuccess.Text = "Data Dimasukkan Berjaya!";
                valid.Visible = true;
            }
            else
            {
                lblinvalid.Text = "Ralat yang tidak dijangka, Masukkan Gagal!";
                invalid.Visible = true;
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("laporan_harian_view");
        }

   }
}