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
            return data.insert_user(log_name, name, icnumber, role, state, position);
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
    }
}
