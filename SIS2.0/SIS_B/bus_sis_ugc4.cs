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


        public DataTable fill_issues()
        {
            return data.data_lamboran("sp_fetch_issues");
        }
        public DataTable fill_promises()
        {
            return data.data_lamboran("sp_fetch_promises");
        }
        public DataTable fill_incident()
        {
            return data.data_lamboran("sp_fetch_incident");
        }
        public DataTable fill_area_status()
        {
            return data.data_lamboran("sp_fetch_areastatus");
        }
        
    }
}
