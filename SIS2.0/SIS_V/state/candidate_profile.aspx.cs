using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using SIS_B;

namespace SIS_V.state
{
    public partial class candidate_profile : System.Web.UI.Page
    {
        bus_sis_ugc1 bus = new bus_sis_ugc1();
        DataTable race, relegion, parti;
        protected void Page_Load(object sender, EventArgs e)
        {
            valid.Visible = false;
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

        protected void button1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text != "" && TextBox29.Text != "" && DropDownList2.SelectedIndex != 0 && DropDownList3.SelectedIndex != 0 && FileUpload1.HasFile && TextBox18.Text != "" && DropDownList4.SelectedIndex != 0 && TextBox19.Text != "" && TextBox20.Text != "")
            {
                if (TextBox1.Text == "")
                {
                    bus.title = "";
                }
                else
                {
                    bus.title = TextBox1.Text;
                }
                if (TextBox2.Text == "")
                {
                    bus.ic = "";
                }
                else
                {
                    bus.ic = TextBox2.Text;
                }
                if (TextBox2.Text == "")
                {
                    bus.uname = "";
                }
                else
                {
                    bus.uname = TextBox3.Text;
                }
                if (TextBox4.Text == "")
                {
                    bus.dob = DateTime.ParseExact("01/01/1753", "dd/MM/yyyy", null);
                }
                else
                {
                    bus.dob = DateTime.ParseExact(TextBox4.Text, "dd/MM/yyyy", null);
                }
                if (TextBox29.Text == "")
                {
                    bus.gender = 3;
                }
                else
                {
                    if (TextBox29.Text == "Lelaki")
                    {
                        bus.gender = 1;
                    }
                    else
                    {
                        bus.gender = 0;
                    }
                }
                if (DropDownList2.SelectedIndex == 0)
                {
                    bus.race = 0;
                }
                else
                {
                    bus.race = int.Parse(DropDownList2.SelectedValue);
                }
                if (DropDownList3.SelectedIndex == 0)
                {
                    bus.religion = 0;
                }
                else
                {
                    bus.religion = int.Parse(DropDownList3.SelectedValue);
                }
                if (FileUpload1.HasFile)
                {
                    string filename = FileUpload1.FileName;
                    System.IO.Stream fs = FileUpload1.PostedFile.InputStream;
                    System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    bus.image = bytes;
                }
                if (TextBox5.Text == "")
                {
                    bus.address = "";
                }
                else
                {
                    bus.address = TextBox5.Text;
                }
                if (TextBox6.Text == "")
                {
                    bus.home_tel_no = "";
                }
                else
                {
                    bus.home_tel_no = TextBox6.Text;
                }
                if (TextBox9.Text == "")
                {
                    bus.office_tel_no = "";
                }
                else
                {
                    bus.office_tel_no = TextBox9.Text;
                }
                if (TextBox10.Text == "")
                {
                    bus.mobile = "";
                }
                else
                {
                    bus.mobile = TextBox10.Text;
                }
                if (TextBox11.Text == "")
                {
                    bus.fax = "";
                }
                else
                {
                    bus.fax = TextBox11.Text;
                }
                if (TextBox7.Text == "")
                {
                    bus.email = "";
                }
                else
                {
                    bus.email = TextBox7.Text;
                }
                if (TextBox8.Text == "")
                {
                    bus.blog = "";
                }
                else
                {
                    bus.blog = TextBox8.Text;
                }
                if (TextBox12.Text == "")
                {
                    bus.facebook = "";
                }
                else
                {
                    bus.facebook = TextBox12.Text;
                }
                if (TextBox13.Text == "")
                {
                    bus.twitter = "";
                }
                else
                {
                    bus.twitter = TextBox13.Text;
                }
                if (TextBox17.Text == "")
                {
                    bus.job = "";
                }
                else
                {
                    bus.job = TextBox17.Text;
                }
                if (TextBox15.Text == "")
                {
                    bus.spouse_name = "";
                }
                else
                {
                    bus.spouse_name = TextBox15.Text;
                }
                if (TextBox14.Text == "")
                {
                    bus.income = 0.0000;
                }
                else
                {
                    bus.income = Double.Parse(TextBox14.Text);
                }
                if (TextBox16.Text == "")
                {
                    bus.children = 0;
                }
                else
                {
                    bus.children = int.Parse(TextBox16.Text);
                }
                if (DropDownList4.SelectedIndex == 0)
                {
                    bus.parti = 0;
                }
                else
                {
                    string[] words = DropDownList4.SelectedValue.Split('~');
                    bus.parti = int.Parse(words[0]);
                }
                if (TextBox21.Text == "")
                {
                    bus.member_no = "";
                }
                else
                {
                    bus.member_no = TextBox21.Text;
                }
                if (CheckBox2.Checked)
                {
                    bus.member_life = true;
                }
                else
                {
                    bus.member_life = false;
                }
                if (TextBox23.Text == "")
                {
                    bus.branch = "";
                }
                else
                {
                    bus.branch = TextBox23.Text;
                }

                if (TextBox22.Text == "")
                {
                    bus.political_post = "";
                }
                else
                {
                    bus.political_post = TextBox22.Text;
                }
                if (TextBox24.Text == "")
                {
                    bus.division = "";
                }
                else
                {
                    bus.division = TextBox24.Text;
                }
                if (TextBox25.Text == "")
                {
                    bus.e_date = DateTime.ParseExact("01/01/1753", "dd/MM/yyyy", null);
                }
                else
                {
                    bus.e_date = DateTime.ParseExact(TextBox25.Text, "dd/MM/yyyy", null);
                }
                if (TextBox26.Text == "")
                {
                    bus.d_date = DateTime.ParseExact("01/01/1753", "dd/MM/yyyy", null);
                }
                else
                {
                    bus.d_date = DateTime.ParseExact(TextBox26.Text, "dd/MM/yyyy", null);
                }
                if (TextBox27.Text == "")
                {
                    bus.l_date = DateTime.ParseExact("01/01/1753", "dd/MM/yyyy", null);
                }
                else
                {
                    bus.l_date = DateTime.ParseExact(TextBox27.Text, "dd/MM/yyyy", null);
                }
                if (TextBox34.Text == "")
                {
                    bus.asset = "";
                }
                else
                {
                    bus.asset = TextBox34.Text;
                }
                if (TextBox35.Text == "")
                {
                    bus.education = "";
                }
                else
                {
                    bus.education = TextBox35.Text;
                }
                if (TextBox37.Text == "")
                {
                    bus.add_info = "";
                }
                else
                {
                    bus.add_info = TextBox37.Text;
                }
                int result = bus.add_candidate();
                if (result == 1)
                {
                    clear();
                    valid.Visible = true;
                    lblvalid.Text = "Data Dimasukkan Berjaya!";
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
        public void clear()
        {
            TextBox4.Attributes.Add("readonly", "readonly");
            TextBox18.Attributes.Add("readonly", "readonly");
            TextBox19.Attributes.Add("readonly", "readonly");
            TextBox20.Attributes.Add("readonly", "readonly");
            TextBox25.Attributes.Add("readonly", "readonly");
            TextBox26.Attributes.Add("readonly", "readonly");
            TextBox27.Attributes.Add("readonly", "readonly");
            TextBox29.Attributes.Add("readonly", "readonly");
            CheckBox2.Checked = false;
            fill_race();
            fill_relegion();
            fill_party();
            TextBox[] boxes = new[]{
                TextBox1,
                TextBox2,
                TextBox3,
                TextBox4,
                TextBox5,
                TextBox6,
                TextBox7,
                TextBox8,
                TextBox9,
                TextBox10,
                TextBox11,
                TextBox12,
                TextBox13,
                TextBox14,
                TextBox15,
                TextBox16,
                TextBox17,
                TextBox18,
                TextBox19,
                TextBox20,
                TextBox21,
                TextBox22,
                TextBox23,
                TextBox24,
                TextBox25,
                TextBox26,
                TextBox27,
                TextBox29,
                TextBox34,
                TextBox35,
                TextBox37
            };

            for (int j = 0; j < boxes.Length; j++)
            {
                boxes[j].Text = string.Empty;
            }

        }

        #region ImageViewCode
        public void fill_image()
        {
            DataTable dt = bus.fill_image();
            if (dt.Rows.Count > 0)
            {
                byte[] bytes = (byte[])dt.Rows[0]["image"];
                if (bytes.Length > 0)
                {
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    //Image1.ImageUrl = "data:image/png;base64," + base64String;
                }
            }
        }
        #endregion

        #region FileDownloadCode
        //protected void lnkDownload_Click(object sender, EventArgs e)
        //{
        //    DataTable dt = bus.fill_image();
        //    if (dt.Rows.Count > 0)
        //    {
        //        byte[] bytes = (byte[])dt.Rows[0]["image"];
        //        if (bytes.Length > 0)
        //        {
        //            Response.Clear();
        //            Response.Buffer = true;
        //            Response.Charset = "";
        //            Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //            Response.AddHeader("content-disposition", "attachment;filename=files.zip ");
        //            Response.ContentType = "application/zip";
        //            Response.BinaryWrite(bytes);
        //            Response.Flush();
        //            Response.End();
        //        }
        //    }
        //}       
        #endregion

    }
}