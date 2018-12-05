<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="ViewCheque.aspx.cs" Inherits="Accs.Web.Admin.ViewCheque" ClientIDMode="Static" %>

<%@ Register TagPrefix="uc" TagName="blist" Src="/usercontrol/BankListNew.ascx" %>
<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" rel="Stylesheet" href="/Style/OutwardGridView.css" />
    <link href="/Style/daterangepicker-bs2.css" rel="stylesheet" type="text/css" />
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/Script/moment.min.js" type="text/javascript"></script>
    <script src="/Script/daterangepicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            loadCalander();
            //Set the initial state of the picker label
            //$('.tbdate').val(moment().format('DD/MM/YYYY') + ' - ' + moment().format('DD/MM/YYYY'));
        });

        function loadCalander() {
            $('#tbdateRange').daterangepicker(
                     {
                         startDate: moment().subtract('days', 29),
                         endDate: moment(),
                         minDate: '01/01/2012',
                         maxDate: '12/31/2030',
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


        }
               </script>
    <style type="text/css">
        .col12LabelStyle
        {
            padding: 0px 0px 0px 5px;
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
    </style>
    <style type="text/css">
    .styleheader
    {
        border: 5px double #c5c5c0;
        height: 30px;
        background-color: #D0D0D0;
        color: #111111;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <script type="text/javascript">

        function printSelection(id) {

            var node = document.getElementById(id);
            var content = node.innerHTML
            var pwin = window.open('', 'print_content', 'width=800,height=600');
            pwin.document.open();
            pwin.document.write('<html><body >' + content + '</body></html>');
            pwin.print();
            pwin.document.close();
            setTimeout(function () { pwin.close(); }, 1000);

        }
    </script>
    <form id="form1" runat="server" enableviewstate="True">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <script language="javascript" type="text/javascript">



            //this method will be called when the html part is loaded.
            //it simply registers a method with one of the ajax events.
            //for now we are registering for the end request which
            //will be called when the ajax request is fully complete

            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandler);
            Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);

            //this method will be invoked when the ajax request is complete
            //do anything you want in this block
            //for now we just display a message
            function BeginRequestHandler(sender, args) {

                var elem = args.get_request();
                //alert(elem.ID);

            }
            function endRequestHandler(sender, args) {
                //check if any error or exceptions occured and show the appropriate message
                if (args.get_error() == null) {
                    var dataItems = args.get_dataItems();
                    if (dataItems['openprint'] != null) {

                        printSelection(dataItems['openprint']);
                    }


                }
                else {
                    alert("A network  error occured ");
                }
            }
 
        </script>
        <asp:Label ID="errLabel" runat="server" Text="No Date is provided" Font-Bold="True"
            ForeColor="#FF3300" Visible="False"></asp:Label>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="3" cellspacing="3" style="width: 900px;">
                    <tr>
                        <td style="width: 100%; border-style: double; border-color: #C0C0C0; padding: 3px"
                            valign="top" colspan="2">
                            <table style="width: 90%">
                                <tr>
                                    <td>
                                        Branch Name
                                    </td>
                                    <td style="padding-left: 3px;">
                                        <%--<asp:DropDownList runat="server" ID="ddlbranchlist" DataTextField="name" DataValueField="value">
                                        </asp:DropDownList>--%>
                                        <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="False" includeBureau="True" IsAdmin="True" />
                                    </td>
                                    <td>
                                        Batch Type
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlbatchtype" DataTextField="name" DataValueField="value">
                                             <asp:ListItem Text="All" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <%--<td class="col12LabelStyle">
                                        Clearing Type
                                    </td>
                                    <td style="padding-left: 10px;">
                                        <asp:DropDownList runat=server ID="ddlClearingtype" DataTextField="name" DataValueField="value"></asp:DropDownList>
                                    </td>--%>
                                    <td>
                                        <asp:TextBox ID="tbdateRange" CssClass="tbdate" runat="server" Font-Names="Trebuchet MS"
                                            Font-Size="12px" BorderColor="#667C9D" BorderStyle="Solid" BorderWidth="1px"
                                            Height="18px" Width="150px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <uc:blist ID="bankList" runat="server"></uc:blist>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%; border-style: double; border-color: #C0C0C0; padding: 3px"
                            valign="top" colspan="2">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        Batch No
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbBatchNo" Font-Size="8pt" runat="server" CssClass="textboxStyle"
                                            Width="100px"></asp:TextBox>
                                    </td>
                                    <td class="col12LabelStyle">
                                        Cheque No
                                    </td>
                                    <td style="padding-left: 5px;">
                                        <asp:TextBox ID="chequeTextBox" Font-Size="8pt" runat="server" CssClass="textboxStyle"
                                            Width="100px"></asp:TextBox>
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
                                    <%--<td class="col12LabelStyle">
                                        A/C No.
                                    </td>
                                    <td style="padding-left: 10px;">
                                        <asp:TextBox ID="accTextBox" Font-Size="8pt" runat="server" CssClass="textboxStyle"
                                            Width="120px"></asp:TextBox>
                                    </td>--%>
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
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="250px" Width="100%">
                                <asp:Label ID="LabelCount" runat="server"></asp:Label>
                                <br />
                                <asp:GridView Width="95%" ID="gvSearch" runat="server" CellPadding="1" AutoGenerateColumns="False"
                                    GridLines="Horizontal" PageSize="20" CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle"
                                    HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle"
                                    Font-Names="Trebuchet MS" Font-Size="9pt">
                                    <RowStyle CssClass="RowStyle" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <asp:HiddenField Visible="false" ID="hidChqID" runat="server" Value='<%# Eval("ID") %>' />
                                                <asp:HiddenField Visible="false" ID="dbsel" runat="server" Value='<%# Eval("dbType") %>' />
                                                <asp:HiddenField Visible="false" ID="hdate" runat="server" Value='<%# Eval("OperationTime","{0:dd/MM/yyyy}") %>' />
                                                <asp:LinkButton ID="lbViewCheque" OnClick="EditThisCheque" runat="server">View Cheque</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Print">
                                            <ItemTemplate>
                                                <asp:HiddenField Visible="false" ID="hidChqIDP" runat="server" Value='<%# Eval("ID") %>' />
                                                <asp:HiddenField Visible="false" ID="dbselP" runat="server" Value='<%# Eval("dbType") %>' />
                                                <asp:LinkButton ID="lbPrint" OnClick="printThisCheque" runat="server">Print Cheque</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mark as Stop Payment">
                                            <ItemTemplate>
                                                <asp:HiddenField Visible="false" ID="hidChqIDSP" runat="server" Value='<%# Eval("ID") %>' />
                                                <asp:HiddenField Visible="false" ID="dbselSP" runat="server" Value='<%# Eval("dbType") %>' />
                                                <asp:HiddenField Visible="false" ID="hdateSP" runat="server" Value='<%# Eval("OperationTime","{0:dd/MM/yyyy}") %>' />
                                                <asp:LinkButton ID="lbMarsSP" OnClick="markAsStopPayment" runat="server" OnClientClick="return  confirm('Are you sure?')">Stop payment</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="OperationTime" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date" />
                                        <asp:BoundField DataField="ChequeNo" HeaderText="ChequeNo" />
                                        <asp:BoundField DataField="AccountNo" HeaderText="Account" />
                                        <asp:BoundField DataField="IssuingBankName" HeaderText="Bank" />
                                        <asp:BoundField DataField="IssuingBranchNameNew" HeaderText="Branch Name" />
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                        <asp:BoundField DataField="ClearingTypeString" HeaderText="Clearing Type" />
                                        <asp:BoundField DataField="Status" HeaderText="Status" />
                                        <asp:BoundField DataField="Presentment" HeaderText="Presentment" />
                                        <asp:BoundField DataField="Reason" HeaderText="Reason" />
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width: 290px; border-color: #C0C0C0; display: none" id="editcheck"
                            runat="server">
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:Label ID="lbResult" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="#096023"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 520px; display: none" runat="server" id="chkimage">
                            <asp:Image ID="chqfront" runat="server" AlternateText="No Front Image Found" BorderColor="#3C516A"
                                BorderStyle="Solid" BorderWidth="3px" ToolTip="Front Image" Width="600px" />
                            <asp:Image ID="chqBack" runat="server" AlternateText="No back Image Found" BorderColor="#3C516A"
                                BorderStyle="Solid" BorderWidth="3px" ToolTip="back Image" Width="600px" />
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
                <div id="printdiv" title="Image View" style="display: none;" runat="server">
                    <table cellpadding="4">
                        <tr>
                            <td>
                                Clearing Date
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbDate" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Cheque No
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbChqNo" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Amount
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbAmount" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <asp:Image ID="chqFrontPrint" runat="server" AlternateText="No Front Image Found"
                        BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" ToolTip="Front Image"
                        Width="600px" />
                    <br />
                    <br />
                    <asp:Image ID="chqRearPrint" runat="server" AlternateText="No Back Image Found" BorderColor="#3C516A"
                        BorderStyle="Solid" BorderWidth="3px" ToolTip="Front Image" Width="600px" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</asp:Content>
