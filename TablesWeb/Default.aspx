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
            var mydata =
                [
                    {
                        "tableID": 1,
                        "tableName": "Table 1",
                        "customerName": "Ivan Velinov",
                        "phoneNumber": "078/471-747",
                        "PersonNum": "4",
                        "date": "25/12/2018",
                        "time": "21:00"
                    },
                    {
                        "tableID": 2,
                        "tableName": "Table 2",
                        "customerName": "",
                        "phoneNumber": "",
                        "PersonNum": "",
                        "date": "",
                        "time": ""
                    },
                    {
                        "tableID": 3,
                        "tableName": "Table 3",
                        "customerName": "Trajce",
                        "phoneNumber": "078/471-748",
                        "PersonNum": "6",
                        "date": "25/12/2018",
                        "time": "18:00"
                    },
                    {
                        "tableID": 4,
                        "tableName": "Table 4",
                        "customerName": "Slavco",
                        "phoneNumber": "078/471-749",
                        "PersonNum": "4",
                        "date": "25/12/2018",
                        "time": "21:00"
                    }
                ];

            $('#dtTables').dataTable({
                data: mydata,
                "columns": [
                    { 'data': 'tableID' },
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
                    }]
            });

            $('#dtTables').on('click', 'td', function (e) {
                //e.preventDefault();
                if (e.target.id == "bookID") {
                    ShowModal(e.target.dataset.id);
                }
                else if (e.target.id == "unBookID") {
                    alert("Un Book table with Id: " + e.target.dataset.id)
                }
            });

            var dateToday = new Date();
            $("#datepicker").datepicker({
                showButtonPanel: true,                 
                minDate:new Date()
            });
            $("#dateModal").datepicker({
                showButtonPanel: true
            });

            $('#timepicker5').timepicker({
                template: false,
                showInputs: false,
                minuteStep: 5,
                showMeridian: false
            });

            HideModal();
        });

        function HideModal() {
            $('#NewBookModal').modal('hide');
        };

        function ShowModal(tableID) {
            $('#rowId').val(tableID);
            $('#dateModal').val(getTodayDate())
            $('#NewBookModal').modal('show');
        };

        function getTodayDate() {
            var d = new Date();
            var date = (d.getMonth() + 1) + "/" + + d.getDate() + "/" + (d.getFullYear());
            return date;
        };
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
                        <div class="row">
                            <input id="rowId" type="hidden" style="visibility: hidden" />
                        </div>
                        <div class="row">
                            <label for="customerNameModal">Customer Name</label>
                            <input type="text" id="customerNameModal" />
                        </div>
                        <div class="row">
                            <label for="phoneNumberModal">Phone Number</label>
                            <input type="text" id="phoneNumberModal" />
                        </div>
                        <div class="row">
                            <label for="personModal">No. Persons</label>
                            <input type="number" id="personModal" max="20" min="1" />
                        </div>
                        <div class="row">
                            <label for="dateModal">Date</label>
                            <input type="text" id="dateModal" />
                        </div>
                        <div class="row input-group bootstrap-timepicker timepicker">                            
                            <div class="bootstrap-timepicker">
                                <label for="timepicker">Time</label>
                                <input id="timepicker5" type="text" class="input-small">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" id="SaveTable" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
