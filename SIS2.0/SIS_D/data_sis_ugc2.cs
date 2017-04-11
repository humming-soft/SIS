using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace SIS_D
{
    //Assigned User - Jane
    public class data_sis_ugc2
    {
        SqlCommand cmd = new SqlCommand();
        db_connect db = new db_connect();

        public DataTable fill_DataTable(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_GetAreaInfo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", state_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable GetPInfoDetails(int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_GetAreaDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_id", area_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int UpdatePInfoDetails(int area_id, string p_kod_kawasan, string p_nama_kawasan, int bil, string kawasan_tumpuan, string kawasan_tumpuan_penbangkang, string kawasan_operasi, string keluasan_kawasan, string sempadan_kawasan, string kegiatan_ekonomi, string pecahan_kaum, int populasi_penduduk, int purata_umur, string purata_jantina, string kemudahan_awam, string taburan_penduduk, string komposisi_etnik, string kedar_pertumbuhan_penduduk)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_UpdateAreaDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@kod_kawasan", p_kod_kawasan);
                cmd.Parameters.AddWithValue("@nama_kawasan", p_nama_kawasan);
                cmd.Parameters.AddWithValue("@bil", bil);
                cmd.Parameters.AddWithValue("@kawasan_tumpuan", kawasan_tumpuan);
                cmd.Parameters.AddWithValue("@kawasan_tumpuan_penbangkang", kawasan_tumpuan_penbangkang);
                cmd.Parameters.AddWithValue("@kawasan_operasi", kawasan_operasi);
                cmd.Parameters.AddWithValue("@keluasan_kawasan", keluasan_kawasan);
                cmd.Parameters.AddWithValue("@sempadan_kawasan", sempadan_kawasan);
                cmd.Parameters.AddWithValue("@kegiatan_ekonomi", kegiatan_ekonomi);
                cmd.Parameters.AddWithValue("@pecahan_kaum", pecahan_kaum);
                cmd.Parameters.AddWithValue("@populasi_penduduk", populasi_penduduk);
                cmd.Parameters.AddWithValue("@purata_umur", purata_umur);
                cmd.Parameters.AddWithValue("@purata_jantina", purata_jantina);
                cmd.Parameters.AddWithValue("@kemudahan_awam", kemudahan_awam);
                cmd.Parameters.AddWithValue("@taburan_penduduk", taburan_penduduk);
                cmd.Parameters.AddWithValue("@komposisi_etnik", komposisi_etnik);
                cmd.Parameters.AddWithValue("@kedar_pertumbuhan_penduduk", kedar_pertumbuhan_penduduk);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable GetConOpAreaList(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetConOpAreaList";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", state_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable fill_kod_kawasan(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetStateAreaList";
                cmd.Parameters.AddWithValue("@state_id", state_id);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetUserDetails(string log_name)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetUserDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@log_name", log_name);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetElectionList()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetElection";
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetStateList(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetState";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", state_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetAreaCodeList(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetAreaList";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", state_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetPollingDistrict(int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetPollingDistrict";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_id", area_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetActivityList()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetElectionActivityType";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@activity_type", 2);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetLookUpList()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetLookup";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lookupType", 5);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetValidityList()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetValidityInfo";
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetCandidateList()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCandidateDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public int SaveCandidateAreaDetails(int pilihanraya, int negeri, int parlimen, int daerah, int name, int jenis, int sumber, int tahap, DateTime tarikh_masa, string butiran)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_InsertCandidateAreaDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@pilihanraya", pilihanraya);
                cmd.Parameters.AddWithValue("@negeri", negeri);
                cmd.Parameters.AddWithValue("@parlimen", parlimen);
                cmd.Parameters.AddWithValue("@daerah", daerah);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@jenis", jenis);
                cmd.Parameters.AddWithValue("@sumber", sumber);
                cmd.Parameters.AddWithValue("@tahap", tahap);
                cmd.Parameters.AddWithValue("@tarikh_masa", tarikh_masa);
                cmd.Parameters.AddWithValue("@butiran", butiran);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable FillActivitiDataTable(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCandidateAreaElectionDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", state_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetAreaList(int area_type_id, int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetAreaCodeName";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_type_id", area_type_id);
                cmd.Parameters.AddWithValue("@state_id", state_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetPollingDetails(int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetPollingDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_id", area_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public int UpdateNoVote(int area_id, int election_id, int polling_district_id, int no_of_vote)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_UpdateNoVote";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@election_id", election_id);
                cmd.Parameters.AddWithValue("@polling_district_id", polling_district_id);
                cmd.Parameters.AddWithValue("@no_of_vote", no_of_vote);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetCandidateNames()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCandidateNames";
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable fill_CandidateDataTable()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCandidateProfiles";
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable GetCandidateSearchList(int name)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCandidateSearchList";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", name);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetCandidateDetails(int candidate_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCandidateProfileDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", candidate_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int UpdateCandidateDetails(Byte[] image, int candidate_id, string candidate_ic, string candidate_name, string title, DateTime dob, int gender, int race, int religion, string alamat, string home_tel_no,
                string fax_no, string Office_tel_no, string email, string mobile_no, string blog, string facebook, string twitter, string occupation, double income, string spouse_name, int child_no, int party, string membership_no,
                bool member4life, string branch, string political_post, string division, DateTime expiry_date, DateTime date_join, DateTime date_left, string asset, string education, string add_info, Byte[] archive, string archivename, string candidate_old_ic)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_UpdateCandidateDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", candidate_id);
                cmd.Parameters.AddWithValue("@candidate_ic", candidate_ic);
                cmd.Parameters.AddWithValue("@name", candidate_name);
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@image", image);
                cmd.Parameters.AddWithValue("@dob", dob);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@race", race);
                cmd.Parameters.AddWithValue("@religion", religion);
                cmd.Parameters.AddWithValue("@add01", alamat);
                cmd.Parameters.AddWithValue("@home_tel_no", home_tel_no);
                cmd.Parameters.AddWithValue("@fax_no", fax_no);
                cmd.Parameters.AddWithValue("@office_tel_no", Office_tel_no);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@mobile_no", mobile_no);
                cmd.Parameters.AddWithValue("@blog", blog);
                cmd.Parameters.AddWithValue("@facebook", facebook);
                cmd.Parameters.AddWithValue("@twitter", twitter);
                cmd.Parameters.AddWithValue("@occupation", occupation);
                cmd.Parameters.AddWithValue("@income", income);
                cmd.Parameters.AddWithValue("@spouse_name", spouse_name);
                cmd.Parameters.AddWithValue("@child_no", child_no);
                cmd.Parameters.AddWithValue("@party_id", party);
                cmd.Parameters.AddWithValue("@membership_no", membership_no);
                cmd.Parameters.AddWithValue("@member_for_life", member4life);
                cmd.Parameters.AddWithValue("@branch", branch);
                cmd.Parameters.AddWithValue("@political_post", political_post);
                cmd.Parameters.AddWithValue("@division", division);
                cmd.Parameters.AddWithValue("@expiry_date", expiry_date);
                cmd.Parameters.AddWithValue("@date_join", date_join);
                cmd.Parameters.AddWithValue("@date_left", date_left);
                cmd.Parameters.AddWithValue("@asset", asset);
                cmd.Parameters.AddWithValue("@education", education);
                cmd.Parameters.AddWithValue("@add_info", add_info);
                cmd.Parameters.AddWithValue("@archive", archive);
                cmd.Parameters.AddWithValue("@archivename", archivename);
                cmd.Parameters.AddWithValue("@candidate_old_ic", candidate_old_ic);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable GetCandidateImage(int candidate_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCandidateImage";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", candidate_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable GetFile(int candidate_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCandidateFile";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", candidate_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable GetArea(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_GetAreaInfo";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", state_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable GetPenyandang(int election_id, int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetElectionResultIncumbent";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@electionId", election_id);
                cmd.Parameters.AddWithValue("@areaId", area_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable GetElectionCandidate(int election_id, int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetElectionCanResult";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@electionId", election_id);
                cmd.Parameters.AddWithValue("@areaId", area_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable GetAllCandidateNames()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetAllCandidateNames";
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public int InsertElectionResult(int election_id, int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_InsertElectionResultVal";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@election_id", election_id);
                cmd.Parameters.AddWithValue("@area_id", area_id);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputId";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputId"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        public int InsertElectionResultCandidateVal(int election_result_id, int candidate_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_InsertElectionResultCandidateVal";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@election_result_id", election_result_id);
                cmd.Parameters.AddWithValue("@candidate_id", candidate_id);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputId";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputId"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        public int DeleteElectionResultCandidate(int election_result_id, int candidate_id, int election_id, int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_DeleteElectionResultCandidateVal";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@election_result_id", election_result_id);
                cmd.Parameters.AddWithValue("@candidate_id", candidate_id);
                //cmd.Parameters.AddWithValue("@election_id", election_id);
                //cmd.Parameters.AddWithValue("@area_id", area_id);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputId";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputId"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
    }
}
