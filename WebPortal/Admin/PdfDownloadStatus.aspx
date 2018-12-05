<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PdfDownloadStatus.aspx.cs"
    Inherits="Accs.Web.Admin.PdfDownloadStatus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../Style/admin.css" rel="Stylesheet" />
    <link type="text/css" href="../Style/OutwardGridView.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server" target="_self">
    <div>
        <span class="headText2" style="margin-left: 0px;">Inward pdf download summary </span>
        <span style="text-align: right;"><a href="#" onclick="window.close()">Close</a></span>
        <hr />
        <div class="userBox" style="width: 100%">
            Status&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddldownloadStatus" runat="server" Font-Names="Trebuchet MS"
                Font-Size="12px" Width="120px" >
                <asp:ListItem Text="All" Value="0"></asp:ListItem>
                <asp:ListItem Text="Printed" Value="1"></asp:ListItem>
                <asp:ListItem Text="Not Printed" Value="2"></asp:ListItem>
            </asp:DropDownList>
            &nbsp; &nbsp Clearing Type
                <asp:DropDownList runat="server" ID="ddlClearingtype" DataTextField="name" DataValueField="value">
                    <asp:ListItem Text="Normal" Value="11"></asp:ListItem>
                    <asp:ListItem Text="HIgh Value" Value="19"></asp:ListItem>
                </asp:DropDownList>
                
                &nbsp; &nbsp;<asp:Button ID="btShow" runat="server" Text="Show" OnClick="btShow_OnClick" />
            
        </div>
        <div class="userBox" style="">
            <asp:Label runat="server" ID="lbNoBatch" Visible="false" Text="No Cheques Found"></asp:Label>
            <asp:GridView ID="gvSendList" Style="text-align: center; width: 100%" runat="server"
                AutoGenerateColumns="False" CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle"
                HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle" 
                AlternatingRowStyle-CssClass="OW_AltRowStyle" >
                <RowStyle CssClass="OW_RowStyle"></RowStyle>
                <Columns>
                    <asp:BoundField DataField="BranchName" HeaderText="Branch Name"></asp:BoundField>
                    <asp:BoundField DataField="ActionTimeString" HeaderText="Status"  />
                </Columns>
                <PagerStyle CssClass="OW_PagerStyle"></PagerStyle>
                <HeaderStyle CssClass="OW_HeaderStyle"></HeaderStyle>
                <AlternatingRowStyle CssClass="OW_AltRowStyle"></AlternatingRowStyle>
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
