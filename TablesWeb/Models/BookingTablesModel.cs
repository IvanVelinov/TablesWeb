using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TablesWeb.Models
{
    public class BookingTablesModel
    {
        public int tableID { get; set; }
        public string tableName { get; set; }
        public string customerName { get; set; }
        public string phoneNumber { get; set; }
        public int? PersonNum { get; set; }
        public DateTime? date { get; set; }
        public DateTime? time { get; set; }                     
    }
}