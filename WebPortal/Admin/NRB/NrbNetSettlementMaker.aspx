<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="NrbNetSettlementMaker.aspx.cs" Inherits="Accs.Web.Admin.NRB.NrbNetSettlementMaker" Culture="bn-BD" UICulture="bn-BD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" rel="Stylesheet" href="/Style/OutwardGridView.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server">
        <div id="msgdiv" runat="server" visible="False" enableviewstate="True" style="background-color: #FFFFDE; border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px; width: 800px">
        </div>
        <div style="margin: 10px 0 10px 0">
            <div style="font-weight: bold; font-size: 16px">
                Net Settlement :
            <asp:Label runat="server" ID="cldate"></asp:Label>
            </div>
            <div style="width: 800px; height: 0px; border: 1px solid #DDDDDD; margin-top: 4px">
            </div>
        </div>
        <asp:GridView ID="gvClearingSummary" runat="server" AutoGenerateColumns="False" Width="800px"
            GridLines="Horizontal" PageSize="20" OnRowDataBound="Gv_RowDataBound"
            CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle" HeaderStyle-CssClass="OW_HeaderStyle"
            RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle"
            Font-Names="Trebuchet MS" Font-Size="9pt">
            <RowStyle CssClass="OW_RowStyle"></RowStyle>
            <Columns>
                <asp:BoundField DataField="ClearingTypeString" HeaderText="Clearing Type" />
                <asp:BoundField DataField="NetAmount" HeaderText="Settlement Amount">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="HoclearingAccount" HeaderText="Ho Office A/c">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FadBB" HeaderText="FADD BB A/C">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SettlementStatus" HeaderText="ProcessingState">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Remarks" HeaderText="Remarks">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Process">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbTransferSettlementAmount" runat="server" CommandName="dc" OnClick="TransferSettlementAmount"
                             Enabled="False">Process</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>

            </Columns>
            <PagerStyle CssClass="OW_PagerStyle"></PagerStyle>
            <HeaderStyle CssClass="OW_HeaderStyle"></HeaderStyle>
            <AlternatingRowStyle CssClass="OW_AltRowStyle"></AlternatingRowStyle>
        </asp:GridView>

    </form>
</asp:Content>
