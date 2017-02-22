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
    public partial class parlimen_tumpuan : System.Web.UI.Page
    {
        bus_sis_ugc3 bus = new bus_sis_ugc3();
        int id;
        string is_con;
        string is_opp_con;
        string area_code;
        string name;
        string color;
        DataTable one = new DataTable();
        DataTable two = new DataTable();
        DataTable three = new DataTable();
        DataTable one_one = new DataTable();
        DataTable two_two = new DataTable();
        DataTable three_three = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                fill_senarai_kawasan();
                fill_senarai_kawasan_pem();
            }
        }
        public void fill_senarai_kawasan()
        {
            one.Columns.Add("area_code", typeof(string));
            one.Columns.Add("area_name", typeof(string));
            one.Columns.Add("color", typeof(string));
            one.Columns.Add("area_id", typeof(int));
            one.Columns.Add("isconcentrated_opposition", typeof(string));
            

            two.Columns.Add("area_code", typeof(string));
            two.Columns.Add("area_name", typeof(string));
            two.Columns.Add("color", typeof(string));
            two.Columns.Add("area_id", typeof(int));
            two.Columns.Add("isconcentrated_opposition", typeof(string));

            three.Columns.Add("area_code", typeof(string));
            three.Columns.Add("area_name", typeof(string));
            three.Columns.Add("color", typeof(string));
            three.Columns.Add("area_id", typeof(int));
            three.Columns.Add("isconcentrated_opposition", typeof(string));


            bus.state_id = int.Parse(Session["state"].ToString());
            DataTable dt = bus.fill_senarai_kawasan();
            int count = dt.Rows.Count;
            if (count>=3)
            {
                int div_count = count / 3;
                for (int i = 0; i < count; i++)
                {
                    id = int.Parse(dt.Rows[i]["area_id"].ToString());
                    area_code = dt.Rows[i]["area_code"].ToString();
                    name = dt.Rows[i]["area_name"].ToString();
                    color = dt.Rows[i]["color"].ToString();
                    is_opp_con = dt.Rows[i]["isconcentrated_opposition"].ToString();
                    if (i < div_count)
                    {
                        one.Rows.Add(area_code, name, color, id, is_opp_con);
                    }
                    else if (i < (div_count * 2))
                    {
                        two.Rows.Add(area_code, name, color, id, is_opp_con);
                    }
                    else if (i < (div_count * 3))
                    {
                        three.Rows.Add(area_code, name, color, id, is_opp_con);
                    }
                    else
                    {
                        one.Rows.Add(area_code, name, color, id, is_opp_con);
                    }


                }
                grid_senarai_one.DataSource = one;
                grid_senarai_one.DataBind();

                grid_senarai_two.DataSource = two;
                grid_senarai_two.DataBind();

                grid_senarai_three.DataSource = three;
                grid_senarai_three.DataBind();
            }
            else if (count == 2)
            {

                int o_id = int.Parse(dt.Rows[0]["area_id"].ToString());
                string o_area_code = dt.Rows[0]["area_code"].ToString();
                string o_name = dt.Rows[0]["area_name"].ToString();
                string o_color = dt.Rows[0]["color"].ToString();
                string o_is_op_co = dt.Rows[0]["isconcentrated_opposition"].ToString();
                int t_id = int.Parse(dt.Rows[1]["area_id"].ToString());
                string t_area_code = dt.Rows[1]["area_code"].ToString();
                string t_name = dt.Rows[1]["area_name"].ToString();
                string t_color = dt.Rows[1]["color"].ToString();
                string t_is_op_co =dt.Rows[1]["isconcentrated_opposition"].ToString();
                one.Rows.Add(o_area_code, o_name, o_color, o_id, o_is_op_co);
                two.Rows.Add(t_area_code, t_name, t_color, t_id, t_is_op_co);

                grid_senarai_one.DataSource = one;
                grid_senarai_one.DataBind();

                grid_senarai_two.DataSource = two;
                grid_senarai_two.DataBind();

            }
            else
            {
                grid_senarai_one.DataSource = dt;
                grid_senarai_one.DataBind();
            }
               
            
        }
        public void fill_senarai_kawasan_pem()
        {
            one_one.Columns.Add("area_code", typeof(string));
            one_one.Columns.Add("area_name", typeof(string));
            one_one.Columns.Add("color", typeof(string));
            one_one.Columns.Add("area_id", typeof(int));
            one_one.Columns.Add("isconcentrated", typeof(string));

            two_two.Columns.Add("area_code", typeof(string));
            two_two.Columns.Add("area_name", typeof(string));
            two_two.Columns.Add("color", typeof(string));
            two_two.Columns.Add("area_id", typeof(int));
            two_two.Columns.Add("isconcentrated", typeof(string));

            three_three.Columns.Add("area_code", typeof(string));
            three_three.Columns.Add("area_name", typeof(string));
            three_three.Columns.Add("color", typeof(string));
            three_three.Columns.Add("area_id", typeof(int));
            three_three.Columns.Add("isconcentrated", typeof(string));


            bus.state_id = int.Parse(Session["state"].ToString());
            DataTable dt = bus.fill_senarai_kawasan_pem();
            int count = dt.Rows.Count;
            if (count >= 3)
            {
                int div_count = count / 3;
                for (int i = 0; i < count; i++)
                {
                    id = int.Parse(dt.Rows[i]["area_id"].ToString());
                    area_code = dt.Rows[i]["area_code"].ToString();
                    name = dt.Rows[i]["area_name"].ToString();
                    color = dt.Rows[i]["color"].ToString();
                    is_con = dt.Rows[i]["isconcentrated"].ToString();
                    if (i < div_count)
                    {
                        one_one.Rows.Add(area_code, name, color, id, is_con);
                    }
                    else if (i < (div_count * 2))
                    {
                        two_two.Rows.Add(area_code, name, color, id, is_con);
                    }
                    else if (i < (div_count * 3))
                    {
                        three_three.Rows.Add(area_code, name, color, id, is_con);
                    }
                    else
                    {
                        one_one.Rows.Add(area_code, name, color, id, is_con);
                    }
                }
                grid_one.DataSource = one_one;
                grid_one.DataBind();

                grid_two.DataSource = two_two;
                grid_two.DataBind();

                grid_three.DataSource = three_three;
                grid_three.DataBind();
            }
            else if (count == 2)
            {

                int o_id = int.Parse(dt.Rows[0]["area_id"].ToString());
                string o_area_code = dt.Rows[0]["area_code"].ToString();
                string o_name = dt.Rows[0]["area_name"].ToString();
                string o_color = dt.Rows[0]["color"].ToString();
                string o_is_con = dt.Rows[0]["isconcentrated"].ToString();
                int t_id = int.Parse(dt.Rows[1]["area_id"].ToString());
                string t_area_code = dt.Rows[1]["area_code"].ToString();
                string t_name = dt.Rows[1]["area_name"].ToString();
                string t_color = dt.Rows[1]["color"].ToString();
                string t_is_con = dt.Rows[1]["isconcentrated"].ToString();
                one_one.Rows.Add(o_area_code, o_name, o_color, o_id, o_is_con);
                two_two.Rows.Add(t_area_code, t_name, t_color, t_id,t_is_con);

                grid_one.DataSource = one_one;
                grid_one.DataBind();

                grid_two.DataSource = two_two;
                grid_two.DataBind();

            }
            else
            {
                grid_one.DataSource = dt;
                grid_one.DataBind();
            }
        }
        protected void grid_senarai_one_PreRender(object sender, EventArgs e)
        {
            if (grid_senarai_one.Rows.Count > 0)
            {
                grid_senarai_one.UseAccessibleHeader = true;
                grid_senarai_one.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }


        protected void grid_senarai_two_PreRender(object sender, EventArgs e)
        {
            if (grid_senarai_two.Rows.Count > 0)
            {
                grid_senarai_two.UseAccessibleHeader = true;
                grid_senarai_two.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }


        protected void grid_senarai_three_PreRender(object sender, EventArgs e)
        {
            if (grid_senarai_three.Rows.Count > 0)
            {
                grid_senarai_three.UseAccessibleHeader = true;
                grid_senarai_three.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void grid_one_PreRender(object sender, EventArgs e)
        {
            if (grid_one.Rows.Count > 0)
            {
                grid_one.UseAccessibleHeader = true;
                grid_one.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void grid_two_PreRender(object sender, EventArgs e)
        {
            if (grid_two.Rows.Count > 0)
            {
                grid_two.UseAccessibleHeader = true;
                grid_two.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void grid_three_PreRender(object sender, EventArgs e)
        {
            if (grid_three.Rows.Count > 0)
            {
                grid_three.UseAccessibleHeader = true;
                grid_three.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        protected void link_area_name_skone_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = int.Parse(grid_senarai_one.DataKeys[row.RowIndex].Value.ToString());
            Session["area"] = id;
            Response.Redirect("detail_incident.aspx");
        }
        protected void link_area_name_sktwo_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = int.Parse(grid_senarai_two.DataKeys[row.RowIndex].Value.ToString());
            Session["area"] = id;
            Response.Redirect("detail_incident.aspx");
        }
        protected void link_area_name_skthree_Click(object sender, EventArgs e)
        {
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = int.Parse(grid_senarai_three.DataKeys[row.RowIndex].Value.ToString());
            Session["area"] = id;
            Response.Redirect("detail_incident.aspx");
        }
    }
}