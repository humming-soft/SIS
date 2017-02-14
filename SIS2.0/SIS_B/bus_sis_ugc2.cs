using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SIS_D;

namespace SIS_B
{
    //Assigned User - Jane
    public class bus_sis_ugc2
    {
        data_sis_ugc2 objAktivitiDAL = new data_sis_ugc2();

        public string kod_kawasan { get; set; }
        public string butiran_aktiviti { get; set; }
        public string tarikh { get; set; }
        public string nama_kawasan { get; set; }
        public string parti { get; set; }
        public string masa { get; set; }
        public string jenis_aktiviti { get; set; }

        public string isu_kod_kawasan { get; set; }
        public string isu_butiran_aktiviti { get; set; }
        public string isu_tarikh { get; set; }
        public string isu_nama_kawasan { get; set; }
        public string isu_sumber { get; set; }
        public string isu_masa { get; set; }
        public string isu_parti { get; set; }
        public string isu_kategori { get; set; }

        public string janji_kod_kawasan { get; set; }
        public string janji_nama_kawasan { get; set; }
        public string janji_yg { get; set; }
        public string janji_nama_tokoh { get; set; }
        public string janji_tarik { get; set; }
        public string janji_masa { get; set; }

        public int InsertAktivitiDetails()
        {
            return objAktivitiDAL.InsertAktivitiDetails(kod_kawasan, butiran_aktiviti, tarikh, nama_kawasan, parti, masa, jenis_aktiviti);
        }
        public int InsertISUDetails()
        {
            return objAktivitiDAL.InsertISUDetails(isu_kod_kawasan, isu_butiran_aktiviti, isu_tarikh, isu_nama_kawasan, isu_sumber, isu_masa, isu_parti,isu_kategori);
        }
        public int InsertJanjiDetails()
        {
            return objAktivitiDAL.InsertJanjiDetails(janji_kod_kawasan, janji_nama_kawasan, janji_yg, janji_nama_tokoh, janji_tarik, janji_masa);
        }
        public DataTable fill_DataTable()
        {
            return objAktivitiDAL.fill_DataTable();
        }
    }
}
