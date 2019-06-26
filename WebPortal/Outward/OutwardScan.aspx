<%@ Page Title="" Language="C#" MasterPageFile="/Outward/Outward.Master" AutoEventWireup="true" CodeBehind="OutwardScan.aspx.cs" Inherits="Accs.Web.Outward.OutwardScan" ValidateRequest="false" ClientIDMode="Static"%>
<%@ Import Namespace="Accs.Core.Common" %>

<%@ MasterType VirtualPath="/Outward/Outward.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="OutwardHead" runat="server">
    <title>Scanner Form</title>
    <link href="/Style/round-button.css" rel="stylesheet" type="text/css" />
    <link href="/Style/outward2.css" rel="stylesheet" type="text/css" />
    <link href="/Style/outward_button.css" rel="stylesheet" type="text/css" />
    <link href="/Style/outward_table.css" rel="stylesheet" type="text/css" />
    <link href="/Style/cupertino/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" />
    <link href="/Style/modal/css/outward_modal.css" rel="stylesheet" type="text/css" />
    <link href="/Style/modal/css/sprites.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .ui-dialog {
            position: fixed;
            top: 100px;
        }
    </style>
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="OutwardBody" runat="server">
    <form id="mainForm" runat="server" title="Scan Cheque">
        <input id="use_ocr" type="hidden" value="yes" />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="/Script/jquery-1.10.1.min.js" />
                <asp:ScriptReference Path="/Script/jquery-migrate-1.1.1.js" />
                <asp:ScriptReference Path="/Script/regex.helper.js" />
                <asp:ScriptReference Path="/Script/outward_scanner.js" />
                <asp:ScriptReference Path="/Script/jquery-ui-1.7.2.custom.min.js" />
                <asp:ScriptReference Path="/Script/json.jquery.js" />
            </Scripts>
            <Services>
                <asp:ServiceReference Path="/Outward/OutwardService.asmx" />
            </Services>
        </asp:ScriptManager>
        <object classid="clsid:786B8341-5C29-4cac-AFC8-A5D60A8F67A7" id="COM123" name="COM123"
            style="display: none;">
        </object>
        <asp:HiddenField ID="hiddenUserId" runat="server" />
        <div id="divScannerController">
            <table style="margin: 10px 0 0 0;">
                <tr>
                    <td>
                        <table cellpadding="4px">
                            <tr>
                                
                                <td>
                                    Currency Type
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlCurrencyType" Font-Names="Trebuchet MS" Font-Size="9pt"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Clearing Type:
                                </td>
                                <td>
                                    <select id="clearing_type" style="font-family: 'Trebuchet MS'; font-size: 12px">
                                        <option value="0">Choose Clearing Type</option>
                                        <option value="1">Regular Value</option>
                                        <option value="9">High Value</option>
                                    </select>
                                </td>
                            </tr>
                           
                            

                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="Deposit Branch"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList CssClass="ddBranchList" ID="ddBranchList" runat="server" Width="132px" Font-Names="Trebuchet MS" Font-Size="9pt">
                                    </asp:DropDownList>
                                    <input id="total_cheques" type="hidden" style="width: 39px;" />
                                </td>
                            </tr>
                            <tr>
                                <td>Date:
                                </td>
                                <td>
                                    <asp:TextBox ID="cu_date" runat="server" EnableViewState="False" CssClass="cu_date_scan"
                                        Width="100px" TabIndex="3"></asp:TextBox>
                                    <cc1:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender1" runat="server" TargetControlID="cu_date"
                                        PopupButtonID="Image1">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Print Endorsement"></asp:Label>
                                </td>
                                <td>
                                    <input id="endorsement_print" type="checkbox" checked="checked" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text="Endorsement Line:"></asp:Label>
                                </td>
                                <td>
                                    <input type="radio" name="endorsement_line" checked="checked" value="1" /><label>Line
                                    1</label><br />
                                    <input type="radio" name="endorsement_line" value="2" /><label>Line 2</label><br />
                                    <input type="radio" name="endorsement_line" value="3" /><label>Line 3</label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top" style="width: 700px;">
                        <div class="buttons" style="margin-left: 10px;" id="scanoption">
                            
                            <button type="button" class="regular" id="btStartScan" name="scan_batch_tiff">
                                <img src="/media/outward/startscan.png" alt="" />
                                Start Scanner
                            </button>
                            
                            <button type="button" class="regular" id="scan_batch_tiff" name="scan_batch_tiff">
                                <img src="/media/outward/textfield_key.png" alt="" />
                                Batch
                            </button>
                            
                            <button type="button" class="regular" id="rescan_batch_tiff" name="rescan_batch_tiff">
                                <img src="/media/outward/textfield_key.png" alt="" />
                                Representment
                            </button>
                            <button type="button" class="regular" id="representment_batch" name="representment_batch">
                                <img src="/media/outward/textfield_key.png" alt="" />
                                RescanPBM
                            </button>
                            <button type="button" class="regular" id="Eject" name="Eject">
                                <img src="/media/outward/cross.png" alt="" />
                                Eject
                            </button>
                            <button type="button" class="regular" id="btStopScan" name="scan_batch_tiff">
                                <img src="/media/outward/stopscan.png" alt="" />
                                Stop Scanner
                            </button>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- Modal Overlay -->
        <div id="modal-overlay" style="display: none;">
        </div>
        <!-- Moday Database Updating... -->
        <div id="divDatabaseUpdating" style="display: none;">
            <div id="divModalDialogBackground" class="ModalBackground">
            </div>
            <div id="divModalDialogContent" class="ModalCenter" style="border: 1px solid #AACCEE;">
                <div style="height: 32px; width: 490px; padding: 5px; margin-left: auto; margin-right: auto;">
                    <img src="/media/images/busy.gif" style="width: 32px; height: 32px; float: left;" />
                    <div style="height: 32px; float: left;">
                        <div style="width: 400px; margin-top: 7px; margin-left: 10px; font-size: 14px; font-weight: bold;">
                            Please wait for Server Response...
                        </div>
                    </div>
                    <div style="clear: both">
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Scanning Image View -->
        <div id="divScanningImagesView" style="display: none;">
            <div id="divModalBackgroundIV" class="ModalBackground" style="width: 940px; height: 422px; margin-left: -470px; margin-top: -210px;">
            </div>
            <div class="ModalCenter" style="width: 920px; height: 380px; margin-left: -460px; margin-top: -200px;">
                <div id="modal-box">
                    <a id="close_modal_dialog" style="float: right" onclick="javascript: return false;"
                        href="#" _counted="undefined">
                        <img class="sprite s_x" border="0" alt="" src="/Style/modal/images/icon_spacer.gif" />
                    </a>
                    <h2 id="modal-title" class="modal_box_header">
                        <div>
                            <img class="modal-h-img sprite s_folder_user modal-h-img" src="/Style/modal/images/icon_spacer.gif"
                                width="16" height="16">Cheque scanning...
                        </div>
                    </h2>
                    <div id="modal-content" style="padding: 0;">
                        <div style="padding: 5px;">
                            <img src="/media/images/busy.gif" style="width: 32px; height: 32px; float: left;" />
                            <div style="height: 32px; float: left;">
                                <div style="width: 400px; margin-top: 7px; margin-left: 10px; font-size: 14px; font-weight: bold;">
                                    Please wait while scanner is scanning your chequeinfos...
                                </div>
                            </div>
                            <div class="buttons" style="height: 32px; float: right;">
                                <button type="button" class="regular" id="CancelBatchScan" name="CancelBatch">
                                    <img src="/media/outward/cross.png" alt="" />
                                    Stop Scanning
                                </button>
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>
                        <table width="100%" cellspacing="2" cellpadding="2" style="font-size: 14px;">
                            <tr>
                                <td align="center">
                                    <h3 style="line-height: 0;">Front Image</h3>
                                </td>
                                <td align="center">
                                    <h3 style="line-height: 0;">Back Image
                                    </h3>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="border: 1px solid #AACCEE; padding: 5px; text-align: center;">
                                        <object classid="clsid:6C8D8005-DA18-4acc-BDE1-40B523DCC6E1" width="430px" height="200px"
                                            id="frontimage" name="frontimage" visible="true">
                                            Front image
                                        </object>
                                    </div>
                                </td>
                                <td>
                                    <div style="border: 1px solid #AACCEE; padding: 5px; text-align: center;">
                                        <object classid="clsid:6C8D8005-DA18-4acc-BDE1-40B523DCC6E1" width="430px" height="200px"
                                            id="backimage" name="backimage" visible="true">
                                            Back image
                                        </object>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <h2 class="modal_box_header" style="background: none; padding: 0;">Total Cheque scanned: <span id="spanNoChequeScanned">0</span>
                        </h2>
                    </div>
                </div>
            </div>
        </div>
        <div id="divPostInsertTable" style="padding: 10px; display: none;">
            <div>
                <h3 id="batchNo"></h3>
                <table id="tablePostInsert" class="ScanTable" cellspacing="0" summary="The Scanned Cheques.">
                    <caption>
                        Server response
                    </caption>
                    <thead>
                        <tr>
                            <th scope="col" abbr="MICR" class="nobg" style="width: 250px;">MICR
                            </th>
                            <th scope="col" style="width: 100px;">Image
                            </th>
                            <th scope="col">DB Response
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td id="postInsertSummary" colspan="7" style="border-right: #c1dad7 1px solid; border-left: #c1dad7 1px solid;">&nbsp;
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="buttons" style="padding: 5px; height: 25px;">
                <button type="button" class="positive" id="okPostScanned" name="okPostScanned">
                    OK
                </button>
                <button type="button" class="positive" id="printPostScannedRejected" name="printPostScannedRejected">
                    Print Rejected Cheques
                </button>
            </div>
        </div>
        <div id="divPreInsertTable" style="padding: 10px; display: none;">
            <div>
                <table id="tablePreInsert" class="ScanTable" cellspacing="0" summary="The Scanned Cheques.">
                    <caption>
                        Scanned Cheques in this Batch
                    </caption>
                    <thead>
                        <tr>
                            <th abbr="Selection" class="nobg" style="width: 25px;"></th>
                            <th scope="col" style="width: 250px;">Original MICR
                            </th>
                            <th style="width: 350px;">Info
                            </th>
                            <th scope="col" style="width: 90px;">Image
                            </th>
                            <th scope="col" style="width: 90px;">IQA
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td id="preInsertSummary" colspan="7" style="border-right: #c1dad7 1px solid; border-left: #c1dad7 1px solid;"></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="buttons" style="padding: 5px; height: 25px;">
                <button type="button" class="positive" id="insert_db" name="insert_db">
                    Data Insert
                </button>
                <button type="button" class="positive" id="cancelBatch" name="cancelBatch">
                    Cancel
                </button>
            </div>
            <!--
        <div id="deposit_slip_scanned_table">
            <big><a href="OutwardDeposit.aspx">Click Here</a> to assign Cheques to Deposit Slips.
            </big>
        </div>
        -->
        </div>
        <!-- Scanned Cheque PopUp -->
        <div id="dialogPopupImage" style="width: 900px; height: 400px; display: none;">
            <table id="Table1" style="margin-left: auto; margin-right: auto; font-size: 14px;">
                <tr>
                    <td align="center">
                        <h3>Front Image</h3>
                    </td>
                    <td align="center">
                        <h3>Back Image</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        <object classid="clsid:6C8D8005-DA18-4acc-BDE1-40B523DCC6E1" width="430px" height="200px"
                            id="popupFrontImage" name="frontimage" visible="true">
                            Front image
                        </object>
                    </td>
                    <td>
                        <object classid="clsid:6C8D8005-DA18-4acc-BDE1-40B523DCC6E1" width="430px" height="200px"
                            id="popupBackImage" name="backimage" visible="true">
                            Back image
                        </object>
                    </td>
                </tr>
            </table>
        </div>
        <!-- Voucher PopUp -->
        <div id="divVoucherModal" style="display: none;">
            <div id="div2" class="ModalBackground" style="width: 940px; height: 422px; margin-left: -470px; margin-top: -210px;">
            </div>
            <div class="ModalCenter" style="width: 920px; height: 380px; margin-left: -460px; margin-top: -200px;">
                <div id="Div3">
                    <a id="A1" style="float: right" onclick="javascript: return false;" href="#" _counted="undefined">
                        <img class="sprite s_x" border="0" alt="" src="/Style/modal/images/icon_spacer.gif" />
                    </a>
                    <h2 id="H1" class="modal_box_header">
                        <div>
                            <img class="modal-h-img sprite s_folder_user modal-h-img" src="/Style/modal/images/icon_spacer.gif"
                                width="16" height="16">Cheque scanning...
                        </div>
                    </h2>
                    <div id="Div4" style="padding: 0;">
                        <div style="padding: 5px;">
                            <img src="/media/images/busy.gif" style="width: 32px; height: 32px; float: left;" />
                            <div style="height: 32px; float: left;">
                                <div style="width: 400px; margin-top: 7px; margin-left: 10px; font-size: 14px; font-weight: bold;">
                                    Please wait while scanner is scanning your chequeinfos...
                                </div>
                            </div>
                            <div class="buttons" style="height: 32px; float: right;">
                                <button type="button" class="regular" id="Button1" name="CancelBatch">
                                    <img src="/media/outward/cross.png" alt="" />
                                    Stop Scanning
                                </button>
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>
                        <table width="100%" cellspacing="2" cellpadding="2" style="font-size: 14px;">
                            <tr>
                                <td align="center">
                                    <h3 style="line-height: 0;">Front Image</h3>
                                </td>
                                <td align="center">
                                    <h3 style="line-height: 0;">Back Image
                                    </h3>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="border: 1px solid #AACCEE; padding: 5px; text-align: center;">
                                        <object classid="clsid:6C8D8005-DA18-4acc-BDE1-40B523DCC6E1" width="430px" height="200px"
                                            id="Object1" name="frontimage" visible="true">
                                            Front image
                                        </object>
                                    </div>
                                </td>
                                <td>
                                    <div style="border: 1px solid #AACCEE; padding: 5px; text-align: center;">
                                        <object classid="clsid:6C8D8005-DA18-4acc-BDE1-40B523DCC6E1" width="430px" height="200px"
                                            id="Object2" name="backimage" visible="true">
                                            Back image
                                        </object>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <h2 class="modal_box_header" style="background: none; padding: 0;">Total Cheque scanned: <span id="span1">0</span>
                        </h2>
                    </div>
                </div>
            </div>
        </div>
        <!-- Scanner Selection -->
        <div id="scanner_selection_dialog" class="hidden">
        </div>
        <div id="dialog" title="Image View" style="display: none; width: 500px; height: 250px;">
            <img style="" id="popup_image" alt="" src="" />
        </div>
    </form>

    <script type="text/javascript">

        var stopscan=<%= Stopscan %>;
        var futureBusinessDaysAllowed = <%= PublicSettings.FutureDayPermittedInDays %>;
        $(document).ready(function() {
            $("#modal-overlay").css("opacity", 0.60);
            if(stopscan==1)
            {
            
                $("#scanoption").css("display","none");
                alert("You can't scan now.Please contact  bach manager");
            }
            

        });
    </script>

</asp:Content>
