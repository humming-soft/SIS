using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIS_B
{
    public class Parliment
    {
            public string Color_Value { get; set; }
            public int Color_code { get; set; }
            public int par_id { get; set; }
            public int p_area_type { get; set; }
            public string par_code { get; set; }
            public string par_name { get; set; }
            public int p_parent_id { get; set; }
            public int dun_id { get; set; }
            public int d_area_type { get; set; }
            public string dun_code { get; set; }
            public string dun_name { get; set; }
            public int d_parent_id { get; set; }
            public List<string> dun { get; set; }
    }
}
