using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SIS_D;
namespace SIS_B
{
    //Assigned User - Agaile
    public class bus_sis_ugc1
    {
        data_sis_ugc1 data1 = new data_sis_ugc1();

        public string uname { get; set; }
        public string pswd { get; set; }
        public int kod_kawasan { get; set; }
        public int jenis_aktiviti { get; set; }
        public int parti { get; set; }
        public string butiran_aktiviti { get; set; }
        public DateTime tarikh { get; set; }
        public int category { get; set; }
        public int sumber { get; set; }

        public int check_login()
        {
            return data1.check_login(uname,pswd);
        }

        public DataTable fetch_userdetails()
        {
            return data1.fetch_userdetails(uname);
        }

        public DataTable fillgrid()
        {
            return data1.fillgrid();
        }

        public DataTable fill_DataTable()
        {
            return data1.fill_DataTable();
        }

        public DataTable fill_lamporan()
        {
            return data1.fill_lamporan();
        }

        public DataTable fill_Kawasan()
        {
            return data1.fill_kawasan();
        }

        public DataTable fill_kodkawasan()
        {
            return data1.fill_kodkawasan();
        }

        public DataTable fill_jenis()
        {
            return data1.fill_jenis();
        }

        public DataTable fill_parti()
        {
            return data1.fill_parti();
        }

        public int insert_aktiviti()
        {
            return data1.insert_aktiviti(kod_kawasan,jenis_aktiviti,parti,tarikh,butiran_aktiviti);
        }

        public DataTable fill_sumber()
        {
            return data1.fill_sumber();
        }
        public DataTable fill_isu()
        {
            return data1.fill_isu();
        }

        public int insert_isu()
        {
            return data1.insert_isu(kod_kawasan, category, sumber, parti, tarikh, butiran_aktiviti);
        }
    }
}
