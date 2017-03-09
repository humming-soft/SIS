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
        //Bug Fixing
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
    }
}
