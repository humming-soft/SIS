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

        public DataTable fill_DataTable()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_GetAreaInfo";
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
        public DataTable FillActivitiDataTable()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCandidateAreaElectionDetails";
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
    }
}
