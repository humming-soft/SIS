using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SIS_B;

namespace SIS_V.state
{
    public partial class laporan_harian_add : System.Web.UI.Page
    {
        bus_sis_ugc2 objAktivitiBUS = new bus_sis_ugc2();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int Output = 0;
            objAktivitiBUS.kod_kawasan = txtKodKawasan.Text;
            objAktivitiBUS.butiran_aktiviti = txtButiranAktiviti.Text;
            objAktivitiBUS.tarikh = txtTarikh.Text;
            objAktivitiBUS.nama_kawasan = txtNamaKawasan.Text;
            objAktivitiBUS.parti = txtParti.Text;
            objAktivitiBUS.masa = txtMasa.Text;
            objAktivitiBUS.jenis_aktiviti = txtJenisAktiviti.Text;
            Output = objAktivitiBUS.InsertAktivitiDetails();
        }
        protected void btnISUAdd_Click(object sender, EventArgs e)
        {
            int Output = 0;
            objAktivitiBUS.isu_kod_kawasan = txtISUKodKawasan.Text;
            objAktivitiBUS.isu_butiran_aktiviti = txtButiranAktiviti.Text;
            objAktivitiBUS.isu_tarikh = txtISUTarikh.Text;
            objAktivitiBUS.isu_nama_kawasan = txtISUNamaKawasan.Text;
            objAktivitiBUS.isu_sumber = txtISUSumber.Text;
            objAktivitiBUS.isu_masa = txtISUMasa.Text;
            objAktivitiBUS.isu_kategori = txtISUKategori.Text;
            objAktivitiBUS.isu_parti = txtISUParti.Text;
            Output = objAktivitiBUS.InsertISUDetails();
        }
        protected void btnJanjiAdd_Click(object sender, EventArgs e)
        {
            int Output = 0;
            objAktivitiBUS.isu_kod_kawasan = txtISUKodKawasan.Text;
            objAktivitiBUS.isu_butiran_aktiviti = txtButiranAktiviti.Text;
            objAktivitiBUS.isu_tarikh = txtISUTarikh.Text;
            objAktivitiBUS.isu_nama_kawasan = txtISUNamaKawasan.Text;
            objAktivitiBUS.isu_sumber = txtISUSumber.Text;
            objAktivitiBUS.isu_masa = txtISUMasa.Text;
            objAktivitiBUS.isu_kategori = txtISUKategori.Text;
            objAktivitiBUS.isu_parti = txtISUParti.Text;
            Output = objAktivitiBUS.InsertISUDetails();
        }
    }
}