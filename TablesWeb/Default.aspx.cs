using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TablesWeb.BAL.Services;
using TablesWeb.Models;

namespace TablesWeb
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
        public static string GetTableBookingsForDate(string testing)
        {
            DateTime dateTime10 = Convert.ToDateTime(testing);
            TableBookingRepository bookings = new TableBookingRepository();
            List<BookingTablesModel> model = bookings.GetTableBookingsForDate(dateTime10);   
            
            return JsonConvert.SerializeObject(model);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string Update(BookingTablesModel _bookTableModel)
        {
           
            DateTime dateTime10 = Convert.ToDateTime(_bookTableModel.date);
            TableBookingRepository bookings = new TableBookingRepository();
            List<BookingTablesModel> model  = bookings.UpdateTableBookingsForDate(dateTime10, _bookTableModel);

            return JsonConvert.SerializeObject(model);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string Unbook(BookingTablesModel _bookTableModel)
        {

            DateTime dateTime10 = Convert.ToDateTime(_bookTableModel.date);
            TableBookingRepository bookings = new TableBookingRepository();
            List<BookingTablesModel> model = bookings.UnBookTableBookingsForDate(dateTime10, _bookTableModel);

            return JsonConvert.SerializeObject(model);
        }
    }
}