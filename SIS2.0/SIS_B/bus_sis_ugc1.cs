using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SIS_D;
namespace SIS_B
{
    public class bus_sis_ugc1
    {
        data_sis_ugc1 data1 = new data_sis_ugc1();

        public DataTable fillgrid()
        {
            return data1.fillgrid();
        }

        public DataTable fill_DataTable()
        {
            return data1.fill_DataTable();
        }
    }
}
