<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewGroupItem.aspx.cs"
    Inherits="Accs.Web.Admin.ViewGroupItem" Culture="bn-BD" UICulture="bn-BD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="uc" TagName="clrTypeInfo" Src="~/usercontrol/DropdownClearingType.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Group Item</title>
    <link rel="stylesheet" type="text/css" href="../Style/table.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Item Distribution 
        <asp:DropDownList ID="ddlMismatch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="loadItemDistribution">
            <asp:ListItem Text="Normal" Value="1"></asp:ListItem>
            <asp:ListItem Text="HighValue" Value="9"></asp:ListItem>
            <asp:ListItem Text="Inward Normal" Value="11"></asp:ListItem>
            <asp:ListItem Text="InwardHighValue" Value="19"></asp:ListItem>
            <asp:ListItem Text="OutwardRetNormal" Value="21"></asp:ListItem>
            <asp:ListItem Text="OutwardRetHighvalue" Value="29"></asp:ListItem>
            <asp:ListItem Text="InwardRetNormal" Value="31"></asp:ListItem>
            <asp:ListItem Text="InwardRetHighvalue" Value="39"></asp:ListItem>
        </asp:DropDownList>
        
        CurrencyType : <asp:DropDownList runat="server" ID="ddlCurrencyType" Font-Names="Trebuchet MS" Font-Size="9pt" AutoPostBack="True" OnSelectedIndexChanged="FilterCurrencyInGroupItem"/>
        <hr />
    </div>
    <div style="width: 800px; margin: 0 auto">
        <asp:ListView ID="lvGroupItem" runat="server" ItemPlaceholderID="lvItem">
            <LayoutTemplate>
                <table class="ctable" width="100%">
                    <asp:PlaceHolder runat="server" ID="lvItem"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <%# AddGroupingRowIfSupplierHasChanged() %>
                <tr>
                    <td>
                        <%# Eval("ChequeSequence")%>
                    </td>
                    <td>
                        <%# Eval("IssuingRoutingNumber")%>
                    </td>
                    <td>
                        <%# Eval("ChequeAccount")%>
                    </td>
                    <td>
                        <%# Eval("TransactionCode")%>
                    </td>
                    <%# AddReturnResaonIfRequired() %>
                    <td>
                        <%# Eval("Amount", "{0:##,##,##,##0.00}")%>
                    </td>
                </tr>
                <%# AddLastGroupSummary() %>
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
