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
        DataTable dt,dt1,dt2,dt3,dt4,dt5;
        string Akodkawasan, Ajenisaktiviti, Aparti, Atarikh, Abaktiviti, iKodKawasan, icategory, isumber, iparti, itarikh, ibutiran, jKodKawasan, jtarikh, jdiberi, jnama, InKodKawasan, Inparti, Intarikh, ButiranInsiden;
        string KodKawasanKawasan, statusKawasan, tarikhKawasan, WujudKawasan, KaveatKawasan;
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
                fill_status();
                txtdate.Attributes.Add("readonly", "readonly");
                txtTarikh.Attributes.Add("readonly", "readonly");
                txtTarikhj.Attributes.Add("readonly", "readonly");
                txtTarikhIn.Attributes.Add("readonly", "readonly");
                txtTarikhKawasan.Attributes.Add("readonly", "readonly");
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

            ddlKodKawasanj.DataSource = dt;
            ddlKodKawasanj.DataBind();
            ddlKodKawasanj.Items.Insert(0, new ListItem("-----SELECT-----", ""));

            ddlKodKawasanIn.DataSource = dt;
            ddlKodKawasanIn.DataBind();
            ddlKodKawasanIn.Items.Insert(0, new ListItem("-----SELECT-----", ""));

            ddlKodKawasanKawasan.DataSource = dt;
            ddlKodKawasanKawasan.DataBind();
            ddlKodKawasanKawasan.Items.Insert(0, new ListItem("-----SELECT-----", ""));
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

            ddlPartiIn.DataSource = dt2;
            ddlPartiIn.DataBind();
            ddlPartiIn.Items.Insert(0, new ListItem("-----SELECT-----", ""));
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
        public void fill_status()
        {
            dt5 = objAktivitiBUS.fill_status();
            ddlstatusKawasan.DataSource = dt5;
            ddlstatusKawasan.DataBind();
            ddlstatusKawasan.Items.Insert(0, new ListItem("-----SELECT-----", ""));
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
                    valid.Visible = false;
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
                int isu = objAktivitiBUS.insert_isu();
                if (isu == 1)// success 
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
                    valid.Visible = false;
                    invalid.Visible = true;
                }
            }
        }

        protected void btnsimpan2_Click(object sender, EventArgs e)
        {
            string c = hfjanji.Value;
            int counter = int.Parse(c);
            jKodKawasan = kod_kawasanJ.Value;
            jtarikh = txtTarikhj.Text;
            jdiberi = txtjanji.Text;
            jnama = txtNamaTokoh.Text;

            string[] split_jKodKawasan = jKodKawasan.Split(',');
            string[] split_jtarikh = jtarikh.Split(',');
            string[] split_jdiberi = jdiberi.Split(',');
            string[] split_jnama = jnama.Split(',');
            for (int l = 0; l < counter; l++)
            {
                objAktivitiBUS.kod_kawasan = int.Parse(split_jKodKawasan[l]);
                objAktivitiBUS.tarikh = DateTime.Parse(split_jtarikh[l]);
                objAktivitiBUS.diberi = split_jdiberi[l];
                objAktivitiBUS.jnama = split_jnama[l];
                int jan = objAktivitiBUS.insert_janji();
                if(jan == 1)// success
                {
                    fill_kodkawasan();
                    txtTarikhj.Text = "";
                    txtjanji.Text = "";
                    txtNamaTokoh.Text = "";
                    lblsuccess.Text = "Data Dimasukkan Berjaya!";
                    invalid.Visible = false;
                    valid.Visible = true;
                }
                else
                {
                    fill_kodkawasan();
                    txtTarikhj.Text = "";
                    txtjanji.Text = "";
                    txtNamaTokoh.Text = "";
                    lblinvalid.Text = "Ralat yang tidak dijangka, Masukkan Gagal!";
                    valid.Visible = false;
                    invalid.Visible = true;
                }
            }
        }

        protected void btnsimpan3_Click(object sender, EventArgs e)
        {
            string d = hfinsiden.Value;
            int counter = int.Parse(d);
            InKodKawasan = hfKodKawasanIn.Value;
            Inparti = hfPartiIn.Value;
            Intarikh = txtTarikhIn.Text;
            ButiranInsiden = txtButiranInsiden.Text;
            string[] split_InKodKawasan = InKodKawasan.Split(',');
            string[] split_Inparti = Inparti.Split(',');
            string[] split_Intarikh = Intarikh.Split(',');
            string[] split_ButiranInsiden = ButiranInsiden.Split(',');
            for(int m = 0; m < counter; m++)
            {
                objAktivitiBUS.kod_kawasan = int.Parse(split_InKodKawasan[m]);
                objAktivitiBUS.parti = int.Parse(split_Inparti[m]); ;
                objAktivitiBUS.tarikh = DateTime.Parse(split_Intarikh[m]);
                objAktivitiBUS.binsiden = split_ButiranInsiden[m];
                int insi = objAktivitiBUS.insert_insiden();
                if (insi == 1)// success
                {
                    fill_kodkawasan();
                    fill_parti();
                    txtTarikhIn.Text = "";
                    txtButiranInsiden.Text = "";
                    lblsuccess.Text = "Data Dimasukkan Berjaya!";
                    invalid.Visible = false;
                    valid.Visible = true;
                }
                else
                {
                    fill_kodkawasan();
                    fill_parti();
                    txtTarikhIn.Text = "";
                    txtButiranInsiden.Text = "";
                    lblinvalid.Text = "Ralat yang tidak dijangka, Masukkan Gagal!";
                    valid.Visible = false;
                    invalid.Visible = true;
                }
            }
        }

        protected void btnsimpan4_Click(object sender, EventArgs e)
        {
            string f = hfkawasan.Value;
            int counter = int.Parse(f);
            KodKawasanKawasan = hfKodKawasanKawasan.Value;
            statusKawasan = hfstatusKawasan.Value;
            tarikhKawasan = txtTarikhKawasan.Text;
            WujudKawasan = hfWujud.Value;
            KaveatKawasan = txtJustifikasi.Text;

            string[] split_KodKawasanKawasan = KodKawasanKawasan.Split(',');
            string[] split_statusKawasan = statusKawasan.Split(',');
            string[] split_tarikhKawasan = tarikhKawasan.Split(',');
            string[] split_WujudKawasan = WujudKawasan.Split(',');
            string[] split_KaveatKawasan = KaveatKawasan.Split(',');
            for (int n = 0; n < counter; n++)
            {
                objAktivitiBUS.kod_kawasan = int.Parse(split_KodKawasanKawasan[n]);
                objAktivitiBUS.status_kawasan = split_statusKawasan[n];
                objAktivitiBUS.tarikh = DateTime.Parse(split_tarikhKawasan[n]);
                objAktivitiBUS.kaveat = split_KaveatKawasan[n];
                int kawasa = objAktivitiBUS.insert_statuskawasan();
                if (kawasa == 1)// success
                {
                    fill_kodkawasan();
                    fill_status();
                    ddlWujud.SelectedIndex = 0;
                    txtTarikhKawasan.Text = "";
                    txtJustifikasi.Text = "";
                    lblsuccess.Text = "Data Dimasukkan Berjaya!";
                    invalid.Visible = false;
                    valid.Visible = true;
                }
                else
                {
                    fill_kodkawasan();
                    fill_status();
                    ddlWujud.SelectedIndex = 0;
                    txtTarikhKawasan.Text = "";
                    txtJustifikasi.Text = "";
                    lblinvalid.Text = "Ralat yang tidak dijangka, Masukkan Gagal!";
                    valid.Visible = false;
                    invalid.Visible = true;
                }
            }
        }
    }
}