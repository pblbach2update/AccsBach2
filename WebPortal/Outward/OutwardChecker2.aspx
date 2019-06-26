<%@ Page Language="C#" MasterPageFile="~/Outward/Outward.Master" AutoEventWireup="true"
    CodeBehind="OutwardChecker2.aspx.cs" Inherits="Accs.Web.Outward.OutwardChecker2"
    ValidateRequest="false" %>

<%@ MasterType VirtualPath="~/Outward/Outward.Master" %>
<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="OutwardHead" runat="server">
    <title>Outward Checker</title>
    <link href="/Style/admin.css" rel="stylesheet" type="text/css" />
    <link href="/Style/modal/css/outward_modal.css" rel="stylesheet" type="text/css" />
    <link href="/Style/modal/css/sprites.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="/Style/outward2.css" />
    <link type="text/css" rel="Stylesheet" href="/Style/outward_button.css" />
    <link type="text/css" rel="Stylesheet" href="/Style/OutwardGridView.css" />
    <link type="text/css" href="/Style/redmond/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
    <link type="text/css" rel="Stylesheet" href="/Style/ach.css" />


    <style type="text/css">
        .m_batch td {
            padding: 1px 2px 1px 5px;
            height: 30px;
            margin-left: 240px;
            vertical-align: middle;
        }

        table.m_batch {
            border-width: 1px;
            border-spacing: 0px;
            border-style: solid;
            border-color: #dfdfdf;
            border-collapse: collapse;
            background-color: white;
        }

            table.m_batch th {
                border-width: 1px;
                padding: 0px;
                border-style: solid;
                border-color: #dfdfdf;
                background-color: white;
            }

            table.m_batch td {
                border-width: 1px;
                border-style: solid;
                border-color: #dfdfdf;
                background-color: white;
                padding: 2px 5px 2px 5px;
            }

            table.m_batch td {
                background-color: #fff;
            }

                table.m_batch td.td_alt {
                    background-color: #eeeeee;
                }

        .count_label {
            vertical-align: middle;
            width: 125px;
            text-align: right;
        }

        .count_val {
            width: 100px;
            font-weight: bold;
            font-size: 16px;
        }

        .CheckBoxProcess {
            display: inline-block;
            width: 120px;
            padding: 5px;
        }

        .IQALabel {
            background: url(media/outward/brightness.png) no-repeat;
            width: 180px;
            font-size: 12px;
            height: 12px;
            border-bottom: 1px dashed lightGrey;
            padding: 0 0 5px 20px;
            margin: 3px 0 0 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="OutwardBody" runat="server">
    <form id="CheckerForm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="/Script/jquery-1.10.1.min.js" />
                <asp:ScriptReference Path="/Script/jquery-migrate-1.1.1.js" />
                <asp:ScriptReference Path="/Script/regex.helper.js" />
                <asp:ScriptReference Path="/Script/jquery-ui-1.7.2.custom.min.js" />
                <asp:ScriptReference Path="/Script/jquery.maskedinput-1.2.2.js" />
                <asp:ScriptReference Path="/Script/json.jquery.js" />
                <asp:ScriptReference Path="/Script/outward_makecheck.js" />
                <asp:ScriptReference Path="/Script/outward_checker2.js" />
                <asp:ScriptReference Path="/Script/UserInterface.js" />
                <asp:ScriptReference Path="/Script/amount.js" />
                <asp:ScriptReference Path="/Script/Tokenizer.js" />
            </Scripts>
            <Services>
                <asp:ServiceReference Path="~/Outward/OutwardService.asmx" />
            </Services>
        </asp:ScriptManager>
        <!-- Main Working Div -->
        <div style="padding: 10px;">
            <table style="width: 800px;">
                <tr>
                    <td>
                        <asp:Label class="headText2" ID="TimeOfRefresh" runat="server">Available Batches</asp:Label>
                        <asp:PlaceHolder runat="server" ID="phbranchlist">
                            <uc:brlist ID="branchList" selectLoginBranch="True" runat="server" IsAdmin="True" AutoPostBackOnChange="true" OnOnAutoPostBackControl="selectedindexchanged" includeBureau="True" />
                        </asp:PlaceHolder>
                        <asp:DropDownList runat="server" ID="ddlCurrency" AutoPostBack="true" OnSelectedIndexChanged="ddlCurrency_OnSelectedIndexChanged" AppendDataBoundItems="True">
                            <asp:ListItem Text="All Currency"  Value="255"></asp:ListItem>
                            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="userBox" style="width: 850px;">
                            <div id="divBatchSelection" runat="server">
                                <asp:GridView ID="gvBatchList" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvBatchList_SelectedIndexChanged"
                                    DataKeyNames="BatchId" CellPadding="4" ForeColor="#333333" GridLines="None" CaptionAlign="Left"
                                    Width="850px" OnRowDataBound="gvBatchList_RowDataBound">
                                    <RowStyle BackColor="#F6F6F6" ForeColor="#222222" BorderColor="#DFDFDF" BorderStyle="Solid"
                                        BorderWidth="1px" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Batch  No" DataField="BatchNo">
                                            <ItemStyle Font-Bold="True" Width="190px" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Currncy" DataField="CurrencyType">
                                            <ItemStyle Font-Bold="True" Width="50px" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField ItemStyle-Width="80px" HeaderText="Creation Date" DataField="CreationDate"
                                            DataFormatString="{0:dd/MM/yyyy}">
                                            <ItemStyle Width="80px" HorizontalAlign="Right"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Status" DataField="BatchStatusCode">
                                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Type" DataField="ClearingType">
                                            <ItemStyle Font-Bold="True" Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Total Cheques" DataField="Total">
                                            <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Unprocessed">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Accept" DataField="CheckerAccept">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Reject" DataField="CheckerReject">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Last User" DataField="LastModifiedBy">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:ButtonField CommandName="Select" HeaderText="Action" ShowHeader="True" Text="Lock">
                                            <ItemStyle Font-Bold="True" Font-Underline="True" Width="45px" />
                                        </asp:ButtonField>
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#e0e0e0" Font-Bold="True" ForeColor="#444444" BorderColor="#DFDFDF"
                                        BorderWidth="1px" />
                                    <SelectedRowStyle />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#222222" />
                                </asp:GridView>
                                <div id="divNobatch" runat="server" style="text-align: center; padding: 20px;" visible="False">
                                    <asp:Label ID="label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#666666"
                                        Text="There is no batch to process at the moment."></asp:Label>
                                </div>
                            </div>
                            <div id="divProcessingBatch" runat="server" visible="False">
                                <div style="width: 800px;">
                                    <table class="m_batch" cellpadding="0" cellspacing="0" style="margin: auto; width: 100%;">
                                        <tr>
                                            <td class="count_label">Cheque Selection:
                                            </td>
                                            <td colspan="4">
                                                <asp:CheckBox ID="chkMakerAccept" runat="server" Checked="True" Text="Unprocessed"
                                                    CssClass="CheckBoxProcess" />
                                                <asp:CheckBox ID="chkCheckerAccept" runat="server" Text="Accepted" CssClass="CheckBoxProcess"
                                                    Checked="True" />
                                                <asp:CheckBox ID="chkCheckerReject" runat="server" Text="Rejected" CssClass="CheckBoxProcess"
                                                    Checked="True" />
                                                <asp:Button ID="btnShowAll" runat="server" Text="Show All" OnClick="btnShowAll_Click"
                                                    Style="display: none" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btnUpdateData" runat="server" Text="Update List" OnClick="btnUpdateData_Click"
                                                    Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="count_label td_alt">Batch No:
                                            </td>
                                            <td class="td_alt" colspan="2">
                                                <asp:Label ID="lblBatchNo" runat="server" Font-Bold="False" Text="0" Font-Size="16px"></asp:Label>
                                            </td>
                                            <td class="count_label td_alt">Clearing Type:
                                            </td>
                                            <td class="td_alt">
                                                <asp:Label ID="lblClearingType" runat="server" Font-Bold="false" Font-Size="16px"
                                                    Text=""></asp:Label>
                                            </td>
                                            <td class="td_alt">
                                                <asp:Button ID="btAccceptAll" runat="server" Text="Accept All"
                                                    Width="96%" OnClick="btAccceptAll_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="count_label"># of Cheques Shown:
                                            </td>
                                            <td class="count_val">
                                                <asp:Label ID="labelTotalCheques" runat="server" Font-Bold="True" Font-Size="16px"
                                                    Text="0"></asp:Label>
                                            </td>
                                            <td class="">&nbsp;
                                            </td>

                                            <td class="count_label">Total Amount:
                                            </td>
                                            <td class="count_val">
                                                <asp:Label ID="labelTotalAmount" runat="server" Font-Bold="True" Text="0" Font-Size="16px"></asp:Label>
                                            </td>
                                            <td class="count_val">
                                                <asp:Button ID="btnUnlock" runat="server" Text="Unlock" OnClick="btnUnlock_Click"
                                                    Width="104%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="count_label td_alt">Unprocessed:
                                            </td>
                                            <td class="count_val td_alt">
                                                <asp:Label ID="labelUnprocessed" runat="server" Font-Bold="True" Font-Size="16px"
                                                    Text="0" ForeColor="#996600"></asp:Label>
                                            </td>
                                            <td class="count_label td_alt">Checker Accepted:
                                            </td>
                                            <td class="count_val td_alt">
                                                <%--(<asp:Label ID="labelMeAccepted" runat="server" Font-Bold="True" Font-Size="16px"
                                                Text="0" ForeColor="#009900"></asp:Label>)--%>
                                                <asp:Label ID="labelAnyAccepted" runat="server" Font-Bold="True" Font-Size="16px"
                                                    Text="0" ForeColor="Gray"></asp:Label>
                                            </td>
                                            <td class="count_label td_alt">Checker Rejected:
                                            </td>
                                            <td class="count_val td_alt">
                                                <%-- (<asp:Label ID="labelMeRejected" runat="server" Font-Bold="True" Font-Size="16px"
                                                Text="0" ForeColor="#CC3300"></asp:Label>)--%>
                                                <asp:Label ID="labelAnyRejected" runat="server" Font-Bold="True" Font-Size="16px"
                                                    Text="0" ForeColor="Gray"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <div id="divChequeList" runat="server">
                <table style="width: 800px;">
                    <tr>
                        <td>
                            <div class="userBox">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"
                                    CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle" HeaderStyle-CssClass="OW_HeaderStyle"
                                    RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle"
                                    OnPageIndexChanging="GridView1_PageIndexChanging" Width="800px" BorderStyle="None"
                                    BorderWidth="0px" CellPadding="0" GridLines="None">
                                    <RowStyle CssClass="OW_RowStyle"></RowStyle>
                                    <Columns>
                                        <asp:BoundField DataField="ChequeSequence" HeaderText="Serial" />
                                        <asp:BoundField DataField="ChequeAccount" HeaderText="Account" />
                                        <asp:BoundField DataField="IssuingBankShortName" HeaderText="Bank" />
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                        <asp:BoundField DataField="IssueDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Date" />
                                        <asp:BoundField DataField="BenificiaryAccount" HeaderText="Benif. A/C">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Status" HeaderText="Status" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <a id="cu_up_<%#Eval("ChequeID")%>" href="" class="cu_up" title="<%#Eval("ChequeID")%>">Process</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle CssClass="OW_PagerStyle"></PagerStyle>
                                    <HeaderStyle CssClass="OW_HeaderStyle"></HeaderStyle>
                                    <AlternatingRowStyle CssClass="OW_AltRowStyle"></AlternatingRowStyle>
                                </asp:GridView>
                                <div id="divNoCheques" runat="server" style="text-align: center; padding: 20px; width: 760px;">
                                    <asp:Label ID="labelNoCheques" runat="server" Font-Bold="True" Font-Size="Large"
                                        ForeColor="#666666" Text="No chequeinfos found in current selection criteria."></asp:Label>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- Whole Document Modal Overlay -->
        <div id="modal-overlay" style="display: none;">
        </div>
        <!-- Modal Data Entry Modal -->
        <div id="dialogDataEntry" style="display: none;">
            <div id="divOWEditorBackground" class="ModalCenter">
            </div>
            <div id="divOWEditorContent" class="ModalCenter">
                <div class="topBar" style="width: 930px;">
                    <div style="float: left; width: 200px;">
                        <label id="cheque_log_title">
                            Cheque-</label>
                         <span id="divIssuingBank" style="font-weight: bold;"></span>
                    </div>
                    <div style="float: right; width: 600px; text-align: right;">
                        <%=UserProfile.BankCode%>,
                    <%=UserProfile.BranchName%>
                    (<%=UserProfile.BranchRoutingNumber%>)
                    </div>
                </div>
                <label id="cu_id" style="display: none;">
                </label>
                <input type="hidden" name="cu_dbid" id="cu_dbid" value="" tabindex="1000" />
                <input type="hidden" name="cu_itemCurrency" id="cu_itemCurrency" value="" tabindex="1001" />
                <div style="width: 940px; height: 490px; float: left;">
                    <div id="stylized" class="outward_form" style="width: 930px;">
                        <table id="header_table" style="width: 100%;" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td style="width: 250px; color: #0E2843;">
                                    <h1>Data Entry</h1>
                                </td>
                                <td valign="bottom" style="color: #0E2843;">
                                    <h1>Cheque Information</h1>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                        <table id="table_body" style="width: 100%;" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td class="dataEntry" style="width: 280px">
                                    <fieldset>
                                        <legend>Benficiary</legend>
                                        <div>
                                            <span style="padding-right: 20px">A/C :</span>
                                            <%--<div id="cu_account_div" style="font-size: 14px; border: 1px solid #CCCC99; margin: 2px 0 2px 5px; padding: 2px; height: 18px; width: 130px;"
                                                class="text_input">
                                            </div>--%>
                                            <input type="text" name="cu_account" id="cu_account" tabindex="1"
                                                readonly="readonly" />

                                        </div>
                                        <div>
                                            <span style="padding-right: 8px">Name :</span>
                                            <!--<input type="text" name="cu_account_holder_name" id="cu_payee" tabindex="1" value="" readonly="readonly" />-->
                                             <textarea name="cu_account_holder_name" id="cu_payee" tabindex="1"  
                                                    style="width: 195px; vertical-align: top;overflow-x: hidden"  rows="2" readonly="readonly"></textarea>
                                        </div>
                                        <div>
                                            <span style="padding-right: 13px">Branch</span>
                                            <asp:DropDownList runat="server" ID="ddlMPBranchList" Width="190px" ClientIDMode="Static" Enabled="False">
                                            </asp:DropDownList>
                                        </div>

                                    </fieldset>
                                    <%-- <div id="grp_account" class="no_notification">
                                    <label>
                                        Benificiary A/C</label>
                                    <div id="cu_account_div" style="font-size: 14px; border: 1px solid #CCCC99; margin: 2px 0 2px 5px;
                                        padding: 2px; height: 18px; width: 130px;" class="text_input">
                                    </div>
                                    <input style="display: none;" type="text" name="cu_account" id="cu_account" tabindex="1"
                                         readonly="readonly" />
                                    <br />
                                    <span id="cu_account_p" class="invalid_entry" style="display: none;">(Invalid Account
                                        No) </span>
                                </div>--%>
                                </td>
                                <td style="width: 5px;"></td>
                                <td class="chkInfo" >
                                    <div id="grp_img_endorsement" class="no_notification">
                                        <label>
                                            <input class="check_label" id="benif_ac_usability" type="checkbox" checked="checked"
                                                tabindex="100" /></label>
                                        <div id="div_img_endorsement" class="image_input" style="height: 100px; width: 256px; padding: 0; margin-left: 25px;">
                                            <img class="chq" id="img_endorsement" src="" style="position: absolute; height: 100px; width: 256px"
                                                alt="User Endorsement" />
                                        </div>
                                    </div>
                                    <div id="grp_img_payee" class="no_notification">
                                        <label class="clearboth">
                                            <input class="check_label" id="payee_usability" type="checkbox" tabindex="104" />
                                        </label>
                                        <div id="div_img_payee" class="image_input" style="">
                                            <img class="chq" id="img_payee" src="" style="" alt="Payee Name" />
                                        </div>
                                    </div>
                                </td>
                                <td style="width: 5px;"></td>
                                <td class="chkInfo2" rowspan="1">
                                    <div style="display: none">
                                        <div style="float: right; width: 225px; padding: 2px; height: 100px;">
                                            <div id="iqaResult" style="width: 205px; height: 17px; border-bottom: 1px dashed #dda0dd; font-weight: bold; margin-bottom: 1px; text-align: center;">
                                                Image Analysis
                                            </div>
                                            <div id="Div2" class="no_notification" style="padding: 2px; font-size: 12px; font-weight: normal;">
                                                <div style="clear: both;">
                                                </div>
                                                <div>
                                                    <div id="chq_image_size" class="IQALabel" style="background-image: url(media/outward/dimension.png);">
                                                        Good Size
                                                    </div>
                                                </div>
                                                <div>
                                                    <div id="chq_brightness" class="IQALabel" style="background-image: url(media/outward/brightness.png);">
                                                        Not too light/dark
                                                    </div>
                                                </div>
                                                <div>
                                                    <div id="chq_skew" class="IQALabel" style="background-image: url(media/outward/skew.png);">
                                                        No excessive Skew
                                                    </div>
                                                </div>
                                                <div>
                                                    <div id="chq_micr_quality" class="IQALabel" style="background-image: url(media/outward/micr.png);">
                                                        Good Read
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div style="float: right; width: 175px; padding: 5px; height: 87px;">
                                            <div id="cheque_log_role" style="width: 170px; height: 17px; border-bottom: 1px dashed #dda0dd; margin-bottom: 3px; text-align: center;">
                                                Checker Log
                                            </div>
                                            <div id="cheque_log_details" class="notification" style="width: 170px; height: 60px; padding: 5px; font-size: 12px; font-weight: normal;">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="dataEntry">

                                    <div id="grp_amount" class="no_notification">
                                        <fieldset>
                                            <legend>Intrument</legend>
                                            <div>

                                                <div>
                                                    <%--<div id="cu_amount_div" style="font-size: 14px; border: 1px solid #CCCC99; margin: 2px 0 2px 5px; padding: 2px; height: 18px; width: 130px;"
                                                        class="text_input">
                                                    </div>--%>
                                                    <span>Amount</span>
                                                    <input type="text" name="cu_amount" id="cu_amount" tabindex="2" maxlength="13" readonly="readonly" />
                                                    <br />
                                                    <span id="cu_amount_p" class="invalid_entry" style="display: none;">(Invalid Amount)
                                                    </span><span style="font-size: 13px" id="taka"></span>
                                                </div>
                                            </div>

                                            <div>

                                                <%-- <div id="cu_date_div" style="font-size: 14px; border: 1px solid #CCCC99; margin: 2px 0 2px 5px; padding: 2px; height: 18px; width: 130px;"
                                                    class="text_input">
                                                </div>--%>
                                                <span>Issue Date</span>
                                                <asp:TextBox ID="cu_date" runat="server" EnableViewState="False" CssClass="cu_date"
                                                    Width="100px" TabIndex="3" ReadOnly="True"></asp:TextBox>
                                                <%--<asp:Image CssClass="cu_date_img" ID="Image1" runat="server" ImageUrl="~/media/images/calendar.gif"
                                                    Visible="false" />
                                                <cc1:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender1" runat="server" TargetControlID="cu_date"
                                                    PopupButtonID="Image1">
                                                </cc1:CalendarExtender>
                                                <br />--%>
                                                <span id="cu_date_p" class="invalid_entry" style="display: none;">(Date Invalid)</span>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <%--<div id="grp_amount" class="no_notification">
                                        <label class="clearboth">
                                            Amount
                                        </label>
                                        <div id="cu_amount_div" style="font-size: 14px; border: 1px solid #CCCC99; margin: 2px 0 2px 5px; padding: 2px; height: 18px; width: 130px;"
                                            class="text_input">
                                        </div>
                                        <input style="display: none;" type="text" name="cu_amount" id="cu_amount" tabindex="2"
                                            maxlength="13" readonly="readonly" />
                                        <br />
                                        <span id="cu_amount_p" class="invalid_entry" style="display: none;">(Invalid Amount)
                                        </span><span style="font-size: 13px" id="taka"></span>
                                    </div>--%>
                                </td>
                                <td></td>
                                <td class="chkInfo">
                                    <div id="grp_img_amount" class="no_notification">
                                        <label>
                                            <input class="check_label" id="con_amt_usability" type="checkbox" checked="checked"
                                                tabindex="101" /></label>
                                        <div id="div_img_amount" class="image_input">
                                            <img class="chq" id="img_amount" src="" alt="Amount" />
                                        </div>
                                    </div>
                                    <div id="grp_img_amountWord" style="clear: both; margin-top: 2px;" class="no_notification">
                                        <label class="clearboth">
                                            <input class="check_label" id="amountinwords_legal_usability" type="checkbox" checked="checked"
                                                tabindex="102" />
                                        </label>
                                        <div id="div_img_amountWord" class="image_input">
                                            <img class="chq" id="img_amountWord" src="" alt="Amount In Words" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="dataEntry">
                                    <%--  <div id="grp_date" class="no_notification">
                                        <label for="cu_date">
                                            Issue Date</label>
                                        <div id="cu_date_div" style="font-size: 14px; border: 1px solid #CCCC99; margin: 2px 0 2px 5px; padding: 2px; height: 18px; width: 130px;"
                                            class="text_input">
                                        </div>
                                        <asp:TextBox ID="cu_date" runat="server" EnableViewState="False" CssClass="cu_date"
                                            Width="100px" TabIndex="3" Visible="false"></asp:TextBox>
                                        <asp:Image CssClass="cu_date_img" ID="Image1" runat="server" ImageUrl="~/media/images/calendar.gif"
                                            Visible="false" />
                                        <cc1:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender1" runat="server" TargetControlID="cu_date"
                                            PopupButtonID="Image1">
                                        </cc1:CalendarExtender>
                                        <br />
                                        <span id="cu_date_p" class="invalid_entry" style="display: none;">(Date Invalid)</span>
                                    </div>--%>
                                    &nbsp;
                                </td>
                                <td></td>
                                <td class="chkInfo">
                                    <div id="grp_img_date" class="no_notification">
                                        <label for="date_usability">
                                            <input class="check_label" name="date_usability" id="date_usability" type="checkbox"
                                                checked="checked" tabindex="103" />
                                        </label>
                                        <div id="div_img_date" class="image_input" style="">
                                            <img class="chq" id="img_date" src="" style="" alt="Issuing Date" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="dataEntry">
                                    <%--<div id="grp_payee" class="no_notification" style="display: none;">
                                        <label>
                                            Benif. Name
                                        </label>
                                        <div id="cu_payee_div" style="font-size: 14px; border: 1px solid #CCCC99; margin: 2px 0 2px 5px; padding: 2px; height: 18px; width: 130px;"
                                            class="text_input">
                                        </div>
                                        <input style="display: none;" type="text" name="cu_payee" id="cu_payee" tabindex="4"
                                            readonly="readonly" />
                                    </div>--%>
                                    &nbsp;
                                </td>
                                <td></td>
                                <td class="chkInfo">
                                    <%--<div id="grp_img_payee" class="no_notification">
                                        <label class="clearboth">
                                            <input class="check_label" id="payee_usability" type="checkbox" checked tabindex="104" />
                                        </label>
                                        <div id="div_img_payee" class="image_input" style="">
                                            <img class="chq" id="img_payee" src="" style="" alt="Payee Name" />
                                        </div>
                                    </div>--%>
                                </td>
                            </tr>
                            <tr>
                                <td class="dataEntry" rowspan="2">
                                    <div id="Div3" class="no_notification" style="display: none;">
                                        <label style="padding: 0px;">
                                            Contact Info
                                        </label>
                                        <div id="divCBSLoading" style="height: 16px; display: none;">
                                            <div style="margin-left: 10px; width: 16px; height: 16px; float: left;">
                                                <img src="media/outward/loading.gif" />
                                            </div>
                                            <div style="margin-left: 10px; height: 16px; float: left;">
                                                Loading...
                                            </div>
                                        </div>
                                    </div>
                                    <div id="Div6" class="clearboth no_notification" style="padding: 5px; border: 1px solid rgb(204, 204, 153); margin-left: 5px; display: none;">
                                        <div id="cu_contact_div" style="font-size: 14px; padding: 5px; width: 210px;">
                                        </div>
                                        <div type="text" id="cu_benif_address" tabindex="1000" style="width: 210px; padding: 5px;">
                                        </div>
                                    </div>
                                </td>
                                <td></td>
                                <td class="chkInfo">
                                    <div style="display: none; float: left;" id="grp_img_payer" class="no_notification">
                                        <label class="clearboth">
                                            <input class="check_label" id="payer_details_usability" type="checkbox" checked tabindex="105" />
                                        </label>
                                        <div id="div_img_payer" class="image_input" style="">
                                            <img alt="Payer" class="chq" id="img_payer" src="" style="" />
                                        </div>
                                    </div>
                                    <div id="grp_img_signature" class="no_notification">
                                        <label class="clearboth">
                                            <input class="check_label" id="signature_usability" type="checkbox" checked tabindex="106" />
                                        </label>
                                        <div id="div_img_sig" class="image_input" style="">
                                            <img alt="Signature" class="chq" id="img_sig" src="" style="" />
                                        </div>
                                    </div>
                                </td>
                                <td></td>
                                <td class="chkInfo2" rowspan="2" style="display: none">
                                    <div>
                                        <div style="float: right; width: 225px; padding: 5px; height: 87px;">
                                            <div style="width: 225px; height: 17px; border-bottom: 1px dashed #dda0dd; margin-bottom: 3px; text-align: center;">
                                                Issuing Bank
                                            </div>
                                            <div class="no_notification" style="width: 215px; height: 60px; padding: 5px; font-size: 12px; font-weight: normal;">
                                                <table>
                                                    <tr>
                                                        <td align="right">Bank:
                                                        </td>
                                                        <td>
                                                            <!--<div id="divIssuingBank" style="font-weight: bold;">
                                                            </div>-->
                                                        </td>
                                                    </tr>
                                                    <%-- <tr>
                                                    <td align="right">
                                                        Branch:
                                                    </td>
                                                    <td>
                                                        <div id="divIssuingBranch" style="font-weight: bold;">
                                                        </div>
                                                    </td>
                                                </tr>--%>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td class="chkInfo">
                                    <div id="grp_img_micr" class="no_notification">
                                        <label style="width: 30px;">
                                            MICR
                                        </label>
                                        <div id="micr_div_edit" class="hidden">
                                            <input type="text" style="display: none; padding: 2px; margin-top: 0px; height: 18px; width: 400px;"
                                                name="cu_micr_text" id="cu_micr_text" />
                                            <div id="micr_text_parsable">
                                                <input maxlength="7" type="text" style="width: 60px;" name="cu_micr_text" id="cu_micr_text_s" />
                                                <input maxlength="9" type="text" style="width: 75px;" name="cu_micr_text" id="cu_micr_text_r" />
                                                <input maxlength="13" type="text" style="width: 110px;" name="cu_micr_text" id="cu_micr_text_a" />
                                                <input maxlength="2" type="text" style="width: 20px;" name="cu_micr_text" id="cu_micr_text_t" />
                                            </div>
                                            <div>
                                                <a class="noborder" id="done_edit_micr" href="javascript:void(0)">OK</a>
                                            </div>
                                            <div>
                                                <a class="noborder" id="cancel_edit_micr" href="javascript:void(0)">Cancel</a>
                                            </div>
                                        </div>
                                        <div id="micr_div">
                                            <div id="cu_micr_div" style="display: none;" class="micr_ok" class="text_input_micr">
                                            </div>
                                            <div id="micr_div_parsable">
                                                <div id="cu_micr_div_s" style="width: 60px;" class="micr_ok">
                                                </div>
                                                <div id="cu_micr_div_r" style="width: 75px;" class="micr_ok">
                                                </div>
                                                <div id="cu_micr_div_a" style="width: 110px;" class="micr_ok">
                                                </div>
                                                <div id="cu_micr_div_t" style="width: 20px;" class="micr_ok">
                                                </div>
                                            </div>
                                            <div>
                                                <a style="display: none;" class="noborder" id="edit_micr" href="javascript:void(0)">Modify</a>
                                            </div>
                                        </div>
                                        <div id="div_img_micr" class="image_input clearboth" style="margin-left: -5px; height: 25px; padding: 0;">
                                            <img class="chq" id="img_micr" src="" style="" alt="MICR" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div class="spacer">
                        </div>
                    </div>
                </div>
                <div style="clear: both; height: 32px;">
                    <div class="buttons">
                        <button type="button" class="positive" id="yes" name="yes" tabindex="5">
                            <img src="/media/outward/apply.png" alt="" />
                            Accept
                        </button>
                        <button type="button" class="negative" id="reject" name="reject" tabindex="6">
                            <img src="/media/outward/cross.png" alt="" />
                            Reject
                        </button>
                        <button type="button" class="negative" id="remake" name="remake" tabindex="7">
                            <img src="/media/outward/cross.png" alt="" />
                            Remake
                        </button>
                        <button type="button" class="regular" id="front_image" name="front_image" tabindex="8">
                            <img src="/media/outward/textfield_key.png" alt="" />
                            Front
                        </button>
                        <button type="button" class="regular" id="rear_image" name="back_image" tabindex="9">
                            <img src="/media/outward/textfield_key.png" alt="" />
                            Back
                        </button>
                        <button style="display: none;" type="button" class="regular" id="deposit_slip" name="deposit_slip"
                            tabindex="10">
                            <img src="/media/outward/textfield_key.png" alt="" />
                            Deposit Slip
                        </button>
                        <button type="button" class="positive" id="prev" name="prev">
                            <img src="/media/outward/apply.png" alt="" />
                            Previous
                        </button>
                        <button type="button" class="positive" id="next" name="next">
                            <img src="/media/outward/apply.png" alt="" />
                            Next
                        </button>
                        <button type="button" class="regular" id="cancel" name="cancel" style="float: right; margin-right: 14px;">
                            <img src="/media/outward/cross.png" alt="" />
                            Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal for Blocking Data Entry Dialog. -->
        <div id="divModalInformation" class="ModalCenter" style="z-index: 600; height: 570px; width: 960px; margin-top: -280px; margin-left: -480px; background-color: #000; display: none;">
        </div>
        <!-- Rejection Dialog -->
        <div id="rejection_dialog" class="outward_form ModalCenter" style="z-index: 600; width: 260px; margin-top: -200px; margin-left: -130px; display: none;">
            <h3 class="topBar">Rejection Reason
            </h3>
            <div id="rejection">
                <ul class="hidden" id="auto_reject_reason" style="padding: 5px 0px 10px 20px; margin: 0px;">
                </ul>
                <label style="text-align: left; width: 200px;">
                    Rejection Reason</label>
                <textarea id="rejection_reason" style="width: 240px; height: 100px; text-align: left"></textarea>
                <div class="buttons" style="margin-top: 5px; height: 30px;">
                    <button type="button" class="positive" id="reject_confirm" name="reject_confirm">
                        <img src="media/outward/apply.png" alt="" />
                        Reject
                    </button>
                    <button type="button" class="regular" id="cancel_reject" name="cancel_reject">
                        <img src="media/outward/cross.png" alt="" />
                        Cancel
                    </button>
                    <div style="clear: both;">
                    </div>
                </div>
            </div>
        </div>
        <!-- Moday Database Updating... -->
        <div id="divDatabaseUpdating" style="display: none;">
            <div id="divModalDialogBackground" class="ModalCenter">
            </div>
            <div id="divModalDialogContent" class="ModalCenter" style="border: 1px solid #AACCEE;">
                <div style="height: 32px; width: 490px; padding: 5px; margin-left: auto; margin-right: auto;">
                    <img src="/media/images/busy.gif" style="width: 32px; height: 32px; float: left;" />
                    <div style="height: 32px; float: left;">
                        <div id="divUpdateMessage" style="width: 400px; margin-top: 7px; margin-left: 10px; font-size: 14px; font-weight: bold;">
                            Please wait for Server Response...
                        </div>
                    </div>
                    <div style="clear: both">
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery Dialog -->
        <div id="dialogPopupImage" title="Image View" style="display: none; width: 500px; height: 250px;">
            <img style="" id="popup_image" height="100%" width="100%" alt="" src="" />
        </div>
        <!-- -->
        <!-- Control Ids -->
        <input id="today_date" type="hidden" value="<%= DateTime.Today.ToString("yyyy/MM/dd") %>" />
        <div id="control_ids" runat="server">

            <script>
                var benifAccLength = '<%= this.BenifAccountLength %>' | 0;
                <% generateListId(); %>
                <%=generateJSClientId() %>
            </script>

            <script type="text/javascript">
                $(document).ready(function () {
                    $("#divOWEditorBackground").css("opacity", 0.20);
                    $("#divModalInformation").css("opacity", 0.20);
                    $("#divModalDialogBackground").css("opacity", 0.20);
                });
            </script>

        </div>
    </form>
</asp:Content>
