<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true" CodeBehind="HoSettlementChecker.aspx.cs" Inherits="Accs.Web.Admin.NRB.HoSettlementChecker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" rel="Stylesheet" href="/Style/OutwardGridView.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel" runat="server">

    <form id="form1" runat="server">
        <h1>Branch Settlement</h1>
        <div>
            Waiting For Authorization :
            <asp:Label runat="server" ID="lbWaitForAuthorization"></asp:Label>
            Settled :
            <asp:Label runat="server" ID="lbSettled"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="Process" OnClick="btStartHoFundTransfer" />
        </div>
        <asp:GridView Width="800px" ID="gvHoSettlement" runat="server" CellPadding="1"
            AutoGenerateColumns="False" GridLines="Horizontal" PageSize="20" CssClass="OW_GridViewStyle"
            PagerStyle-CssClass="OW_PagerStyle" HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle"
            AlternatingRowStyle-CssClass="OW_AltRowStyle" Font-Names="Trebuchet MS" Font-Size="9pt">
            <RowStyle CssClass="RowStyle" />
            <Columns>
                <asp:BoundField DataField="BranchName" HeaderText="BranchName">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="BranchSettlementAccount" HeaderText="Settlement Account">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="NetAmount" HeaderText="Net Settlement">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SettlementStatus" HeaderText="Status">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Remarks" HeaderText="Remarks">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>

            </Columns>
        </asp:GridView>
    </form>


</asp:Content>
