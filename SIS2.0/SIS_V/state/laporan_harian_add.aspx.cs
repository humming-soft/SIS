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
        DataTable dt,dt1,dt2;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                fill_kodkawasan();
                fill_jenis();
                fill_parti();

            }
        }

        public void fill_kodkawasan()
        {
            //dt = objAktivitiBUS.fill_kodkawasan();
            ddlKodKawasan.DataSource = dt;
            ddlKodKawasan.DataBind();
            ddlKodKawasan.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void fill_jenis()
        {
            //dt1 = objAktivitiBUS.fill_jenis();
            ddlAktiviti.DataSource = dt;
            ddlAktiviti.DataBind();
            ddlAktiviti.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        public void fill_parti()
        {
            //dt2 = objAktivitiBUS.fill_parti();
            ddlparti.DataSource = dt;
            ddlparti.DataBind();
            ddlparti.Items.Insert(0, new ListItem("-----SELECT-----", ""));
        }

        protected void btnsimpan_Click(object sender, EventArgs e)
        {
            string a = hfaktivity.Value;

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