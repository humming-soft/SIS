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
        public int insert_user(string log_name, string name, string log_pwd, string icnumber, int role, int state, string position)
        {
            try
            {
                //cmd.Connection = db.disconnect();
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_insert_user";
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Connection = db.connect();
                cmd.Parameters.AddWithValue("@log_name", log_name);
                cmd.Parameters.AddWithValue("@log_pwd", log_pwd);
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
        public DataTable fill_masalah_dalaman_parti(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetConMainDashboardMainIssues_state";
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
        public DataTable fill_comment(int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetConDetDashboardAreaDetail_area";
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
        public DataTable fill_Negeri(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetState";
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
        public DataTable fill_parlimen(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetAreaList";
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
        public DataTable fill_Election()
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
        public DataTable fill_Party()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetAllParties";
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
        public DataTable fill_InfoType(int type_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetElectionActivityType";
                cmd.Parameters.AddWithValue("@activity_type", type_id);
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
        public DataTable fill_Drop_Sumber(int type_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetLookup";
                cmd.Parameters.AddWithValue("@lookupType", type_id);
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
        public DataTable fill_validInfo()
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
        public DataTable DistrictInfo(int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetPollingDistrict";
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
        public DataTable fill_category()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetAllCurrentIssue";
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
        public DataTable fill_agency()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetAllAgencies";
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
        public DataTable fill_pertubuhan()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_fetch_NGO";
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
        public int areaInfoElectionParty(int election_id, int area_id, int party_id, int activity_id, DateTime ele_date, string detail, int current_issue_id, int polling_District_id, int info_source,
            int info_valdity, int action_status, int source_election_status, int issue_source, int info_source_agency_id,
            int info_source_ngo_id, int source_election_status_agency_id, int source_election_status_ngo_id)
        {
            try
            {
                //cmd.Connection = db.disconnect();
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_InsertElectionParty_state";
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Connection = db.connect();
                cmd.Parameters.AddWithValue("@election_id", election_id);
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@party_id", party_id);
                cmd.Parameters.AddWithValue("@activity_id", activity_id);
                cmd.Parameters.AddWithValue("@date", ele_date);
                cmd.Parameters.AddWithValue("@details", detail);
                cmd.Parameters.AddWithValue("@current_issue_id", current_issue_id);
                cmd.Parameters.AddWithValue("@polling_district_id", polling_District_id);
                cmd.Parameters.AddWithValue("@info_source", info_source);
                cmd.Parameters.AddWithValue("@info_validity", info_valdity);
                cmd.Parameters.AddWithValue("@action_status", action_status);
                cmd.Parameters.AddWithValue("@source_election_status", source_election_status);
                cmd.Parameters.AddWithValue("@issue_source", issue_source);
                cmd.Parameters.AddWithValue("@info_source_agency_id", info_source_agency_id);
                cmd.Parameters.AddWithValue("@info_source_ngo_id", info_source_ngo_id);
                cmd.Parameters.AddWithValue("@source_election_status_agency_id", source_election_status_agency_id);
                cmd.Parameters.AddWithValue("@source_election_status_ngo_id", source_election_status_ngo_id);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputId";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputId"].Value.ToString());
                //cmd.Dispose();
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        public DataTable fill_gridElectionParty_viewAll(int state_id, int election_id, int area_id, int party_id, int activity_id, int current_issue_id, int polling_District_id, int info_source,
          int info_valdity, int action_status, int source_election_status, int issue_source, int info_source_agency_id,
          int info_source_ngo_id, int source_election_status_agency_id, int source_election_status_ngo_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_fetch_areaInfoElectionParty_viewAll";
                cmd.Parameters.AddWithValue("@state_id", state_id);
                cmd.Parameters.AddWithValue("@election_id", election_id);
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@party_id", party_id);
                cmd.Parameters.AddWithValue("@activity_id", activity_id);
                cmd.Parameters.AddWithValue("@current_issue_id", current_issue_id);
                cmd.Parameters.AddWithValue("@polling_district_id", polling_District_id);
                cmd.Parameters.AddWithValue("@info_source", info_source);
                cmd.Parameters.AddWithValue("@info_validity", info_valdity);
                cmd.Parameters.AddWithValue("@action_status", action_status);
                cmd.Parameters.AddWithValue("@source_election_status", source_election_status);
                cmd.Parameters.AddWithValue("@issue_source", issue_source);
                cmd.Parameters.AddWithValue("@info_source_agency_id", info_source_agency_id);
                cmd.Parameters.AddWithValue("@info_source_ngo_id", info_source_ngo_id);
                cmd.Parameters.AddWithValue("@source_election_status_agency_id", source_election_status_agency_id);
                cmd.Parameters.AddWithValue("@source_election_status_ngo_id", source_election_status_ngo_id);
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
        public DataTable fill_gridElectionParty(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_fetch_areaInfoElectionParty";
                cmd.Parameters.AddWithValue("@state_id", state_id);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
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
                cmd.CommandText = "usp_GetKawasan";
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
        public DataTable fill_parlimen_dun(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetParlimenDun";
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
        public DataTable fill_area_analysis_ViewAll(int state_id,int type,int parlimen,int dun)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_fetch_area_analysis_viewAll";
                cmd.Parameters.AddWithValue("@sid", state_id);
                cmd.Parameters.AddWithValue("@area_type", type);
                cmd.Parameters.AddWithValue("@parlimen_id", parlimen);
                cmd.Parameters.AddWithValue("@dun_id", dun);
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
        public DataSet fill_calon_candidates(int state_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_GetConDetDashboardWinnableCandidate_calon";
                cmd.Parameters.AddWithValue("@state_id", state_id);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(ds);
                ds.Relations.Add(new DataRelation("parlimenRelation", ds.Tables[0].Columns["area_id"], ds.Tables[1].Columns["area_id"]));
                ds.Relations.Add(new DataRelation("parlimenDunRelation", ds.Tables[1].Columns["area_id"], ds.Tables[2].Columns["parent_area_id"]));
                ds.Relations.Add(new DataRelation("parlimenDunRelation", ds.Tables[2].Columns["area_id"], ds.Tables[3].Columns["area_id"]));
                return ds;
            }
            finally
            {
                db.disconnect();
            }
        }
        
    }
}
