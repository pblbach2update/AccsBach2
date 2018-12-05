<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CbsView.aspx.cs" Inherits="Accs.Web.Admin.CbsView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Style/Process.css" rel="stylesheet" type="text/css" />
    <link href="../Style/ach.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <table class="head" width="500px" cellpadding="5px">
            <tr>
                <td>
                    <asp:Label Text="ClearingType" ID="lbClearingType" runat="server" />
                </td>
                <td>
                    <asp:Label Text="Date" ID="lbDate" runat="server" />
                </td>
                <td>
                    <asp:Label Text="IRE" ID="lbIRE" runat="server" />
                </td>
                <td>
                    <asp:Label Text="0" ID="lbCount" runat="server" />
                </td>
            </tr>
        </table>
        <br/>
        <asp:GridView ID="gvLog" runat="server" AutoGenerateColumns="False" Width="90%" CellPadding="4"
            ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#EFefef" />
            <Columns>
                <asp:BoundField DataField="CBSItemId" HeaderText="CBSItemId">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ChequeId" HeaderText="ChequeId">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ChequeNo" HeaderText="ChequeNo">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ChequeAccNo" HeaderText="ChequeAccNo">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Amount" HeaderText="Amount">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ErrorCode" HeaderText="ErrorCode">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ErrorMessage" HeaderText="ErrorMessage">
                    <ItemStyle HorizontalAlign="Center" Width="280px" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#006699" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#909090" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#b0b0b0" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
