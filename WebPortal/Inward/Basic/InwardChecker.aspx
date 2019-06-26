<%@ Page Title="" Language="C#" MasterPageFile="~/Inward/InwardMenu.Master" AutoEventWireup="true"
    CodeBehind="InwardChecker.aspx.cs" Inherits="Accs.Web.Inward.Basic.InwardChecker"  %>


<%@ Register TagPrefix="uc" TagName="brlist" Src="~/usercontrol/BranchListNew.ascx" %>
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
    <div class="userBox" style="width: 800px">
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="batchDate" runat="server" BorderColor="#888888" BorderStyle="Solid"
            BorderWidth="1px" Width="100px" Font-Names="Trebuchet MS" Font-Size="12px" Visible="false"></asp:TextBox>
       
       &nbsp;&nbsp; Clearing Type&nbsp;&nbsp;
        <asp:DropDownList ID="ddlClearType" runat="server" AppendDataBoundItems="True" Font-Names="Trebuchet MS" Font-Size="10pt">
            <asp:ListItem Text="All" Value="0"></asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Account Type&nbsp;&nbsp;
        <asp:DropDownList ID="ddlAccountType" runat="server" Font-Names="Trebuchet MS" Font-Size="10pt" AppendDataBoundItems="True">
            <asp:ListItem Value="0" Text="All"></asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:PlaceHolder runat="server" ID="phbrlist">
            <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="True" IsAdmin="True"
                OnOnAutoPostBackControl="selectedindexchanged" includeBureau="True" selectLoginBranch="True" />
        </asp:PlaceHolder>
        <asp:Button ID="btnGetBatch" class="afprocess" runat="server" Text="Get Cheques" OnClick="btnGetBatch_Click" />
        <a href="/Admin/ViewGroupItemBranch.aspx?bid=<%= UserProfile.BranchId %>" target="_blank">Return Marked</a>
        
    </div>
    <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <contenttemplate>--%>
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
                        <asp:GridView ID="gvbatch" runat="server" AutoGenerateColumns="False" Width="800px"
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
    <%-- </contenttemplate>
        </asp:UpdatePanel>--%>
    <%--<asp:UpdatePanel runat="server" UpdateMode="Conditional">
            <contenttemplate>
           <div id="useroptions" style="display: none; clear: both; margin-top: 20px" runat="server">
                <span class="headText2" style="margin-left: 0px;">Batch Information</span>
                <br />
                <div style="float: left; margin-top: 1px; clear: both; width: 800px" class="userBox">
                    <table width="100%" rules="all" border="1" style="border-collapse: collapse;" cellspacing="0"
                        cellpadding="6">
                        <tr style="color: #333333; background-color: #F7F6F3">
                            <td style="color: Green" colspan="1">
                                Batch Number &nbsp
                            </td>
                            <td colspan="3" align="center">
                                <asp:Label ID="batchnumber" runat="server" Text="" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center">
                                Type
                            </td>
                            <td align="center">
                                <asp:Label ID="clearingType" runat="server" Text="" Font-Bold="True"></asp:Label>
                            </td>
                            <td colspan="2" align="center">
                                <asp:Label ID="countinfo" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr style="color: #284775; background-color: White">
                            <td style="width: 100px">
                                Unprocessed&nbsp
                            </td>
                            <td align="center">
                                <asp:Label ID="cunprocessed" runat="server" Text="Label" ForeColor="#ff2310" Font-Size="14px"
                                    Font-Bold="True"></asp:Label>
                            </td>
                            <td style="width: 100px" align="center">
                                Honor&nbsp
                            </td>
                            <td align="center">
                                <asp:Label ID="chonor" runat="server" Text="Label" ForeColor="Green" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="width: 100px" align="center">
                                Dishonor&nbsp
                            </td>
                            <td align="center">
                                <asp:Label ID="crej" runat="server" Text="Label" ForeColor="#FF27D7" Font-Bold="True"></asp:Label>
                            </td>
                            <td style="width: 100px" align="center">
                                Hold
                            </td>
                            <td align="center">
                                <asp:Label ID="chold" runat="server" Text="Label" ForeColor="#FFDD00" Font-Size="14px"></asp:Label>
                            </td>
                        </tr>
                        <tr style="color: #284775; background-color: White">
                            <td>
                                Total Amount
                            </td>
                            <td colspan="5">
                                <asp:Label ID="tamount" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td align="right" colspan="2">
                                <div><!--img src="/media/images/unlock.jpg" /-->
                                    <asp:LinkButton ID="lbtUnlock" runat="server" OnClick="ShowModalConfirmation">Unlock Batch</asp:LinkButton>
                                </div>
                                <div>
                                    <cc2:ModalPopupExtender ID="generic_ModalPopupExtender" runat="server" TargetControlID="lbtUnlock"
                                        DropShadow="True" PopupControlID="panConfirmation" BackgroundCssClass="modalBackground"
                                        Drag="True" Enabled="false" CancelControlID="btcancel">
                                    </cc2:ModalPopupExtender>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </contenttemplate>
        </asp:UpdatePanel>--%>
    <%--<asp:UpdatePanel ID="listupdate" runat="server" UpdateMode="Conditional">
            <contenttemplate>--%>
    <div id="chequelist" style="display: none; clear: both" runat="server">
        <span class="headText2" style="margin-left: 0px;">Cheques In Batch</span>
        <div style="margin-top: 1px; width: 800px" class="userBox">
            <table>
                <tr>
                    <td valign="top" align="right">
                        <%--  Display
                                <asp:DropDownList ID="ddloption" runat="server" AutoPostBack="True" OnSelectedIndexChanged="chequeinfoStatusChanged">
                                </asp:DropDownList>--%>
                        <div style="display: none">
                            <asp:LinkButton ID="gridColor" runat="server" OnClick="colorGridAfterCancel">ColorGrid</asp:LinkButton>
                        </div>
                    </td>
                </tr>
                <%-- <tr>
                            <td>
                                <div style="padding-left: 15px">
                                    <asp:GridView ID="gvChequeList" runat="server" AutoGenerateColumns="False" AllowSorting="true"
                                        CellPadding="4" ForeColor="#333333" GridLines="Both" AllowPaging="false" Width="760px"
                                        Style="text-align: center">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Cheque No" DataField="ChequeSequence" />
                                            <asp:BoundField HeaderText="Account No" DataField="ChequeAccount" />
                                            <asp:BoundField HeaderText="Amount" DataField="Amount" />
                                            <asp:BoundField HeaderText="Presenting Bank" DataField="BOFDBankName" />
                                            <asp:BoundField HeaderText="Settlement Date" DataField="SettlementDate" DataFormatString="{0:dd-MM-yyyy}" />
                                            <asp:BoundField HeaderText="Maked By" DataField="Maker" />
                                            <asp:BoundField HeaderText="Maker status" DataField="MakerRemark" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <a href="javascript:showCheckerDetails('<%# Eval("ChequeID") %>',1)">Process</a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#909090" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#b0b0b0" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>--%>
            </table>
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
    <%--<div id="chequeinfomakerlist" style="display: none; clear: both; margin-top: 10px" runat="server">
                <div id="mkbatchinfo" style="display: block; clear: both; margin-top: 5px" runat="server">
                    <span class="headText2" style="margin-left: 0px; clear: both">Batch Information</span>
                    <br />
                    <div style="float: left; clear: both; width: 800px; margin-top: 4px" class="userBox">
                        <table width="100%" border="1" style="border-collapse: collapse; border-style: solid"
                            cellspacing="8" cellpadding="6">
                            <tr style="color: #333333; background-color: #F7F6F3">
                                <td style="color: Green" colspan="1">
                                    Batch Number &nbsp
                                </td>
                                <td colspan="3" align="center">
                                    <asp:Label ID="mbatchnumber" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                                </td>
                                <td colspan="4" align="center">
                                    <asp:Label ID="mcountinfo" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr style="color: #284775; background-color: White">
                                <td style="width: 100px">
                                    Unprocessed&nbsp
                                </td>
                                <td align="center">
                                    <asp:Label ID="munprocessed" runat="server" Text="Label" ForeColor="#ff2310" Font-Size="14px"
                                        Font-Bold="True"></asp:Label>
                                </td>
                                <td style="width: 100px" align="center">
                                    Accept&nbsp
                                </td>
                                <td align="center">
                                    <asp:Label ID="mkaccept" runat="server" Text="Label" ForeColor="#00ff00" Font-Bold="True"
                                        Font-Size="14px"></asp:Label>
                                </td>
                                <td style="width: 100px" align="center">
                                    Reject&nbsp
                                </td>
                                <td align="center">
                                    <asp:Label ID="mkreject" runat="server" Text="Label" ForeColor="#FF27D7" Font-Bold="True"
                                        Font-Size="14px"></asp:Label>
                                </td>
                                <td style="width: 100px" align="center">
                                    Hold&nbsp
                                </td>
                                <td align="center">
                                    <asp:Label ID="mkhold" runat="server" Text="Label" ForeColor="#FFDD00" Font-Size="14px"
                                        Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr style="color: #333333; background-color: #F7F6F3">
                                <td>
                                    Total Amount
                                </td>
                                <td colspan="3">
                                    <asp:Label ID="mktamount" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td align="right" colspan="4">
                                    <div>
                                        <asp:LinkButton ID="close" runat="server" OnClick="closeViewBatch">Close Batch</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div style="clear: both">
                    <span class="headText2" style="margin-left: 0px;">Cheques In Unfinalized Batch</span>
                    <div style="float: left; margin-top: 4px; width: 800px" class="userBox">
                        <table width="100%">
                            <tr>
                                <td>
                                    <div>
                                        <asp:GridView ID="gvmaker" runat="server" AutoGenerateColumns="False" AllowSorting="true"
                                            CellPadding="4" CssClass="glossymenu" ForeColor="#333333" GridLines="Both" AllowPaging="false"
                                            Width="760px" Style="text-align: center">
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <Columns>
                                                <asp:BoundField HeaderText="Cheque No" DataField="ChequeSequence" />
                                                <asp:BoundField HeaderText="Account No" DataField="ChequeAccount" />
                                                <asp:BoundField HeaderText="Amount" DataField="Amount" />
                                                <asp:BoundField HeaderText="Presenting Bank" DataField="BOFDBankName" />
                                                <asp:BoundField HeaderText="Settlement Date" DataField="SettlementDate" DataFormatString="{0:dd-MM-yyyy}" />
                                            </Columns>
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#909090" Font-Bold="True" ForeColor="White" />
                                            <EditRowStyle BackColor="#b0b0b0" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>--%>
    <%-- </contenttemplate>
        </asp:UpdatePanel>--%>
    <%--<asp:UpdatePanel ID="modalDialogue" runat="server" UpdateMode=Conditional>
            <contenttemplate>
        
            <asp:Panel ID="panConfirmation" runat="server" CssClass="modalPopup" Style="display: none">
                <table style="width: 100%;" cellspacing="8">
                    <tr>
                        <td>
                            <asp:Label ID="modal" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <asp:Button ID="btyes" runat="server" Text="Yes" OnClick="unlockBatch" />
                            
                            <asp:Button ID="btcancel" runat="server" Text="No" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </contenttemplate>
        </asp:UpdatePanel>--%>
    </form>
</asp:Content>
