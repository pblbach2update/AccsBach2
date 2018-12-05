<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewItemImage.aspx.cs"
    Inherits="Accs.Web.Admin.ViewItemImage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cheque Images</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: right">
        <asp:ImageButton ID="imgButtonPrint" runat="server" ImageUrl="/media/images/print.png"
            OnClientClick="window.print();return false;" />
    </div>
    <div>
        <div style="margin: 0 auto; width: 540px">
            <asp:Image ID="chqfront" runat="server" AlternateText="No Front Image Found" BorderColor="#3C516A"
                BorderStyle="Solid" BorderWidth="3px" ToolTip="Front Image" Width="520px" />
        </div>
        <div style="margin: 0 auto; width: 540px">
            <asp:Image ID="chqBack" runat="server" AlternateText="No Front Image Found" BorderColor="#3C516A"
                BorderStyle="Solid" BorderWidth="3px" ToolTip="Front Image" Width="520px" />
        </div>
    </div>
    </form>
</body>
</html>
