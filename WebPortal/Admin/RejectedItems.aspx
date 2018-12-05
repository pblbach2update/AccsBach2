<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RejectedItems.aspx.cs"
    Inherits="Accs.Web.Admin.RejectedItems" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rejected Items</title>
    <link type="text/css" rel="Stylesheet" href="../Style/OutwardGridView.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>
            Rejected Items</h3>
        <hr />
        <div class="userBox" style="height: 800px">
            <asp:GridView ID="gvSendList" Style="text-align: center; width: 100%" runat="server"
                AutoGenerateColumns="False" CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle"
                HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle">
                <RowStyle CssClass="OW_RowStyle"></RowStyle>
                <Columns>
                    <asp:BoundField DataField="BranchName" HeaderText="Branch Name"></asp:BoundField>
                    <asp:BoundField DataField="BankName" HeaderText="Bank Name"></asp:BoundField>
                    <asp:BoundField DataField="ChequeSeqNo" HeaderText="Cheque No"></asp:BoundField>
                    <asp:BoundField DataField="ChequeAccNo" HeaderText="Account Number"></asp:BoundField>
                    <asp:BoundField DataField="tranCode" HeaderText="Tran Code">
                       
                    </asp:BoundField>
                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                    <asp:BoundField DataField="ReturnReason" HeaderText="Reason"  />
                    <asp:BoundField DataField="ClearingTypeString" HeaderText="Clearing Type" />
                    
                </Columns>
                <EmptyDataTemplate>
                    No Rejected items found.</EmptyDataTemplate>
                <PagerStyle CssClass="OW_PagerStyle"></PagerStyle>
                <HeaderStyle CssClass="OW_HeaderStyle"></HeaderStyle>
                <AlternatingRowStyle CssClass="OW_AltRowStyle"></AlternatingRowStyle>
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
