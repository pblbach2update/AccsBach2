<%@ Page Title="" Language="C#" MasterPageFile="ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="MisMatchNew.aspx.cs" Inherits="Accs.Web.Admin.MisMatchNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <meta http-equiv="refresh" content="15" />
    <link type="text/css" rel="Stylesheet" href="../Style/OutwardGridView.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server" enableviewstate="True">
    <div class="userBox" style="height: 300px;overflow: scroll;padding-right: 20px">
        <span style="font-size: 18px;">Mismatch</span> 
        <asp:DropDownList ID="ddlMismatch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="LoadMisMatchList">
            <asp:ListItem Text="Normal" Value="1"></asp:ListItem>
            <asp:ListItem Text="HighValue" Value="9"></asp:ListItem>
            <asp:ListItem Text="Inward Normal" Value="11"></asp:ListItem>
            <asp:ListItem Text="InwardHighValue" Value="19"></asp:ListItem>
            <asp:ListItem Text="OutwardRetNormal" Value="21"></asp:ListItem>
            <asp:ListItem Text="OutwardRetHighvalue" Value="29"></asp:ListItem>
            <asp:ListItem Text="InwardRetNormal" Value="31"></asp:ListItem>
            <asp:ListItem Text="InwardRetHighvalue" Value="39"></asp:ListItem>
        </asp:DropDownList>
        <hr />
        
        
        <asp:GridView Width="100%"  ID="gvInwardMismatch" runat="server" CellPadding="1"
            AutoGenerateColumns="False" GridLines="Horizontal" PageSize="20" CssClass="OW_GridViewStyle"
            PagerStyle-CssClass="OW_PagerStyle" HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle"
            AlternatingRowStyle-CssClass="OW_AltRowStyle" Font-Names="Trebuchet MS" Font-Size="9pt"
            >
            <RowStyle CssClass="RowStyle" />
            <Columns>
                <asp:BoundField DataField="run" HeaderText="Run/BatchNo" />
                <asp:BoundField DataField="BofdBranchName" HeaderText="Branch Name" />
                <asp:BoundField DataField="IssuingBankShortName" HeaderText="Bank Name" />
                <asp:BoundField DataField="ChequeNo" HeaderText="ChequeNo" />
                <asp:BoundField DataField="ChequeAccount" HeaderText="Account" />
                <asp:BoundField DataField="TransactionCode" HeaderText="Tran Code" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                <asp:BoundField DataField="ReturnReason" HeaderText="Reason" />
                <asp:BoundField DataField="WorkSourceString" HeaderText="Clearing Type" />
            </Columns>
        </asp:GridView>
    </div>
   <%-- <div class="userBox" style="height: 300px;overflow: scroll">
        <span style="font-size: 18px;"> Inward Return</span>
        <hr />
        <asp:GridView  ID="gvInwardReturn" runat="server" CellPadding="1" Width="100%"
            AutoGenerateColumns="False" GridLines="Horizontal" PageSize="20" CssClass="OW_GridViewStyle"
            PagerStyle-CssClass="OW_PagerStyle" HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle"
            AlternatingRowStyle-CssClass="OW_AltRowStyle" Font-Names="Trebuchet MS" Font-Size="9pt"
            HorizontalAlign="Center">
            <RowStyle CssClass="RowStyle" />
            <Columns>
                <asp:BoundField DataField="run" HeaderText="Run" />
                <asp:BoundField DataField="BofdBranchName" HeaderText="Branch Name" />
                <asp:BoundField DataField="IssuingBankShortName" HeaderText="Bank Name" />
                <asp:BoundField DataField="ChequeNo" HeaderText="ChequeNo" />
                <asp:BoundField DataField="ChequeAccount" HeaderText="Account" />
                <asp:BoundField DataField="TransactionCode" HeaderText="Tran Code" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                <asp:BoundField DataField="ReturnReason" HeaderText="Reason" />
                <asp:BoundField DataField="WorkSourceString" HeaderText="Clearing Type" />
            </Columns>
        </asp:GridView>
    </div>--%>

    </form>
</asp:Content>
