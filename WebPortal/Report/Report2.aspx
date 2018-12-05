<%@ Page Title="" Language="C#" MasterPageFile="/master.Master" AutoEventWireup="true" CodeBehind="Report2.aspx.cs" Inherits="Accs.Web.Report.Report2" %>

<%@ Register TagPrefix="rsweb" Namespace="Microsoft.Reporting.WebForms" Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845DCD8080CC91" %>
<%@ Register TagPrefix="uc" TagName="blist" Src="/usercontrol/BankListNew.ascx" %>
<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Bach Report</title>
    <link type="text/css" rel="Stylesheet" href="/Style/ach.css" />
    <link type="text/css" rel="Stylesheet" href="/Style/admin.css" />
    <link href="/Style/daterangepicker-bs2.css" rel="stylesheet" type="text/css" />
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/Script/moment.min.js" type="text/javascript"></script>
    <script src="/Script/daterangepicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.tbdate').daterangepicker(
                         {
                             startDate: moment().subtract('days', 29),
                             endDate: moment(),
                             minDate: '01/01/2012',
                             maxDate: '12/31/2200',
                             dateLimit: { days: 60 },
                             showDropdowns: true,
                             showWeekNumbers: true,
                             timePicker: false,
                             timePickerIncrement: 1,
                             timePicker12Hour: true,
                             ranges: {
                                 'Today': [moment(), moment()],
                                 'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                                 'Tomorrow': [moment().add('days', 1), moment().add('days', 1)],
                                 'Last 30 Days': [moment().subtract('days', 29), moment()],
                                 'This Month': [moment().startOf('month'), moment().endOf('month')],
                                 'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                             },
                             opens: 'left',
                             buttonClasses: ['btn btn-default'],
                             applyClass: '', // 'btn-small btn-primary',
                             cancelClass: '', //'btn-small',
                             format: 'DD/MM/YYYY',
                             separator: ' to ',
                             locale: {
                                 applyLabel: 'Submit',
                                 fromLabel: 'From',
                                 toLabel: 'To',
                                 customRangeLabel: 'Custom Range',
                                 daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                                 monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
                                 firstDay: 1
                             },
                             leftpad: 280
                         },
                         function (start, end) {
                             //console.log("Callback has been called!");
                             $('.tbdate').val(start.format('DD/MM/YYYY') + ' - ' + end.format('DD/MM/YYYY'));
                         }
                      );
            //Set the initial state of the picker label
            //$('.tbdate').val(moment().format('DD/MM/YYYY') + ' - ' + moment().format('DD/MM/YYYY'));
        });
    </script>
    <style type="text/css">
        .styleheader {
            border: 5px double #c5c5c0;
            height: 30px;
            background-color: #D0D0D0;
            color: #111111;
        }

        .input-mini {
            width: 60px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        .table-condensed th, .table-condensed td {
            padding: 4px 5px;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        .dropdown-menu {
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 1000;
            display: none;
            float: left;
            min-width: 160px;
            padding: 5px 0;
            margin: 2px 0 0;
            list-style: none;
            background-color: #ffffff;
            border: 1px solid #ccc;
            border: 1px solid rgba(0, 0, 0, 0.2);
            *border-right-width: 2px;
            *border-bottom-width: 2px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            -webkit-background-clip: padding-box;
            -moz-background-clip: padding;
            background-clip: padding-box;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server" enableviewstate="True">
        <div style="width: 1100px; padding-top: 5px;">
            <div>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </div>
            <div>
                <asp:DropDownList ID="ddlReportName" runat="server" AppendDataBoundItems="true" AutoPostBack="false" Font-Names="Trebuchet MS" Font-Size="10pt">
                       <asp:ListItem Value="-1" Text="Select a report"></asp:ListItem>                    
                </asp:DropDownList>
                <asp:TextBox ID="tbdateRange" runat="server" class='tbdate' value='' Style="width: 150px"></asp:TextBox>
                <asp:DropDownList ID="ddlClrType" runat="server" DataTextField="name" DataValueField="value"
                    Width="100px" Font-Names="Trebuchet MS" Font-Size="10pt" AppendDataBoundItems="True">
                    <asp:ListItem Text="All" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <%--<asp:DropDownList ID="branchDropDownList" runat="server" AutoPostBack="false" AppendDataBoundItems="True"
                DataTextField="BranchName" DataValueField="BranchID" Width="100px" Font-Names="Trebuchet MS"
                Font-Size="10pt">
            </asp:DropDownList>--%>
                <asp:PlaceHolder runat="server" ID="phbrlist">
                    <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="False" OnOnAutoPostBackControl="selectedindexchanged" includeBureau="True" selectLoginBranch="True" />
                </asp:PlaceHolder>
                
                <asp:DropDownList runat="server" ID="ddlCurrency" AutoPostBack="true" OnSelectedIndexChanged="ddlCurrency_OnSelectedIndexChanged"/>

                <asp:DropDownList ID="ddlAccountType" runat="server" AutoPostBack="false" Width="100px" Font-Names="Trebuchet MS" Font-Size="10pt" AppendDataBoundItems="True">
                    <asp:ListItem Value="0" Text="All"></asp:ListItem>
                </asp:DropDownList>
                <uc:blist ID="bankList" runat="server" IncludeOwnBank="False"></uc:blist>
                <asp:Button ID="btnGenReport" runat="server" Text="Generate Report" OnClick="btnGenReport_Click" />
            </div>
            <div style="padding: 10px; border: 1px solid #c5c5c0; background-color: #fafafa; overflow: auto; height: 470px">
                <rsweb:ReportViewer BackColor="#e9e9e9" Font-Names="Verdana" Font-Size="8pt" Height="469px"
                    ID="ReportViewer1" runat="server" runat="server" ShowZoomControl="False" Visible="False"
                    Width="1000px">
                    <LocalReport ReportPath="">
                    </LocalReport>
                </rsweb:ReportViewer>
            </div>
        </div>
    </form>
    
</asp:Content>
