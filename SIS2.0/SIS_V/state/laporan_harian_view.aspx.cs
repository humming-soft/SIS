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
    public partial class laporan_harian_view : System.Web.UI.Page
    {
        bus_sis_ugc1 bus1 = new bus_sis_ugc1();
        DataTable table1 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill_lamporan();
            }
        }

        public void fill_lamporan()
        {
            table1 = bus1.fill_lamporan();
            if (table1.Rows.Count > 0)
            {
                GridDataTable3.DataSource = table1;
                GridDataTable3.DataBind();

                //GridDataTable4.DataSource = table1;
                //GridDataTable4.DataBind();

                //GridDataTable5.DataSource = table1;
                //GridDataTable5.DataBind();

                //GridDataTable6.DataSource = table1;
                //GridDataTable6.DataBind();

                //GridDataTable7.DataSource = table1;
                //GridDataTable7.DataBind();
            }
        }

        protected void GridDataTable3_PreRender(object sender, EventArgs e)
        {
            if (GridDataTable3.Rows.Count > 0)
            {
                GridDataTable3.UseAccessibleHeader = true;
                GridDataTable3.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        //protected void GridDataTable4_PreRender(object sender, EventArgs e)
        //{
        //    if (GridDataTable4.Rows.Count > 0)
        //    {
        //        GridDataTable4.UseAccessibleHeader = true;
        //        GridDataTable4.HeaderRow.TableSection = TableRowSection.TableHeader;
        //    }
        //}

        //protected void GridDataTable5_PreRender(object sender, EventArgs e)
        //{
        //    if (GridDataTable5.Rows.Count > 0)
        //    {
        //        GridDataTable5.UseAccessibleHeader = true;
        //        GridDataTable5.HeaderRow.TableSection = TableRowSection.TableHeader;
        //    }
        //}
        //protected void GridDataTable6_PreRender(object sender, EventArgs e)
        //{
        //    if (GridDataTable6.Rows.Count > 0)
        //    {
        //        GridDataTable6.UseAccessibleHeader = true;
        //        GridDataTable6.HeaderRow.TableSection = TableRowSection.TableHeader;
        //    }
        //}
        //protected void GridDataTable7_PreRender(object sender, EventArgs e)
        //{
        //    if (GridDataTable7.Rows.Count > 0)
        //    {
        //        GridDataTable7.UseAccessibleHeader = true;
        //        GridDataTable7.HeaderRow.TableSection = TableRowSection.TableHeader;
        //    }
        //}
    }
}