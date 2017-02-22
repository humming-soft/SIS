using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace SIS_D
{
    //Assigned User - Ancy
    public class data_sis_ugc3
    {
        SqlCommand cmd = new SqlCommand();
        db_connect db = new db_connect();
        public DataTable fetch_state()
        {
            try
            {
                //cmd.Connection = db.disconnect();
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_fetch_state";
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Connection = db.connect();
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                //db.disconnect();
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable fetch_role()
        {
            try
            {
                //cmd.Connection = db.disconnect();
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_fetch_role";
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Connection = db.connect();
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                //db.disconnect();
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable fill_user()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_fetch_user";
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
        public int insert_user(string log_name,string name,string icnumber, int role, int state,string position)
        {
            try
            {
                //cmd.Connection = db.disconnect();
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_insert_user";
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Connection = db.connect();
                cmd.Parameters.AddWithValue("@log_name", log_name);
                cmd.Parameters.AddWithValue("@icnumber", icnumber);
                cmd.Parameters.AddWithValue("@fullname", name);
                cmd.Parameters.AddWithValue("@position", position);
                cmd.Parameters.AddWithValue("@regdate", DateTime.Today);
                cmd.Parameters.AddWithValue("@role_id", role);
                cmd.Parameters.AddWithValue("@state_id", state);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                //cmd.Dispose();
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        public int update_user(string log_name, string name, string icnumber, int role, int state, string position)
        {
            try
            {
                //cmd.Connection = db.disconnect();
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_update_user";
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Connection = db.connect();
                cmd.Parameters.AddWithValue("@log_name", log_name);
                cmd.Parameters.AddWithValue("@icnumber", icnumber);
                cmd.Parameters.AddWithValue("@fullname", name);
                cmd.Parameters.AddWithValue("@position", position);
                cmd.Parameters.AddWithValue("@role_id", role);
                cmd.Parameters.AddWithValue("@state_id", state);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                //cmd.Dispose();
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        public int update_pass(string pass, string log_name)
        {
            try
            {
                //cmd.Connection = db.disconnect();
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_update_pass";
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Connection = db.connect();
                cmd.Parameters.AddWithValue("@log_name", log_name);
                cmd.Parameters.AddWithValue("@log_pwd", pass);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                //cmd.Dispose();
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable fill_senarai_kawasan(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "GetConDashboardAreaList_state";
                cmd.Parameters.AddWithValue("@state_id",state_id);
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
        public DataTable fill_senarai_kawasan_pem(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "GetConDashboardAreaListPembangkang_state";
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
        public DataTable fill_maklumat_kawasan(int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetConDetDashboardAreaDetail";
                cmd.Parameters.AddWithValue("@areaId", area_id);
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
        public DataTable fill_calon(int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetConDetDashboardElectionCandidate";
                cmd.Parameters.AddWithValue("@area_id", area_id);
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
        public DataTable fill_keluar_mengundi(int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetConDetDashboardPercentageTurnOutVote";
                cmd.Parameters.AddWithValue("@areaId", area_id);
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
        public DataTable fill_semasa(int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetConDetDashboardElectionParty_area";
                cmd.Parameters.AddWithValue("@area_id", area_id);
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
