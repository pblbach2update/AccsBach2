<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SettingUC.ascx.cs" Inherits="Accs.Web.usercontrol.SettingUC" %>

<div id="scontainer">
    <asp:Label runat="server" ID="lbSettingsName"></asp:Label> 
    
    <asp:TextBox runat="server" ID="tbsettingsValue" Width="100"></asp:TextBox> 
    
    <asp:CheckBox runat="server" ID="stEnableDisable" Visible="False"/>

    <asp:Button runat="server" ID="btUpdate" OnClick="OnSettingsUpdateClicked" Text="Update"/>
</div>

