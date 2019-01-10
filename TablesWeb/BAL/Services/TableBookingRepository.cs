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
        public List<BookingTablesModel> GetTableBookingsForDate(DateTime _selectedDate)
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
                    date =DateTime.Now.Date.ToString("MM/dd/yyyy"),
                    time = DateTime.Now.ToString("HH:mm"),
                    bookId = 1,
                    employeeId = 2
                },

                new BookingTablesModel
                {
                    tableID = 2,
                    tableName = "Table 2",
                    customerName = "",
                    phoneNumber = "",
                    PersonNum = null,
                    date ="",
                    time = "",
                    bookId = null,
                    employeeId = null
                },
                new BookingTablesModel
                {
                    tableID = 3,
                    tableName = "Table 3",
                    customerName = "Trajce",
                    phoneNumber = "078/471-748",
                    PersonNum = 6,
                    date =DateTime.Now.Date.ToString("MM/dd/yyyy"),
                    time = DateTime.Now.ToString("HH:mm"),
                    bookId = 3,
                    employeeId = 2
                },

                new BookingTablesModel
                {
                    tableID = 4,
                    tableName = "Table 4",
                    customerName = "Slavco",
                    phoneNumber = "078/471-749",
                    PersonNum = 4,
                    date =DateTime.Now.Date.ToString("MM/dd/yyyy"),
                    time = DateTime.Now.ToString("HH:mm"),
                    bookId = 4,
                    employeeId = 2
                }
            };

            return bookings;
        }

        public List<BookingTablesModel> UpdateTableBookingsForDate(DateTime _selectedDate, BookingTablesModel _model)
        {
            List<BookingTablesModel> bookings = GetTableBookingsForDate(_selectedDate);

            BookingTablesModel booking = bookings.Where(x => x.tableID == _model.tableID).FirstOrDefault();


            booking.customerName = _model.customerName;
            booking.phoneNumber = _model.phoneNumber;
            booking.PersonNum = _model.PersonNum;
            booking.date = _model.date;
            booking.time = _model.time;
            booking.bookId = 4;
            booking.employeeId = 6;

            return bookings;
        }

        public List<BookingTablesModel> UnBookTableBookingsForDate(DateTime _selectedDate, BookingTablesModel _model)
        {
            List<BookingTablesModel> bookings = GetTableBookingsForDate(_selectedDate);

            BookingTablesModel booking = bookings.Where(x => x.tableID == _model.tableID).FirstOrDefault();


            booking.customerName = "";
            booking.phoneNumber = "";
            booking.PersonNum = null;
            booking.date = "";
            booking.time = "";
            booking.bookId = null;
            booking.employeeId = null;

            return bookings;
        }
    }
}
