using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIS_D;
using System.Data;

namespace SIS_B
{
    //Assigned User - Ancy
    public class bus_sis_ugc3
    {
        data_sis_ugc3 data = new data_sis_ugc3();
        public string log_name { get; set; }
        public string name { get; set; }
        public string icnumber { get; set; }
        public int role { get; set; }
        public int state { get; set; }
        public string position { get; set; }
        public string pass { get; set; }
        public int state_id { get; set; }
        public int area_id { get; set; }
        public int polling_District_id { get; set; }
        public int election_id { get; set; }
        public int party_id { get; set; }
        public int activity_id { get; set; }
        public int info_source { get; set; }
        public int info_valdity { get; set; }
        public string detail { get; set; }
        public int current_issue_id { get; set; }
        public int issue_source { get; set; }
        public int action_status { get; set; }
        public int source_election_status { get; set; }
        public int info_source_agency_id { get; set; }
        public int info_source_ngo_id { get; set; }
        public int source_election_status_agency_id { get; set; }
        public int source_election_status_ngo_id { get; set; }
        public int parlimen_id { get; set; }
        public int dun_id { get; set; }
        public int area_type { get; set; }
        public DateTime ele_date { get; set; }
        public DataTable fetch_states()
        {
            return data.fetch_state();
        }
        public DataTable fill_user()
        {
            return data.fill_user();
        }
        public DataTable fetch_role()
        {
            return data.fetch_role();
        }
        public int insert_user()
        {
            return data.insert_user(log_name, name,pass, icnumber, role, state, position);
        }
        public int update_user()
        {
            return data.update_user(log_name, name, icnumber, role, state, position);
        }
        public int update_password()
        {
            return data.update_pass(pass, log_name);
        }
        //sis user story 004_004A
        public DataTable fill_senarai_kawasan()
        {
            return data.fill_senarai_kawasan(state_id);
        }
        public DataTable fill_senarai_kawasan_pem()
        {
            return data.fill_senarai_kawasan_pem(state_id);
        }
        public DataTable fill_maklumat_kawasan()
        {
            return data.fill_maklumat_kawasan(area_id);
        }
        public DataTable fill_calon()
        {
            return data.fill_calon(area_id);
        }
        public DataTable fill_keluar_mengundi()
        {
            return data.fill_keluar_mengundi(area_id);
        }
        public DataTable fill_semasa()
        {
            return data.fill_semasa(area_id);
        }
        public DataTable fill_masalah_dalaman_parti()
        {
            return data.fill_masalah_dalaman_parti(state_id);
        }
        public DataTable fill_comment()
        {
            return data.fill_comment(area_id);
        }
        public DataTable fill_Negeri()
        {
            return data.fill_Negeri(state_id);
        }
        public DataTable fill_parlimen()
        {
            return data.fill_parlimen(state_id);
        }
        public DataTable fill_Election()
        {
            return data.fill_Election();
        }
        public DataTable fill_Party()
        {
            return data.fill_Party();
        }
        public DataTable fill_InfoType()
        {
            return data.fill_InfoType(1);
        }
        public DataTable fill_Drop_Sumber()
        {
            return data.fill_Drop_Sumber(5);
        }
        public DataTable fill_validInfo()
        {
            return data.fill_validInfo();
        }
        public DataTable DistrictInfo()
        {
            return data.DistrictInfo(area_id);
        }
        public DataTable fill_category()
        {
            return data.fill_category();
        }
        public DataTable fill_drop_sumber_isu()
        {
            return data.fill_Drop_Sumber(8);
        }
        public DataTable fill_drop_status()
        {
            return data.fill_Drop_Sumber(6);
        }
        public DataTable fill_drop_statusjanji()
        {
            return data.fill_Drop_Sumber(9);
        }
        public DataTable fill_agency()
        {
            return data.fill_agency();
        }
        public DataTable fill_pertubuhan()
        {
            return data.fill_pertubuhan();
        }
        public int areaInfoElectionParty()
        {
            return data.areaInfoElectionParty(election_id, area_id, party_id, activity_id, ele_date, detail, current_issue_id, polling_District_id, info_source, info_valdity, action_status, source_election_status, issue_source, info_source_agency_id,info_source_ngo_id,source_election_status_agency_id,source_election_status_ngo_id);
        }
        public DataTable fill_gridElectionParty()
        {
            return data.fill_gridElectionParty(state_id);
        }
        public DataTable fill_gridElectionParty_viewAll()
        {
            return data.fill_gridElectionParty_viewAll(state_id,election_id, area_id, party_id, activity_id,current_issue_id, polling_District_id, info_source, info_valdity, action_status, source_election_status, issue_source, info_source_agency_id, info_source_ngo_id, source_election_status_agency_id, source_election_status_ngo_id);
        }
        public DataTable fill_kawasan()
        {
            return data.fill_kawasan();
        }
        public DataTable fill_parlimen_dun()
        {
            return data.fill_parlimen_dun(state_id);
        }
        public DataTable fill_area_analysis_ViewAll()
        {
            return data.fill_area_analysis_ViewAll(state_id,area_type,parlimen_id,dun_id);
        }
    }
}
               