<%@ Page Title="" Language="C#" MasterPageFile="~/Inward/InwardMenu.Master" AutoEventWireup="true"
    CodeBehind="InwardChecker.aspx.cs" Inherits="Accs.Web.Inward.Basic.InwardChecker"  %>


<%@ Register TagPrefix="uc" TagName="brlist" Src="~/usercontrol/BranchListNew.ascx" %>
<%@ Register TagPrefix="uc" TagName="blist" Src="/usercontrol/BankListNew.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headInward" runat="server">
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/Script/ach.js" type="text/javascript"></script>
    <style>
        .cursorHand {
            cursor: pointer;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <asp:Label ID="errormsg" runat="server" Text="Label" Visible="False" Font-Size="12px"
            ForeColor="Red"></asp:Label></asp:Panel>
    <div class="userBox" style="width: 900px">
       
       
       Clearing Type&nbsp;&nbsp;
        <asp:DropDownList ID="ddlClearType" runat="server" AppendDataBoundItems="True" Font-Names="Trebuchet MS" Font-Size="10pt">
            <asp:ListItem Text="All" Value="0"></asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Account Type&nbsp;&nbsp;
        <asp:DropDownList ID="ddlAccountType" runat="server" Font-Names="Trebuchet MS" Font-Size="10pt" AppendDataBoundItems="True">
            <asp:ListItem Value="0" Text="All"></asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:PlaceHolder runat="server" ID="phbrlist">
            <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="True" IsAdmin="True"
                OnOnAutoPostBackControl="selectedindexchanged" includeBureau="True" selectLoginBranch="True" />&nbsp;&nbsp;
        </asp:PlaceHolder>
         Bank <uc:blist ID="bankList" runat="server" IncludeOwnBank="False"></uc:blist>&nbsp;&nbsp;
       Currency <asp:DropDownList runat="server" ID="ddlCurrency"  AppendDataBoundItems="True">
            <asp:ListItem Text="All Currency" Value="-1"></asp:ListItem>
        </asp:DropDownList>&nbsp;&nbsp;
       Status <asp:DropDownList runat="server" ID="ddlItemFilter" AutoPostBack="True" OnSelectedIndexChanged="ddlItemFilter_OnSelectedIndexChanged">
            <asp:ListItem Value="0" Text="All Item"></asp:ListItem>
            <asp:ListItem Value="1" Text="Unprocessed" Selected="True"></asp:ListItem>
            <asp:ListItem Value="2" Text="Processed"></asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnGetBatch" class="afprocess" runat="server" Text="Get Cheques" OnClick="btnGetBatch_Click" />
        
        
    </div>
   
    <div id="divbatch" style="display: block;" runat="server">
        <div style="float: left; margin-top: 4px" class="userBox" runat="server">
            <table>
                <tr>
                    <td align="right" style="padding: 5px">
                        <asp:Label ID="lbcount" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="gvbatch" runat="server" AutoGenerateColumns="False" Width="900px"
                            AllowSorting="True" CellPadding="4" ForeColor="#333333" Style="border-collapse: collapse;
                            text-align: center" EnableViewState="false" onrowdatabound="gvbatch_RowDataBound" >
                            
                            <Columns >
                                <asp:TemplateField>
                                    <HeaderTemplate>Instrument No</HeaderTemplate>
                                    <ItemTemplate>
                                        <a href="/Inward/Basic/checkersingleitemprocess.aspx?chkno=<%# Eval("ChequeID")%>" ><%# Eval("ChequeSequence")%></a>
                                        </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:BoundField HeaderText="Account No" DataField="ChequeAccount" />
                                <asp:BoundField HeaderText="Amount" DataField="Amount" />
                                <asp:BoundField HeaderText="Presenting Bank" DataField="BOFDBankName" />
                                <asp:BoundField HeaderText="Settlement Date" DataField="SettlementDate" DataFormatString="{0:dd-MM-yyyy}" />
                                <asp:BoundField HeaderText="Status" DataField="Status" />
                                <asp:BoundField HeaderText="Currency" DataField="CurrencyType" />
                              
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#909090" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#b0b0b0" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="cursorHand"  />
                            
                        </asp:GridView>
                        
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="divnobatch" style="display: none; margin-top: 4px" runat="server">
        <div style="float: left; padding: 20; text-align: center" class="userBox">
            <asp:Label ID="bnotfound" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#666666"
                Text="No chequeinfo found at the moment.Please refresh list after few minutes"></asp:Label>
        </div>
    </div>
   
   
    <div style="display: none" id="divchqnotfound" runat="server">
        <div style="float: left; margin-top: 4px; width: 780px; padding: 20px; text-align: center"
            class="userBox">
            <asp:Label ID="lbnotfound" runat="server" Text="Label" Font-Size="16px">No chequeinfos found for you to process.Please unlock the batch </asp:Label>
        </div>
    </div>
    <div id="ac2" style="visibility: hidden; display: block;">
        <div id="p1" class="overlay">
            <div id="p2" class="loader" style="margin-top: 0px">
                loading.......
                <img src="/media/images/busy.gif" />
            </div>
        </div>
    </div>
 
    </form>
</asp:Content>
