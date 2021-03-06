﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using SIS_B;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.IO;

namespace SIS_V.state
{
    public partial class candidate_winnable_view : System.Web.UI.Page
    {
        bus_sis_ugc4 bus = new bus_sis_ugc4();
        DataTable instanceDt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillCandidate();
                clientInvocation();
                candidateInfoPanel.Visible = false;
                invalidAdd.Visible = false;
                invalidOption.Visible = false;
                updateStatus.Visible = false;
                agencyGroupBtn.Visible = false;
                
            }
        }

        private void fillCandidate()
        {
            instanceDt = new DataTable();
            instanceDt.Clear();
            instanceDt = bus.fill_Candidates();
            if (instanceDt.Rows.Count > 0)
            {
                candidates.DataSource = instanceDt;
                candidates.DataBind();
                candidates.Items.Insert(0, new ListItem("-----PILIH-----", ""));
            }

        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            if (candidates.SelectedIndex != 0)
            {
                topStatus.Visible = false;
                string candidateIc = candidates.SelectedValue;
                bus.candidateIc = candidateIc;
                fillCandidateInfo();
                clientInvocation();
                invalidAdd.Visible = false;
                invalidOption.Visible = false;
                updateStatus.Visible = false;
                agencyGroupBtn.Visible = false;
            }
            else
            {
                topLabel.Text = "Sila pilih calon untuk mencari.";
                topStatus.Visible = true;
            }
        }
        private void fillCandidateInfo()
        {
            string cand_image;
            DataTable candidateDt = new DataTable();
            candidateDt = bus.fill_Candidate_info();
            candidateDt.Columns.Add("pimage", typeof(string));
            if (candidateDt.Rows.Count > 0)
            {
                for (int i = 0; i < candidateDt.Rows.Count; i++)
                {
                    string base64String = "";
                    if (candidateDt.Rows[i]["image"].ToString() == "")
                    {
                        base64String = "/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAA8AAD/4QMZaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjRFNkQ1NTQwRkU2NzExRTY5NERGOTA2MjJBMEZGNjlFIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjRFNkQ1NTNGRkU2NzExRTY5NERGOTA2MjJBMEZGNjlFIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzYgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIzOEMxMzlCNTM0NjhGMTQwODZFRTFFNEEzMDc0MEQ5MyIgc3RSZWY6ZG9jdW1lbnRJRD0iMzhDMTM5QjUzNDY4RjE0MDg2RUUxRTRBMzA3NDBEOTMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAGBAQEBQQGBQUGCQYFBgkLCAYGCAsMCgoLCgoMEAwMDAwMDBAM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";
                    }
                    else
                    {
                        byte[] bytes = (byte[])candidateDt.Rows[i]["image"];
                        if (bytes.Length > 0)
                        {
                            base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        }
                        else
                        {
                            base64String = "/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAA8AAD/4QMZaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjRFNkQ1NTQwRkU2NzExRTY5NERGOTA2MjJBMEZGNjlFIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjRFNkQ1NTNGRkU2NzExRTY5NERGOTA2MjJBMEZGNjlFIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzYgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIzOEMxMzlCNTM0NjhGMTQwODZFRTFFNEEzMDc0MEQ5MyIgc3RSZWY6ZG9jdW1lbnRJRD0iMzhDMTM5QjUzNDY4RjE0MDg2RUUxRTRBMzA3NDBEOTMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAGBAQEBQQGBQUGCQYFBgkLCAYGCAsMCgoLCgoMEAwMDAwMDBAM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";
                        }
                    }
                    cand_image = "data:image/png;base64," + base64String;
                    candidateDt.Rows[i]["pimage"] = cand_image;
                }
                ViewState["candidate"] = candidateDt;
                CandidateDataList.DataSource = candidateDt;
                CandidateDataList.DataBind();
                HfCandidateId.Value = candidateDt.Rows[0]["candidate_id"].ToString();
                fillComment(Int32.Parse(candidateDt.Rows[0]["candidate_id"].ToString()));
                fillWinnableArea(Int32.Parse(candidateDt.Rows[0]["candidate_id"].ToString()));
                fillArchive(Int32.Parse(candidateDt.Rows[0]["candidate_id"].ToString()));
                candidateInfoPanel.Visible = true;
                alternate.Visible = false;
            }
            else
            {
                candidateInfoPanel.Visible = false;
                alternate.Visible = true;
            }
        }

        private void fillArchive(int candidate_id)
        {
            instanceDt = new DataTable();
            instanceDt.Clear();
            bus.candidate_id = candidate_id;
            instanceDt = bus.fill_candidate_area_archive();
            if (instanceDt.Rows.Count > 0)
            {
                HfArchiveId.Value = instanceDt.Rows[0]["win_candidate_archive_id"].ToString();
                GridViewFile.DataSource = instanceDt;
                GridViewFile.DataBind();
                lbnFileDelete.Visible = true;
            }
            else
            {
                GridViewFile.DataSource = null;
                GridViewFile.DataBind();
                lbnFileDelete.Visible = false;
            }
        }

        private void fillComment(int candidate_id)
        {
            instanceDt = new DataTable();
            instanceDt.Clear();
            bus.candidate_id = candidate_id;
            TextBox tt1 = (TextBox)CandidateDataList.Items[0].FindControl("txtComment");
            instanceDt = bus.fill_candidate_comment();
            if (instanceDt.Rows.Count > 0)
            {
                tt1.Text = instanceDt.Rows[0]["comments"].ToString();
            }
        }

        private void fillElection(DropDownList ddElection)
        {
            instanceDt = new DataTable();
            instanceDt.Clear();
            instanceDt = bus.currentElectionInfo();
            if (instanceDt.Rows.Count > 0)
            {
                ddElection.DataSource = instanceDt;
                ddElection.DataBind();
            }
        }

        private void fillWinnableArea(int candidate_id)
        {
            instanceDt = new DataTable();
            instanceDt.Clear();
            bus.candidate_id = candidate_id;
            instanceDt = bus.fill_candidate_area();
            int index = instanceDt.Rows.Count;
            DataRow dr1 = instanceDt.NewRow();
            dr1["candidate_area_id"] = DBNull.Value;
            dr1["candidate_id"] = DBNull.Value;
            dr1["area_id"] = DBNull.Value;
            dr1["election_id"] = DBNull.Value;
            dr1["choice_no"] = DBNull.Value;
            dr1["is_incumbent"] = DBNull.Value;
            dr1["area_name"] = string.Empty;
            dr1["election_name"] = string.Empty;
            dr1["area_type"] = DBNull.Value;
            instanceDt.Rows.Add(dr1);
            ViewState["CurrentTable"] = instanceDt;
            if (instanceDt.Rows.Count > 0)
            {
                GridViewUpdate.DataSource = instanceDt;
                GridViewUpdate.DataBind();
            }
        }

        private void clientInvocation()
        {
            StringBuilder strScript = new StringBuilder();
            strScript.Append("jQuery(document).ready(function () {");
            strScript.Append("$('#candidates').customselect();");
            strScript.Append("});");
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "Script", strScript.ToString(), true);
        }

        protected void GridViewUpdate_PreRender(object sender, EventArgs e)
        {
            if (GridViewUpdate.Rows.Count > 0)
            {
                GridViewUpdate.UseAccessibleHeader = true;
                GridViewUpdate.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void ddArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList lb = (DropDownList)sender;
            GridViewRow row = (GridViewRow)lb.NamingContainer;

            DropDownList ddarea = (DropDownList)row.FindControl("ddArea");
            DropDownList ddareacode = (DropDownList)row.FindControl("ddAreaCode");
            if (ddarea.SelectedIndex != 0)
            {
                int areaType = Int32.Parse(ddarea.SelectedValue);

                instanceDt = new DataTable();
                bus.areaType = areaType;
                bus.sid = int.Parse(Session["state"].ToString());
                instanceDt = bus.fill_status_districts();
                if (instanceDt.Rows.Count > 0)
                {
                    ddareacode.DataSource = instanceDt;
                    ddareacode.DataBind();
                    ddareacode.Items.Insert(0, new ListItem("----SILA PILIH----", ""));
                }
                ddareacode.Enabled = true;
                clientInvocation();
                invalidAdd.Visible = false;
                invalidOption.Visible = false;
                updateStatus.Visible = false;
            }
        }

        protected void ddOptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            invalidAdd.Visible = false;
            invalidOption.Visible = false;
            updateStatus.Visible = false;
        }

        protected void lbDelete_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lb.NamingContainer;
            if (lb.CommandArgument == "delete")
            {
                if (row != null)
                {
                    int index = row.RowIndex;
                    HiddenField hfvalue = (HiddenField)GridViewUpdate.Rows[index].Cells[1].FindControl("hfPid");
                    bus.candidate_area_id = int.Parse(hfvalue.Value);
                    invalidOption.Visible = false;
                    invalidAdd.Visible = false;
                    if (bus.delete_WinnableCandidateAreaSourceAll() == 0)
                    {
                        if (bus.delete_WinnableCandidateArea() == 0)
                        {
                            updateLabel.Text = "Rekod berjaya dipadamkan.";
                            updateStatus.Attributes.Remove("class");
                            updateStatus.Attributes.Add("class", "alert alert-success alert-dismissable");
                            updateStatus.Visible = true;
                            if (candidates.SelectedIndex != 0)
                            {
                                string candidateIc = candidates.SelectedValue;
                                bus.candidateIc = candidateIc;
                                fillCandidateInfo();
                            }
                        }
                        else
                        {
                            updateLabel.Text = "Tidak dapat memadam rekod.";
                            updateStatus.Attributes.Remove("class");
                            updateStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                            updateStatus.Visible = true;
                        }
                    }
                }
            }
        }


        protected void lbDelete_Click1(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lb.NamingContainer;
            if (lb.CommandArgument == "delete")
            {
                if (row != null)
                {
                    int index = row.RowIndex;
                    HiddenField hf1 = (HiddenField)GridViewAgency.Rows[index].Cells[1].FindControl("hfAgencyid");
                    bus.candidate_area_source_id = int.Parse(hf1.Value);
                    invalidOption.Visible = false;
                    invalidAdd.Visible = false;
                    if (bus.delete_WinnableSourceArea() == 0)
                    {
                        agencyLabel.Text = "Rekod berjaya dipadamkan.";
                        agencyStatus.Attributes.Remove("class");
                        agencyStatus.Attributes.Add("class", "alert alert-success alert-dismissable");
                        agencyStatus.Visible = true;
                        DataTable dtag = new DataTable();
                        bus.candidate_area_id = int.Parse(htCandidateAreaId.Value);
                        dtag = bus.fill_winnable_area_source();
                        DataRow dr1 = dtag.NewRow();
                        dr1["candidate_area_source_id"] = DBNull.Value;
                        dr1["candidate_area_id"] = DBNull.Value;
                        dr1["agency_name"] = string.Empty;
                        dr1["justification"] = string.Empty;
                        dr1["source_date"] = DBNull.Value;
                        dtag.Rows.Add(dr1);
                        ViewState["AgencyTable"] = dtag;
                        if (dtag.Rows.Count > 0)
                        {
                            GridViewAgency.DataSource = dtag;
                            GridViewAgency.DataBind();
                        }
                    }
                    else
                    {
                        agencyLabel.Text = "Tidak dapat memadam rekod.";
                        agencyStatus.Attributes.Remove("class");
                        agencyStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                        agencyStatus.Visible = true;
                    }
                }
            }
        }

        protected void lbEdit_Click(object sender, EventArgs e)
        {
            agencyStatus.Visible = false;
            LinkButton lb = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lb.NamingContainer;
            if (lb.CommandArgument == "edit")
            {
                if (row != null)
                {
                    int index = row.RowIndex;
                    DropDownList ddl1 = (DropDownList)GridViewUpdate.Rows[index].Cells[1].FindControl("ddElection");
                    DropDownList ddl2 = (DropDownList)GridViewUpdate.Rows[index].Cells[2].FindControl("ddPosition");
                    DropDownList ddl3 = (DropDownList)GridViewUpdate.Rows[index].Cells[3].FindControl("ddArea");
                    DropDownList ddl4 = (DropDownList)GridViewUpdate.Rows[index].Cells[4].FindControl("ddAreaCode");
                    DropDownList ddl5 = (DropDownList)GridViewUpdate.Rows[index].Cells[5].FindControl("ddOptions");

                    Label lb1 = (Label)GridViewUpdate.Rows[index].Cells[1].FindControl("LblElection");
                    Label lb2 = (Label)GridViewUpdate.Rows[index].Cells[2].FindControl("LblPosition");
                    Label lb3 = (Label)GridViewUpdate.Rows[index].Cells[3].FindControl("LblArea");
                    Label lb4 = (Label)GridViewUpdate.Rows[index].Cells[4].FindControl("LblAreaCode");
                    Label lb5 = (Label)GridViewUpdate.Rows[index].Cells[5].FindControl("LblOptions");

                    HtmlGenericControl itag = (HtmlGenericControl)GridViewUpdate.Rows[index].Cells[6].FindControl("iconEdit");

                    itag.Attributes.Remove("class");
                    itag.Attributes.Add("class", "fa fa-save");

                    fillElection(ddl1);
                    ddl1.ClearSelection();
                    ddl1.Items.FindByText(lb1.Text).Selected = true;

                    ddl2.ClearSelection();
                    ddl2.Items.FindByText(lb2.Text).Selected = true;

                    ddl3.ClearSelection();
                    ddl3.Items.FindByText(lb3.Text).Selected = true;

                    int areaType = Int32.Parse(ddl3.SelectedValue);
                    instanceDt = new DataTable();
                    bus.areaType = areaType;
                    bus.sid = int.Parse(Session["state"].ToString());
                    instanceDt = bus.fill_status_districts();
                    if (instanceDt.Rows.Count > 0)
                    {
                        ddl4.DataSource = instanceDt;
                        ddl4.DataBind();
                        ddl4.Items.Insert(0, new ListItem("----SILA PILIH----", ""));
                    }
                    ddl4.ClearSelection();
                    ddl4.Items.FindByText(lb4.Text).Selected = true;

                    ddl5.ClearSelection();
                    ddl5.Items.FindByText(lb5.Text).Selected = true;

                    ddl1.Visible = true;
                    ddl2.Visible = true;
                    ddl3.Visible = true;
                    ddl4.Visible = true;
                    ddl5.Visible = true;

                    lb1.Visible = false;
                    lb2.Visible = false;
                    lb3.Visible = false;
                    lb4.Visible = false;
                    lb5.Visible = false;

                    updateStatus.Visible = false;
                    invalidOption.Visible = false;
                    invalidAdd.Visible = false;
                    lb.CommandArgument = "save";
                }
            }
            else if (lb.CommandArgument == "save")
            {
                if (row != null)
                {
                    int index = row.RowIndex;
                    DropDownList ddl1 = (DropDownList)GridViewUpdate.Rows[index].Cells[1].FindControl("ddElection");
                    DropDownList ddl2 = (DropDownList)GridViewUpdate.Rows[index].Cells[2].FindControl("ddPosition");
                    DropDownList ddl3 = (DropDownList)GridViewUpdate.Rows[index].Cells[3].FindControl("ddArea");
                    DropDownList ddl4 = (DropDownList)GridViewUpdate.Rows[index].Cells[4].FindControl("ddAreaCode");
                    DropDownList ddl5 = (DropDownList)GridViewUpdate.Rows[index].Cells[5].FindControl("ddOptions");

                    Label lb1 = (Label)GridViewUpdate.Rows[index].Cells[1].FindControl("LblElection");
                    Label lb2 = (Label)GridViewUpdate.Rows[index].Cells[2].FindControl("LblPosition");
                    Label lb3 = (Label)GridViewUpdate.Rows[index].Cells[3].FindControl("LblArea");
                    Label lb4 = (Label)GridViewUpdate.Rows[index].Cells[4].FindControl("LblAreaCode");
                    Label lb5 = (Label)GridViewUpdate.Rows[index].Cells[5].FindControl("LblOptions");

                    HiddenField hf1 = (HiddenField)GridViewUpdate.Rows[index].Cells[1].FindControl("hfPid");

                    HtmlGenericControl itag = (HtmlGenericControl)GridViewUpdate.Rows[index].Cells[6].FindControl("iconEdit");

                    if (rowValidate(ddl1, ddl2, ddl3, ddl4, ddl5) == 1)
                    {

                        if (hf1.Value != "")
                        {
                            bus.candidate_area_id = int.Parse(hf1.Value);
                            bus.candidate_id = 0;
                            bus.area_id = int.Parse(ddl4.SelectedValue);
                            bus.election_id = int.Parse(ddl1.SelectedValue);
                            bus.choice_id = int.Parse(ddl5.SelectedValue);
                            bus.is_incumbent = int.Parse(ddl2.SelectedValue);
                            if (bus.update_WinnableCandidateArea() == 0)
                            {
                                updateLabel.Text = "Berjaya dikemas kini.";
                                updateStatus.Attributes.Remove("class");
                                updateStatus.Attributes.Add("class", "alert alert-success alert-dismissable");
                                updateStatus.Visible = true;
                                invalidOption.Visible = false;
                                invalidAdd.Visible = false;
                                lb1.Text = ddl1.SelectedItem.Text;
                                lb2.Text = ddl2.SelectedItem.Text;
                                lb3.Text = ddl3.SelectedItem.Text;
                                lb4.Text = ddl4.SelectedItem.Text;
                                lb5.Text = ddl5.SelectedItem.Text;
                            }
                            else
                            {
                                updateLabel.Text = "Tidak dapat mengemas kini maklumat kawasan.";
                                updateStatus.Attributes.Remove("class");
                                updateStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                                updateStatus.Visible = true;
                                invalidOption.Visible = false;
                                invalidAdd.Visible = false;
                            }
                            ddl1.Visible = false;
                            ddl2.Visible = false;
                            ddl3.Visible = false;
                            ddl4.Visible = false;
                            ddl5.Visible = false;

                            lb1.Visible = true;
                            lb2.Visible = true;
                            lb3.Visible = true;
                            lb4.Visible = true;
                            lb5.Visible = true;

                            lb.CommandArgument = "edit";
                            itag.Attributes.Remove("class");
                            itag.Attributes.Add("class", "fa fa-edit");
                        }
                        else
                        {
                            bus.candidate_id = int.Parse(HfCandidateId.Value);
                            bus.area_id = int.Parse(ddl4.SelectedValue);
                            bus.election_id = int.Parse(ddl1.SelectedValue);
                            bus.choice_id = int.Parse(ddl5.SelectedValue);
                            bus.is_incumbent = int.Parse(ddl2.SelectedValue);
                            if (bus.check_WinnableCandidateExists() == 1)
                            {
                                updateLabel.Text = "Anda telah memilih Kawasan ini.";
                                updateStatus.Attributes.Remove("class");
                                updateStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                                updateStatus.Visible = true;
                                invalidOption.Visible = false;
                                invalidAdd.Visible = false;
                            }
                            else
                            {
                                int ret = bus.insert_WinnableArea();
                                if (ret > 0)
                                {
                                    fillWinnableArea(int.Parse(HfCandidateId.Value));
                                    updateLabel.Text = "Dimasukkan dikemaskini.";
                                    updateStatus.Attributes.Remove("class");
                                    updateStatus.Attributes.Add("class", "alert alert-success alert-dismissable");
                                    updateStatus.Visible = true;
                                    invalidOption.Visible = false;
                                    invalidAdd.Visible = false;
                                }
                                else if (ret == -1)
                                {
                                    updateLabel.Text = "Anda telah memilih Kawasan ini.";
                                    updateStatus.Attributes.Remove("class");
                                    updateStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                                    updateStatus.Visible = true;
                                    invalidOption.Visible = false;
                                    invalidAdd.Visible = false;
                                }
                            }
                        }
                    }
                }
            }
        }

        private int rowValidate(DropDownList ddl1, DropDownList ddl2, DropDownList ddl3, DropDownList ddl4, DropDownList ddl5)
        {
            int flag = 0;
            int iflag = 0;

            if (ddl1.SelectedValue == "")
            {
                flag++;
                ddl1.Attributes.CssStyle.Add("border-color", "red");
            }
            else
            {
                ddl1.Attributes.CssStyle.Remove("border-color");
            }
            if (ddl2.SelectedValue == "")
            {
                flag++;
                ddl2.Attributes.CssStyle.Add("border-color", "red");
            }
            else
            {
                ddl2.Attributes.CssStyle.Remove("border-color");
            }
            if (ddl3.SelectedValue == "")
            {
                flag++;
                ddl3.Attributes.CssStyle.Add("border-color", "red");
            }
            else
            {
                ddl3.Attributes.CssStyle.Remove("border-color");
            }
            if (ddl4.SelectedValue == "")
            {
                flag++;
                ddl4.Attributes.CssStyle.Add("border-color", "red");
            }
            else
            {
                ddl4.Attributes.CssStyle.Remove("border-color");
            }
            if (ddl5.SelectedValue == "")
            {
                flag++;
                ddl5.Attributes.CssStyle.Add("border-color", "red");
            }
            else
            {
                ddl5.Attributes.CssStyle.Remove("border-color");
            }
            if (flag == 0)
            {
                if (AreaCandidateExists(ddl4.SelectedValue.ToString(), ddl1.SelectedValue.ToString(), ddl5.SelectedValue.ToString()) == 1)
                {
                    iflag++;
                    ddl5.Attributes.CssStyle.Add("border-color", "red");
                }
                else
                {
                    ddl5.Attributes.CssStyle.Remove("border-color");
                }
            }
            if (flag == 0)
            {
                if (iflag == 0)
                {
                    return 1;
                }
                else
                {
                    updateStatus.Visible = false;
                    invalidOption.Visible = true;
                    return 0;
                }

            }
            else
            {
                updateStatus.Visible = false;
                invalidAdd.Visible = true;
                return 0;
            }
        }

        private int AreaCandidateExists(string ddareacode, string ddelection, string ddoptions)
        {
            bus.candidate_id = Int32.Parse(HfCandidateId.Value);
            bus.area_id = Int32.Parse(ddareacode);
            bus.election_id = Int32.Parse(ddelection);
            bus.choice_id = Int32.Parse(ddoptions);
            int exists = bus.check_WinnableCandidateExistsExcludeSelf();
            return exists;
        }

        protected void GridViewUpdate_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label lbel = e.Row.FindControl("rowNumber") as Label;
                lbel.Text = ((e.Row.RowIndex)+1).ToString();
                DropDownList ddl1 = e.Row.FindControl("ddElection") as DropDownList;
                DropDownList ddl2 = e.Row.FindControl("ddPosition") as DropDownList;
                DropDownList ddl3 = e.Row.FindControl("ddArea") as DropDownList;
                DropDownList ddl4 = e.Row.FindControl("ddAreaCode") as DropDownList;
                DropDownList ddl5 = e.Row.FindControl("ddOptions") as DropDownList;

                Label lb1 = e.Row.FindControl("LblElection") as Label;
                Label lb2 = e.Row.FindControl("LblPosition") as Label;
                Label lb3 = e.Row.FindControl("LblArea") as Label;
                Label lb4 = e.Row.FindControl("LblAreaCode") as Label;
                Label lb5 = e.Row.FindControl("LblOptions") as Label;

                LinkButton lbn1 = e.Row.FindControl("lbEdit") as LinkButton;
                LinkButton lbn2 = e.Row.FindControl("lbDelete") as LinkButton;
                LinkButton lbn3 = e.Row.FindControl("lbAgency") as LinkButton;
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lbn1);
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lbn2);
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lbn3);
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(ddl5);

                HtmlGenericControl itag = e.Row.FindControl("iconEdit") as HtmlGenericControl;
                

                if (ViewState["CurrentTable"] != null)
                {
                    DataTable dt = (DataTable)ViewState["CurrentTable"];
                    if (dt.Rows.Count > 0)
                    {
                        int index = e.Row.RowIndex;
                        if (dt.Rows[(index)]["candidate_area_id"].ToString() == "")
                        {
                            fillElection(ddl1);
                            ddl1.Visible = true;
                            ddl2.Visible = true;
                            ddl3.Visible = true;
                            ddl4.Visible = true;
                            ddl5.Visible = true;
                            lb1.Visible = false;
                            lb2.Visible = false;
                            lb3.Visible = false;
                            lb4.Visible = false;
                            lb5.Visible = false;

                            itag.Attributes.Remove("class");
                            itag.Attributes.Add("class", "fa fa-save");
                            lbn1.CommandArgument = "save";
                            lbn2.Visible = false;
                            lbn3.Visible = false;
                        }
                        else
                        {
                            ddl1.Visible = false;
                            ddl2.Visible = false;
                            ddl3.Visible = false;
                            ddl4.Visible = false;
                            ddl5.Visible = false;
                        }
                    }
                }
            }
        }

        protected void lbAgency_Click(object sender, EventArgs e)
        {

            updateStatus.Visible = false;
            agencyStatus.Visible = false;

            LinkButton lb = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lb.NamingContainer;
            if (lb.CommandArgument == "agencyView")
            {
                if (row != null)
                {
                    int index = row.RowIndex;
                    HiddenField hf1 = (HiddenField)GridViewUpdate.Rows[index].Cells[1].FindControl("hfPid");
                    instanceDt = new DataTable();
                    htCandidateAreaId.Value = hf1.Value;
                    bus.candidate_area_id = int.Parse(hf1.Value);
                    instanceDt = bus.fill_winnable_area_source();
                    DataRow dr1 = instanceDt.NewRow();
                    dr1["candidate_area_source_id"] = DBNull.Value;
                    dr1["candidate_area_id"] = DBNull.Value;
                    dr1["agency_name"] = string.Empty;
                    dr1["justification"] = string.Empty;
                    dr1["source_date"] = DBNull.Value;
                    instanceDt.Rows.Add(dr1);
                    ViewState["AgencyTable"] = instanceDt;
                    if (instanceDt.Rows.Count > 0)
                    {
                        GridViewAgency.DataSource = instanceDt;
                        GridViewAgency.DataBind();
                        agencyGroupBtn.Visible = true;
                        noAgency.Visible = false;
                    }
                    else
                    {
                        GridViewAgency.DataSource = null;
                        GridViewAgency.DataBind();
                        noAgency.Visible = false;
                        agencyGroupBtn.Visible = true;
                    }
                }
            }
        }

        protected void GridViewAgency_PreRender(object sender, EventArgs e)
        {
            if (GridViewAgency.Rows.Count > 0)
            {
                GridViewAgency.UseAccessibleHeader = true;
                GridViewAgency.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void GridViewAgency_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbel = e.Row.FindControl("rowNumber") as Label;
                lbel.Text = ((e.Row.RowIndex) + 1).ToString();
                TextBox txt1 = e.Row.FindControl("sourceDate") as TextBox;
                DropDownList ddl2 = e.Row.FindControl("ddAgency") as DropDownList;
                TextBox txt2 = e.Row.FindControl("txtjustification") as TextBox;

                Label lb1 = e.Row.FindControl("lbSourceDate") as Label;
                Label lb2 = e.Row.FindControl("lbAgency") as Label;
                Label lb3 = e.Row.FindControl("lbjust") as Label;

                LinkButton lbn1 = e.Row.FindControl("lbEdit") as LinkButton;
                LinkButton lbn2 = e.Row.FindControl("lbDelete") as LinkButton;
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lbn1);
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lbn2);

                HtmlGenericControl itag = e.Row.FindControl("iconEdit") as HtmlGenericControl;


                if (ViewState["AgencyTable"] != null)
                {
                    DataTable dt = (DataTable)ViewState["AgencyTable"];
                    if (dt.Rows.Count > 0)
                    {
                        int index = e.Row.RowIndex;
                        if (dt.Rows[index]["candidate_area_source_id"].ToString() == "")
                        {
                            txt1.Visible = true;
                            instanceDt = new DataTable();
                            instanceDt = bus.fill_Agencies();
                            if (instanceDt.Rows.Count > 0)
                            {
                                ddl2.DataSource = instanceDt;
                                ddl2.DataBind();
                                ddl2.Items.Insert(0, new ListItem("-----PILIH-----", ""));
                            }
                            ddl2.Visible = true;
                            txt2.Visible = true;
                            lb1.Visible = false;
                            lb2.Visible = false;
                            lb3.Visible = false;

                            itag.Attributes.Remove("class");
                            itag.Attributes.Add("class", "fa fa-save");
                            lbn1.CommandArgument = "save";
                            lbn2.Visible = false;
                            setDatePicker();

                        }
                        else
                        {
                            txt1.Visible = false;
                            ddl2.Visible = false;
                            txt2.Visible = false;
                        }
                    }
                }
            }
        }

        protected void btnCommentClear_Click(object sender, EventArgs e)
        {
            TextBox tt1 = (TextBox)CandidateDataList.Items[0].FindControl("txtComment");
            tt1.Text = "";
        }

        protected void btnCommentSave_Click(object sender, EventArgs e)
        {
            TextBox tt1 = (TextBox)CandidateDataList.Items[0].FindControl("txtComment");
            HtmlGenericControl alert = (HtmlGenericControl)CandidateDataList.Items[0].FindControl("commentStatus");
            Label commentLabel = (Label)CandidateDataList.Items[0].FindControl("commentLabel");
            bus.candidate_id = int.Parse(HfCandidateId.Value);
            bus.comment = tt1.Text;
            int ret = bus.update_WinnableCandidateComment();
            if (ret == 0)
            {
                commentLabel.Text = "Dikemaskini Berjaya.";
                alert.Attributes.Remove("class");
                alert.Attributes.Add("class", "alert alert-success alert-dismissable");
                alert.Visible = true;

            }
            else if (ret == -1)
            {
                if (ViewState["candidate"] != null)
                {
                    DataTable dtCandidate = (DataTable)ViewState["candidate"];
                    bus.candidate_id = int.Parse(HfCandidateId.Value);
                    bus.name = dtCandidate.Rows[0]["name"].ToString();
                    bus.job = dtCandidate.Rows[0]["occupation"].ToString();
                    bus.education = dtCandidate.Rows[0]["education"].ToString();
                    bus.political_post = dtCandidate.Rows[0]["political_post"].ToString();
                    bus.comment = tt1.Text;
                    bus.insert_WinnableCandidate();
                }
                commentLabel.Text = "Dikemaskini Berjaya.";
                alert.Attributes.Remove("class");
                alert.Attributes.Add("class", "alert alert-success alert-dismissable");
                alert.Visible = true;
            }
            else
            {
                commentLabel.Text = "Tidak dapat mengemas kini komen.";
                alert.Attributes.Remove("class");
                alert.Attributes.Add("class", "alert alert-danger alert-dismissable");
                alert.Visible = true;
            }
        }

        protected void CandidateDataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btn1 = e.Item.FindControl("btnCommentClear") as Button;
                Button btn2 = e.Item.FindControl("btnCommentSave") as Button;               
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(btn1);
                ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(btn2);
            }
        }

        protected void lbEdit_Click1(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lb.NamingContainer;
            if (lb.CommandArgument == "edit")
            {
                if (row != null)
                {
                    int index = row.RowIndex;
                    TextBox txt1 = (TextBox)GridViewAgency.Rows[index].Cells[1].FindControl("sourceDate");
                    DropDownList ddl2 = (DropDownList)GridViewAgency.Rows[index].Cells[2].FindControl("ddAgency");
                    TextBox txt2 = (TextBox)GridViewAgency.Rows[index].Cells[3].FindControl("txtjustification");

                    Label lb1 = (Label)GridViewAgency.Rows[index].Cells[1].FindControl("lbSourceDate");
                    Label lb2 = (Label)GridViewAgency.Rows[index].Cells[2].FindControl("lbAgency");
                    Label lb3 = (Label)GridViewAgency.Rows[index].Cells[3].FindControl("lbjust");

                    HtmlGenericControl itag = (HtmlGenericControl)GridViewAgency.Rows[index].Cells[4].FindControl("iconEdit");

                    itag.Attributes.Remove("class");
                    itag.Attributes.Add("class", "fa fa-save");

                    txt1.Text = lb1.Text;
                    txt2.Text = lb3.Text;

                    instanceDt = new DataTable();
                    instanceDt = bus.fill_Agencies();
                    if (instanceDt.Rows.Count > 0)
                    {
                        ddl2.DataSource = instanceDt;
                        ddl2.DataBind();
                        ddl2.Items.Insert(0, new ListItem("-----PILIH-----", ""));
                        ddl2.ClearSelection();
                        ddl2.Items.FindByText(lb2.Text).Selected = true;
                    }

                    txt1.Visible = true;
                    ddl2.Visible = true;
                    txt2.Visible = true;

                    lb1.Visible = false;
                    lb2.Visible = false;
                    lb3.Visible = false;

                    updateStatus.Visible = false;
                    invalidOption.Visible = false;
                    invalidAdd.Visible = false;
                    lb.CommandArgument = "save";
                }
            }
            else if (lb.CommandArgument == "save")
            {
                if (row != null)
                {
                    int index = row.RowIndex;
                    TextBox txt1 = (TextBox)GridViewAgency.Rows[index].Cells[1].FindControl("sourceDate");
                    DropDownList ddl2 = (DropDownList)GridViewAgency.Rows[index].Cells[2].FindControl("ddAgency");
                    TextBox txt2 = (TextBox)GridViewAgency.Rows[index].Cells[3].FindControl("txtjustification");

                    Label lb1 = (Label)GridViewAgency.Rows[index].Cells[1].FindControl("lbSourceDate");
                    Label lb2 = (Label)GridViewAgency.Rows[index].Cells[2].FindControl("lbAgency");
                    Label lb3 = (Label)GridViewAgency.Rows[index].Cells[3].FindControl("lbjust");

                    HiddenField hf1 = (HiddenField)GridViewAgency.Rows[index].Cells[1].FindControl("hfAgencyid");
                    HiddenField hf2 = (HiddenField)GridViewAgency.Rows[index].Cells[1].FindControl("hfAreaid");
                    HiddenField hf3 = (HiddenField)GridViewAgency.Rows[index].Cells[1].FindControl("hfsourceDate");

                    HtmlGenericControl itag = (HtmlGenericControl)GridViewAgency.Rows[index].Cells[4].FindControl("iconEdit");

                    if (AgencyValidate(txt1, ddl2, txt2, hf3) == 1)
                    {

                        if (hf1.Value != "")
                        {
                            bus.candidate_area_source_id = int.Parse(hf1.Value);
                            bus.candidate_area_id = int.Parse(hf2.Value);
                            bus.source_date = DateTime.ParseExact(hf3.Value, "dd/MM/yyyy", null);
                            bus.agency_id = int.Parse(ddl2.SelectedValue);
                            bus.justification = txt2.Text;
                            if (bus.update_WinnableCandidateSource() == 0)
                            {
                                agencyLabel.Text = "Dikemaskini Berjaya.";
                                agencyStatus.Attributes.Remove("class");
                                agencyStatus.Attributes.Add("class", "alert alert-success alert-dismissable");
                                agencyStatus.Visible = true;
                                lb1.Text = hf3.Value;
                                lb2.Text = ddl2.SelectedItem.Text;
                                lb3.Text = txt2.Text;
                            }
                            else
                            {
                                agencyLabel.Text = "Tidak dapat mengemas kini maklumat kawasan.";
                                agencyStatus.Attributes.Remove("class");
                                agencyStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                                agencyStatus.Visible = true;
                            }
                            txt1.Visible = false;
                            ddl2.Visible = false;
                            txt2.Visible = false;

                            lb1.Visible = true;
                            lb2.Visible = true;
                            lb3.Visible = true;

                            lb.CommandArgument = "edit";
                            itag.Attributes.Remove("class");
                            itag.Attributes.Add("class", "fa fa-edit");
                        }
                        else
                        {
                            bus.candidate_area_id = int.Parse(htCandidateAreaId.Value);
                            bus.source_date = DateTime.ParseExact(hf3.Value, "dd/MM/yyyy", null);
                            bus.agency_id = int.Parse(ddl2.SelectedValue);
                            bus.justification = txt2.Text;
                            if (bus.insert_WinnableAreaSource() > 0)
                            {
                                instanceDt = new DataTable();
                                bus.candidate_area_id = int.Parse(htCandidateAreaId.Value);
                                instanceDt = bus.fill_winnable_area_source();
                                DataRow dr1 = instanceDt.NewRow();
                                dr1["candidate_area_source_id"] = DBNull.Value;
                                dr1["candidate_area_id"] = DBNull.Value;
                                dr1["agency_name"] = string.Empty;
                                dr1["justification"] = string.Empty;
                                dr1["source_date"] = DBNull.Value;
                                instanceDt.Rows.Add(dr1);
                                ViewState["AgencyTable"] = instanceDt;
                                if (instanceDt.Rows.Count > 0)
                                {
                                    GridViewAgency.DataSource = instanceDt;
                                    GridViewAgency.DataBind();
                                }

                                agencyLabel.Text = "Dimasukkan Berjaya";
                                agencyStatus.Attributes.Remove("class");
                                agencyStatus.Attributes.Add("class", "alert alert-success alert-dismissable");
                                agencyStatus.Visible = true;
                            }
                            else
                            {
                                agencyLabel.Text = "Agensi sudah dipilih untuk Kawasan Calon.";
                                agencyStatus.Attributes.Remove("class");
                                agencyStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                                agencyStatus.Visible = true;
                            }

                        }
                    }
                }
            }
            setDatePicker();
        }

        private int AgencyValidate(TextBox txt1, DropDownList ddl1, TextBox txt2, HiddenField hf3)
        {
            int flag = 0;
            //int iflag = 0;

            if (hf3.Value == "")
            {
                flag++;
                txt1.Attributes.CssStyle.Add("border-color", "red");
            }
            else
            {
                txt1.Attributes.CssStyle.Remove("border-color");
            }
            if (ddl1.SelectedValue == "")
            {
                flag++;
                ddl1.Attributes.CssStyle.Add("border-color", "red");
            }
            else
            {
                ddl1.Attributes.CssStyle.Remove("border-color");
            }
            if (txt2.Text == "")
            {
                flag++;
                txt2.Attributes.CssStyle.Add("border-color", "red");
            }
            else
            {
                txt2.Attributes.CssStyle.Remove("border-color");
            }
            if (flag > 0)
            {
                agencyLabel.Text = "Sila lengkapkan borang untuk menambah.";
                agencyStatus.Attributes.Remove("class");
                agencyStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                agencyStatus.Visible = true;
                return 0;
            }
            return 1;
        }

        private void setDatePicker()
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("jQuery(document).ready(function () {");
            sb.Append("$('.dateagency').datepicker({");
            sb.Append("autoclose: true,");
            sb.Append("todayHighlight: true,");
            sb.Append("format: 'dd/mm/yyyy',");
            sb.Append("orientation: 'bottom auto',");
            sb.Append("keyboardNavigation: false");
            sb.Append("});");
            sb.Append("});");
            sb.Append(@"</script>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DatePickerScript", sb.ToString(), false);
        }

        protected void GridViewFile_PreRender(object sender, EventArgs e)
        {
            if (GridViewFile.Rows.Count > 0)
            {
                GridViewFile.UseAccessibleHeader = true;
                GridViewFile.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void lbDownload_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lb.NamingContainer;
            if (row != null)
            {
                DataTable down = new DataTable();
                int index = row.RowIndex;
                HiddenField hf1 = (HiddenField)GridViewFile.Rows[index].Cells[0].FindControl("HfArchiveId");
                bus.archive_id = int.Parse(hf1.Value);
                down = bus.download_WinnableCandidateArchive();
                if (down.Rows.Count > 0)
                {
                    byte[] data = (byte[])down.Rows[0]["win_candidate_archive"];
                    if (data.Length > 0)
                    {
                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.AddHeader("content-disposition", "attachment;filename=" + down.Rows[0]["original_filename"]);
                        Response.ContentType = "application/zip";
                        Response.BinaryWrite(data);
                        Response.Flush();
                        Response.End();
                    }
                }
                
            }
        }

        protected void lbnSaveArchive_Click(object sender, EventArgs e)
        {
            if (fileValidate(FileUpload1, infoFile) == 0)
            {
                string filename = FileUpload1.FileName;
                System.IO.Stream fs = FileUpload1.PostedFile.InputStream;
                System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                bus.fileName = filename;
                bus.uniqueFilename = filename + "_" + DateTime.Now.ToString("yyyyMMdd_HH_mm_ss");
                bus.comment = infoFile.Text;
                if (HfArchiveId.Value.ToString() != "")
                {
                    bus.archive_id = int.Parse(HfArchiveId.Value);
                    if (bus.update_WinnableCandidateArchive() == 0)
                    {
                        bus.archive = bytes;
                        bus.update_WinnableArchiveFile();
                        if (HfCandidateId.Value.ToString() != "")
                        {
                            fillArchive(int.Parse(HfCandidateId.Value));
                        }
                        topLabel.Text = "Fail Dikemaskini Berjaya.";
                        topStatus.Attributes.Remove("class");
                        topStatus.Attributes.Add("class", "alert alert-success alert-dismissable");
                        topStatus.Visible = true;
                        infoFile.Text = "";
                    }
                    else
                    {
                        topLabel.Text = "Difailkan untuk mengemas kini fail.";
                        topStatus.Attributes.Remove("class");
                        topStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                        topStatus.Visible = true;
                    }
                }
                else
                {
                    bus.candidate_id = int.Parse(HfCandidateId.Value);
                    int aid = bus.insert_WinnableArchive();
                    if (aid > 0 || aid != null)
                    {

                        bus.archive_id = aid;
                        bus.archive = bytes;
                        bus.update_WinnableArchiveFile();
                        if (HfCandidateId.Value.ToString() != "")
                        {
                            fillArchive(int.Parse(HfCandidateId.Value));
                        }
                        topLabel.Text = "Fail Dikemaskini Berjaya.";
                        topStatus.Attributes.Remove("class");
                        topStatus.Attributes.Add("class", "alert alert-success alert-dismissable");
                        topStatus.Visible = true;
                        infoFile.Text = "";
                    }
                }
            }

        }

        private int fileValidate(FileUpload file, TextBox txtComment)
        {
            int flag = 0;
            if (!file.HasFile)
            {
                flag++;
                fileName.InnerHtml = "Sila pilih fail!";
            }
            else
            {
                fileName.InnerHtml = "";
            }
            if (txtComment.Text == "")
            {
                flag++;
                txtComment.Attributes.CssStyle.Add("border-color", "red");
            }
            else
            {
                txtComment.Attributes.CssStyle.Remove("border-color");
            }
            if (flag == 0)
            {
                return 0;
            }
            else
            {
                topLabel.Text = "Lengkapkan bidang kemahiran";
                topStatus.Attributes.Remove("class");
                topStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                topStatus.Visible = true;
                return 1;
            }  
        }

        protected void lbnFileDelete_Click(object sender, EventArgs e)
        {
            if (HfArchiveId.Value.ToString() != "")
            {
                bus.archive_id = int.Parse(HfArchiveId.Value);
                if (bus.delete_WinnableCandidateAreaArchive() == 0)
                {
                    topLabel.Text = "Dipadam Berjaya.";
                    topStatus.Attributes.Remove("class");
                    topStatus.Attributes.Add("class", "alert alert-success alert-dismissable");
                    topStatus.Visible = true;
                }
                else
                {
                    topLabel.Text = "Gagal Padam!";
                    topStatus.Attributes.Remove("class");
                    topStatus.Attributes.Add("class", "alert alert-danger alert-dismissable");
                    topStatus.Visible = true;
                }
                if (HfCandidateId.Value.ToString() != "")
                {
                    fillArchive(int.Parse(HfCandidateId.Value));
                }
                HfArchiveId.Value = "";
            }

        }


        //protected void GridViewUpdate_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    foreach (GridViewRow row in GridViewUpdate.Rows)
        //    {
        //        if (row.RowIndex == GridViewUpdate.SelectedIndex)
        //        {
        //            row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
        //            row.ToolTip = string.Empty;
        //        }
        //        else
        //        {
        //            row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
        //            row.ToolTip = "Click to select this row.";
        //        }
        //    }
        //}
    }
}