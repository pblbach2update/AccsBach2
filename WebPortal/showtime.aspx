<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showtime.aspx.cs" Inherits="Accs.Web.showtime" EnableSessionState="false"%>

<html>
<head>
    <link type="text/css" rel="Stylesheet" href="Style/Header.css" />
    <meta http-equiv="refresh" content="60" />
</head>
<body style="background:#f0f0f0 url(/media/images/topMenuBack.png) repeat-x scroll 0px 0px;">
    <form id="form1" runat="server">
    <div style="margin-top: 5px;font-weight: bold" >
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <img  height="18px" src="\media/images/clock2.png"/><%=DateTime.Now.ToString("hh:mm tt") %>
    </div>
    </form>
</body>
</html>
