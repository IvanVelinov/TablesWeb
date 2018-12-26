<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TablesWeb._Default" %>




<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {

            var mydata =
                [
                    {
                        "tableID":1,
                        "tableName": "Table 1",
                        "customerName": "Ivan Velinov",
                        "phoneNumber": "078/471-747",
                        "PersonNum": "4",
                        "date": "25/12/2018",
                        "time": "21:00"
                    },
                    {
                        "tableID":2,
                        "tableName": "Table 2",
                        "customerName": "",
                        "phoneNumber": "",
                        "PersonNum": "",
                        "date": "",
                        "time": ""
                    },
                    {
                        "tableID":3,
                        "tableName": "Table 3",
                        "customerName": "Trajce",
                        "phoneNumber": "078/471-748",
                        "PersonNum": "6",
                        "date": "25/12/2018",
                        "time": "18:00"
                    },
                    {
                        "tableID":4,
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
                            debugger;
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
                debugger;
                //e.preventDefault();
                if (e.target.id == "bookID") {
                    alert("Book table with Id: " + e.target.dataset.id)
                }
                else  if (e.target.id == "unBookID") {
                    alert("Un Book table with Id: " + e.target.dataset.id)
                }
            });

            $("#datepicker").datepicker({
                showButtonPanel: true
            });
        });
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
    </div>

</asp:Content>
