using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SIS_D;
namespace SIS_B
{
    //Assigned User - Sebin
    public class bus_sis_ugc4
    {
        data_sis_ugc4 data = new data_sis_ugc4();
        data_sis_ugc1 data_alt = new data_sis_ugc1();
        public int sid { get; set; }

        public int areaType { get; set; }

        public int rid { get; set; }

        public int area_id { get; set; }

        public int activity_id { get; set; }

        public int party_id { get; set; }

        public int current_issue_id { get; set; }

        public int lookup_id { get; set; }
        public String comment { get; set; }

        public List<int> areaTypes { get; set; }

        public string status { get; set; }

        public string candidateIc { get; set; }

        public int candidate_id { get; set; }

        public int election_id { get; set; }

        public int choice_id { get; set; }

        public int is_incumbent { get; set; }

        public int agency_id { get; set; }

        public string justification { get; set; }

        public DateTime source_date { get; set; }

        public string name { get; set; }

        public string job { get; set; }

        public string political_post { get; set; }

        public string education { get; set; }

        public byte[] archive { get; set; }

        public string fileName { get; set; }

        public string uniqueFilename { get; set; }

        public int archive_id { get; set; }
        //Release-2

        public DataTable fill_lamporan()
        {
            return data.data_lamboran("sp_fetch_daily_report", "i", sid);
        }
        public DataTable fill_issues()
        {
            return data.data_lamboran("sp_fetch_issues", "i",sid);
        }
        public DataTable fill_promises()
        {
            return data.data_lamboran("sp_fetch_promises", "i", sid);
        }
        public DataTable fill_incident()
        {
            return data.data_lamboran("sp_fetch_incident", "i", sid);
        }
        public DataTable fill_area_status()
        {
            return data.data_lamboran("sp_fetch_areastatus", "i", sid);
        }
        public DataTable fill_status_districts()
        {
            return data.dataStatusDistricts("sp_fetch_dist_status_summary","i",sid,areaType);
        }

        public DataTable currentElectionInfo()
        {
            return data.data_currentElectionInfo();
        }

        //Release-4

        public DataTable fill_area_analysis()
        {
            return data.data_lamboran("sp_fetch_area_analysis", "i", sid);
        }

        public DataTable get_area_analysis()
        {
            return data.data_area_analysis("sp_fetch_indivi_area_report", rid);
        }

        public int update_area_analysis()
        {
            return data.update_justifiaction("sp_update_area_justification", comment, rid);
        }

        public int delete_area_analysis()
        {
            return data.delete_justifiaction("sp_DeleteStateAnalysisRecord", rid);
        }

        //Release-5
        public DataSet fill_turnout()
        {
            return data.data_turnout("sp_GetVoterTurnout", sid);
        }
        //Bug Fixing - Additional
        public DataTable fill_area_list()
        {
            return data.data_areaList("usp_GetAreaList", sid);
        }

        public DataTable fill_activity_type()
        {

            DataTable dt = new DataTable();
            foreach (int areaTypeid in areaTypes)
            {
                dt.Merge(data.data_activityType("usp_GetElectionActivityType", areaTypeid));
            }
            return dt;
        }

        public DataTable fill_party_list()
        {
            return data.data_partyList("usp_GetParties");
        }

        public DataTable fill_filtered_list()
        {
            return data.data_filterActivity("sp_FilterActivityReport", sid, area_id, activity_id, party_id);
        }

        public DataTable fill_filtered_lssue()
        {
            return data.data_filterIssue("sp_FilterIssueReport", sid, area_id, current_issue_id, lookup_id, party_id);
        }

        public DataTable fill_issue_list()
        {
            return data.data_partyList("usp_GetIsu");
        }

        public DataTable fill_info_source()
        {
            return data_alt.fill_sumber();
        }


        public DataTable fill_filtered_promises()
        {
            return data.fill_filtered_promises("sp_FilterPromisesReport", sid, area_id);
        }

        public DataTable fill_filtered_incident()
        {
            return data.fill_filtered_incident("sp_FilterIncidentReport", sid, area_id, party_id);
        }

        public DataTable fill_status()
        {
            return data_alt.fill_status();
        }

        public DataTable fill_filtered_status()
        {
            return data.fill_filtered_status("sp_FilterAreaStatusReport", sid, area_id, status);
        }
        public DataSet fill_candidate_dun()
        {
            return data.data_candidate_dun("sp_GetConDetDashboardWinnableCandidate_dun", area_id);
        }

        //Dev-II

        public DataTable fill_Candidates()
        {
            return data.data_partyList("sp_GetAllCandidate");
        }

        public DataTable fill_Candidate_info()
        {
            return data.data_CandiateInfo("sp_GetCandidateProfileByCandidateIc", candidateIc);
        }

        public DataTable fill_Agencies()
        {
            return data.data_partyList("usp_GetAllAgencies");
        }

        public int insert_WinnableArea()
        {
            return data.data_InsertWinnableArea(candidate_id,area_id,election_id,choice_id,is_incumbent);
        }
        public int insert_WinnableAreaSource()
        {
            return data.data_InsertWinnableAreaSource(area_id,agency_id,justification,source_date);
        }

        public int insert_WinnableCandidate()
        {
            return data.data_InsertWinnableCandidate(candidate_id, name, job, education, political_post, comment);
        }

        public int insert_WinnableArchive()
        {
            return data.data_InsertWinnableAreaArchive(candidate_id, comment, fileName, uniqueFilename);
        }

        public int update_WinnableArchiveFile()
        {
            return data.data_UpdateWinnableArchiveFile(archive_id, archive);
        }

        public int check_WinnableCandidateExists()
        {
            return data.data_WinnableCandiateExists(choice_id,area_id,election_id);
        }
        public DataTable fill_candidate_comment()
        {
            return data.candidate_comment("usp_GetWinnableCandidateComment", candidate_id);
        }
        public DataTable fill_candidate_area()
        {
            return data.candidate_area("usp_GetWinnableCandidate_Area", candidate_id);
        }
        public DataTable fill_candidate_area_archive()
        {
            return data.candidate_area_archive("usp_GetWinnableCandidateAreaArchive_state", candidate_id);
        }
        public DataTable fill_winnable_area_sourse()
        {
            return data.winnable_area_source("usp_GetWinnableCandidate_Area_Source", candidate_id);
        }
    }
}
