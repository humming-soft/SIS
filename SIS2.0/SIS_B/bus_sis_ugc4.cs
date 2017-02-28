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
        public int sid { get; set; }

        public int areaType { get; set; }

        public int rid { get; set; }

        public String comment { get; set; }

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
        
    }
}
