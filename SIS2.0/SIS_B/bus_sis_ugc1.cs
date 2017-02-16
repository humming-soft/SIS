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
    }
}
