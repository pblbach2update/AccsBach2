<%@ Page Title="" Language="C#" MasterPageFile="~/Outward/Outward.Master" AutoEventWireup="true"
    CodeBehind="SearchReturn.aspx.cs" Inherits="Accs.Web.Outward.SearchReturn" ClientIDMode="Static" %>
<%@ Register TagPrefix="uc" TagName="blist" Src="/usercontrol/BankListNew.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="OutwardHead" runat="server">
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/Script/moment.min.js" type="text/javascript"></script>
    <script src="/Script/daterangepicker.js" type="text/javascript"></script>
    <link type="text/css" rel="Stylesheet" href="/Style/OutwardGridView.css" />
    <link type="text/css" href="/Style/redmond/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
    <link type="text/css" rel="Stylesheet" href="/Style/ach.css" />
    <link href="/Style/daterangepicker-bs2.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .col12LabelStyle
        {
            padding: 0px 0px 0px 10px;
            height: 16px;
            font-weight: bold;
        }
        .col3LableStyle
        {
            padding: 0px 0px 0px 10px;
            height: 16px;
            width: 140px;
            font-weight: bold;
            text-align: right;
        }
        .amtLabel
        {
            padding: 0px 0px 0px 5px;
            height: 16px;
            font-weight: bold;
            text-align: right;
        }
        .textboxStyle
        {
            /*#667C9D	*/
            border-color: #667C9D;
            border-style: solid;
            border-width: 1px;
        }
         .input-mini{
	     width:60px;
	  }
	  label {
    display: block;
    margin-bottom: 5px;
}
	  .table-condensed th, .table-condensed td 
	  {
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
    <script type="text/javascript">
        $(document).ready(function () {

            $('#tbdateRange').daterangepicker(
                {
                    startDate: moment().subtract('days', 29),
                    endDate: moment(),
                    minDate: '01/01/2012',
                    maxDate: '12/31/2033',
                    dateLimit: { days: 60 },
                    showDropdowns: true,
                    showWeekNumbers: true,
                    timePicker: false,
                    timePickerIncrement: 1,
                    timePicker12Hour: true,
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                        'Last 7 Days': [moment().subtract('days', 6), moment()],
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
                    leftpad: 800
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="OutwardBody" runat="server">
    
    <script type="text/javascript">

        function hideshowCell(flag) {
            var row = document.getElementById("customAmountCell");
            if (flag == true) {
                //row.style.visibility = true;
                row.style.display = '';
                row.style.visibility = "visible";
            }
            else {
                //row.style.visibility = false;
                row.style.display = 'none';
                row.style.visibility = "hidden";
            }
        }
        function printdishonor(chqid, source,sdate) {

            var a = new Array;
            a[0] = 1;
            a[1] = 4;

            var url = 'ReturnPrint.aspx?chequeinfoid=' + chqid + "&source=" + source+"&sdate="+sdate;
            var r = window.open(url, a, "dialogwidth: 800px; dialogheight: 600px; resizable: yes; dialogHide:yes");

        }

    </script>
    <form id="form1" runat="server" enableviewstate="True">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Label ID="errLabel" runat="server" Text="No Date is provided" Font-Bold="True"
            ForeColor="#FF3300" Visible="False"></asp:Label>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="3" cellspacing="3" style="width: 950px;">
                    <tr>
                        <td style="width: 100%; border-style: double; border-color: #C0C0C0; padding: 1px"
                            valign="top" colspan="2">
                            <table style="width: 100%">
                                <tr>
                                    <td class="col12LabelStyle">
                                        Cheque No
                                    </td>
                                    <td style="padding-left: 5px;">
                                        <asp:TextBox ID="chequeTextBox" Font-Size="8pt" runat="server" CssClass="textboxStyle"
                                            Width="80px"></asp:TextBox>
                                    </td>
                                    <td class="col12LabelStyle">
                                        Amount
                                    </td>
                                    <td>
                                        &nbsp;<asp:TextBox ID="minTextBox" runat="server" CssClass="textboxStyle" Font-Size="8pt"
                                            Width="80px"></asp:TextBox>
                                        &nbsp;to
                                        <asp:TextBox ID="maxTextBox" runat="server" CssClass="textboxStyle" Font-Size="8pt"
                                            Width="80px"></asp:TextBox>
                                    </td>
                                    <td class="col12LabelStyle">
                                        A/C No.
                                    </td>
                                    <td style="padding-left: 10px;">
                                        <asp:TextBox ID="accTextBox" Font-Size="8pt" runat="server" CssClass="textboxStyle"
                                            Width="100px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbdateRange" CssClass="tbdate" runat="server" Font-Names="Trebuchet MS"
                                            Font-Size="12px" BorderColor="#667C9D" BorderStyle="Solid" BorderWidth="1px"
                                            Height="18px" Width="120px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <uc:blist ID="bankList" runat="server"></uc:blist>
                                    </td>
                                    <td style="padding-left: 5px;">
                                        <asp:ImageButton ID="searchButton" runat="server" ImageUrl="~/media/images/search.png"
                                            OnClick="searchButton_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-color: #C0C0C0; border-style: double; padding-left: 0px; padding: 5px 0 0 3px;"
                            valign="top" colspan="2">
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="350px" Width="100%">
                                <asp:Label ID="LabelCount" runat="server"></asp:Label>
                                <br />
                                <asp:GridView Width="95%" ID="gvSearch" runat="server" CellPadding="1" AutoGenerateColumns="False"
                                    GridLines="Horizontal" PageSize="20" CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle"
                                    HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle"
                                    Font-Names="Trebuchet MS" Font-Size="9pt">
                                    <RowStyle CssClass="RowStyle" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="">
                                            <ItemTemplate>
                                                <a href="javascript:printdishonor('<%# Eval("ChequeID") %>','<%# Eval("DbType") %>','<%# Eval("SettlementDate","{0:dd/MM/yyyy}") %>')">Print
                                                    Cheque</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SettlementDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Clearing Date" />
                                        <asp:BoundField DataField="ChequeSequence" HeaderText="ChequeNo" />
                                        <asp:BoundField DataField="ChequeAccount" HeaderText="Account" />
                                        <asp:BoundField DataField="IssuingBankName" HeaderText="Bank" />
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                        <asp:BoundField DataField="ReturnReason" HeaderText="Reason" />
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <asp:UpdateProgress ID="actionProgress" runat="server" DisplayAfter="50">
                    <ProgressTemplate>
                        <asp:Panel ID="p1" CssClass="overlay" runat="server">
                            <asp:Panel ID="p2" CssClass="loader" runat="server" Style="margin-top: 0px">
                                loading.......
                                <img src="/media/images/busy.gif" /></asp:Panel>
                        </asp:Panel>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</asp:Content>
