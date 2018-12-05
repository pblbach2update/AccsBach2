<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="SystemSettings.aspx.cs" Inherits="Accs.Web.Admin.SystemSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" href="../Style/admin.css" rel="Stylesheet" />
    <style type="text/css">
        .rightAlign
        {
            text-align: right;
        }
    </style>
    <script type="text/javascript">

        function showFTPSettings() {

            var a = new Array;
            a[0] = 1;
            a[1] = 4;

            var url = '/FtpSettings.aspx';
            var r = window.showModalDialog(url, a, "dialogwidth: 700px; resizable: yes; dialogHide:yes");
            var formid = document.getElementsByTagName("form");
            if (r != null) {
                window.location.reload(true);
            }
        }    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form runat="server">
    <asp:Label ID="MsgLabel" CssClass="messageLabel" runat="server" Text="Label" Visible="False"></asp:Label>
    <table>
        <tr>
            <td>
                <span class="headText2" style="margin-left: 0px;">Edit System Parameters</span>
            </td>
        </tr>
        <tr>
            <td>
                <div style="float: left; width: 600px;" class="userBox">
                    <table cellpadding="4px" style="width: 600px">
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                Bank Name
                            </td>
                            <td valign="top">
                                <asp:TextBox ID="tbBankName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                Minimum Password Length
                            </td>
                            <td valign="top">
                                <asp:TextBox ID="MinPassLen" runat="server" Width="70px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                Use OCR (if MICR is absent)
                            </td>
                            <td valign="top">
                                <asp:RadioButtonList ID="rbUseOcr" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="true">Yes</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="false">No</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                Max Scan Count
                            </td>
                            <td valign="top">
                                <asp:TextBox ID="tbScanCount" runat="server" Width="70px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                Inward Batch Size
                            </td>
                            <td valign="top">
                                <asp:TextBox ID="tbInwardBatchSize" runat="server" Width="70px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                Outward (scan) Batch Size
                            </td>
                            <td valign="top">
                                <asp:TextBox ID="tbOutwardBatchSize" runat="server" Width="70px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                Stop Central Scan
                            </td>
                            <td valign="top">
                                &nbsp;<asp:CheckBox ID="chkStopScan" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                Stop Oce Xml Generation
                            </td>
                            <td valign="top">
                                &nbsp;<asp:CheckBox ID="chkStopOce" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                Stop Ore&nbsp; Xml Generation
                            </td>
                            <td valign="top">
                                &nbsp;<asp:CheckBox ID="chkStopOre" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                ACK Parsing requires for OCE
                            </td>
                            <td valign="top">
                                &nbsp;<asp:CheckBox ID="chkOceAckParse" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 215px;" class="rightAlign">
                                ACK Parsing requires for ORE
                            </td>
                            <td valign="top">
                                &nbsp;<asp:CheckBox ID="chkOreAckParse" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:ImageButton ID="btnSaveChanges" runat="server" ImageUrl="~/media/images/svchangeBtn.png"
                                    OnClick="btnSaveChanges_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" colspan="2">
                                <a href="javascript:showFTPSettings()">FTP Settings and Test</a>
                        </tr>
                    </table>
                </div>
                
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
