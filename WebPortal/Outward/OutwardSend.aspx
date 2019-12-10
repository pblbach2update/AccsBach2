<%@ Page Title="" Language="C#" MasterPageFile="~/Outward/Outward.Master" AutoEventWireup="true"
    CodeBehind="OutwardSend.aspx.cs" Inherits="Accs.Web.Outward.OutwardSend" ValidateRequest="false"
    ClientIDMode="Static" %>

<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="clrTypeInfo" Src="~/usercontrol/DropdownClearingType.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="OutwardHead" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Style/ach.css" />
    <link type="text/css" rel="Stylesheet" href="../Style/outward.css" />
    <link type="text/css" rel="Stylesheet" href="../Style/outward_button.css" />
    <link type="text/css" rel="Stylesheet" href="../Style/OutwardGridView.css" />
    <link type="text/css" href="/Style/admin.css" rel="Stylesheet" />
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script>
        $(function () {

            $("#chkSelectAll").change(function () {
                var toggle = false;

                if ($(this).is(":checked")) {
                    toggle = true;

                }

                $("#gvSendList tr td  input:checkbox").each(
                        function () {

                            $(this).prop("checked", toggle);
                        }

                 );




            });
            $("#chkXmLAll").change(function () {
                var toggle = false;

                if ($(this).is(":checked")) {
                    toggle = true;

                }

                $("#gvOCEList tr td input:checkbox").each(
                        function () {

                            $(this).prop("checked", toggle);
                        }

                 );




            });

        });
    </script>
    <title>Outward XML Send</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="OutwardBody" runat="server">
    <form runat="server" style="padding: 10px;">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table style="width: 100%" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3">
                    <span class="headText2" style="margin-left: 0px;">Settings</span>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="userBox" style="">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:TextBox ID="batchDate" runat="server" BorderColor="#888888" BorderStyle="Solid"
                                        BorderWidth="1px" Width="100px" Font-Names="Trebuchet MS" Font-Size="12px" OnTextChanged="batchDate_TextChanged"
                                        AutoPostBack="True"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                        TargetControlID="batchDate" Format="dd/MM/yyyy">
                                    </cc1:CalendarExtender>
                                    <asp:Image ID="Image1" runat="server" Height="15px" ImageUrl="~/media/images/calendar.gif" />
                                </td>
                                <td>
                                    <asp:PlaceHolder runat="server" ID="phbrlist">
                                        <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="True" IsAdmin="True"
                                            OnOnAutoPostBackControl="Selectedindexchanged" includeBureau="True" />
                                    </asp:PlaceHolder>
                                </td>
                                <td>
                                    <uc:clrTypeInfo ID="clType" runat="server" AutoPostBackOnChange="True" Type="0"
                                        OnDropDownChanging="Loadinfo"></uc:clrTypeInfo>
                                </td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddlCurrencyType" Font-Names="Trebuchet MS" Font-Size="9pt" AutoPostBack="True"
                                        OnSelectedIndexChanged="FilterCurrencyInNetSettlement" AppendDataBoundItems="True">
                                        <asp:ListItem Text="All Currency" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" OnClick="RefreshSendList" ImageUrl="~/media/images/reload.png" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <span class="headText2" style="margin-left: 0px;">Select Batches</span>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="userBox" style="">
                        <asp:Button ID="btnGenerateXml" runat="server" Font-Names="Trebuchet MS" Font-Size="10pt"
                            OnClick="btnGenerateXml_Click" Text="Generate XML" Style="padding: 4px" />
                        <asp:GridView ID="gvSendList" Style="text-align: center; width: 100%" runat="server"
                            AutoGenerateColumns="False" CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle"
                            HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle">
                            <RowStyle CssClass="OW_RowStyle"></RowStyle>
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkSelectAll" runat="server" Checked="True" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkbox" runat="server" Checked="True" />
                                        <asp:HiddenField ID="hidbatchid" runat="server" Value='<%# Eval("BatchID") %>' />
                                        <asp:HiddenField ID="hdclrtype" runat="server" Value='<%# Eval("ClearingTypeInt") %>' />
                                        <asp:HiddenField ID="hdBranchId" runat="server" Value='<%# Eval("branchId") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="BatchNo" HeaderText="Batch No"></asp:BoundField>
                                <asp:BoundField DataField="CurrencyType" HeaderText="Currency"></asp:BoundField>
                                <asp:BoundField DataField="presentingBranch" HeaderText="Branch Name"></asp:BoundField>
                                <asp:BoundField DataField="clearingType" HeaderText="Type"></asp:BoundField>
                                <asp:BoundField DataField="StatusOCE" HeaderText="Status"></asp:BoundField>
                                <asp:BoundField DataField="CheckerAccept" HeaderText="Accepted">
                                    <ItemStyle Font-Bold="true" ForeColor="#007722" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CheckerAcceptAmount" HeaderText="Total Amount" />
                                <asp:BoundField DataField="CheckerReject" HeaderText="Rejected" />
                                <asp:BoundField DataField="Total" HeaderText="Total" />
                            </Columns>
                            <EmptyDataTemplate>
                                No new outward cheques found for sending.
                            </EmptyDataTemplate>
                            <PagerStyle CssClass="OW_PagerStyle"></PagerStyle>
                            <HeaderStyle CssClass="OW_HeaderStyle"></HeaderStyle>
                            <AlternatingRowStyle CssClass="OW_AltRowStyle"></AlternatingRowStyle>
                        </asp:GridView>
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <span class="headText2" style="margin-left: 0px;">Send XML</span>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="userBox" style="">
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Button runat="server" ID="btSendAllFilesToPBM" Text="Send All To PBM" Style="padding: 3px"
                                        OnClick="SendAllToPbmNew" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbOCECount" runat="server" Text=""></asp:Label>
                                    <asp:GridView ID="gvOCEList" runat="server" AutoGenerateColumns="False" CellPadding="1"
                                        ForeColor="#333333" GridLines="None" Style="text-align: center" Width="100%">
                                        <RowStyle BackColor="#FFFFFF" ForeColor="#333333" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkXmLAll" runat="server" Checked="True" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkbox" runat="server" Checked="True" />
                                                    <asp:HiddenField ID="fileName" runat="server" Value='<%# Eval("Name") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Name" HeaderText="Name">
                                                <ItemStyle HorizontalAlign="Left" Width="45%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Length" HeaderText="Size (bytes)" />
                                            <asp:BoundField DataField="CreationTime" HeaderText="Date" />
                                        </Columns>
                                        <EmptyDataTemplate>
                                            No Files Found.
                                        </EmptyDataTemplate>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#a0a0a0" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#b0b0b0" />
                                        <AlternatingRowStyle BackColor="#f8f8f8" ForeColor="#111111" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <asp:Label ID="lblUploadMessage" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
