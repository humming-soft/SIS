﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;
using System.Data;

namespace SIS_V.state
{
    public partial class candidate_profile_view : System.Web.UI.Page
    {
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        bus_sis_ugc2 objBUS = new bus_sis_ugc2();
        DataTable dt, race, relegion, parti, img_dt;
        string cand_image, gender, member4life;
        protected void Page_Load(object sender, EventArgs e)
        {
            invalid.Visible = false;
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
                    TextBox4.Attributes.Add("readonly", "readonly");
                    TextBox18.Attributes.Add("readonly", "readonly");
                    TextBox19.Attributes.Add("readonly", "readonly");
                    TextBox20.Attributes.Add("readonly", "readonly");
                    TextBox25.Attributes.Add("readonly", "readonly");
                    TextBox26.Attributes.Add("readonly", "readonly");
                    TextBox27.Attributes.Add("readonly", "readonly");
                    TextBox29.Attributes.Add("readonly", "readonly");
                    fill_race();
                    fill_relegion();
                    fill_party();
                    GetCandidateDetails();
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
        public void fill_race()
        {
            race = bus.fill_race();
            if (race.Rows.Count > 0)
            {
                DropDownList2.DataSource = race;
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("---PILIH---", ""));
            }

        }
        public void fill_relegion()
        {
            relegion = bus.fill_relegion();
            if (relegion.Rows.Count > 0)
            {
                DropDownList3.DataSource = relegion;
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, new ListItem("---PILIH---", ""));
            }

        }
        public void fill_party()
        {
            parti = bus.fill_party();
            if (parti.Rows.Count > 0)
            {
                DropDownList4.DataSource = parti;
                DropDownList4.DataBind();
                DropDownList4.Items.Insert(0, new ListItem("---PILIH---", ""));
            }
        }
        public void GetCandidateDetails()
        {
            objBUS.candidate_id = int.Parse(Session["candidate_unique_id"].ToString());
            dt = objBUS.GetCandidateDetails();
            if (dt.Rows.Count > 0)
            {
                TextBox1.Text = dt.Rows[0]["title"].ToString();
                TextBox2.Text = dt.Rows[0]["candidate_ic"].ToString();
                TextBox3.Text = dt.Rows[0]["name"].ToString();
                TextBox4.Text = dt.Rows[0]["dob"].ToString();
                gender = dt.Rows[0]["gender"].ToString();
                if (gender == "1")
                {
                    TextBox29.Text = "Lelaki";
                }
                else if (gender == "0")
                {
                    TextBox29.Text = "Perempuan";
                }
                DropDownList2.SelectedValue = dt.Rows[0]["race"].ToString();
                DropDownList3.SelectedValue = dt.Rows[0]["religion"].ToString();
                TextBox5.Text = dt.Rows[0]["alamat"].ToString();
                TextBox6.Text = dt.Rows[0]["home_tel_no"].ToString();
                TextBox11.Text = dt.Rows[0]["fax_no"].ToString();
                TextBox9.Text = dt.Rows[0]["Office_tel_no"].ToString();
                TextBox7.Text = dt.Rows[0]["email"].ToString();
                TextBox10.Text = dt.Rows[0]["mobile_no"].ToString();
                TextBox8.Text = dt.Rows[0]["blog"].ToString();
                TextBox12.Text = dt.Rows[0]["facebook"].ToString();
                TextBox13.Text = dt.Rows[0]["twitter"].ToString();
                TextBox17.Text = dt.Rows[0]["occupation"].ToString();
                TextBox14.Text = dt.Rows[0]["income"].ToString();
                TextBox15.Text = dt.Rows[0]["spouse_name"].ToString();
                TextBox16.Text = dt.Rows[0]["child_no"].ToString();
                DropDownList4.SelectedValue = dt.Rows[0]["party"].ToString();
                TextBox21.Text = dt.Rows[0]["membership_no"].ToString();
                member4life = dt.Rows[0]["member_for_life"].ToString();
                if (member4life == "True")
                {
                    CheckBox2.Checked = true;
                }
                else
                {
                    CheckBox2.Checked = false;
                }
                TextBox23.Text = dt.Rows[0]["branch"].ToString();
                TextBox22.Text = dt.Rows[0]["political_post"].ToString();
                TextBox24.Text = dt.Rows[0]["division"].ToString();
                TextBox25.Text = dt.Rows[0]["expiry_date"].ToString();
                TextBox26.Text = dt.Rows[0]["date_join"].ToString();
                TextBox27.Text = dt.Rows[0]["date_left"].ToString();
                TextBox34.Text = dt.Rows[0]["asset"].ToString();
                TextBox35.Text = dt.Rows[0]["education"].ToString();
                TextBox37.Text = dt.Rows[0]["add_info"].ToString(); string base64String = "";
                if (dt.Rows[0]["image"].ToString() == "")
                {
                    base64String = "/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAA8AAD/4QMZaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjRFNkQ1NTQwRkU2NzExRTY5NERGOTA2MjJBMEZGNjlFIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjRFNkQ1NTNGRkU2NzExRTY5NERGOTA2MjJBMEZGNjlFIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzYgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIzOEMxMzlCNTM0NjhGMTQwODZFRTFFNEEzMDc0MEQ5MyIgc3RSZWY6ZG9jdW1lbnRJRD0iMzhDMTM5QjUzNDY4RjE0MDg2RUUxRTRBMzA3NDBEOTMiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAGBAQEBQQGBQUGCQYFBgkLCAYGCAsMCgoLCgoMEAwMDAwMDBAM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";
                }
                else
                {
                    byte[] bytes = (byte[])dt.Rows[0]["image"];
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
                imager.Src = cand_image;
                if (dt.Rows[0]["original_filename"].ToString() != "")
                {
                    rar_name.Text = dt.Rows[0]["original_filename"].ToString();
                }
            }
        }
        protected void button1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text != "" && TextBox29.Text != "" && DropDownList2.SelectedIndex != 0 && DropDownList3.SelectedIndex != 0 && TextBox18.Text != "" && DropDownList4.SelectedIndex != 0 && TextBox19.Text != "" && TextBox20.Text != "")
            {
                objBUS.candidate_id = int.Parse(Session["candidate_unique_id"].ToString());
                objBUS.candidate_old_ic = Session["old_ic"].ToString();
                if (FileUpload1.HasFile)
                {
                    string filename = FileUpload1.FileName;
                    System.IO.Stream fs = FileUpload1.PostedFile.InputStream;
                    System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    objBUS.image = bytes;
                }
                else
                {
                    img_dt = objBUS.GetCandidateImage();
                    if (img_dt.Rows[0]["image"].ToString() != "")
                    {
                        byte[] bytes = (byte[])img_dt.Rows[0]["image"];
                        if (bytes.Length > 0)
                        {
                            objBUS.image = bytes;
                        }
                    }
                    else
                    {
                        invalid.Visible = true;
                        lblinvalid.Text = "Sila muat naik gambar profil anda!";
                        return;
                    }
                }
                objBUS.title = TextBox1.Text;
                objBUS.candidate_ic = TextBox2.Text;
                objBUS.candidate_name = TextBox3.Text;
                if (TextBox4.Text == "")
                {
                    objBUS.dob = DateTime.ParseExact("01/01/1753", "dd/MM/yyyy", null);
                }
                else
                {
                    objBUS.dob = DateTime.ParseExact(TextBox4.Text, "dd/MM/yyyy", null);
                }
                if (TextBox29.Text == "")
                {
                    objBUS.gender = 3;
                }
                else
                {
                    if (TextBox29.Text == "Lelaki")
                    {
                        objBUS.gender = 1;
                    }
                    else
                    {
                        objBUS.gender = 0;
                    }
                }
                if (DropDownList2.SelectedIndex == 0)
                {
                    objBUS.race = 0;
                }
                else
                {
                    objBUS.race = int.Parse(DropDownList2.SelectedValue);
                }
                if (DropDownList3.SelectedIndex == 0)
                {
                    objBUS.religion = 0;
                }
                else
                {
                    objBUS.religion = int.Parse(DropDownList3.SelectedValue);
                }
                objBUS.alamat = TextBox5.Text;
                objBUS.home_tel_no = TextBox6.Text;
                objBUS.fax_no = TextBox11.Text;
                objBUS.Office_tel_no = TextBox9.Text;
                objBUS.email = TextBox7.Text;
                objBUS.mobile_no = TextBox10.Text;
                objBUS.blog = TextBox8.Text;
                objBUS.facebook = TextBox12.Text;
                objBUS.twitter = TextBox13.Text;
                objBUS.occupation = TextBox17.Text;
                objBUS.spouse_name = TextBox15.Text;
                if (TextBox14.Text == "")
                {
                    objBUS.income = 0.0000;
                }
                else
                {
                    objBUS.income = Double.Parse(TextBox14.Text);
                }
                if (TextBox16.Text == "")
                {
                    objBUS.child_no = 0;
                }
                else
                {
                    objBUS.child_no = int.Parse(TextBox16.Text);
                }
                if (DropDownList4.SelectedIndex == 0)
                {
                    objBUS.party = 0;
                }
                else
                {
                    string[] words = DropDownList4.SelectedValue.Split('~');
                    objBUS.party = int.Parse(words[0]);
                }
                objBUS.membership_no = TextBox21.Text;
                if (CheckBox2.Checked)
                {
                    objBUS.member4life = true;
                }
                else
                {
                    objBUS.member4life = false;
                }

                objBUS.branch = TextBox23.Text;
                objBUS.political_post = TextBox22.Text;
                objBUS.division = TextBox24.Text;
                if (TextBox25.Text == "")
                {
                    objBUS.expiry_date = DateTime.ParseExact("01/01/1753", "dd/MM/yyyy", null);
                }
                else
                {
                    objBUS.expiry_date = DateTime.ParseExact(TextBox25.Text, "dd/MM/yyyy", null);
                }
                if (TextBox26.Text == "")
                {
                    objBUS.date_join = DateTime.ParseExact("01/01/1753", "dd/MM/yyyy", null);
                }
                else
                {
                    objBUS.date_join = DateTime.ParseExact(TextBox26.Text, "dd/MM/yyyy", null);
                }
                if (TextBox27.Text == "")
                {
                    objBUS.date_left = DateTime.ParseExact("01/01/1753", "dd/MM/yyyy", null);
                }
                else
                {
                    objBUS.date_left = DateTime.ParseExact(TextBox27.Text, "dd/MM/yyyy", null);
                }
                objBUS.asset = TextBox34.Text;
                objBUS.education = TextBox35.Text;
                objBUS.add_info = TextBox37.Text;
                if (FileUpload2.HasFile)
                {
                    string filename = FileUpload2.FileName;
                    System.IO.Stream fs2 = FileUpload2.PostedFile.InputStream;
                    System.IO.BinaryReader br2 = new System.IO.BinaryReader(fs2);
                    Byte[] bytes2 = br2.ReadBytes((Int32)fs2.Length);
                    objBUS.archive = bytes2;
                    objBUS.archivename = filename;
                }
                int chk = objBUS.UpdateCandidateDetails();
                if (chk == 0)
                {
                    Session["profile_update"] = "success";
                    Response.Redirect("candidate_profilelist");
                }
                else if (chk == 1)
                {
                    invalid.Visible = true;
                    lblinvalid.Text = "IC Nombor in yang sedia ada!";
                }
                else
                {
                invalid.Visible = true;
                lblinvalid.Text = "Ralat yang tidak dijangka, Masukkan Gagal!";
                }
            }
            else
            {
                invalid.Visible = true;
                lblinvalid.Text = "Anda mempunyai beberapa kesilapan dalam pengisian borang. Sila isikan butiran yang diperlukan !";
            }
        }
    }
}