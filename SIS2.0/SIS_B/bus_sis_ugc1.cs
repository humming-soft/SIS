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
        public string diberi { get; set; }
        public string jnama { get; set; }
        public string binsiden { get; set; }
        public string status_kawasan { get; set; }
        public string kaveat { get; set; }
        public DateTime tarikhA { get; set; }
        public int stateid { get; set; }
        public int areaid { get; set; }
        public int name { get; set; }
        public int jenis { get; set; }
        public int tahap { get; set; }
        public int info { get; set; }
        public int valid { get; set; }
        public string title { get; set; }
        public string ic { get; set; }
        public DateTime dob { get; set; }
        public int gender { get; set; }
        public int race { get; set; }
        public int religion { get; set; }
        public Byte[] image { get; set; }
        public string address { get; set; }
        public string home_tel_no { get; set; }
        public string office_tel_no { get; set; }
        public string mobile { get; set; }
        public string fax { get; set; }
        public string email { get; set; }
        public string blog { get; set; }
        public string facebook { get; set; }
        public string twitter { get; set; }
        public string job { get; set; }
        public string spouse_name { get; set; }
        public double income { get; set; }
        public int children { get; set; }
        public string member_no { get; set; }
        public bool member_life { get; set; }
        public string branch { get; set; }
        public string political_post { get; set; }
        public string division { get; set; }
        public DateTime e_date { get; set; }
        public DateTime d_date { get; set; }
        public DateTime l_date { get; set; }
        public string asset { get; set; }
        public string education { get; set; }
        public string add_info { get; set; }
        public int check_login()
        {
            return data1.check_login(uname,pswd);
        }

        public DataTable fetch_userdetails()
        {
            return data1.fetch_userdetails(uname);
        }

        public DataTable fill_Kawasan()
        {
            return data1.fill_kawasan();
        }

        public DataTable fill_kodkawasan()
        {
            return data1.fill_kodkawasan(stateid);
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
            return data1.insert_aktiviti(kod_kawasan,jenis_aktiviti,parti,tarikh,info,valid,butiran_aktiviti);
        }

        public DataTable fill_sumber()
        {
            return data1.fill_sumber();
        }
        public DataTable fill_sumberM()
        {
            return data1.fill_sumberM();
        }
        public DataTable fill_tahap()
        {
            return data1.fill_tahap();
        }
        public DataTable fill_isu()
        {
            return data1.fill_isu();
        }

        public int insert_isu()
        {
            return data1.insert_isu(kod_kawasan, category, sumber, parti, tarikh, butiran_aktiviti);
        }
        public int insert_janji()
        {
            return data1.insert_janji(kod_kawasan, tarikh,diberi,jnama);
        }
        public int insert_insiden()
        {
            return data1.insert_insiden(kod_kawasan, parti, tarikh, binsiden );
        }
        public DataTable fill_status()
        {
            return data1.fill_status();
        }
        public int insert_statuskawasan()
        {
            return data1.insert_statuskawasan(kod_kawasan, status_kawasan, tarikh, kaveat);
        }
        public DataTable parlimen()
        {
            return data1.parlimen(stateid);
        }
        public DataTable dun()
        {
            return data1.dun(stateid);
        }
        public DataTable situasi()
        {
            return data1.situasi(areaid,stateid);
        }
        public DataTable jumlah_insiden()
        {
            return data1.jumlah_insiden(stateid);
        }
        public DataTable isu_utama()
        {
            return data1.isu_utama(stateid);
        }
        public DataTable parlimen_WC() 
        {
            return data1.parlimen_WC(stateid);
        }
        public DataTable dun_WC()
        {
            return data1.dun_WC(stateid);
        }
        public DataTable fill_candidates()
        {
            return data1.fill_candidates(areaid);
        }
        public DataTable fill_candidates_dun()
        {
            return data1.fill_candidates_dun(areaid);
        }
        public DataTable GetCandidateList_All()
        {
            return data1.GetCandidateList_All(stateid,name, jenis, sumber, tahap);
        }
        public DataTable fill_incident()
        {
            return data1.fill_incident(areaid);
        }
        public DataTable fill_issue()
        {
            return data1.fill_issue(areaid);
        }
        public DataTable fill_race()
        {
            return data1.fill_race();
        }
        public DataTable fill_relegion()
        {
            return data1.fill_relegion();
        }
        public DataTable fill_party()
        {
            return data1.fill_party();
        }
        public int add_candidate()
        {
            return data1.add_candidate(title,ic,uname,dob,gender,race,religion,image,address,home_tel_no,office_tel_no,mobile,fax,email,blog,facebook,twitter,job,spouse_name,income,children,parti,member_no,member_life,branch,political_post,division,e_date,d_date,l_date,asset,education,add_info);
        }




        public int image_upload()
        {
            return data1.image_upload(image);
        }
        public DataTable fill_image()
        {
            return data1.fill_image();
        }
    }
}
