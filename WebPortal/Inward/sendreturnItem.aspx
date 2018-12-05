<%@ Page Title="" Language="C#" MasterPageFile="~/Inward/InwardMenu.Master" AutoEventWireup="true"
    CodeBehind="sendreturnItem.aspx.cs" Inherits="Accs.Web.Inward.sendreturnItem" %>

<%@ Register TagPrefix="uc" TagName="brlist" Src="~/usercontrol/BranchListNew.ascx" %>
<%@ Register TagPrefix="uc" TagName="clrTypeInfo" Src="~/usercontrol/DropdownClearingType.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headInward" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Style/OutwardGridView.css" />
    <link type="text/css" href="../Style/admin.css" rel="Stylesheet" />
    <title>Return XML</title>
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script>
        $(function () {

            $("#chkall").change(function () {
                var toggle = false;

                if ($(this).is(":checked")) {
                    toggle = true;

                }

                $("input:checkbox").each(
                        function () {

                            $(this).prop("checked", toggle);
                        }

                 );




            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <form id="Form1" runat="server" style="padding: 10px;">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table style="width: 100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:PlaceHolder runat="server" ID="phbrlist">
                    <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="True" IsAdmin="True"
                        OnOnAutoPostBackControl="selectedindexchanged" includeBureau="True" />
                </asp:PlaceHolder>
            </td>
            <td>
                <uc:clrTypeInfo ID="clType" runat="server" AutoPostBackOnChange="True" Type="1" OndropDownChanging="loadinfo">
                </uc:clrTypeInfo>
            </td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" OnClick="RefreshSendList" ImageUrl="~/media/images/reload.png" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div class="userBox" style="">
                    <div>
                        <asp:LinkButton ID="lbSendAll" runat="server" Font-Size="14px" OnClick="SendAllToPbmNew">Send All To Pbm</asp:LinkButton></div>
                    <asp:GridView ID="gvSendList" Style="text-align: center; width: 100%" runat="server"
                        AutoGenerateColumns="False" CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle"
                        HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle">
                        <RowStyle CssClass="OW_RowStyle"></RowStyle>
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <input type="checkbox" id="chkall" checked="checked" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkbox" runat="server" Checked="True" AutoPostBack="False" />
                                    <asp:HiddenField ID="hidchequeid" runat="server" Value='<%# Eval("ChequeID") %>' />
                                    <asp:HiddenField ID="hdClrType" runat="server" Value='<%# Eval("clrType") %>' />
                                    <asp:HiddenField ID="hdsetlementdate" runat="server" Value='<%# Eval("SettlementDate","{0:dd/MM/yyyy HH:mm }") %>' />
                                    <asp:HiddenField ID="hdirout" runat="server" Value='<%# Eval("IssuingRoutingNumber") %>' />
                                    <asp:HiddenField ID="hidbunid" runat="server" Value='<%# Eval("BundleId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="IssuingBranchName" HeaderText="Branch Name"></asp:BoundField>
                            <asp:BoundField DataField="ReturnReason" HeaderText="Return Reason">
                                <ItemStyle Width="16%" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="clearingType" HeaderText="Type" />--%>
                            <asp:BoundField DataField="ChequeSequence" HeaderText="Serial">
                                <ItemStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Amount" HeaderText="Amount" />
                            <asp:BoundField DataField="ChequeAccount" HeaderText="A/C" />
                            <asp:BoundField DataField="OREFileName" HeaderText="File">
                                <ItemStyle Width="30%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ClrTypeString" HeaderText="Type" />
                        </Columns>
                        <EmptyDataTemplate>
                            No new dishonor cheques found.
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="OW_PagerStyle"></PagerStyle>
                        <HeaderStyle CssClass="OW_HeaderStyle"></HeaderStyle>
                        <AlternatingRowStyle CssClass="OW_AltRowStyle"></AlternatingRowStyle>
                    </asp:GridView>
                </div>
            </td>
        </tr>
        <%--<tr>
            <td style="width: 70%">
                <asp:Label ID="lbGenResult" runat="server" Font-Bold="true" Text=""></asp:Label>
            </td>
        </tr>--%>
    </table>
    
    </form>
</asp:Content>
