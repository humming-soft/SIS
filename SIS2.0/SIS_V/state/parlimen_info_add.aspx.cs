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
    public partial class parlimen_info_add : System.Web.UI.Page
    {
        bus_sis_ugc2 objPInfoBUS = new bus_sis_ugc2();
        DataTable dt;
        int area_id;
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
                    GetPInfoDetails();
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

        public void GetPInfoDetails()
        {
            string KawasanTumpuan;
            string KawasanTumpuanPenbangkang;
            string KawasanOperasi;
            objPInfoBUS.area_id = int.Parse(Session["area_id"].ToString());
            dt = objPInfoBUS.GetPInfoDetails();
            if(dt.Rows.Count > 0)
            {
                txtKodKawasan.Text = dt.Rows[0]["area_code"].ToString();
                txtNamaKawasan.Text = dt.Rows[0]["area_name"].ToString();
                txtBil.Text = dt.Rows[0]["no_of_villages"].ToString();

                KawasanTumpuan = dt.Rows[0]["Government"].ToString();
                if (KawasanTumpuan == "Yes"){
                    chkKawasanTumpuan.Checked = true;
                }else{
                    chkKawasanTumpuan.Checked = false;
                }
                KawasanTumpuanPenbangkang = dt.Rows[0]["Opposition"].ToString();
                if (KawasanTumpuanPenbangkang == "Yes"){
                    chkKawasanTumpuanPenbangkang.Checked = true;
                }else{
                    chkKawasanTumpuanPenbangkang.Checked = false;
                }
                KawasanOperasi = dt.Rows[0]["Operation Area"].ToString();
                if (KawasanOperasi == "Yes")
                {
                    chkKawasanOperasi.Checked = true;
                }else{
                    chkKawasanOperasi.Checked = false;
                }

                txtKeluasanKawasan.Text = dt.Rows[0]["area_size"].ToString();
                txtSempadanKawasan.Text = dt.Rows[0]["border_area"].ToString();
                txtKegiatanEkonomi.Text = dt.Rows[0]["economy_activities"].ToString();
                txtPecahanKaum.Text = dt.Rows[0]["race_fragment"].ToString();
                txtPopulasiPenduduk.Text = dt.Rows[0]["no_of_population"].ToString();
                txtPurataUmur.Text = dt.Rows[0]["average_age"].ToString();
                txtPurataJantina.Text = dt.Rows[0]["average_gender"].ToString();
                txtKemudahanAwam.Text = dt.Rows[0]["basic_facilities"].ToString();
                txtTaburanPenduduk.Text = dt.Rows[0]["distribution_of_population"].ToString();
                txtKomposisiEtnik.Text = dt.Rows[0]["ethnic_composition"].ToString();
                txtKedarPertumbuhanPenduduk.Text = dt.Rows[0]["rate_poulation_growth"].ToString();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtKodKawasan.Text != "" && txtNamaKawasan.Text != "" && txtBil.Text != "" && txtKeluasanKawasan.Text != "" && txtSempadanKawasan.Text != "" && txtKegiatanEkonomi.Text != "" && txtPecahanKaum.Text != "" && txtKegiatanEkonomi.Text != "" && txtPopulasiPenduduk.Text != "" && txtPurataUmur.Text != "" && txtPurataJantina.Text != "" && txtKemudahanAwam.Text != "" && txtTaburanPenduduk.Text != "" && txtKomposisiEtnik.Text != "" && txtKedarPertumbuhanPenduduk.Text != "")
            {
                objPInfoBUS.area_id = int.Parse(Session["area_id"].ToString());
                objPInfoBUS.p_kod_kawasan = txtKodKawasan.Text;
                objPInfoBUS.p_nama_kawasan = txtNamaKawasan.Text;
                objPInfoBUS.bil = int.Parse(txtBil.Text);
                if (chkKawasanTumpuan.Checked)
                {
                    objPInfoBUS.kawasan_tumpuan = "Yes";
                }
                else
                {
                    objPInfoBUS.kawasan_tumpuan = "No";
                }
                if (chkKawasanTumpuanPenbangkang.Checked)
                {
                    objPInfoBUS.kawasan_tumpuan_penbangkang = "Yes";
                }
                else
                {
                    objPInfoBUS.kawasan_tumpuan_penbangkang = "No";
                }
                if (chkKawasanOperasi.Checked)
                {
                    objPInfoBUS.kawasan_operasi = "Yes";
                }
                else
                {
                    objPInfoBUS.kawasan_operasi = "No";
                }
                objPInfoBUS.keluasan_kawasan = txtKeluasanKawasan.Text;
                objPInfoBUS.sempadan_kawasan = txtSempadanKawasan.Text;
                objPInfoBUS.kegiatan_ekonomi = txtKegiatanEkonomi.Text;
                objPInfoBUS.pecahan_kaum = txtPecahanKaum.Text;
                objPInfoBUS.populasi_penduduk = int.Parse(txtPopulasiPenduduk.Text);
                objPInfoBUS.purata_umur = int.Parse(txtPurataUmur.Text);
                objPInfoBUS.purata_jantina = txtPurataJantina.Text;
                objPInfoBUS.kemudahan_awam = txtKemudahanAwam.Text;
                objPInfoBUS.taburan_penduduk = txtTaburanPenduduk.Text;
                objPInfoBUS.komposisi_etnik = txtKomposisiEtnik.Text;
                objPInfoBUS.kedar_pertumbuhan_penduduk = txtKedarPertumbuhanPenduduk.Text;
                int chk = objPInfoBUS.UpdatePInfoDetails();
                if (chk == 0)
                {
                    Response.Redirect("parlimen_info_view");
                }
            }
            else
            {
                invalid.Visible = true;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtKodKawasan.Text = "";
            txtNamaKawasan.Text = "";
            txtBil.Text = "";
            chkKawasanTumpuan.Checked = false;
            chkKawasanTumpuanPenbangkang.Checked = false;
            chkKawasanOperasi.Checked = false; 
            txtKeluasanKawasan.Text = "";
            txtSempadanKawasan.Text = "";
            txtKegiatanEkonomi.Text = "";
            txtPecahanKaum.Text = "";
            txtPopulasiPenduduk.Text = "";
            txtPurataUmur.Text = "";
            txtPurataJantina.Text = "";
            txtKemudahanAwam.Text = "";
            txtTaburanPenduduk.Text = "";
            txtKomposisiEtnik.Text = "";
            txtKedarPertumbuhanPenduduk.Text = "";
            Response.Redirect("parlimen_info_view");
        }

    }
}