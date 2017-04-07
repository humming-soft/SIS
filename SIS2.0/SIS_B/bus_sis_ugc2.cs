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
        public int candidate_id { get; set; }
        public Byte[] image { get; set; }
        public string title { get; set; }
        public string candidate_ic { get; set; }
        public string candidate_name { get; set; }
        public DateTime dob { get; set; }
        public int gender { get; set; }
        public int race { get; set; }
        public int religion { get; set; }
        public string alamat { get; set; }
        public string home_tel_no { get; set; }
        public string fax_no { get; set; }
        public string Office_tel_no { get; set; }
        public string email { get; set; }
        public string mobile_no { get; set; }
        public string blog { get; set; }
        public string facebook { get; set; }
        public string twitter { get; set; }
        public string occupation { get; set; }
        public double income { get; set; }
        public string spouse_name { get; set; }
        public int child_no { get; set; }
        public int party { get; set; }
        public string membership_no { get; set; }
        public bool member4life { get; set; }
        public string branch { get; set; }
        public string political_post { get; set; }
        public string division { get; set; }
        public DateTime expiry_date { get; set; }
        public DateTime date_join { get; set; }
        public DateTime date_left { get; set; }
        public string asset { get; set; }
        public string education { get; set; }
        public string add_info { get; set; }
        public Byte[] archive { get; set; }
        public string archivename { get; set; }
        public string candidate_old_ic { get; set; }
        public int election_result_id { get; set; }

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
        public DataTable GetCandidateNames()
        {
            return objDAL.GetCandidateNames();
        }
        public DataTable fill_CandidateDataTable()
        {
            return objDAL.fill_CandidateDataTable();
        }
        public DataTable GetCandidateSearchList()
        {
            return objDAL.GetCandidateSearchList(name);
        }
        public DataTable GetCandidateDetails()
        {
            return objDAL.GetCandidateDetails(candidate_id);
        }
        public int UpdateCandidateDetails()
        {
            return objDAL.UpdateCandidateDetails(image, candidate_id, candidate_ic, candidate_name, title, dob, gender, race, religion, alamat, home_tel_no,
                fax_no, Office_tel_no, email, mobile_no, blog, facebook, twitter, occupation, income, spouse_name, child_no, party, membership_no,
                member4life, branch, political_post, division, expiry_date, date_join, date_left, asset, education, add_info, archive, archivename, candidate_old_ic);
        }
        public DataTable GetCandidateImage()
        {
            return objDAL.GetCandidateImage(candidate_id);
        }
        public DataTable GetFile()
        {
            return objDAL.GetFile(candidate_id);
        }
        public DataTable GetArea()
        {
            return objDAL.GetArea(state_id);
        }
        public DataTable GetPenyandang()
        {
            return objDAL.GetPenyandang(election_id, area_id);
        }
        public DataTable GetElectionCandidate()
        {
            return objDAL.GetElectionCandidate(election_id, area_id);
        }
        public DataTable GetAllCandidateNames()
        {
            return objDAL.GetAllCandidateNames();
        }
        public int InsertElectionResult()
        {
            return objDAL.InsertElectionResult(election_id, area_id);
        }
        public int InsertElectionResultCandidateVal()
        {
            return objDAL.InsertElectionResultCandidateVal(election_result_id, candidate_id);
        }
        public int DeleteElectionResultCandidate()
        {
            return objDAL.DeleteElectionResultCandidate(election_result_id, candidate_id);
        }

    }
}
