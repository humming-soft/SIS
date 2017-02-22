using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIS_D
{
    [Serializable]
    public class SisUser
    {

        public int tokenId { get; set; }
        public String userName { get; set; }
        public String refToken { get; set; }
        public DateTime timeStamp { get; set; }

        public SisUser()
        {
        }
        public SisUser(int tokenId, string userName, string token, DateTime timeStamp)
        {
            // TODO: Complete member initialization
            this.tokenId = tokenId;
            this.userName = userName;
            this.refToken = token;
            this.timeStamp = timeStamp;
        }
    }
}
