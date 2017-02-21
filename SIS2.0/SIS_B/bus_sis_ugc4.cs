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
        
    }
}
