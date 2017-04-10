using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIS_B
{
    public class ElectionCandidate
    {
        public int election_result_id { get; set; }
        public int candidate_id { get; set; }
        public string candidate_name { get; set; }
        public int party_id { get; set; }
        public string party_shortcode { get; set; }
        public string party_name_bm { get; set; }
        public int coalition_id { get; set; }
        public int no_of_vote { get; set; }
    }
}
