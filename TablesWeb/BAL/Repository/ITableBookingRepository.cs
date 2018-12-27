using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TablesWeb.Models;

namespace TablesWeb.BAL.Repository
{
    public interface ITableBookingRepository
    {
        List<BookingTablesModel> GetTableBookingsForDate(BookingTablesModel table);
    }
}
