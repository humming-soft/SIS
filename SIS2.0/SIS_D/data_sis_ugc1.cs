using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace SIS_D
{
    //Assigned User - Agaile
    public class data_sis_ugc1
    {
        SqlCommand cmd = new SqlCommand();
        db_connect db = new db_connect();


        public int check_login(string username, string pswd)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_AuthenticateUser";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@log_name", username);
                cmd.Parameters.AddWithValue("@log_pwd", pswd);
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

        public DataTable fetch_userdetails(string username)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "get_user_detail";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@log_name", username);
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

        public DataTable fill_kawasan()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_analisis_kawasan";
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

        public DataTable fill_kodkawasan(int stateid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_getkodkawasan";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", stateid);
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

        public DataTable fill_jenis()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_getjenis";
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

        public DataTable fill_parti()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "getparty";
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

        public int insert_aktiviti(int kod_kawasan, int jenis_aktiviti, int parti, DateTime tarikh, string butiran_aktiviti)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_insert_aktiviti";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@kod_kawasan", kod_kawasan);
                cmd.Parameters.AddWithValue("@jenis_aktiviti", jenis_aktiviti);
                cmd.Parameters.AddWithValue("@parti", parti);
                cmd.Parameters.AddWithValue("@tarikh", tarikh);
                cmd.Parameters.AddWithValue("@butiran_aktiviti", butiran_aktiviti);
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

        public DataTable fill_sumber()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetLookup";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lookupType", 8);
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

        public DataTable fill_isu()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetIsu";
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

        public int insert_isu(int kod_kawasan, int category, int sumber, int parti, DateTime tarikh, string butiran_aktiviti)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_insert_isu";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@isu_kod_kawasan", kod_kawasan);
                cmd.Parameters.AddWithValue("@isu_kategori", category);
                cmd.Parameters.AddWithValue("@isu_sumber", sumber);
                cmd.Parameters.AddWithValue("@isu_parti", parti);
                cmd.Parameters.AddWithValue("@isu_tarik", tarikh);
                cmd.Parameters.AddWithValue("@isu_butiran", butiran_aktiviti);
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
        public int insert_janji(int kod_kawasan, DateTime tarikh, string diberi, string jnama)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_insert_janji";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@janji_kod_kawasan", kod_kawasan);
                cmd.Parameters.AddWithValue("@janji_tarik", tarikh);
                cmd.Parameters.AddWithValue("@janji_parti_id", 14);
                cmd.Parameters.AddWithValue("@janji_yg", diberi);
                cmd.Parameters.AddWithValue("@janji_nama_tokoh", jnama);
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

        public int insert_insiden(int kod_kawasan, int parti, DateTime tarikh, string binsiden)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_insert_insiden";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@insiden_kod_kawasan", kod_kawasan);
                cmd.Parameters.AddWithValue("@insiden_parti", parti);
                cmd.Parameters.AddWithValue("@insiden_tarik", tarikh);
                cmd.Parameters.AddWithValue("@insiden_butiran_insiden", binsiden);
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

        public DataTable fill_status()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_fetch_analysis_color";
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
        public int insert_statuskawasan(int kod_kawasan, string status_kawasan, DateTime tarikh, string kaveat)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_insert_analysis";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@analysis_kod_kawasan", kod_kawasan);
                cmd.Parameters.AddWithValue("@analysis_status", status_kawasan);
                cmd.Parameters.AddWithValue("@analysis_tarik", tarikh);
                cmd.Parameters.AddWithValue("@analysis_justifikasi", kaveat);
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

        public DataTable parlimen(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetMainDashboardAnalysisAreaStatus_parlimen";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@areaType", 1);
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
        public DataTable dun(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetMainDashboardAnalysisAreaStatus_parlimen";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@areaType", 2);
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

        public DataTable situasi(int areaid,int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetMainDashboardAnalysisAreaStatus_chart";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@areaType", @areaid);
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

        public DataTable jumlah_insiden(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetConMainDashboardTotalIncidentsStates";
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

        public DataTable isu_utama(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetMainDashboardMainIssuesState";
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

        public DataTable parlimen_WC(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_getparlimen_WC";
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

        public DataTable dun_WC(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_getdun_WC";
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

        public DataTable fill_candidates(int areaid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_GetConDetDashboardWinnableCandidate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_id", areaid);
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
        public DataTable fill_candidates_dun(int areaid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_GetConDetDashboardWinnableCandidate_dun";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_id", areaid);
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

        public DataTable GetCandidateList_All(int state_id,int name, int jenis, int sumber, int tahap)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCandidateAreaElectionDetails_All";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", state_id);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@jenis", jenis);
                cmd.Parameters.AddWithValue("@sumber", sumber);
                cmd.Parameters.AddWithValue("@tahap", tahap);
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
