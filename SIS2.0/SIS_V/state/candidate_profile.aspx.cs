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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                TextBox4.Attributes.Add("readonly", "readonly");
                //fill_image();
            }
        }

        protected void button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                System.IO.Stream fs = FileUpload1.PostedFile.InputStream;
                System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                bus.image = bytes;
                int res = bus.image_upload();
               
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
                    Image1.ImageUrl = "data:image/png;base64," + base64String;
                }
            }
        }
    }
}