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
            if(!IsPostBack)
            {
                TextBox4.Attributes.Add("readonly", "readonly");
                TextBox25.Attributes.Add("readonly", "readonly");
                TextBox26.Attributes.Add("readonly", "readonly");
                TextBox27.Attributes.Add("readonly", "readonly");
                TextBox29.Attributes.Add("readonly", "readonly");
                //fill_image();
                fill_race();
                fill_relegion();
                fill_party();
            }
        }

        protected void button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string filename = FileUpload1.FileName;
                System.IO.Stream fs = FileUpload1.PostedFile.InputStream;
                System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                bus.image = bytes;
                int res = bus.image_upload();
               
            }
            else
            {
                string filename2 = FileUpload2.FileName;
                System.IO.Stream fs2 = FileUpload2.PostedFile.InputStream;
                System.IO.BinaryReader br = new System.IO.BinaryReader(fs2);
                Byte[] bytes = br.ReadBytes((Int32)fs2.Length);
                bus.image = bytes;
                int res = bus.image_upload();
            }
        }

        public void fill_race()
        {
            race = bus.fill_race();
            if(race.Rows.Count > 0)
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

        public void fill_image()
        {
            DataTable dt = bus.fill_image();
            if(dt.Rows.Count > 0)
            {
                byte[] bytes = (byte[])dt.Rows[0]["image"];
                if (bytes.Length > 0)
                {
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    //Image1.ImageUrl = "data:image/png;base64," + base64String;
                }
            }
        }

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
    }
}