<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TablesWeb._Default" %>




<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.min.css" />


    <script>
        $(document).ready(function () {
            HideModalNewBookModal();
            initializeDateAndTimePickers();
            fillDatepickerValue();
            CallAjaxToFillDataTable();
            initializeDatatableButtonClick();
            initializeSaveButtonClick();
            initializeCloseButtonClick();
            initializeDiscardYesButtonClick();

        });

        function CallAjaxToFillDataTable() {
            $.ajax({
                type: "GET",
                data: { testing: JSON.stringify($("#datepicker").val()) },
                url: "Default.aspx/GetTableBookingsForDate",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    fillDataTable(data.d);
                },
                error: function (err) {
                    alert(err);
                }
            });
        };

        function CallAjaxToBookTable() {
            debugger;
            var model = {
                tableID: $('#rowId').val(), bookId: $('#bookId').val(),
                employeeId: 2, tableName: $('#tableName').val(), customerName: $('#customerNameModal').val(),
                phoneNumber: $('#phoneNumberModal').val(), PersonNum: $('#personModal').val(), date: $('#dateModal').val(),
                time: $('#timepicker5').val()
            };

            $.ajax({
                type: "POST",
                data: JSON.stringify({ '_bookTableModel': model }),
                url: "Default.aspx/Update",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    fillDataTable(data.d);
                    //var currentdate = new Date();
                    //if (model.date == new Date().format("MM/dd/yyyy"))
                    //    CallAjaxToFillDataTable();

                    HideModalNewBookModal();
                },
                error: function (err) {
                    alert(err);
                }
            });


        };

        function CallAjaxToUNBookTable() {
            debugger;
            var model = {
                tableID: $('#discardTableID').val()
            };

            $.ajax({
                type: "POST",
                data: JSON.stringify({ '_bookTableModel': model }),
                url: "Default.aspx/Unbook",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    fillDataTable(data.d);
                    //var currentdate = new Date();
                    //if (model.date == new Date().format("MM/dd/yyyy"))
                    //    CallAjaxToFillDataTable();

                    HideDiscardBookModal();
                },
                error: function (err) {
                    alert(err);
                }
            });


        };

        function fillDataTable(data) {
            $('#dtTables').dataTable().fnDestroy();
            $('#dtTables').dataTable({
                data: jQuery.parseJSON(data),
                "columns": [
                    { 'data': 'tableID' },
                    { 'data': 'bookId' },
                    { 'data': 'employeeId' },
                    { 'data': 'tableName' },
                    { 'data': 'customerName' },
                    { 'data': 'phoneNumber' },
                    { 'data': 'PersonNum' },
                    { 'data': 'date' },
                    { 'data': 'time' },
                    {
                        mRender: function (data, type, row) {
                            return '<span class="btn btn-success" id="bookID" data-id="' + row.tableID + '">Book</span>'
                        }
                    },
                    {
                        mRender: function (data, type, row) {
                            return '<span class="btn btn-danger" id="unBookID" data-id="' + row.tableID + '">UnBook</a>'
                        }
                    }
                ],
                "columnDefs": [
                    {
                        "targets": [0],
                        "visible": false,
                        "searchable": false
                    }
                ]
            });
        }

        function initializeDateAndTimePickers() {
            $("#datepicker").datepicker({
                showButtonPanel: true
                //,minDate: new Date()
            });
            $("#dateModal").datepicker({
                showButtonPanel: true,
                minDate: new Date()
            });

            $('#timepicker5').timepicker({
                template: false,
                showInputs: false,
                minuteStep: 5,
                showMeridian: false
            });

        }

        function initializeSaveButtonClick() {
            $("#SaveBooking").click(function () {
                debugger;
                if (CheckValidPhoneNumber()) {
                    CallAjaxToBookTable();
                }
            });
        };

        function initializeCloseButtonClick() {
            $("#CloseBooking").click(function () {
                alert("Handler for Close.click() called.");
            });
        };

        function initializeDiscardYesButtonClick() {
            $("#DiscardBooking").click(function () {
                CallAjaxToUNBookTable();
            });
        };

        function initializeDatatableButtonClick() {
            $('#dtTables').on('click', 'tr', function (e) {
                var row = $('#dtTables').DataTable().row(this).data();

                if (e.target.id == "bookID") {
                    ShowBookTableModal(row);
                }
                else if (e.target.id == "unBookID") {
                    ShowDiscardTableModal(e.target.dataset.id);
                }
            });
        };

        function HideModalNewBookModal() {
            $('#NewBookModal').modal('hide');
        };

        function HideDiscardBookModal() {
           $('#DiscardBookModal').modal('hide');
        };

        function ShowBookTableModal(row) {
            $('#rowId').val(row.tableID);
            $('#tableName').val(row.tableName);
            if (row.bookId == null)
                $('#dateModal').val(getTodayDate())
            else {
                $('#bookId').val(row.bookId);
                $('#customerNameModal').val(row.customerName);
                $('#phoneNumberModal').val(row.phoneNumber);
                $('#personModal').val(row.PersonNum);
                $('#dateModal').val(row.date)
                $('#timepickers5').timepicker('setTime', row.time);
            }
            $('#NewBookModal').modal('show');
        };

        function ShowDiscardTableModal(tableID) {
            $('#discardTableID').val(tableID);
            $('#DiscardBookModal').modal('show');
        };

        function fillDatepickerValue() {
            $('#datepicker').val(getTodayDate())
        }

        function getTodayDate() {
            var d = new Date();
            var date = (d.getMonth() + 1) + "/" + + d.getDate() + "/" + (d.getFullYear());
            return date;
        };


        function CheckValidPhoneNumber() {
            var ret = true;
            var phone = $('#phoneNumberModal').val(),
                intRegex = /[0-9 -()+]+$/;

            if ((phone.length < 6) || (!intRegex.test(phone))) {
                alert('Please enter a valid phone number.');
                ret = false;
            }

            return ret;
        };
         //$("#SaveBooking").click(function () {
         //       debugger;
         //       CallAjaxToBookTable();
         //   });

    </script>


    <div class="container">
        <div class="row">
            <p>
                Date:
                <input type="text" id="datepicker">
            </p>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table id="dtTables" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th data-field="tableID">tableID</th>
                                <th data-field="bookId">bookId</th>
                                <th data-field="employeeId">employeeId</th>
                                <th data-field="tableName">Tables</th>
                                <th data-field="customerName">Customer Name</th>
                                <th data-field="phoneNumber">Phone Number</th>
                                <th data-field="PersonNum">Persons</th>
                                <th data-field="date">Date</th>
                                <th data-field="time">Time</th>
                                <th data-field="book">Book</th>
                                <th data-field="unBook">Unbook</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <!--end of .table-responsive-->
            </div>
        </div>

        <div id="NewBookModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Book Table</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row input">
                            <input id="rowId" type="hidden" style="visibility: hidden" />
                            <input id="tableName" type="hidden" style="visibility: hidden" />
                            <input id="bookId" type="hidden" style="visibility: hidden" />
                        </div>
                        <div class="row">
                            <div class="left">
                                <label for="customerNameModal">Customer Name</label>
                            </div>
                            <div class="left">
                                <input type="text" id="customerNameModal" />
                            </div>

                        </div>
                        <div class="row">
                            <div class="left">
                                <label for="phoneNumberModal">Phone Number</label>
                            </div>
                            <div class="left">
                                <input type="text" id="phoneNumberModal" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="left">
                                <label for="personModal">No. Persons</label>
                            </div>
                            <div class="left">
                                <input type="number" id="personModal" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="left">
                                <label for="dateModal">Date</label>
                            </div>
                            <div class="left">
                                <input type="text" id="dateModal" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="left">
                                <label for="timepicker">Time</label>
                            </div>
                            <div class="left">
                                <input id="timepicker5" type="text" class="input-small">
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" id="CloseBooking" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" id="SaveBooking" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="DiscardBookModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Discard Table</h4>
                    </div>
                    <div class="modal-body">
                         <div class="row input">
                            <input id="discardTableID" type="hidden" style="visibility: hidden" />                            
                        </div>
                        <div class="row">
                            <label style="margin-left: 15px">Are you sure you want to cancel the table?</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                        <button type="button" id="DiscardBooking" class="btn btn-primary">Yes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
