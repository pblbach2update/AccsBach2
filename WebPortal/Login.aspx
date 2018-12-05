<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Accs.Web.Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Style/Login.css" type="text/css" rel="Stylesheet" />
    <link href="Style/Header.css" type="text/css" rel="Stylesheet" />
    <title>ACCS Login</title>
</head>
<body style="margin: 0px; padding: 0px;">
    
    <table width="100%">
        <tr>
            <td align="center">
                <div style="margin: 20px 0 20px 0px;">
                <div style="margin: 20px 0 20px 0px;">
                    <div style="border-bottom:solid 1px #eeeeee;  ">
                        <img id="bankLogo" runat="server" alt="Bank Logo" src="/media/images/BankLogin.png" style="height: 60px; 
                            margin-bottom: 10px;" />
                    </div>
                </div>
            </td>            
        </tr>
        <tr><td align="center"><img src="media/images/accs.png" alt="" width="350px" /></td></tr>
        <tr>
            <td align="center">
                <div id="loginError">
                    <asp:Label ID="lblLoginError" runat="server" Text="Invalid Username or Password!"
                        ForeColor="#FF0066" Visible="False"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <div id="loginBox">
                    <form id="form1" runat="server">
                    <table id="loginTable" cellpadding="8">
                        <tr>
                            <td>
                                User Name
                            </td>
                            <td>
                                <asp:TextBox ID="loginNameTextBox"  runat="server" Width="150px" ForeColor="#364365"
                                    ToolTip="Enter User Name" TabIndex="1" BorderWidth="0px"  Height="16px" 
                                    Font-Names="Trebuchet MS" Font-Size="9pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password
                            </td>
                            <td>
                                <asp:TextBox ID="passwordTextBox" runat="server" Width="150px" TextMode="Password"
                                    ToolTip="Enter Your Password" Font-Names="Trebuchet MS" Font-Size="9pt" Height="16px" ForeColor="#294056" TabIndex="2" BorderWidth="0px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: right">
                                <asp:ImageButton ID="loginButton" runat="server" Height="25px" ImageUrl="~/media/images/loginBtn.png"
                                    Width="65px" AlternateText="Login" BackColor="#E2E2E2" OnClick="loginButton_Click"
                                    TabIndex="3" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <div id="loginfooter" style=" border-top:1px solid #eeeeee; background-color: #ffffff;" class="commlink">
                    <table>
                        <tr>
                            <td>
                                <a href="http://www.commlinkinfotech.com" target="_blank">
                                    <img alt="Commlink Info Tech Ltd." src="media/images/commlink.png" style="border:none;" />
                            </td>
                        </tr>
                    </table>
                   
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
