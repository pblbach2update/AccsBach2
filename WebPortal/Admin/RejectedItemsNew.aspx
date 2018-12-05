<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RejectedItemsNew.aspx.cs"
    Inherits="Accs.Web.Admin.RejectedItemsNew" %>

<%@ Register TagPrefix="uc" TagName="clrTypeInfo" Src="~/usercontrol/DropdownClearingType.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rejected Items</title>
    <link type="text/css" rel="Stylesheet" href="/Style/OutwardGridView.css" />
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <link href="/Style/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <script src="/Script/jquery.fancybox.js" type="text/javascript"></script>
    <script>

        $(function () {

            $('.fancybox').fancybox({

                height: 800
            });

        });
    </script>
    <link rel="stylesheet" type="text/css" href="/Style/table.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3>
            Rejected Items</h3>
        <hr />
        <div class="userBox" style="height: 800px">
            <div>
                <uc:clrTypeInfo ID="clrtype" runat="server" AutoPostBackOnChange="True" Type="0"
                    OndropDownChanging="Loadinfo"></uc:clrTypeInfo>
            </div>
            <asp:ListView ID="lvRejectedItems" runat="server" ItemPlaceholderID="listItemParty"
                OnItemCommand="lsViewParty_ItemCommand" OnItemEditing="lsViewParty_ItemEditing"
                OnItemCanceling="lsViewParty_ItemCanceling" OnItemUpdating="lsViewParty_ItemUpdating"
                DataKeyNames="ChequeID" ClientIDMode="Predictable" 
                onitemdeleted="lvRejectedItems_ItemDeleted" 
                onitemdeleting="lvRejectedItems_ItemDeleting">
                <LayoutTemplate>
                    <table class="ctable">
                        <tr>
                            <th>
                            </th>
                            <th>
                                Branch Name
                            </th>
                            <th>
                                Bank Name
                            </th>
                            <th>
                                Cheque No
                            </th>
                            <th>
                                Routing No
                            </th>
                            <th>
                                Acc No
                            </th>
                            <th>
                                Tran Code
                            </th>
                            <th>
                                Amount
                            </th>
                            <th>
                                Representment
                            </th>
                            <th>
                                Reason
                            </th>
                            <th>
                                Type
                            </th>
                            <th>
                                Action
                            </th>
                        </tr>
                        <asp:PlaceHolder runat="server" ID="listItemParty"></asp:PlaceHolder>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <a href='ViewItemImage.aspx?cid=<%#Eval("ChequeID") %>' class="fancybox fancybox.iframe">
                                View</a>
                        </td>
                        <td>
                            <%# Eval("BOFDBranchName")%>
                        </td>
                        <td>
                            <%# Eval("IssuingBankShortName")%>
                        </td>
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
                        <td>
                            <%# Eval("Amount")%>
                        </td>
                        <td>
                            <%# Eval("RepresentmentIndicator")%>
                        </td>
                        <td>
                            <%# Eval("ReturnReason")%>
                        </td>
                        <td>
                            <%# Eval("ClrTypeString")%>
                        </td>
                        <td>
                            
                            <asp:LinkButton ID="lbEditParty" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lbDeleteItem" runat="server" CommandName="Delete">Delete</asp:LinkButton>
                            <asp:LinkButton ID="lbMarkAsResend" runat="server" CommandName="MarkRTS">Mark as RTS</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <a href='ViewItemImage.aspx?cid=<%#Eval("ChequeID") %>' class="fancybox fancybox.iframe">
                                View</a>
                        </td>
                        <td>
                            <%# Eval("BOFDBranchName")%>
                        </td>
                        <td>
                            <%# Eval("IssuingBankShortName")%>
                        </td>
                        <td>
                            <asp:TextBox ID="tbChequeNo" Width="50" Text='<%# Eval("ChequeSequence") %>' runat="server"
                                onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tbRouting" Width="80" Text=' <%# Eval("IssuingRoutingNumber") %>' runat="server"
                                onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tbAccNo" Width="100" Text=' <%# Eval("ChequeAccount") %>' runat="server"
                                onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tbTranCode" Width="20" Text=' <%# Eval("TransactionCode") %>' runat="server"
                                onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tbAmount" Width="80" Text=' <%# Eval("Amount") %>' runat="server"
                                onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tbRepresnt" Width="10" Text=' <%# Eval("RepresentmentIndicator") %>' runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <%# Eval("ReturnReason")%>
                        </td>
                        <td>
                            <%# Eval("ClrTypeString")%>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbEdit" runat="server" CommandName="Update" ValidationGroup="editGroup">Update</asp:LinkButton>
                            <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel" CausesValidation="False">Cancel</asp:LinkButton>
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <tr>
                        <td>
                            Rejected items not found
                        </td>
                    </tr>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
    </div>
    </form>
</body>
</html>
