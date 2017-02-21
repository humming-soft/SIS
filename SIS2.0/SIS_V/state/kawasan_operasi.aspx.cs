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

        int area_id, isconccount, isopercount;

        DataTable con_dt1 = new DataTable();
        DataTable con_dt2 = new DataTable();
        DataTable con_dt3 = new DataTable();
        DataTable con_dt4 = new DataTable();
        DataTable op_dt1 = new DataTable();
        DataTable op_dt2 = new DataTable();
        DataTable op_dt3 = new DataTable();
        DataTable op_dt4 = new DataTable();
        int state_id;
        string area_code, area_name, color, row_color;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                state_id = int.Parse(Session["state"].ToString());
                GetConOpAreaList();
            }
        }

        protected string Isset(string row_color)
        {
            if (row_color == "Black")
            {
                return "GreyLnkBtn";
            }
            else
            {
                return "RedLnkBtn";
            }
        }

        public void GetConOpAreaList()
        {
            objKOInfoBUS.state_id = state_id;
            dt = objKOInfoBUS.GetConOpAreaList();

            if (dt.Rows.Count > 0)
            {
                isconc.Columns.Add("area_id", typeof(int));
                isconc.Columns.Add("area_code", typeof(string));
                isconc.Columns.Add("area_name", typeof(string));
                isconc.Columns.Add("color", typeof(string));
                isconc.Columns.Add("row_color", typeof(string));

                isopera.Columns.Add("area_id", typeof(int));
                isopera.Columns.Add("area_code", typeof(string));
                isopera.Columns.Add("area_name", typeof(string));
                isopera.Columns.Add("color", typeof(string));
                isopera.Columns.Add("row_color", typeof(string));

                con_dt1.Columns.Add("area_id", typeof(int));
                con_dt1.Columns.Add("area_code", typeof(string));
                con_dt1.Columns.Add("area_name", typeof(string));
                con_dt1.Columns.Add("color", typeof(string));
                con_dt1.Columns.Add("row_color", typeof(string));

                con_dt2.Columns.Add("area_id", typeof(int));
                con_dt2.Columns.Add("area_code", typeof(string));
                con_dt2.Columns.Add("area_name", typeof(string));
                con_dt2.Columns.Add("color", typeof(string));
                con_dt2.Columns.Add("row_color", typeof(string));

                con_dt3.Columns.Add("area_id", typeof(int));
                con_dt3.Columns.Add("area_code", typeof(string));
                con_dt3.Columns.Add("area_name", typeof(string));
                con_dt3.Columns.Add("color", typeof(string));
                con_dt3.Columns.Add("row_color", typeof(string));

                op_dt1.Columns.Add("area_id", typeof(int));
                op_dt1.Columns.Add("area_code", typeof(string));
                op_dt1.Columns.Add("area_name", typeof(string));
                op_dt1.Columns.Add("color", typeof(string));
                op_dt1.Columns.Add("row_color", typeof(string));

                op_dt2.Columns.Add("area_id", typeof(int));
                op_dt2.Columns.Add("area_code", typeof(string));
                op_dt2.Columns.Add("area_name", typeof(string));
                op_dt2.Columns.Add("color", typeof(string));
                op_dt2.Columns.Add("row_color", typeof(string));

                op_dt3.Columns.Add("area_id", typeof(int));
                op_dt3.Columns.Add("area_code", typeof(string));
                op_dt3.Columns.Add("area_name", typeof(string));
                op_dt3.Columns.Add("color", typeof(string));
                op_dt3.Columns.Add("row_color", typeof(string));

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if ((dt.Rows[i][7].ToString() == dt.Rows[i][8].ToString()) && (dt.Rows[i][7].ToString() == "True") && (dt.Rows[i][8].ToString() == "True"))
                    {
                        area_id = 0; area_code = ""; area_name = ""; color = ""; row_color = "";
                        area_id = int.Parse(dt.Rows[i]["area_id"].ToString());
                        area_code = dt.Rows[i]["area_code"].ToString();
                        area_name = dt.Rows[i]["area_name"].ToString();
                        color = dt.Rows[i]["color"].ToString();
                        row_color = "Red";
                    }
                    else
                    {
                        area_id = 0; area_code = ""; area_name = ""; color = ""; row_color = "";
                        area_id = int.Parse(dt.Rows[i]["area_id"].ToString());
                        area_code = dt.Rows[i]["area_code"].ToString();
                        area_name = dt.Rows[i]["area_name"].ToString();
                        color = dt.Rows[i]["color"].ToString();
                        row_color = "Black";
                    }
                    if (dt.Rows[i][7].ToString() == "True") //Concentrated area
                    {
                        isconc.Rows.Add(area_id, area_code, area_name, color, row_color);
                    }
                    if (dt.Rows[i][8].ToString() == "True") // Operational area
                    {
                        isopera.Rows.Add(area_id, area_code, area_name, color, row_color);
                    }
                }

                isconccount = isconc.Rows.Count / 3;
                isopercount = isopera.Rows.Count / 3;

                for (int j = 0; j < isconc.Rows.Count; j++) // looping through isconcentrated only
                {
                    area_id = 0; area_code = ""; area_name = ""; color = ""; row_color = "";
                    area_id = int.Parse(dt.Rows[j]["area_id"].ToString());
                    area_code = isconc.Rows[j]["area_code"].ToString();
                    area_name = isconc.Rows[j]["area_name"].ToString();
                    color = isconc.Rows[j]["color"].ToString();
                    row_color = isconc.Rows[j]["row_color"].ToString();
                    if (j < isconccount)
                    {
                        con_dt1.Rows.Add(area_id, area_code, area_name, color, row_color);
                    }
                    else if (j >= isconccount && j < (isconccount * 2))
                    {
                        con_dt2.Rows.Add(area_id, area_code, area_name, color, row_color);
                    }
                    else if (j >= (isconccount * 2) && j < (isconccount * 3))
                    {
                        con_dt3.Rows.Add(area_id, area_code, area_name, color, row_color);
                    }
                    else
                    {
                        if (isconc.Rows.Count == 1)
                        {
                            con_dt1.Rows.Add(area_id, area_code, area_name, color, row_color);
                        }
                        if (isconc.Rows.Count == 2)
                        {
                            if (j == 0)
                            {
                                con_dt1.Rows.Add(area_id, area_code, area_name, color, row_color);
                            }
                            else
                            {
                                con_dt2.Rows.Add(area_id, area_code, area_name, color, row_color);
                            }

                        }
                    }
                }

                for (int k = 0; k < isopera.Rows.Count; k++) // looping through operational only
                {
                    area_id = 0; area_code = ""; area_name = ""; color = ""; row_color = "";
                    area_id = int.Parse(dt.Rows[k]["area_id"].ToString());
                    area_code = isopera.Rows[k]["area_code"].ToString();
                    area_name = isopera.Rows[k]["area_name"].ToString();
                    color = isopera.Rows[k]["color"].ToString();
                    row_color = isopera.Rows[k]["row_color"].ToString();
                    if (k < isopercount)
                    {
                        op_dt1.Rows.Add(area_id, area_code, area_name, color, row_color);
                    }
                    else if (k >= isopercount && k < (isopercount * 2))
                    {
                        op_dt2.Rows.Add(area_id, area_code, area_name, color, row_color);
                    }
                    else if (k >= (isopercount * 2) && k < (isopercount * 3))
                    {
                        op_dt3.Rows.Add(area_id, area_code, area_name, color, row_color);
                    }
                    else
                    {
                        if (isopera.Rows.Count == 1)
                        {
                            op_dt1.Rows.Add(area_id, area_code, area_name, color, row_color);
                        }
                        if (isopera.Rows.Count == 2)
                        {
                            if (k == 0)
                            {
                                op_dt1.Rows.Add(area_id, area_code, area_name, color, row_color);
                            }
                            else
                            {
                                op_dt2.Rows.Add(area_id, area_code, area_name, color, row_color);
                            }

                        }
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

        protected void ConGridView1_PreRender(object sender, EventArgs e)
        {
            if (ConGridView1.Rows.Count > 0)
            {
                ConGridView1.UseAccessibleHeader = true;
                ConGridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void ConGridView2_PreRender(object sender, EventArgs e)
        {
            if (ConGridView2.Rows.Count > 0)
            {
                ConGridView2.UseAccessibleHeader = true;
                ConGridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void ConGridView3_PreRender(object sender, EventArgs e)
        {
            if (ConGridView3.Rows.Count > 0)
            {
                ConGridView3.UseAccessibleHeader = true;
                ConGridView3.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void OpGridView1_PreRender(object sender, EventArgs e)
        {
            if (OpGridView1.Rows.Count > 0)
            {
                OpGridView1.UseAccessibleHeader = true;
                OpGridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }

        protected void OpGridView2_PreRender(object sender, EventArgs e)
        {
            if (OpGridView2.Rows.Count > 0)
            {
                OpGridView2.UseAccessibleHeader = true;
                OpGridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }

        protected void OpGridView3_PreRender(object sender, EventArgs e)
        {
            if (OpGridView3.Rows.Count > 0)
            {
                OpGridView3.UseAccessibleHeader = true;
                OpGridView3.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }
        protected void lnk_arn1_Click(Object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            Session["area"] = int.Parse(ConGridView1.DataKeys[row.RowIndex].Value.ToString());
            Response.Redirect("detail_incident.aspx");
        }
        protected void lnk_arn2_Click(Object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            Session["area"] = int.Parse(ConGridView2.DataKeys[row.RowIndex].Value.ToString());
            Response.Redirect("detail_incident.aspx");
        }
        protected void lnk_arn3_Click(Object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            Session["area"] = int.Parse(ConGridView3.DataKeys[row.RowIndex].Value.ToString());
            Response.Redirect("detail_incident.aspx");
        }
        protected void lnk_arn4_Click(Object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            Session["area"] = int.Parse(OpGridView1.DataKeys[row.RowIndex].Value.ToString());
            Response.Redirect("detail_incident.aspx");
        }
        protected void lnk_arn5_Click(Object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            Session["area"] = int.Parse(OpGridView2.DataKeys[row.RowIndex].Value.ToString());
            Response.Redirect("detail_incident.aspx");
        }
        protected void lnk_arn6_Click(Object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            Session["area"] = int.Parse(OpGridView3.DataKeys[row.RowIndex].Value.ToString());
            Response.Redirect("detail_incident.aspx");
        }

    }
}