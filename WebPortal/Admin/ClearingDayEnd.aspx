<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="ClearingDayEnd.aspx.cs" Inherits="Accs.Web.Admin.ClearingDayEnd" Culture="bn-BD" UICulture="bn-BD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <meta http-equiv="refresh" content="30" />
    <link type="text/css" rel="Stylesheet" href="/Style/OutwardGridView.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server">
    <div id="msgdiv" runat="server" visible="False" enableviewstate="True" style="background-color: #FFFFDE;
        border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px;
        width: 800px">
    </div>
    <div style="margin: 10px 0 10px 0">
        <div style="font-weight: bold; font-size: 16px">
            Clearing Summary :
            <asp:Label runat="server" ID="cldate"></asp:Label>
        </div>
        <div style="width: 800px; height: 0px; border: 1px solid #DDDDDD; margin-top: 4px">
        </div>
    </div>
    <asp:GridView ID="gvClearingSummary" runat="server" AutoGenerateColumns="False" Width="800px"
        OnRowDataBound="gvClearingSummary_RowDataBound" GridLines="Horizontal" PageSize="20"
        CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle" HeaderStyle-CssClass="OW_HeaderStyle"
        RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle"
        Font-Names="Trebuchet MS" Font-Size="9pt">
        <RowStyle CssClass="OW_RowStyle"></RowStyle>
        <Columns>
            <asp:BoundField DataField="ClrTypeStringString" HeaderText="" />
            <asp:BoundField DataField="outSentCount" HeaderText="Count">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="outSentAmount" DataFormatString="{0:##,##,##,###.##}"
                HeaderText="Amount">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="inHonoredCount" HeaderText="Count">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="inHonoredAmount" DataFormatString="{0:##,##,##,###.##}"
                HeaderText="Amount">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="inDishonoredCount" HeaderText="Count">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="inDishonoredAmount" DataFormatString="{0:##,##,##,###.##}"
                HeaderText="Amount">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="outDishonoredCount" HeaderText="Count">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="outDishonoredAmount" DataFormatString="{0:##,##,##,###.##}"
                HeaderText="Amount">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="outTotalAmount" DataFormatString="{0:N}" HeaderText="Net Settlement"
                HtmlEncode="False">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Day">
                <ItemTemplate>
                    <asp:LinkButton ID="closeStatus" runat="server" CommandName="dc" OnClick="CloseClearing"
                        OnClientClick="return confirm('Are you sure to change ?')">Close</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Report">
                <ItemTemplate>
                    <asp:LinkButton ID="closeReport" runat="server" CommandName="rc" OnClick="CloseClearing"
                        OnClientClick="return confirm('Are you sure to change ?')">Close</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="OW_PagerStyle"></PagerStyle>
        <HeaderStyle CssClass="OW_HeaderStyle"></HeaderStyle>
        <AlternatingRowStyle CssClass="OW_AltRowStyle"></AlternatingRowStyle>
    </asp:GridView>
    <div style="font-weight: bold; font-size: 16px;padding-top: 40px">
        Clearing Session :
    </div>
    <div style="width: 800px; height: 0px; border: 1px solid #DDDDDD; margin-top: 4px">
    </div>
    <table style="width: 600px;border-collapse: collapse;text-align: center" cellspacing="4px" cellpadding="4px">
        <thead>
        <tr>
            <th>
            </th>
            <th>
                Send Cut Off
            </th>
            <th>
                Return Cut Off
            </th>
        </tr>
        </thead>
        <tr>
            <td>
                HighValue
            </td>
            <td>
                <asp:Label ID="lbHvSendCutOff" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbHvReturnCutOff" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Regular
            </td>
            <td>
                <asp:Label ID="lbRgSendCutOff" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:Label ID="lbRgReturnCutoff" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
