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
        DataTable statusdt = new DataTable();
        string areas;
        string color = "";
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
                status[0] = 0;
                status[1] = 0;
                status[2] = 0;
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
            string name = "";
            string values = "";
            statusdt.Columns.Add("names", typeof(string));
            int parentid, parentid_p;
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

                for (int i = 0; i < subDistricts.Rows.Count; i++)
                {
                    if (subDistricts.Rows[i]["color"].ToString() == "HITAM")
                    {
                        color = "&nbsp;<h2 class='fa fa-square' style='color:black;border: 1px solid gray;border-radius: 2px; width: 20px;height: 15px;background-color:black;'></h2>&nbsp;";
                    }
                    else if (subDistricts.Rows[i]["color"].ToString() == "KELABU")
                    {
                        color = "&nbsp;<h2 class='fa fa-square' style='color:grey;border: 1px solid gray;border-radius: 2px; width: 20px;height: 15px;background-color:grey;'></h2>&nbsp;";
                    }
                    else if (subDistricts.Rows[i]["color"].ToString() == "PUTIH")
                    {
                        color = "&nbsp;<h2 class='fa fa-square' style='color:white;border: 1px solid gray;border-radius: 2px; width: 20px;height: 15px;background-color:white;'></h2>&nbsp;";
                    }
                    if (i == 0)
                    {
                        parentid = int.Parse(subDistricts.Rows[i]["parent_area_id"].ToString());
                        name = subDistricts.Rows[i]["area"].ToString() + "  " + color;
                    }
                    else
                    {
                        parentid = int.Parse(subDistricts.Rows[i]["parent_area_id"].ToString());
                        parentid_p = int.Parse(subDistricts.Rows[i - 1]["parent_area_id"].ToString());
                        if (parentid == parentid_p)
                        {
                            name += "  " + subDistricts.Rows[i]["area"].ToString() + "  " + color;
                        }
                        else
                        {
                            // insert only if the parent id's are diff
                            values = "";
                            values = name;
                            statusdt.Rows.Add(values);
                            // Then take the new name
                            name = subDistricts.Rows[i]["area"].ToString() + "  " + color;
                        }
                    }
                }
                values = "";
                values = name;
                statusdt.Rows.Add(values);
                status_kawasan_subdist.DataSource = statusdt;
                status_kawasan_subdist.DataBind();

            }
        }

        #region SebinCode
        //public void loadSubDistrictStatus()
        //{

        //    bus4.sid = int.Parse(Session["state"].ToString());
        //    bus4.areaType = 2;
        //    subDistricts = bus4.fill_status_districts();
        //    if (subDistricts.Rows.Count > 0)
        //    {
        //        int[] status = new int[3];
        //        status[0] = 0;
        //        status[1] = 0;
        //        status[2] = 0;
        //        foreach (DataRow row in subDistricts.Rows)
        //        {
        //            if (row["color"].Equals("HITAM")) { status[0] += 1; }
        //            else if (row["color"].Equals("KELABU")) { status[1] += 1; }
        //            else if (row["color"].Equals("PUTIH")) { status[2] += 1; }
        //        }
        //        statusblack_sd.InnerHtml = status[0].ToString();
        //        statusgray_sd.InnerHtml = status[1].ToString();
        //        statuswhite_sd.InnerHtml = status[2].ToString();

        //        status_kawasan_subdist.DataSource = subDistricts;
        //        status_kawasan_subdist.DataBind();
        //        // until here
        //    }
        //}
        
        #endregion

        #region JaneCode
        //public void loadSubDistrictStatus()
        //{

        //    bus4.sid = int.Parse(Session["state"].ToString());
        //    bus4.areaType = 2;
        //    subDistricts = bus4.fill_status_districts();
        //    if (subDistricts.Rows.Count > 0)
        //    {
        //        int[] status = new int[3];
        //        status[0] = 0;
        //        status[1] = 0;
        //        status[2] = 0;
        //        foreach (DataRow row in subDistricts.Rows)
        //        {
        //            if (row["color"].Equals("HITAM")) { status[0] += 1; }
        //            else if (row["color"].Equals("KELABU")) { status[1] += 1; }
        //            else if (row["color"].Equals("PUTIH")) { status[2] += 1; }
        //        }
        //        statusblack_sd.InnerHtml = status[0].ToString();
        //        statusgray_sd.InnerHtml = status[1].ToString();
        //        statuswhite_sd.InnerHtml = status[2].ToString();



        //        DataTable dtFinal = subDistricts.Clone();

        //        DataTable newdt = new DataTable();
        //        newdt.Columns.Add("areas", typeof(string));
        //        newdt.Columns.Add("color", typeof(string));

        //        for (int i = 0; i < subDistricts.Rows.Count; i++)
        //        {
        //            bool isDupe = false;
        //            for (int j = 0; j < dtFinal.Rows.Count; j++)
        //            {
        //                if (subDistricts.Rows[i][1].ToString() == dtFinal.Rows[j][1].ToString())
        //                {
        //                    //string hitm1 = "";
        //                    //string kelabu1 = "";
        //                    //string putih = "";
        //                    //if (dtFinal.Rows[j][5].ToString() == "HITAM")
        //                    //{
        //                    //    hitm1 = "<h3 class='fa fa-circle'></h3>";
        //                    //}
        //                    //else if (dtFinal.Rows[j][5].ToString() == "KELABU")
        //                    //{
        //                    //    kelabu1 = "<h3 class='fa fa-circle'></h3>";
        //                    //}
        //                    //else if (dtFinal.Rows[j][5].ToString() == "PUTIH")
        //                    //{
        //                    //    putih = "<h3 class='fa fa-circle'></h3>";
        //                    //}

        //                    dtFinal.Rows[j][4] = dtFinal.Rows[j][4].ToString() +  " ** " + subDistricts.Rows[i][4].ToString();
        //                    //dtFinal.Rows[j][8] = dtFinal.Rows[j][4].ToString() + " ?? " + hitm1 + kelabu1 + putih + subDistricts.Rows[i][4].ToString() + " ?? " + hitm1 + kelabu1 + putih;

        //                    //areas = ""; color = "";
        //                    //areas = dtFinal.Rows[j][4].ToString() + " ** " + subDistricts.Rows[i][4].ToString();
        //                    //color = subDistricts.Rows[i][5].ToString();
        //                    isDupe = true;
        //                    break;
        //                }
        //                //newdt.Rows.Add(areas, color);
        //            }
        //            if (!isDupe)
        //            {
        //                dtFinal.ImportRow(subDistricts.Rows[i]);
        //            }
        //        }

        //        status_kawasan_subdist.DataSource = dtFinal;
        //        status_kawasan_subdist.DataBind();
        //        // until here
        //    }
        //}       
        #endregion


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

        protected Boolean IsEnabled(bool conc)
        {
            if (conc == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void link_area_name_skone_Click(object sender, EventArgs e)
        {
            Session["pre_page"] = "Rumusan Status Kawasan";
            Session["pre_url"] = "status_kawasan";
            LinkButton lnk = sender as LinkButton;
            GridViewRow row = lnk.NamingContainer as GridViewRow;
            int id = int.Parse(status_kawasan_dist.DataKeys[row.RowIndex].Value.ToString());
            Session["area"] = id;
            Response.Redirect("detail_incident");
        }
    }
}