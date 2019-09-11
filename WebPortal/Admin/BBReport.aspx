<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BBReport.aspx.cs" Inherits="Accs.Web.Admin.BBReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>BB Report</title>
    <link href="/Style/table.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            BB Report 
            <asp:DropDownList runat="server" ID="ddlCurrency" AutoPostBack="true" OnSelectedIndexChanged="ddlCurrency_OnSelectedIndexChanged" AppendDataBoundItems="True">
                <asp:ListItem Text="All Currency" Value="-1"></asp:ListItem>
            </asp:DropDownList>
            <hr />
        </div>

        <div style="width: 1400px; margin: 0 auto; float: left">
            <asp:PlaceHolder runat="server" ID="phGroupReport"></asp:PlaceHolder>

        </div>


    </form>
</body>
</html>
