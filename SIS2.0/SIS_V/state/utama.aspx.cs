using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SIS_B;
using System.Web.Services;

namespace SIS_V.state
{
    public partial class utama : System.Web.UI.Page
    {
        bus_sis_ugc1 bus1 = new bus_sis_ugc1();
        int count, id, hash, Num;
        string Name;
        DataTable dt = new DataTable();
        DataTable table1 = new DataTable();
        DataTable table2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //fillgrid();
            }
        }

        [WebMethod]

        public static int test()
        {
            return 0;
        }
       
        //public void fillgrid()
        //{
        //    dt = bus1.fillgrid();
        //    if (dt.Rows.Count > 0)
        //    {
        //        count = dt.Rows.Count / 2;

        //        table1.Columns.Add("id", typeof(int));
        //        table1.Columns.Add("#", typeof(int));
        //        table1.Columns.Add("Name", typeof(string));
        //        table1.Columns.Add("Num", typeof(int));

        //        table2.Columns.Add("id", typeof(int));
        //        table2.Columns.Add("#", typeof(int));
        //        table2.Columns.Add("Name", typeof(string));
        //        table2.Columns.Add("Num", typeof(int));

        //        for (int i = 0; i < dt.Rows.Count; i++)
        //        {
        //            id = 0; hash = 0; Name = ""; Num = 0;
        //            id = int.Parse(dt.Rows[i]["id"].ToString());
        //            hash = int.Parse(dt.Rows[i]["#"].ToString());
        //            Name = dt.Rows[i]["Name"].ToString();
        //            Num = int.Parse(dt.Rows[i]["Num"].ToString());
        //            if (i < count)
        //            {
        //                table1.Rows.Add(id, hash, Name, Num);
        //            }
        //            else
        //            {
        //                table2.Rows.Add(id, hash, Name, Num);
        //            }
        //        }

        //    }

        //    grdinsident1.DataSource = table1;
        //    grdinsident1.DataBind();

        //    grdinsident2.DataSource = table2;
        //    grdinsident2.DataBind();
        //}

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = int.Parse(grdinsident1.DataKeys[row.RowIndex].Value.ToString());
            if (id != 0)
            {
                /* 
                 * can use either Server.Transfer or Response.Redirect 
                 * Server.Transfer - url won't change
                 * Response.Redirect - url will change
                */
                Response.Redirect("~/state/detail_incident.aspx");

                //Server.Transfer("~/state/detail_incident.aspx");
            }
        }
    }
}