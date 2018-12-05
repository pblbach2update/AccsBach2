<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NetSettlement.aspx.cs"
    Inherits="Accs.Web.Admin.NetSettlement" Culture="bn-BD" UICulture="bn-BD" %>
<%@ Register TagPrefix="uc" TagName="clrTypeInfo" Src="~/usercontrol/DropdownClearingType.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Net Settlement</title>
    <link rel="stylesheet" type="text/css" href="/Style/table.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Net Settlement <uc:clrTypeInfo ID="netClrType" runat="server" AutoPostBackOnChange="True" Type="0"
                    OndropDownChanging="loadinfo"></uc:clrTypeInfo>
        
        <hr />
    </div>
    <div style="width: 800px; margin: 0 20px 20px">
        <asp:ListView ID="lvGroupItem" runat="server" ItemPlaceholderID="lvItem">
            <LayoutTemplate>
                <table class="ctable" width="100%">
                    <tr>
                        <th></th>
                        <th colspan="2">Delivered</th>
                        <th colspan="2">Received</th>
                        <th colspan="2">Return Delivered</th>
                        <th colspan="2">Return Received</th>
                        <th></th>
                    </tr>
                    <tr>
                        <th>
                            Bank
                        </th>
                        <th>
                            Instruments
                        </th>
                        <th>
                            Amount
                        </th>
                        <th>
                            Instruments
                        </th>
                        <th>
                            Amount
                        </th>
                        <th>
                            Instruments
                        </th>
                        <th>
                            Amount
                        </th>
                        <th>
                            Instruments
                        </th>
                        <th>
                            Amount
                        </th>
                        <th>Net Amount</th>
                    </tr>
                    <asp:PlaceHolder runat="server" ID="lvItem"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                
                <tr>
                    <td>
                        <%# Eval("BankName")%>
                    </td>
                    <td>
                        <%# Eval("outTotalCount")%>
                    </td>
                    <td>
                        <%# Eval("outTotalAmount","{0:##,##,##,##0.00}")%>
                    </td>
                    <td>
                        <%# Eval("inTotalCount")%>
                    </td>
                    <td>
                        <%# Eval("inTotalAmount", "{0:##,##,##,##0.00}")%>
                    </td>
                    <td>
                        <%# Eval("inDishonoredCount")%>
                    </td>
                    <td>
                        <%# Eval("inDishonoredAmount", "{0:##,##,##,##0.00}")%>
                    </td>
                    <td>
                        <%# Eval("outDishonoredCount")%>
                    </td>
                    <td>
                        <%# Eval("outDishonoredAmount", "{0:##,##,##,##0.00}")%>
                    </td>
                    <td>
                        <%# ShowNetAmount() %>
                    </td>

                </tr>
                <%# ShowFooter() %>
                
            </ItemTemplate>
            <EmptyDataTemplate>
                <tr>
                    <td>
                        No item not found
                    </td>
                </tr>
            </EmptyDataTemplate>
        </asp:ListView>
    </div>
    </form>
</body>
</html>
