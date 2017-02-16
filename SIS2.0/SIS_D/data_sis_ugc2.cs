using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace SIS_D
{
    //Assigned User - Jane
    public class data_sis_ugc2
    {
        SqlCommand cmd = new SqlCommand();
        db_connect db = new db_connect();

        public int InsertAktivitiDetails(string kod_kawasan, string butiran_aktiviti, string tarikh, string nama_kawasan, string parti, string masa, string jenis_aktiviti)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_activity";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@kod_kawasan", kod_kawasan);
                cmd.Parameters.AddWithValue("@butiran_aktiviti", butiran_aktiviti);
                cmd.Parameters.AddWithValue("@tarikh", tarikh);
                cmd.Parameters.AddWithValue("@nama_kawasan", nama_kawasan);
                cmd.Parameters.AddWithValue("@parti", parti);
                cmd.Parameters.AddWithValue("@masa", masa);
                cmd.Parameters.AddWithValue("@jenis_aktiviti", jenis_aktiviti);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }

        public int InsertISUDetails(string isu_kod_kawasan, string isu_butiran_aktiviti, string isu_tarikh, string isu_nama_kawasan, string isu_sumber, string isu_masa, string isu_parti, string isu_kategori)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_isu_activity";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@kod_kawasan", isu_kod_kawasan);
                cmd.Parameters.AddWithValue("@butiran_aktiviti", isu_butiran_aktiviti);
                cmd.Parameters.AddWithValue("@tarikh", isu_tarikh);
                cmd.Parameters.AddWithValue("@nama_kawasan", isu_nama_kawasan);
                cmd.Parameters.AddWithValue("@parti", isu_sumber);
                cmd.Parameters.AddWithValue("@masa", isu_masa);
                cmd.Parameters.AddWithValue("@jenis_aktiviti", isu_parti);
                cmd.Parameters.AddWithValue("@masa", isu_kategori);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
        public int InsertJanjiDetails(string janji_kod_kawasan, string janji_nama_kawasan, string janji_yg, string janji_nama_tokoh, string janji_tarik, string janji_masa)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_janji_activity";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@kod_kawasan", janji_kod_kawasan);
                cmd.Parameters.AddWithValue("@butiran_aktiviti", janji_nama_kawasan);
                cmd.Parameters.AddWithValue("@tarikh", janji_yg);
                cmd.Parameters.AddWithValue("@nama_kawasan", janji_nama_tokoh);
                cmd.Parameters.AddWithValue("@parti", janji_tarik);
                cmd.Parameters.AddWithValue("@masa", janji_masa);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                return res;
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
                cmd.CommandText = "sp_GetAreaInfo";
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

        public DataTable GetPInfoDetails(int area_id)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_GetAreaDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_id", area_id);
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

        public int UpdatePInfoDetails(int area_id, string p_kod_kawasan, string p_nama_kawasan, int bil, string kawasan_tumpuan, string kawasan_tumpuan_penbangkang, string kawasan_operasi, string keluasan_kawasan, string sempadan_kawasan, string kegiatan_ekonomi, string pecahan_kaum, int populasi_penduduk, int purata_umur, string purata_jantina, string kemudahan_awam, string taburan_penduduk, string komposisi_etnik, string kedar_pertumbuhan_penduduk)
        {
            try
            {
                cmd.Parameters.Clear();
                cmd.CommandText = "sp_UpdateAreaDetails";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@area_id", area_id);
                cmd.Parameters.AddWithValue("@kod_kawasan", p_kod_kawasan);
                cmd.Parameters.AddWithValue("@nama_kawasan", p_nama_kawasan);
                cmd.Parameters.AddWithValue("@bil", bil);
                cmd.Parameters.AddWithValue("@kawasan_tumpuan", kawasan_tumpuan);
                cmd.Parameters.AddWithValue("@kawasan_tumpuan_penbangkang", kawasan_tumpuan_penbangkang);
                cmd.Parameters.AddWithValue("@kawasan_operasi", kawasan_operasi);
                cmd.Parameters.AddWithValue("@keluasan_kawasan", keluasan_kawasan);
                cmd.Parameters.AddWithValue("@sempadan_kawasan", sempadan_kawasan);
                cmd.Parameters.AddWithValue("@kegiatan_ekonomi", kegiatan_ekonomi);
                cmd.Parameters.AddWithValue("@pecahan_kaum", pecahan_kaum);
                cmd.Parameters.AddWithValue("@populasi_penduduk", populasi_penduduk);
                cmd.Parameters.AddWithValue("@purata_umur", purata_umur);
                cmd.Parameters.AddWithValue("@purata_jantina", purata_jantina);
                cmd.Parameters.AddWithValue("@kemudahan_awam", kemudahan_awam);
                cmd.Parameters.AddWithValue("@taburan_penduduk", taburan_penduduk);
                cmd.Parameters.AddWithValue("@komposisi_etnik", komposisi_etnik);
                cmd.Parameters.AddWithValue("@kedar_pertumbuhan_penduduk", kedar_pertumbuhan_penduduk);
                SqlParameter outparam = new SqlParameter();
                outparam.ParameterName = "@flag";
                outparam.Direction = ParameterDirection.InputOutput;
                outparam.DbType = DbType.Int32;
                outparam.Value = 0;
                cmd.Parameters.Add(outparam);
                cmd.Connection = db.connect();
                cmd.ExecuteNonQuery();
                int res = int.Parse(cmd.Parameters["@flag"].Value.ToString());
                return res;
            }
            finally
            {
                db.disconnect();
            }
        }
    }
}
