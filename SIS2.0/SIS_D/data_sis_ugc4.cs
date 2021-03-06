﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace SIS_D
{
    //Assigned User - Sebin
    public class data_sis_ugc4
    {
        SqlCommand cmd = new SqlCommand();
        db_connect db = new db_connect();

        public DataTable data_lamboran(String sp, String nature, int sid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nature", nature);
                cmd.Parameters.AddWithValue("@sid", sid);
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
        public DataTable dataStatusDistricts(String sp, String nature, int sid, int areaType)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nature", nature);
                cmd.Parameters.AddWithValue("@sid", sid);
                cmd.Parameters.AddWithValue("@area_type", areaType);
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

        public DataTable data_get_token(String userName)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_get_user_token";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user", userName);
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

        public int data_set_token(SisUser user)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_set_user_token";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user", user.userName);
                cmd.Parameters.AddWithValue("@token", user.refToken);
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

        public DataTable data_currentElectionInfo()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetCurrentElection";
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


        public DataTable data_area_analysis(string sp, int rid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@rid", rid);
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

        public int update_justifiaction(String sp, String comment, int rid){
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@comment", comment);
                cmd.Parameters.AddWithValue("@rid", rid);
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

        public int delete_justifiaction(String sp, int rid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@rid", rid);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataSet data_turnout(string sp, int sid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", sid);
                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(ds);
                ds.Relations.Add(new DataRelation("SubDistRelation", ds.Tables[0].Columns["dist_id"], ds.Tables[1].Columns["parent_area_id"]));
                ds.Relations.Add(new DataRelation("VotersRelation", ds.Tables[1].Columns["subdist_id"], ds.Tables[2].Columns["area_id"]));
                return ds;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable data_areaList(string sp, int sid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", sid);
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

        public DataTable data_activityType(String sp, int typeId)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@activity_type", typeId);
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

        public DataTable data_partyList(String sp)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
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
        public DataTable data_filterActivity(String sp, int state_id, int area_id, int activity_id, int party_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", state_id);
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@activity_id", activity_id);
                cmd.Parameters.AddWithValue("@party_id", party_id);
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

        public DataTable data_filterIssue(String sp, int state_id, int area_id, int current_issue_id, int lookup_id, int party_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", state_id);
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@cissue_id", current_issue_id);
                cmd.Parameters.AddWithValue("@lookup_id", lookup_id);
                cmd.Parameters.AddWithValue("@party_id", party_id);
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


        public DataTable fill_filtered_promises(string sp, int sid, int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", sid);
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

        public DataTable fill_filtered_incident(string sp, int sid, int area_id, int party_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", sid);
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@party_id", party_id);
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

        public DataTable fill_filtered_status(string sp, int sid, int area_id, string status)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state_id", sid);
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@status_name", status);
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

        public DataSet data_candidate_dun(string sp, int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_id", area_id);
                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(ds);
                ds.Relations.Add(new DataRelation("AreaRelation", ds.Tables[0].Columns["area_id"], ds.Tables[1].Columns["area_id"]));
                return ds;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable data_CandiateInfo(string sp, string candidateIc)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidateIc", candidateIc);
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

        public int data_InsertWinnableCandidate(int candidate_id, string name, string job, string education, string political_post, string comments)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_InsertWinnableCandidate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", candidate_id);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@job", job);
                cmd.Parameters.AddWithValue("@education", education);
                cmd.Parameters.AddWithValue("@political_post", political_post);
                cmd.Parameters.AddWithValue("@comments", comments);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_InsertWinnableArea(int candidate_id, int area_id, int election_id, int choice_id, int is_incumbent)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_InsertWinnableCandidateArea";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", candidate_id);
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@election_id", election_id);
                cmd.Parameters.AddWithValue("@choice_no", choice_id);
                cmd.Parameters.AddWithValue("@is_incumbent", is_incumbent);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_InsertWinnableAreaSource(int area_id, int agency_id, string Justification, DateTime source_date)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_InsertWinnableCandidateAreaSource";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_area_id", area_id);
                cmd.Parameters.AddWithValue("@agency_id", agency_id);
                cmd.Parameters.AddWithValue("@justification", Justification);
                cmd.Parameters.AddWithValue("@source_date", source_date);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_InsertWinnableAreaArchive(int candiate_id, string infoComment, string fileName, string uniqueFileName)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_InsertWinnableCandidateAreaArchive";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", candiate_id);
                cmd.Parameters.AddWithValue("@win_candidate_archive_info", infoComment);
                cmd.Parameters.AddWithValue("@unique_filename", uniqueFileName);
                cmd.Parameters.AddWithValue("@original_filename", fileName);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_UpdateWinnableArchiveFile(int archive_id, byte[] file)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_UpdateWinnableCandidateAreaArchiveBinary";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@win_candidate_archive_id", archive_id);
                cmd.Parameters.AddWithValue("@win_candidate_archive", file);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_WinnableCandiateExists(int choice_id, int area_id, int election_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetWinnableCandidateChoiceExisted";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@electionId", election_id);
                cmd.Parameters.AddWithValue("@areaId", area_id);
                cmd.Parameters.AddWithValue("@choiceId", choice_id);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_WinnableCandiateExists(int candidate_id, int choice_id, int area_id, int election_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_GetWinnableCandidateChoiceExistedExSelf";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidateId", candidate_id);
                cmd.Parameters.AddWithValue("@electionId", election_id);
                cmd.Parameters.AddWithValue("@areaId", area_id);
                cmd.Parameters.AddWithValue("@choiceId", choice_id);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        
        public DataTable candidate_comment(string sp, int cid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", cid);
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
        public DataTable candidate_area(string sp, int cid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", cid);
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
        public DataTable candidate_area_archive(string sp, int cid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", cid);
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
        public DataTable winnable_area_source(string sp, int cid)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_area_id", cid);
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

        public int data_UpdateWinnableArea(int candidate_area_id, int candidate_id, int area_id, int election_id, int choice_no, int is_incumbent)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_UpdateWinnableCandidateArea";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_area_id", candidate_area_id);
                cmd.Parameters.AddWithValue("@candidate_id", candidate_id);
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@election_id", election_id);
                cmd.Parameters.AddWithValue("@choice_no", choice_no);
                cmd.Parameters.AddWithValue("@is_incumbent", is_incumbent);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_DeleteWinnableArea(int candidate_area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_DeleteWinnableCandidateArea";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_place_id", candidate_area_id);
                 cmd.Parameters.AddWithValue("@candidate_id", 0);
                 cmd.Parameters.AddWithValue("@area_id", 0);
                 cmd.Parameters.AddWithValue("@election_id", 0);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_DeleteWinnableCandidateSourceAll(int candidate_area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_DeleteWinnableCandidateAreaSourceAll";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_area_id", candidate_area_id);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_UpdateWinnableCandidateComment(int candidate_id, string comment)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_UpdateWinnableCandidateComment";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_id", candidate_id);
                cmd.Parameters.AddWithValue("@comments", comment);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public DataTable data_GetWinnableCandidateArchiveById(string sp, int archiveId)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_archive_id", archiveId);
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

        public int data_UpdateWinnableCandidateSource(int candidate_area_source_id, int candidate_area_id, int agency_id, string justification, DateTime source_date)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_UpdateWinnableCandidateAreaSource";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_area_source_id", candidate_area_source_id);
                cmd.Parameters.AddWithValue("@candidate_area_id", candidate_area_id);
                cmd.Parameters.AddWithValue("@agency_id", agency_id);
                cmd.Parameters.AddWithValue("@justification", justification);
                cmd.Parameters.AddWithValue("@source_date", source_date);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_DeleteWinnableCandidateAreaSource(int candidate_area_source_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_DeleteWinnableCandidateAreaSource";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@candidate_area_source_id", candidate_area_source_id);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_UpdateWinnableCandidateArchive(int archive_id, string archive_info, string unique_filename, string original_filename)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_UpdateWinnableCandidateArchive";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@win_candidate_archive_id", archive_id);
                cmd.Parameters.AddWithValue("@win_candidate_archive_info", archive_info);
                cmd.Parameters.AddWithValue("@unique_filename", unique_filename);
                cmd.Parameters.AddWithValue("@original_filename", original_filename);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int data_DeleteWinnableCandidateAreaArchive(int archive_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "usp_DeleteWinnableCandidateAreaArchive";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@win_candidate_archive_id", archive_id);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@OutputID";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@OutputID"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
    }
}
