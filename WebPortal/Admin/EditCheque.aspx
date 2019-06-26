<%@ Page Title="" Language="C#" MasterPageFile="/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="EditCheque.aspx.cs" Inherits="Accs.Web.Admin.EditCheque" %>

<%@ Import Namespace="Accs.Core.Common" %>
<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>
<%@ Register TagPrefix="uc" TagName="blist" Src="/usercontrol/BankListNew.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" rel="Stylesheet" href="/Style/OutwardGridView.css" />
    <link href="/Style/editableselect.css" rel="stylesheet" type="text/css" />
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/Script/editableselect.js" type="text/javascript"></script>
    <script src="/Script/ach.js" type="text/javascript"></script>
    <style type="text/css">
        .col12LabelStyle {
            padding: 0px 0px 0px 5px;
            height: 16px;
            font-weight: bold;
        }

        .col3LableStyle {
            padding: 0px 0px 0px 10px;
            height: 16px;
            width: 140px;
            font-weight: bold;
            text-align: right;
        }

        .amtLabel {
            padding: 0px 0px 0px 5px;
            height: 16px;
            font-weight: bold;
            text-align: right;
        }

        .textboxStyle {
            /*#667C9D	*/
            border-color: #667C9D;
            border-style: solid;
            border-width: 1px;
        }

        .style1 {
            width: 400px;
        }

        .style2 {
            width: 328px;
        }

        .style3 {
            width: 156px;
        }

        .WindowsStyle .ajax__combobox_inputcontainer .ajax__combobox_textboxcontainer input {
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            -moz-border-right-colors: none;
            -moz-border-top-colors: none;
            border-color: #7F9DB9 -moz-use-text-color #7F9DB9 #7F9DB9;
            border-image: none;
            border-style: solid none solid solid;
            border-width: 1px 0 1px 1px;
            font-size: 13px;
            height: 18px;
            margin: 0;
            padding: 1px 0 0 5px;
        }

        .WindowsStyle .ajax__combobox_inputcontainer .ajax__combobox_buttoncontainer button {
            background-image: url("/media/images/windows-arrow.gif");
            background-position: left top;
            border: 0 none;
            height: 21px;
            margin: 0;
            padding: 0;
            width: 21px;
        }

        .WindowsStyle .ajax__combobox_itemlist {
            border-color: #7F9DB9;
        }
    </style>
    <script>

        $(function () {
            //alert(1);

            $(".eselect").editableselect();

        })

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
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
                        if (dataItems['delchq'] != null) {

                            alert(dataItems['delchq']);

                        }
                        if (dataItems['delbatch'] != null) {

                            alert(dataItems['delbatch']);

                        }
                        if (dataItems['pdfPrint'] != null) {

                            window.open(dataItems['pdfPrint'], 'PrintPdf',
                            'width=800,height=600,toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,copyhistory=yes,resizable=yes');


                        }


                    }
                    else {

                        //alert("A network  error occured ");
                    }
                }

            </script>
            <asp:Label ID="errLabel" runat="server" Text="No Date is provided" Font-Bold="True"
                ForeColor="#FF3300" Visible="False"></asp:Label>
            
            <table cellpadding="3" cellspacing="3" style="width: 960px;">
                <tr>
                  <td style="width: 100%; border-style: double; border-color: #C0C0C0; padding: 3px"
                        valign="top" colspan="2">
                        <table style="width: 100%">
                            <tr>
                                <td>Branch Name
                                </td>
                                <td style="padding-left: 3px;">
                                    <%-- <asp:DropDownList runat="server" ID="ddlbranchlist" DataTextField="name" DataValueField="value">
                                        </asp:DropDownList>--%>
                                    <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="False" includeBureau="True" IsAdmin="True" />
                                </td>
                                <td>Batch Type
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlbatchtype" DataTextField="name" DataValueField="value" AppendDataBoundItems="true">
                                        <asp:ListItem Text="All" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="col12LabelStyle">Clearing Type
                                </td>
                                <td style="padding-left: 10px;" class="style3">
                                    <asp:DropDownList runat="server" ID="ddlClearingtype" DataTextField="name" DataValueField="value" AppendDataBoundItems="True">
                                        <asp:ListItem Text="All" Value="-1"></asp:ListItem>

                                    </asp:DropDownList>
                                </td>
                                <td>Clearing Date :
                                </td>
                                <td>
                                    <asp:TextBox ID="tbclrdate" runat="server" Font-Names="Trebuchet MS" Font-Size="12px"
                                        BorderColor="#667C9D" BorderStyle="Solid" BorderWidth="1px" Height="18px" Width="80px"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                        TargetControlID="tbclrdate" Format="dd/MM/yyyy">
                                    </asp:CalendarExtender>
                                    <asp:Image ID="Image1" runat="server" Height="15px" ImageUrl="/media/images/calendar.gif" />
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
                                <td>Batch No
                                </td>
                                <td>
                                    <asp:TextBox ID="tbBatchNo" Font-Size="8pt" runat="server" CssClass="textboxStyle"
                                        Width="100px"></asp:TextBox>
                                </td>
                                <td class="col12LabelStyle">Cheque No
                                </td>
                                <td style="padding-left: 5px;">
                                    <asp:TextBox ID="chequeTextBox" Font-Size="8pt" runat="server" CssClass="textboxStyle"
                                        Width="100px"></asp:TextBox>
                                </td>
                                <td class="col12LabelStyle">Amount
                                </td>
                                <td>&nbsp;<asp:TextBox ID="minTextBox" runat="server" CssClass="textboxStyle" Font-Size="8pt"
                                    Width="80px"></asp:TextBox>
                                    &nbsp;to
                                        <asp:TextBox ID="maxTextBox" runat="server" CssClass="textboxStyle" Font-Size="8pt"
                                            Width="80px"></asp:TextBox>
                                </td>
                                <td class="col12LabelStyle">&nbsp; Bank
                                </td>
                                <td style="padding-left: 1px">

                                    <uc:blist ID="bankList" runat="server" IncludeOwnBank="False"></uc:blist>
                                    <%--<asp:DropDownList runat="server" ID="ddlIssuingBankList">
                                        </asp:DropDownList>--%>
                                    <%--<td class="col12LabelStyle">
                                        A/C No.
                                    </td>
                                    <td style="padding-left: 10px;">
                                        <asp:TextBox ID="accTextBox" Font-Size="8pt" runat="server" CssClass="textboxStyle"
                                            Width="120px"></asp:TextBox>
                                    </td>--%>
                                </td>
                                <td style="padding-left: 5px;">
                                    <asp:ImageButton ID="searchButton" runat="server" ImageUrl="/media/images/search.png"
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
                            <span style="padding-left: 700px">
                                <asp:LinkButton ID="lbPrintAll" runat="server" OnClick="printFilterList" Visible="false">Print All</asp:LinkButton></span>
                            <br />
                            <br />
                            <asp:GridView Width="95%" ID="gvSearch" runat="server" CellPadding="1" AutoGenerateColumns="False"
                                GridLines="Horizontal" PageSize="20" CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle"
                                HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle"
                                Font-Names="Trebuchet MS" Font-Size="9pt">
                                <RowStyle CssClass="RowStyle" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:HiddenField Visible="false" ID="hidBatchStatus" runat="server" Value='<%# Eval("BatchStatus") %>' />
                                            <asp:HiddenField Visible="false" ID="hidChqID" runat="server" Value='<%# Eval("ID") %>' />
                                            <asp:LinkButton ID="LinkButton1" OnClick="editThisCheque" runat="server">Edit Cheque</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hidBatchId" runat="server" Value='<%# Eval("BatchID") %>' />
                                            <asp:LinkButton ID="lbBatchDelete" OnClick="editThisBatch" runat="server">Edit Batch</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbPrintCheque" OnClick="printCheque" runat="server">Print</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <a href="#" onclick="javascript:window.open('showlog.aspx?chkno=<%# Eval("ID") %>','', 'width=400,height=400');">Log</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="OperationTime" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date" />
                                    <asp:BoundField DataField="ChequeNo" HeaderText="ChequeNo" />
                                    <asp:BoundField DataField="AccountNo" HeaderText="Account" />
                                    <asp:BoundField DataField="IssuingBankName" HeaderText="Bank" />
                                    <asp:BoundField DataField="IssuingBranchNameNew" HeaderText="Branch" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                    <asp:BoundField DataField="Status" HeaderText="Status" />
                                    <asp:BoundField DataField="ClearingTypeString" HeaderText="Clearing Type" />
                                    <asp:BoundField DataField="Presentment" HeaderText="Presentment" />
                                    <asp:BoundField DataField="Reason" HeaderText="Reason" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="border-color: #C0C0C0; border-style: double; display: none"
                        id="editcheck" runat="server" class="style2">Serial:&nbsp;
                            <asp:Label ID="lbChqSerial" runat="server"></asp:Label>
                        &nbsp;&nbsp; Status:&nbsp;
                            <asp:Label ID="lbChqStatus" runat="server"></asp:Label>
                        <br />
                        Batch:
                            <asp:Label ID="lbBatchNo" runat="server" Font-Size="9pt" Style="font-weight: 700"></asp:Label>&nbsp;&nbsp;
                            <br />
                        Status:&nbsp;
                            <asp:Label ID="lbBatchStatus" runat="server"></asp:Label>
                        <br />
                        <br />
                        <table class="style1">
                            <tr>
                                <td>Cheque
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddChangeChqStatus" Width="129px" runat="server" Font-Names="Trebuchet MS"
                                        Font-Size="8pt" Height="20px" OnSelectedIndexChanged="ddChangeChqStatus_SelectedIndexChanged"
                                        AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="dropdownrreason" runat="server" Visible="false" Width="200px">
                                    </asp:DropDownList>

                                </td>
                                
                                    <td>
                                        <asp:Button ID="btChangeStatus" runat="server" OnClick="btChangeStatus_Click" Text="Change" />
                                        <asp:Button ID="delcheque" runat="server" Text="Delete" Width="63px" OnClick="delcheque_Click" />
                                    </td>
                               </tr> 
                            <tr>
                                <td>Present
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddPresentment" runat="server" Font-Size="9pt" Width="50px">
                                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="btPresentment" runat="server" OnClick="btPresentment_Click" Text="Change" />
                                </td>
                            </tr>
                            <tr>
                                <td>Type
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlClearType" runat="server"
                                        Font-Names="Trebuchet MS" Font-Size="10pt">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="btClearingChange" runat="server" OnClick="btClearingChange_Click"
                                        Text="Change" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="File:"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbFileName" runat="server"></asp:Label>
                                </td>
                                <td style="margin-left: 40px">
                                    <asp:Button ID="btRemoveFile" runat="server" OnClick="btRemoveFile_Click" Text="Remove" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="chargeApplicable" runat="server" Text="Charge Not Applicable"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbApplyCharge" />
                                </td>
                                <td style="margin-left: 40px">
                                    <asp:Button ID="btChargeApply" runat="server" Text="Change" OnClick="btChargeApply_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbBenifAccount" runat="server" Text="Benif A/C"></asp:Label>
                                </td>
                                <td colspan="">
                                    <div>
                                        <asp:TextBox ID="tbeditable" CssClass="eselect" runat="server" drpvalue="<%# ClearingChargeInfo.KrishiOwnAccount %>"></asp:TextBox>
                                    </div>
                                </td>
                                <td style="margin-left: 40px">
                                    <asp:Button ID="btChangeBenifAccount" runat="server" Text="Change" OnClick="btChangeBenifAccount_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Label ID="lbResult" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="#096023"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btnFlip" runat="server" OnClick="btnFlip_Click" Text="Flip Image" />
                                    &nbsp
                                    <asp:PlaceHolder runat="server" ID="phInwardItemResender">
                                        <asp:Button ID="btMakrInwardDisHonResending" runat="server" OnClick="btMakrInwardDisHonResending_OnClick" Text="Mark Item for Resending" />
                                    </asp:PlaceHolder>
                                </td>
                            </tr>
                         </table>
                    </td>
                    <td style="width: 520px; display: none" runat="server" id="chkimage">
                        <asp:Image ID="chqfront" runat="server" AlternateText="No Front Image Found" BorderColor="#3C516A"
                            BorderStyle="Solid" BorderWidth="3px" ToolTip="Front Image" Width="520px" />
                    </td>
                </tr>
                <tr id="trdelbatch" style="display: none" runat="server">
                    <td colspan="2">
                        <asp:Panel ID="Panel2" GroupingText="Batch Information" runat="server" Width="100%">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbBatchStat" runat="server" Text="" Font-Bold="True" Font-Size="10pt"
                                            ForeColor="#096023"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Batch No :
                                    </td>
                                    <td>
                                        <asp:Label ID="lbdelBatchNo" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Batch Type :
                                    </td>
                                    <td>
                                        <asp:Label ID="lbBatchType" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Batch Status :
                                    </td>
                                    <td>
                                        <div style="float: left" runat="server" id="dvChangeBatch">
                                            <asp:Label ID="lb_BatchStatus" runat="server" Text=""></asp:Label>
                                            &nbsp
                                <asp:LinkButton ID="lbeditBatchStatus" runat="server" OnClick="lbeditBatchStatus_Click">Edit</asp:LinkButton>
                                        </div>
                                        <div id="dvEditBatch" style="float: left" runat="server" visible="false">
                                            <asp:DropDownList ID="ddlBatch_stat" Width="180px" runat="server" Font-Names="Trebuchet MS"
                                                Font-Size="9pt">
                                            </asp:DropDownList>
                                            &nbsp;
                                <asp:Button ID="changeStatus" runat="server" Text="Save" OnClientClick="return confirm('Are you sure to make the change?.This will overwrite all the previous changes.')"
                                    OnClick="changeStatus_Click" />
                                            &nbsp;
                                <asp:Button runat="server" Text="Cancel" ID="btCancelBatchStatusEdit" OnClick="btCancelBatchStatusEdit_Click" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Creation Date :
                                    </td>
                                    <td>
                                        <div runat="server" id="dvChangeClearingDate" style="float: left">
                                            <asp:Label ID="lbCDate" runat="server" Text=""></asp:Label>&nbsp;
                                <asp:LinkButton ID="lbEditClearingDate" runat="server" OnClick="lbEditClearingDate_Click">Edit</asp:LinkButton>
                                        </div>
                                        <div runat="server" id="dvEditClrDate" style="float: left" visible="false">
                                            <asp:TextBox ID="tbClearingDate" runat="server" Font-Names="Trebuchet MS" Font-Size="12px"
                                                BorderColor="#667C9D" BorderStyle="Solid" BorderWidth="1px" Height="18px" Width="80px"></asp:TextBox>
                                            <asp:CalendarExtender ID="clChangeClrDate" runat="server" PopupButtonID="imgcalendar"
                                                TargetControlID="tbClearingDate" Format="dd-MM-yyyy">
                                            </asp:CalendarExtender>
                                            &nbsp
                                <asp:Image ID="imgcalendar" runat="server" Height="15px" ImageUrl="/media/images/calendar.gif" />
                                            &nbsp
                                <asp:Button ID="btSaveClrDate" runat="server" Text="Save" OnClientClick="return confirm('Are you sure to make the change?.This will overwrite previous changes.')"
                                    OnClick="btSaveClrDate_Click" />
                                            &nbsp;
                                <asp:Button runat="server" Text="Cancel" ID="btCancelEditClearing" OnClick="btCancelEditClearing_Click" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Total Cheque Count :
                                    </td>
                                    <td>
                                        <asp:Label ID="lbChequeCount" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>UnProcessed :
                                    </td>
                                    <td>
                                        <asp:Label ID="lbUnprocessed" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Accept :
                                    </td>
                                    <td>
                                        <asp:Label ID="lbAccept" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Reject :
                                    </td>
                                    <td>
                                        <asp:Label ID="lbReject" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Remake :
                                    </td>
                                    <td>
                                        <asp:Label ID="lbRemake" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lbUpdateStaus" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="#096023"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btDeleteBatch" runat="server" Text="Delete This Batch" OnClick="btDeleteBatch_Click" />
                                        &nbsp
                                        <asp:PlaceHolder runat="server" ID="phShowResendButton" Visible="False">
                                            <asp:Button ID="btMarkBatchForResending" runat="server" Text="Mark for Resnding" OnClick="btMarkForResending_Click" />
                                        </asp:PlaceHolder>&nbsp
                                        <asp:Button ID="btClose" runat="server" Text="Close" OnClick="btClose_Click" />
                                    </td>
                                </tr>
                                <tr>
                                <td colspan="2">
                                    <asp:Label ID="lbBatchUpdateResult" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="#096023"></asp:Label>
                                </td>
                            </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <div id="dialog" title="Image View" style="display: none; width: 500px; height: 250px;">
        <img style="" id="popup_image" alt="" src="" />
    </div>
</asp:Content>
