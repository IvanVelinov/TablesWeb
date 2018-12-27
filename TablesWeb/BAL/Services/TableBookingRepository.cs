using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TablesWeb.BAL.Repository;
using TablesWeb.Models;

namespace TablesWeb.BAL.Services
{
    public class TableBookingRepository : ITableBookingRepository
    {
        public List<BookingTablesModel> GetTableBookingsForDate(BookingTablesModel table)
        {
            List<BookingTablesModel> bookings = new List<BookingTablesModel>
            {
                new BookingTablesModel
                {
                    tableID = 1,
                    tableName = "Table 1",
                    customerName = "Ivan Velinov",
                    phoneNumber = "078471747",
                    PersonNum = 4,
                    date = DateTime.Now.Date,
                    time = DateTime.Now
                }, 

                new BookingTablesModel
                {
                     tableID = 2,
                    tableName = "Table 2",
                    customerName = "",
                    phoneNumber = "",
                    PersonNum = null,
                    date =null,
                    time = null
                },

                new BookingTablesModel
                {
                     tableID = 3,
                    tableName = "Table 3",
                    customerName = "Trajce",
                    phoneNumber = "078/471-748",
                    PersonNum = 6,
                    date =DateTime.Now.Date,
                    time = DateTime.Now
                },

                new BookingTablesModel
                {
                    tableID = 4,
                    tableName = "Table 4",
                    customerName = "Slavco",
                    phoneNumber = "078/471-749",
                    PersonNum = 4,
                    date =DateTime.Now.Date,
                    time = DateTime.Now
                }
            };

            return bookings;
        }
    }
}
