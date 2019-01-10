using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TablesWeb.Models
{
    public class BookingTablesModel
    {
        public int tableID { get; set; }
        public int? bookId { get; set; }
        public int? employeeId { get; set; }
        public string tableName { get; set; }
        public string customerName { get; set; }
        public string phoneNumber { get; set; }
        public int? PersonNum { get; set; }
        public string date { get; set; }
        public string time { get; set; }        
    }
}