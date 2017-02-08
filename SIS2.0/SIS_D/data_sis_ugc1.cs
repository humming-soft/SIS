using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace SIS_D
{
    
    public class data_sis_ugc1
    {
        SqlCommand cmd = new SqlCommand();
        db_connect db = new db_connect();

        public DataTable fillgrid()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_users";
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

        public DataTable fill_DataTable()
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_DataTables";
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
