<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="CbsAction.aspx.cs" Inherits="Accs.Web.Admin.CbsAction" Culture="en-US"
    UICulture="en-US" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Style/OutwardGridView.css" />
    <style type="text/css">
        ._icon
        {
            width: 20px;
            background-color: #ffffff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server">
    <div id="msgdiv" runat="server" visible="False" enableviewstate="True" style="background-color: #FFFFDE;
        border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px;
        width: 800px">
    </div>
    <div style="margin: 10px 0 10px 30px">
        <div style="font-weight: bold; font-size: 16px">
            CBS Integration
            <%= settDate.ToString("dd/MM/yyyy")%>
        </div>
        <div style="width: 80%; height: 0px; border: 1px solid #DDDDDD; margin-top: 4px">
        </div>
    </div>
    <table width="80%" cellpadding="5px">
        <tr style="text-align: left; background-color: #f0f0f0; font-weight: bold">
            <td class="_icon">
                &nbsp;
            </td>
            <td>
                Type
            </td>
            <td>
                Success
            </td>
            <td>
                Failed
            </td>
            <td>
                New
            </td>
            <td>
                Action
            </td>
        </tr>
        <tr style="background-color: #D8F7F9">
            <td class="_icon">
                <img src="../media/images/oce.png" width="14px" />
            </td>
            <td>
                Outward HV
            </td>
            <td>
                <asp:Label Text="" ID="lbOutHvOk" runat="server" />
            </td>
            <td>
                <a target="_blank" href="cbsview.aspx?type=9&date=<%= settDate.ToString("dd/MM/yyyy") %>&ire=0">
                    <asp:Label Text="" ID="lbOutHvFailed" runat="server" /></a>
            </td>
            <td>
                <asp:Label Text="" ID="lbOutHvNew" runat="server" />
            </td>
            <td>
                &nbsp;<asp:LinkButton Text="Send OCE HV" ID="btSendOceHv" runat="server" OnClick="btSendClick" />
            </td>
        </tr>
        <tr style="background-color: #e9f8e9">
            <td class="_icon">
            </td>
            <td>
                Outward Regular
            </td>
            <td>
                <asp:Label Text="" ID="lbOutRegSuccess" runat="server" />
            </td>
            <td>
                <a target="_blank" href="cbsview.aspx?type=1&date=<%= settDate.ToString("dd/MM/yyyy") %>&ire=0">
                    <asp:Label Text="" ID="lbOutRegFailed" runat="server" /></a>
            </td>
            <td>
                <asp:Label Text="" ID="lbOutRegNew" runat="server" />
            </td>
            <td>
                <asp:LinkButton Text="Send OCE Regular" ID="btSendOceReg" runat="server" OnClick="btSendClick" />
            </td>
        </tr>
        <tr>
            <td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
        </tr>
        <tr style="background-color: #e8F9Fd">
            <td class="_icon">
                <img src="../media/images/ire.png" width="14px" />
            </td>
            <td>
                IRE HV
            </td>
            <td>
                <asp:Label Text="" ID="lbIreHvSucces" runat="server" />
            </td>
            <td>
                <a target="_blank" href="cbsview.aspx?type=9&date=<%= settDate.ToString("dd/MM/yyyy") %>&ire=1">
                    <asp:Label Text="" ID="lbIreHvFailed" runat="server" /></a>
            </td>
            <td>
                <asp:Label Text="" ID="lbIreHvNew" runat="server" />
            </td>
            <td>
                <asp:LinkButton Text="Send IRE HV" ID="btSendIreHv" runat="server" OnClick="btSendClick"
                    OnClientClick="return confirm('Please make sure that you have done the CBS Process. Proceed?')" />
            </td>
        </tr>
        <tr style="background-color: #e9f8e9">
            <td class="_icon">
            </td>
            <td>
                IRE Regular
            </td>
            <td>
                <asp:Label Text="" ID="lbIreRegSuccess" runat="server" />
            </td>
            <td>
                <a target="_blank" href="cbsview.aspx?type=1&date=<%= settDate.ToString("dd/MM/yyyy") %>&ire=1">
                    <asp:Label Text="" ID="lbIreRegFailed" runat="server" /></a>
            </td>
            <td>
                <asp:Label Text="" ID="lbIreRegNew" runat="server" />
            </td>
            <td>
                <asp:LinkButton Text="Send IRE Regular" ID="btSendIreReg" runat="server" OnClick="btSendClick"
                    OnClientClick="return confirm('Please make sure that you have done the CBS Process. Proceed?')" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr style="background-color: #D8F7F9">
            <td class="_icon">
                <img src="../media/images/ice.png" width="16px" />
            </td>
            <td>
                Inward HV
            </td>
            <td>
                <asp:Label Text="" ID="lbInHvSuccess" runat="server" />
            </td>
            <td>
                <a target="_blank" href="cbsview.aspx?type=19&date=<%= settDate.ToString("dd/MM/yyyy") %>&ire=0">
                    <asp:Label Text="" ID="lbInHvFailed" runat="server" /></a>
            </td>
            <td>
                <asp:Label Text="" ID="lbInHvNew" runat="server" />
            </td>
            <td>
                <asp:LinkButton Text="Send ICE HV" ID="btSendIceHv" runat="server" OnClick="btSendClick" />
            </td>
        </tr>
        <tr style="background-color: #e9f8e9">
            <td class="_icon">
            </td>
            <td>
                Inward Regular
            </td>
            <td>
                <asp:Label Text="" ID="lbInRegSuccess" runat="server" />
            </td>
            <td>
                <a target="_blank" href="cbsview.aspx?type=11&date=<%= settDate.ToString("dd/MM/yyyy") %>&ire=0">
                    <asp:Label Text="" ID="lbInRegFailed" runat="server" /></a>
            </td>
            <td>
                <asp:Label Text="" ID="lbInRegNew" runat="server" />
            </td>
            <td>
                <asp:LinkButton Text="Send ICE Regular" ID="btSendIceReg" runat="server" OnClick="btSendClick" />
            </td>
        </tr>
        <tr>
            <td class="_icon">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr style="background-color: #D8F7F9">
            <td class="_icon">
                <img src="../media/images/ore.png" width="14px" />
            </td>
            <td>
                ORE HV
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:LinkButton ID="btGetOreHv" runat="server" OnClick="btSendClick" Text="Get ORE HV" />
            </td>
        </tr>
        <tr style="background-color: #e9f8e9">
            <td class="_icon">
                &nbsp;
            </td>
            <td>
                ORE Regular
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:LinkButton ID="btGetOreReg" runat="server" OnClick="btSendClick" Text="Get ORE Regular" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <%--<asp:GridView ID="gvClearingSummary" runat="server" AutoGenerateColumns="False" Width="800px"
        GridLines="Horizontal" PageSize="20" CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle"
        HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle"
        Font-Names="Trebuchet MS" Font-Size="9pt">
        <RowStyle CssClass="OW_RowStyle"></RowStyle>
        <Columns>
            <asp:BoundField DataField="ClearingTypeStr" HeaderText="Clearing Type" />
            <asp:BoundField DataField="StatusCode" HeaderText="Type" />
            <asp:BoundField DataField="ErrorText" HeaderText="Status" />
            <asp:BoundField DataField="Count" HeaderText="Count" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton ID="closeStatus" runat="server" OnClick="CloseClearing" OnClientClick="return confirm('Are you sure to change ?')">Close</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="OW_PagerStyle"></PagerStyle>
        <HeaderStyle CssClass="OW_HeaderStyle"></HeaderStyle>
        <AlternatingRowStyle CssClass="OW_AltRowStyle"></AlternatingRowStyle>
    </asp:GridView>--%>
    </form>
</asp:Content>
