using EBillingSys.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EBillingSys.Repository
{
    internal interface IData
    {
        void SaveBillDetails(BillDetail details);
        void SaveBillItems(List<Items>items,SqlConnection conn, int id);
        List<BillDetail>GetAllDetail();
        BillDetail GetDetail(int Id);
    }
}
