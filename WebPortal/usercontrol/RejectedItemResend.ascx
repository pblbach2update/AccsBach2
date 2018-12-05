<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RejectedItemResend.ascx.cs"
    Inherits="Accs.Web.usercontrol.RejectedItemResend" %>
<asp:ListView ID="lvRejectedItems" runat="server" ItemPlaceholderID="listItemParty"
    OnItemCommand="lsViewParty_ItemCommand" OnItemEditing="lsViewParty_ItemEditing"
    OnItemCanceling="lsViewParty_ItemCanceling" OnItemUpdating="lsViewParty_ItemUpdating"
    DataKeyNames="ChequeID" ClientIDMode="Predictable">
    <LayoutTemplate>
        <table>
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
                    Amount
                </th>
                <th>
                    Representment
                </th>
                <th>
                    Reason
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
                <a class="fancybox fancybox.iframe" href="'ViewItemImage.aspx?cid=<%# Eval("ChequeID") %>'">View</a>
            </td>
            <td>
                <%# Eval("BranchName")%>
            </td>
            <td>
                <%# Eval("BankName")%>
            </td>
            <td>
                <%# Eval("ChequeSeqNo")%>
            </td>
            <td>
                <%# Eval("issuingRt")%>
            </td>
            <td>
                <%# Eval("ChequeAccNo")%>
            </td>
            <td>
                <%# Eval("tranCode")%>
            </td>
            <td>
                <%# Eval("Amount")%>
            </td>
            <td>
                <%# Eval("PresentmentCount")%>
            </td>
            <td>
                <%# Eval("ReturnReason")%>
            </td>
            <td>
                <%# Eval("ClearingTypeString")%>
            </td>
            <td>
                <asp:LinkButton ID="lbEditParty" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                <asp:LinkButton ID="lbMarkAsResend" runat="server" CommandName="Select">Mark as RTS</asp:LinkButton>
            </td>
        </tr>
    </ItemTemplate>
    <EditItemTemplate>
        <tr>
            <td>
                <%# Eval("BranchName")%>
            </td>
            <td>
                <%# Eval("BankName")%>
            </td>
            <td>
                <asp:TextBox ID="tbChequeNo" Text='<%# Eval("ChequeSeqNo") %>' runat="server" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="tbRouting" Text=' <%# Eval("issuingRt") %>' runat="server" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="tbAccNo" Text=' <%# Eval("ChequeAccNo") %>' runat="server" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="tbTranCode" Text=' <%# Eval("tranCode") %>' runat="server" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="tbAmount" Text=' <%# Eval("Amount") %>' runat="server" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="tbRepresnt" Text=' <%# Eval("PresentmentCount") %>' runat="server"></asp:TextBox>
            </td>
            <td>
                <%# Eval("ReturnReason")%>
            </td>
            <td>
                <%# Eval("ClearingTypeString")%>
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
                Party not found in the system.Please add new party.
            </td>
        </tr>
    </EmptyDataTemplate>
</asp:ListView>
