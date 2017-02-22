using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace SIS_D
{
    public class SisUserService
    {
        private static int tokenId;
        private static String username;
        private static String token;
        private static DateTime timeStamp;
        public static SisUser getUser(String userName)
        {
            data_sis_ugc4 data = new data_sis_ugc4();
            DataTable tokenInfo = new DataTable();
            tokenInfo = data.data_get_token(userName);
            foreach (DataRow row in tokenInfo.Rows)
            {
                tokenId = Convert.ToInt32(row["tokenid"].ToString());
                username = row["username"].ToString();
                token = row["token"].ToString();
                timeStamp = Convert.ToDateTime(row["timestamp"]);
            }
            return new SisUser(tokenId, userName, token, timeStamp);
        }
        public static void updateUser(SisUser user)
        {
            data_sis_ugc4 data = new data_sis_ugc4();
            int status = data.data_set_token(user);
        }
    }
}
