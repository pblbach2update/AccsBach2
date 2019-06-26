<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showtime.aspx.cs" Inherits="Accs.Web.showtime" EnableSessionState="false"%>

<html>
<head>
    <link type="text/css" rel="Stylesheet" href="Style/Header.css" />
    <script type="text/javascript">
        var curDate = new Date('<%=DateTime.Now.ToString("MMMM dd, yyyy, HH:mm:ss")%>');
        function testMethod() {
            curDate.setSeconds(curDate.getSeconds() + 1);
            var h = curDate.getHours();
            var m = curDate.getMinutes();
            document.getElementById("lbServerTime").innerHTML = h + ":" + m;
            
            
        }
        //setTimeout(testMethod, 1000);
        setInterval(testMethod, 1000);
        testMethod();


    </script>
</head>
<body style="background:#f0f0f0 url(/media/images/topMenuBack.png) repeat-x scroll 0px 0px;">
    <form id="form1" runat="server">
    <div style="margin-top: 5px;font-weight: bold" >
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <img  height="18px" src="/media/images/clock2.png"/><span id="lbServerTime"><%=DateTime.Now.ToString("HH:mm") %></span>
        
        
        
        <input type="button" name="btShowClock" value="ShowClock" onclick="testMethod()"/>
    </div>
    </form>
</body>
</html>
