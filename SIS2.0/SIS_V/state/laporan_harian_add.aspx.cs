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
    public partial class laporan_harian_add : System.Web.UI.Page
    {
        bus_sis_ugc1 objAktivitiBUS = new bus_sis_ugc1();
        DataTable dt,dt1,dt2,dt3,dt4;
        string Akodkawasan, Ajenisaktiviti, Aparti, Atarikh, Abaktiviti, iKodKawasan,icategory,isumber,iparti,itarikh,ibutiran;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                invalid.Visible = false;
                valid.Visible = false;
                fill_kodkawasan();
                fill_jenis();
                fill_parti();
                fill_sumber();
                fill_isu();
                txtdate.Attributes.Add("readonly", "readonly");
                txtTarikh.Attributes.Add("readonly", "readonly");
                txtTarikh1.Attributes.Add("readonly", "readonly");
                txtTarikh2.Attributes.Add("readonly", "readonly");
            }
        }

        public void fill_kodkawasan()
        {
            dt = objAktivitiBUS.fill_kodkawasan();
            ddlKodKawasan.DataSource = dt;
            ddlKodKawasan.DataBind();
            ddlKodKawasan.Items.Insert(0, new ListItem("-----SELECT-----", ""));

            ddlKod_KawasanI.DataSource = dt;
            ddlKod_KawasanI.DataBind();
            ddlKod_KawasanI.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void fill_jenis()
        {
            dt1 = objAktivitiBUS.fill_jenis();
            ddlAktiviti.DataSource = dt1;
            ddlAktiviti.DataBind();
            ddlAktiviti.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void fill_parti()
        {
            dt2 = objAktivitiBUS.fill_parti();
            ddlparti.DataSource = dt2;
            ddlparti.DataBind();
            ddlparti.Items.Insert(0, new ListItem("-----SELECT-----", ""));

            ddlPartiI.DataSource = dt2;
            ddlPartiI.DataBind();
            ddlPartiI.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void fill_sumber()
        {
            dt3 = objAktivitiBUS.fill_sumber();
            ddlSumberIsu.DataSource = dt3;
            ddlSumberIsu.DataBind();
            ddlSumberIsu.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }
        public void fill_isu()
        {
            dt4 = objAktivitiBUS.fill_isu();
            ddlKategoriIsu.DataSource = dt4;
            ddlKategoriIsu.DataBind();
            ddlKategoriIsu.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        protected void btnsimpan_Click(object sender, EventArgs e)
        {
            string a = hfkaktivitiM.Value;
            int counter = int.Parse(a);
            Akodkawasan = hfkodkawasan.Value;
            Ajenisaktiviti = hfkaktiviti.Value;
            Aparti = hfparti.Value;
            Atarikh = txtdate.Text;
            Abaktiviti = txtButiran.Text;

            string[] split_Akodkawasan = Akodkawasan.Split(',');
            string[] split_Ajenisaktiviti = Ajenisaktiviti.Split(',');
            string[] split_Aparti = Aparti.Split(',');
            string[] split_Atarikh = Atarikh.Split(',');
            string[] split_Abaktiviti = Abaktiviti.Split(',');
            for (int j = 0; j < counter; j++)
            {
                objAktivitiBUS.kod_kawasan = int.Parse(split_Akodkawasan[j]);
                objAktivitiBUS.jenis_aktiviti = int.Parse(split_Ajenisaktiviti[j]);
                objAktivitiBUS.parti = int.Parse(split_Aparti[j]);
                objAktivitiBUS.tarikh = DateTime.Parse(split_Atarikh[j]);
                objAktivitiBUS.butiran_aktiviti = split_Abaktiviti[j];
                int act = objAktivitiBUS.insert_aktiviti();
                if(act == 1)// success
                {
                    fill_kodkawasan();
                    fill_jenis();
                    fill_parti();
                    txtdate.Text = "";
                    txtButiran.Text = "";
                    lblsuccess.Text = "Data Dimasukkan Berjaya!";
                    invalid.Visible = false;
                    valid.Visible = true;

                }
                else // fail
                {
                    fill_kodkawasan();
                    fill_jenis();
                    fill_parti();
                    txtdate.Text = "";
                    txtButiran.Text = "";
                    lblinvalid.Text = "Ralat yang tidak dijangka, Masukkan Gagal!";
                    invalid.Visible = true;
                }
            }
        }

        protected void btnsimpan1_Click(object sender, EventArgs e)
        {
            string b = hfisu.Value;
            int counter = int.Parse(b);
            iKodKawasan = kod_kawasanI.Value;
            icategory = KategoriIsu.Value;
            isumber = SumberIsu.Value;
            iparti = PartiI.Value;
            itarikh = txtTarikh.Text;
            ibutiran = txtButiran_Isu.Text;

            string[] split_iKodKawasan = iKodKawasan.Split(',');
            string[] split_icategory = icategory.Split(',');
            string[] split_isumber = isumber.Split(',');
            string[] split_iparti = iparti.Split(',');
            string[] split_itarikh = itarikh.Split(',');
            string[] split_ibutiran = ibutiran.Split(',');
            for (int k = 0; k < counter; k++)
            {
                objAktivitiBUS.kod_kawasan = int.Parse(split_iKodKawasan[k]);
                objAktivitiBUS.category = int.Parse(split_icategory[k]);
                objAktivitiBUS.sumber = int.Parse(split_isumber[k]);
                objAktivitiBUS.parti = int.Parse(split_iparti[k]);
                objAktivitiBUS.tarikh = DateTime.Parse(split_itarikh[k]);
                objAktivitiBUS.butiran_aktiviti = split_ibutiran[k];
                int act = objAktivitiBUS.insert_isu();
                if (act == 1)// success 
                {
                    fill_kodkawasan();
                    fill_isu();
                    fill_sumber();
                    fill_parti();
                    txtTarikh.Text = "";
                    txtButiran_Isu.Text = "";
                    lblsuccess.Text = "Data Dimasukkan Berjaya!";
                    invalid.Visible = false;
                    valid.Visible = true;

                }
                else // fail
                {
                    fill_kodkawasan();
                    fill_jenis();
                    fill_parti();
                    txtdate.Text = "";
                    txtButiran.Text = "";
                    lblinvalid.Text = "Ralat yang tidak dijangka, Masukkan Gagal!";
                    invalid.Visible = true;
                }
            }
        }

        //protected void btnAdd_Click(object sender, EventArgs e)
        //{
        //    int Output = 0;
        //    objAktivitiBUS.kod_kawasan = txtKodKawasan.Text;
        //    objAktivitiBUS.butiran_aktiviti = txtButiranAktiviti.Text;
        //    objAktivitiBUS.tarikh = txtTarikh.Text;
        //    objAktivitiBUS.nama_kawasan = txtNamaKawasan.Text;
        //    objAktivitiBUS.parti = txtParti.Text;
        //    objAktivitiBUS.masa = txtMasa.Text;
        //    objAktivitiBUS.jenis_aktiviti = txtJenisAktiviti.Text;
        //    Output = objAktivitiBUS.InsertAktivitiDetails();
        //}
        //protected void btnISUAdd_Click(object sender, EventArgs e)
        //{
        //    int Output = 0;
        //    objAktivitiBUS.isu_kod_kawasan = txtISUKodKawasan.Text;
        //    objAktivitiBUS.isu_butiran_aktiviti = txtButiranAktiviti.Text;
        //    objAktivitiBUS.isu_tarikh = txtISUTarikh.Text;
        //    objAktivitiBUS.isu_nama_kawasan = txtISUNamaKawasan.Text;
        //    objAktivitiBUS.isu_sumber = txtISUSumber.Text;
        //    objAktivitiBUS.isu_masa = txtISUMasa.Text;
        //    objAktivitiBUS.isu_kategori = txtISUKategori.Text;
        //    objAktivitiBUS.isu_parti = txtISUParti.Text;
        //    Output = objAktivitiBUS.InsertISUDetails();
        //}
        //protected void btnJanjiAdd_Click(object sender, EventArgs e)
        //{
        //    int Output = 0;
        //    objAktivitiBUS.isu_kod_kawasan = txtISUKodKawasan.Text;
        //    objAktivitiBUS.isu_butiran_aktiviti = txtButiranAktiviti.Text;
        //    objAktivitiBUS.isu_tarikh = txtISUTarikh.Text;
        //    objAktivitiBUS.isu_nama_kawasan = txtISUNamaKawasan.Text;
        //    objAktivitiBUS.isu_sumber = txtISUSumber.Text;
        //    objAktivitiBUS.isu_masa = txtISUMasa.Text;
        //    objAktivitiBUS.isu_kategori = txtISUKategori.Text;
        //    objAktivitiBUS.isu_parti = txtISUParti.Text;
        //    Output = objAktivitiBUS.InsertISUDetails();
        //}
    }
}