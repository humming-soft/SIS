using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SIS_D;

namespace SIS_B
{
    //Assigned User - Jane
    public class bus_sis_ugc2
    {
        data_sis_ugc2 objDAL = new data_sis_ugc2();

        public string kod_kawasan { get; set; }
        public string butiran_aktiviti { get; set; }
        public string tarikh { get; set; }
        public string nama_kawasan { get; set; }
        public string parti { get; set; }
        public string masa { get; set; }
        public string jenis_aktiviti { get; set; }

        public string isu_kod_kawasan { get; set; }
        public string isu_butiran_aktiviti { get; set; }
        public string isu_tarikh { get; set; }
        public string isu_nama_kawasan { get; set; }
        public string isu_sumber { get; set; }
        public string isu_masa { get; set; }
        public string isu_parti { get; set; }
        public string isu_kategori { get; set; }

        public string janji_kod_kawasan { get; set; }
        public string janji_nama_kawasan { get; set; }
        public string janji_yg { get; set; }
        public string janji_nama_tokoh { get; set; }
        public string janji_tarik { get; set; }
        public string janji_masa { get; set; }

        public int area_id { get; set; }
        public string p_kod_kawasan { get; set; }
        public string p_nama_kawasan { get; set; }
        public int bil { get; set; }
        public string kawasan_tumpuan { get; set; }
        public string kawasan_tumpuan_penbangkang { get; set; }
        public string kawasan_operasi { get; set; }
        public string keluasan_kawasan { get; set; }
        public string sempadan_kawasan { get; set; }
        public string kegiatan_ekonomi { get; set; }
        public string pecahan_kaum { get; set; }
        public int populasi_penduduk { get; set; }
        public int purata_umur { get; set; }
        public string purata_jantina { get; set; }
        public string kemudahan_awam { get; set; }
        public string taburan_penduduk { get; set; }
        public string komposisi_etnik { get; set; }
        public string kedar_pertumbuhan_penduduk { get; set; }

        public int state_id { get; set; }
        public string log_name { get; set; }

        public int pilihanraya { get; set; }
        public int negeri { get; set; }
        public int parlimen { get; set; }
        public int daerah { get; set; }
        public int name { get; set; }
        public int jenis { get; set; }
        public int sumber { get; set; }
        public int tahap { get; set; }
        public DateTime tarikh_masa { get; set; }
        public string butiran { get; set; }

        public int area_type_id { get; set; }

        public int polling_district_id { get; set; }
        public int no_of_vote { get; set; }

        public int election_id { get; set; }

        public DataTable fill_DataTable()
        {
            return objDAL.fill_DataTable(state_id);
        }

        public DataTable GetPInfoDetails(){

            return objDAL.GetPInfoDetails(area_id);
        }

        public int UpdatePInfoDetails()
        {
            return objDAL.UpdatePInfoDetails(area_id, p_kod_kawasan, p_nama_kawasan, bil, kawasan_tumpuan, kawasan_tumpuan_penbangkang, kawasan_operasi, keluasan_kawasan, sempadan_kawasan, kegiatan_ekonomi, pecahan_kaum, populasi_penduduk, purata_umur, purata_jantina, kemudahan_awam, taburan_penduduk, komposisi_etnik, kedar_pertumbuhan_penduduk);
        }
        public DataTable GetConOpAreaList()
        {
            return objDAL.GetConOpAreaList(state_id);
        }
        public DataTable fill_kod_kawasan()
        {
            return objDAL.fill_kod_kawasan(state_id);
        }
        public DataTable GetUserDetails()
        {
            return objDAL.GetUserDetails(log_name);
        }
        public DataTable GetElectionList()
        {
            return objDAL.GetElectionList();
        }
        public DataTable GetStateList()
        {
            return objDAL.GetStateList(state_id);
        }
        public DataTable GetAreaCodeList()
        {
            return objDAL.GetAreaCodeList(state_id);
        }
        public DataTable GetPollingDistrict()
        {
            return objDAL.GetPollingDistrict(area_id);
        }
        public DataTable GetActivityList()
        {
            return objDAL.GetActivityList();
        }
        public DataTable GetLookUpList()
        {
            return objDAL.GetLookUpList();
        }
        public DataTable GetValidityList()
        {
            return objDAL.GetValidityList();
        }
        public DataTable GetCandidateList()
        {
            return objDAL.GetCandidateList();
        }

        public int SaveCandidateAreaDetails()
        {
            return objDAL.SaveCandidateAreaDetails(pilihanraya, negeri, parlimen, daerah, name, jenis, sumber, tahap, tarikh_masa, butiran);
        }
        public DataTable FillActivitiDataTable()
        {
            return objDAL.FillActivitiDataTable(state_id);
        }
        public DataTable GetAreaList()
        {
            return objDAL.GetAreaList(area_type_id, state_id);
        }
        public DataTable GetPollingDetails()
        {
            return objDAL.GetPollingDetails(area_id);
        }
        public int UpdateNoVote()
        {
            return objDAL.UpdateNoVote(area_id, election_id, polling_district_id, no_of_vote);
        }

    }
}
