<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BranchSummary.aspx.cs"
    Inherits="Accs.Web.Outward.BranchSummary" 
    ValidateRequest="false"
    %>

<html>
<head>
    <title>Branch Summary</title>
    <link type="text/css" href="../Style/ach.css" rel="Stylesheet" />
    <link type="text/css" href="../Style/admin.css" rel="Stylesheet" />
    <style type="text/css">
        table
        {
            font-size: 12px;
        }
    </style>
</head>
<body style="padding: 10px">
    <form id="form1" runat="server">
    <div>
        <div class="userBox" style="width: 100%">
            Batch No :
            <asp:Label ID="lbDepositBranch" runat="server"></asp:Label>
        </div>
        <asp:GridView Width="100%" ID="gvBranchSummary" AutoGenerateColumns="False" runat="server"
            CellPadding="8" ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#f2f2f2" HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="ChequeSequence" HeaderText="Cheque No" />
                <asp:BoundField DataField="BenificiaryAccount" HeaderText="Beneficiary A/C" />
                <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                <asp:BoundField DataField="IssuingBankShortName" HeaderText="Bank" />                
                <asp:BoundField DataField="Status" HeaderText="Status" />
                
            </Columns>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#777777" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
