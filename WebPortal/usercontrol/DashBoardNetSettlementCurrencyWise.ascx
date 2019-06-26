<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DashBoardNetSettlementCurrencyWise.ascx.cs" Inherits="Accs.Web.usercontrol.DashBoardNetSettlementCurrencyWise" %>

<div >
        <asp:ListView ID="lvBankSummary" ItemPlaceholderID="bsummary" runat="server">
            <LayoutTemplate>
                <table class="ctable">
                    <%--<tr>
                        <th colspan="10" style="text-align: center">
                            <asp:Label runat="server" ID="lbCurrencyName"></asp:Label>
                        </th>
                    </tr>--%>
                    <tr>
                        <th>
                            Currency
                        </th>
                        <th colspan="2">
                            Instrument sent
                        </th>
                        <th colspan="2">
                            Instrument Received
                        </th>
                        <th colspan="2">
                            Return Sent
                        </th>
                        <th colspan="2">
                            Return Received
                        </th>
                        <th>
                            Net Settlement
                        </th>
                    </tr>
                    <tr>
                        <th>
                        </th>
                        <th colspan="1">
                            Count
                        </th>
                        <th colspan="1">
                            Amount
                        </th>
                        <th colspan="1">
                            Count
                        </th>
                        <th colspan="1">
                            Amount
                        </th>
                        <th colspan="1">
                            Count
                        </th>
                        <th colspan="1">
                            Amount
                        </th>
                        <th colspan="1">
                            Count
                        </th>
                        <th colspan="1">
                            Amount
                        </th>
                        <th>
                        </th>
                    </tr>
                    <asp:PlaceHolder runat="server" ID="bsummary"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%#ShowNetSettlement()%>
                    </td>
                    <td>
                        <%# showGroupItemList(0) %>
                    </td>
                    <td>
                        <%#Eval("AmountSent", "{0:##,##,##,##0.00}")%>
                    </td>
                    <td>
                        <%# showGroupItemList(10) %>
                    </td>
                    <td>
                        <%#Eval("AmountReceived", "{0:##,##,##,##0.00}") %>
                    </td>
                    <td>
                        <%# showGroupItemList(20) %>
                    </td>
                    <td>
                        <%#Eval("ReturnAmountSent","{0:##,##,##,##0.00}") %>
                    </td>
                    <td>
                        <%# showGroupItemList(30) %>
                    </td>
                    <td>
                        <%#Eval("ReturnAmountReceived", "{0:##,##,##,##0.00}")%>
                    </td>
                    <td>
                        <%#Eval("NetAmount", "{0:##,##,##,##0.00}")%>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
