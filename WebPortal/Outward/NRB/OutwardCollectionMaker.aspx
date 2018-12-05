<%@ Page Title="" Language="C#" MasterPageFile="~/Outward/Outward.Master" AutoEventWireup="true" CodeBehind="OutwardCollectionMaker.aspx.cs" Inherits="Accs.Web.Outward.NRB.OutwardCollectionMaker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="OutwardHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="OutwardBody" runat="server">
    <form runat="server">
        <div id="msgdiv" runat="server" visible="False" enableviewstate="True" style="background-color: #FFFFDE; border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px; width: 800px">
        </div>
        <div>
            Outward Settled Items &nbsp<asp:DropDownList ID="ddlClearingType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="LoadItemList">
                <asp:ListItem Value="0" Text="All"/>
                <asp:ListItem Value="1" Text="Normal"/>
                <asp:ListItem Value="9" Text="HighValue"/>
            </asp:DropDownList>
        <hr />

        </div>
        <div>

            <asp:GridView ID="gvFinaliezedItems" runat="server" AutoGenerateColumns="False" Width="800px"
                AllowSorting="True" CellPadding="4" ForeColor="#333333" Style="border-collapse: collapse; text-align: center"
                OnRowDataBound="Gv_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="InstrumentNO" DataField="ChequeNo" />
                    <asp:BoundField HeaderText="Benif Account" DataField="BenifAccount" />
                    <asp:BoundField HeaderText="Amount" DataField="Amount" />
                    <asp:BoundField HeaderText="Bank" DataField="Bankname" />
                    <asp:BoundField HeaderText="Return Resson" DataField="ReturnReasonText" />
                    <asp:BoundField HeaderText="Status" DataField="Status" />
                    <asp:TemplateField HeaderText="Process">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="chequeId" Value='<%#Eval("ChequeId") %>' />
                            <asp:LinkButton ID="lbSendCollectionRequest" runat="server" CommandName="dc" OnClick="InitiateSendColletionRequest"
                                Enabled="true">Process</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>


                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#909090" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#b0b0b0" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="cursorHand" />

            </asp:GridView>



        </div>

    </form>


</asp:Content>
