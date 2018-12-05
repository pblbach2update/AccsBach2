<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FtpSettings.aspx.cs" Inherits="Accs.Web.FtpSettings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="Stylesheet" href="Style/ach.css" />
    <link type="text/css" href="Style/admin.css" rel="Stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="padding: 10px">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="upFtpSettings" runat="server">
        <ContentTemplate>
            <div>
                <table>
                    <tr>
                        <td colspan="1">
                            <span class="headText2" style="margin-left: 0px;">FTP Settings</span>
                        </td>
                        <td>
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upFtpSettings"
                                DisplayAfter="1" DynamicLayout="False">
                                <ProgressTemplate>
                                    <img src="media/images/busy.gif" width="25px" />&nbsp;&nbsp;&nbsp;&nbsp; Busy...
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="userBox" style="">
                                <table style="width: 100%" cellpadding="4">
                                    <tr>
                                        <td>
                                            IP Address
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtIPAddress" runat="server" Font-Names="Trebuchet MS" Font-Size="10pt"></asp:TextBox>
                                        </td>
                                        <td>
                                            Name
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtName" runat="server" Font-Names="Trebuchet MS" Font-Size="10pt"></asp:TextBox>
                                        </td>
                                        <td>
                                            Password
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Font-Names="Trebuchet MS"
                                                Font-Size="10pt"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Upload Path
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtUploadPath" Width="200px" runat="server" Font-Names="Trebuchet MS"
                                                Font-Size="10pt"></asp:TextBox>
                                        </td>
                                        <td>
                                            Secured FTP
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rbSFTP" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="true">Yes</asp:ListItem>
                                                <asp:ListItem Selected="True" Value="false">No</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Download ICE
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtDLICE" runat="server" Font-Names="Trebuchet MS" Font-Size="10pt"
                                                Width="200px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Download IRE
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtDLIRE" runat="server" Font-Names="Trebuchet MS" Font-Size="10pt"
                                                Width="200px"></asp:TextBox>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="right">
                                            <asp:Button ID="btnFtpConnect" runat="server" Font-Names="Trebuchet MS" Font-Size="10pt"
                                                Text="Test Connection" OnClick="btnFtpConnect_Click" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnSetFtp" runat="server" Font-Names="Trebuchet MS" Font-Size="10pt"
                                                OnClick="btnSetFtp_Click" Text="Update Settings" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="background-color: #ffffff; border: 1px solid #999999;">
                                            <asp:Label ID="lbFtpResult" runat="server" Font-Bold="True" ForeColor="#003366" Text="Ftp Result"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
