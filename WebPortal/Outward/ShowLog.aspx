<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowLog.aspx.cs" Inherits="Accs.Web.Admin.ShowLog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="../Style/Process.css" rel="stylesheet" type="text/css" />    
    <link href="../Style/ach.css" rel="stylesheet" type="text/css" />    
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="gvLog" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#EFefef" />
            <Columns>
                <asp:BoundField DataField="LogTime" HeaderText="Time">
                <ItemStyle HorizontalAlign="Center" Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="LogUser" HeaderText="User">
                <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="LogType" HeaderText="Type">
                <ItemStyle HorizontalAlign="Center" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="LogDetails" HeaderText="Details">
                <ItemStyle HorizontalAlign="Center" Width="300px" />
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
