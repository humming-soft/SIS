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
        //coded by ANCY MATHEW
        data_sis_ugc3 data = new data_sis_ugc3();
        public string log_name { get; set; }
        public string name { get; set; }
        public string icnumber { get; set; }
        public int role { get; set; }
        public int state { get; set; }
        public string position { get; set; }
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
            return data.insert_user(log_name, name, icnumber, role, state, position);
        }
    }
}
