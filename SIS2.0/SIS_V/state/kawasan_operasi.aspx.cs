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
    public partial class kawasan_operasi : System.Web.UI.Page
    {
        bus_sis_ugc2 objKOInfoBUS = new bus_sis_ugc2();
        DataTable dt = new DataTable();

        DataTable isconc = new DataTable();
        DataTable isopera = new DataTable();

        int isconckount, isoperakount;

        DataTable con_dt1 = new DataTable();
        DataTable con_dt2 = new DataTable();
        DataTable con_dt3 = new DataTable();
        DataTable con_dt4 = new DataTable();
        DataTable op_dt1 = new DataTable();
        DataTable op_dt2 = new DataTable();
        DataTable op_dt3 = new DataTable();
        DataTable op_dt4 = new DataTable();
        int state_id, con_count, op_count;
        string area_code, area_name, color;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                state_id = int.Parse(Session["state"].ToString());
                GetConOpAreaList();
            }
        }

        public void GetConOpAreaList()
        {
            objKOInfoBUS.state_id = state_id;
            dt = objKOInfoBUS.GetConOpAreaList();

            if (dt.Rows.Count > 0)
            {
                isconc.Columns.Add("area_code", typeof(string));
                isconc.Columns.Add("area_name", typeof(string));
                isconc.Columns.Add("color", typeof(string));

                isopera.Columns.Add("area_code", typeof(string));
                isopera.Columns.Add("area_name", typeof(string));
                isopera.Columns.Add("color", typeof(string));

                con_dt1.Columns.Add("area_code", typeof(string));
                con_dt1.Columns.Add("area_name", typeof(string));
                con_dt1.Columns.Add("color", typeof(string));

                con_dt2.Columns.Add("area_code", typeof(string));
                con_dt2.Columns.Add("area_name", typeof(string));
                con_dt2.Columns.Add("color", typeof(string));

                con_dt3.Columns.Add("area_code", typeof(string));
                con_dt3.Columns.Add("area_name", typeof(string));
                con_dt3.Columns.Add("color", typeof(string));

                con_dt4.Columns.Add("area_code", typeof(string));
                con_dt4.Columns.Add("area_name", typeof(string));
                con_dt4.Columns.Add("color", typeof(string));

                op_dt1.Columns.Add("area_code", typeof(string));
                op_dt1.Columns.Add("area_name", typeof(string));
                op_dt1.Columns.Add("color", typeof(string));

                op_dt2.Columns.Add("area_code", typeof(string));
                op_dt2.Columns.Add("area_name", typeof(string));
                op_dt2.Columns.Add("color", typeof(string));

                op_dt3.Columns.Add("area_code", typeof(string));
                op_dt3.Columns.Add("area_name", typeof(string));
                op_dt3.Columns.Add("color", typeof(string));

                op_dt4.Columns.Add("area_code", typeof(string));
                op_dt4.Columns.Add("area_name", typeof(string));
                op_dt4.Columns.Add("color", typeof(string));

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    area_code = ""; area_name = ""; color = "";
                    area_code = dt.Rows[i]["area_code"].ToString();
                    area_name = dt.Rows[i]["area_name"].ToString();
                    color = dt.Rows[i]["color"].ToString();

                    if (dt.Rows[i][7].ToString() == "True") //Concentrated area
                    {
                        isconc.Rows.Add(area_code, area_name, color);
                    }
                    if (dt.Rows[i][8].ToString() == "True") // Operational area
                    {
                        isopera.Rows.Add(area_code, area_name, color);
                        #region commented2
                        //op_count = op_dt1.Rows.Count / 3;
                        //for (int k = 0; k < op_dt1.Rows.Count; k++)
                        //{
                        //    area_code = ""; area_name = ""; color = "";
                        //    area_code = op_dt1.Rows[k]["area_code"].ToString();
                        //    area_name = op_dt1.Rows[k]["area_name"].ToString();
                        //    color = op_dt1.Rows[k]["color"].ToString();

                        //    if (k < op_count)
                        //    {
                        //        op_dt2.Rows.Add(area_code, area_name, color);
                        //    }
                        //    else if (k < (op_count * 2))
                        //    {
                        //        op_dt3.Rows.Add(area_code, area_name, color);
                        //    }
                        //    else if (k < (op_count * 3))
                        //    {
                        //        op_dt4.Rows.Add(area_code, area_name, color);
                        //    }
                        //}
                        #endregion
                    }
                    #region lastcommented
                    //ConGridView1.DataSource = con_dt2;
                    //ConGridView1.DataBind();
                    //ConGridView2.DataSource = con_dt3;
                    //ConGridView2.DataBind();
                    //ConGridView3.DataSource = con_dt4;
                    //ConGridView3.DataBind();

                    //OpGridView1.DataSource = op_dt2;
                    //OpGridView1.DataBind();
                    //OpGridView2.DataSource = op_dt3;
                    //OpGridView2.DataBind();
                    //OpGridView3.DataSource = op_dt4;
                    //OpGridView3.DataBind();
                    #endregion
                }

                isconckount = isconc.Rows.Count / 3;
                isoperakount = isopera.Rows.Count / 3;

                for (int j = 0; j < isconc.Rows.Count; j++) // looping through isconcentrated only
                {
                    area_code = ""; area_name = ""; color = "";
                    area_code = isconc.Rows[j]["area_code"].ToString();
                    area_name = isconc.Rows[j]["area_name"].ToString();
                    color = isconc.Rows[j]["color"].ToString();
                    if (j < isconckount)
                    {
                        con_dt1.Rows.Add(area_code, area_name, color);
                    }
                    else if (j >= isconckount && j < (isconckount * 2))
                    {
                        con_dt2.Rows.Add(area_code, area_name, color);
                    }
                    else if (j >= (isconckount * 2) && j < (isconckount * 3))
                    {
                        con_dt3.Rows.Add(area_code, area_name, color);
                    }
                    else
                    {
                        con_dt1.Rows.Add(area_code, area_name, color);
                    }
                }

                for (int k = 0; k < isopera.Rows.Count; k++) // looping through operational only
                {
                    area_code = ""; area_name = ""; color = "";
                    area_code = isopera.Rows[k]["area_code"].ToString();
                    area_name = isopera.Rows[k]["area_name"].ToString();
                    color = isopera.Rows[k]["color"].ToString();
                    if (k < isoperakount)
                    {
                        op_dt1.Rows.Add(area_code, area_name, color);
                    }
                    else if (k >= isoperakount && k < (isoperakount * 2))
                    {
                        op_dt2.Rows.Add(area_code, area_name, color);
                    }
                    else if (k >= (isoperakount * 2) && k < (isoperakount * 3))
                    {
                        op_dt3.Rows.Add(area_code, area_name, color);
                    }
                    else
                    {
                        op_dt1.Rows.Add(area_code, area_name, color);
                    }
                }

                bind_all();

            }


        }

        public void bind_all()
        {
            ConGridView1.DataSource = con_dt1;
            ConGridView1.DataBind();
            ConGridView2.DataSource = con_dt2;
            ConGridView2.DataBind();
            ConGridView3.DataSource = con_dt3;
            ConGridView3.DataBind();


            OpGridView1.DataSource = op_dt1;
            OpGridView1.DataBind();
            OpGridView2.DataSource = op_dt2;
            OpGridView2.DataBind();
            OpGridView3.DataSource = op_dt3;
            OpGridView3.DataBind();
        }
    }
}