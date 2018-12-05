<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DropdownClearingType.ascx.cs" Inherits="Accs.Web.usercontrol.DropdownClearingType" %>
<asp:DropDownList ID="ddlClearingType" runat="server" DataTextField="Text" DataValueField="Value" AppendDataBoundItems="True" OnSelectedIndexChanged="SelectedClearingType">
    <asp:ListItem Value="0">All</asp:ListItem>
</asp:DropDownList>
