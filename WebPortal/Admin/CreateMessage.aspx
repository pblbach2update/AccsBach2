<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="CreateMessage.aspx.cs" Inherits="Accs.Web.Admin.CreateMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form runat="server">
    <asp:Label ID="MsgLabel" CssClass="messageLabel" runat="server" Text="Label" Visible="False"></asp:Label>
    <table cellspacing="4" >
        <tr>
            <td valign=top>
                Select Branch :
            </td>
            <td>
                <div style="float: left"><asp:ListBox ID="lbBranchList" runat="server"  SelectionMode=Multiple 
                    Width="240px" Rows=10 AppendDataBoundItems="True">
                    <asp:ListItem Text="All" Value="0"></asp:ListItem>
                </asp:ListBox></div>
                    <div style="padding-left: 20px;float:left">
                    <span style="font-style: italic;font-size: 10">You can select multiple branches at a time using ctrl+Mouse Left button Click.<br />Do not select All if you want to send message to specific branches.</span>
                    </div>
            </td>
        </tr>
        <tr>
            <td>
                Subject :
            </td>
            <td>
                <asp:TextBox ID="tbSubject" runat="server" Width="397px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="tbSubject"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td valign="top">
                Message :
            </td>
            <td valign="top">
                <asp:TextBox ID="tbMessage" Columns="20" runat="server" Height="209px" TextMode="MultiLine"
                    Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="tbMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left">
                <asp:Button ID="btSend" runat="server" Text="Send" OnClick="btSend_Click" />
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
