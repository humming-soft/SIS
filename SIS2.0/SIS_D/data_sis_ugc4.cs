using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace SIS_D
{
    //Assigned User - Sebin
    public class data_sis_ugc4
    {
        SqlCommand cmd = new SqlCommand();
        db_connect db = new db_connect();

        public DataTable data_lamboran(String sp)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = sp;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                cmd.Connection = db.connect();
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            finally
            {
                db.disconnect();
            }
        }
    }
}
