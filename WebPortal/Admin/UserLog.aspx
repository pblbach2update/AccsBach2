<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="UserLog.aspx.cs" Inherits="Accs.Web.Admin.UserLog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" href="/Style/admin.css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server" style="padding: 10px;">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <table width="100%" cellspacing="0">
            <tr>
                <td colspan="2">
                    <div class="userBox" style="width: 97%">
                        <span style="margin-left: 0px;">Date : </span>
                        <asp:TextBox ID="batchDate" runat="server" BorderColor="#888888" BorderStyle="Solid"
                            BorderWidth="1px" Width="100px" Font-Names="Trebuchet MS" Font-Size="12px"></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                            TargetControlID="batchDate" Format="dd/MM/yyyy">
                        </cc1:CalendarExtender>
                        <asp:Image ID="Image1" runat="server" Height="15px" ImageUrl="/media/images/calendar.gif" />
                        &nbsp;&nbsp;&nbsp;&nbsp; Branch
                    
                   <%-- <asp:DropDownList ID="ddlBranchList" runat="server" DataTextField="BranchName" DataValueField="BranchID" AutoPostBack="true"
                        onselectedindexchanged="ddlBranchList_SelectedIndexChanged">
                    </asp:DropDownList>--%>
                        <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="true" OnOnAutoPostBackControl="Selectedindexchanged" includeBureau="True" selectLoginBranch="True" />


                        &nbsp;&nbsp; User Name
                    
                    <asp:DropDownList ID="ddlUserList" runat="server" DataTextField="Username" DataValueField="UserID">
                    </asp:DropDownList>
                    
                    <asp:DropDownList runat="server" ID="ddlOperationtype" AppendDataBoundItems="True">
                        
                        <asp:ListItem Text="All" Value="0"></asp:ListItem>
                        
                         
                    </asp:DropDownList>

                        
                    <asp:Button ID="btnLoad" runat="server" Text="View Log"
                        OnClick="btnLoad_Click" />
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:UpdatePanel ID="StockPricePanel" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table style="width: 99%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <span class="headText2">Log</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="userBox" style="width: 97%;">
                                            <asp:GridView ID="gvSummaryInward" Style="width: 97%;" AutoGenerateColumns="False" runat="server" CellPadding="6"
                                                ForeColor="#333333" GridLines="None" 
                                                OnPageIndexChanging="gvItems_PageIndexChanging" PageSize="15" AllowPaging="True">
                                                <RowStyle BackColor="#f2f2f2" HorizontalAlign="Center" />
                                                <Columns>

                                                    <asp:BoundField DataField="UserName" HeaderText="User" />
                                                    <asp:BoundField DataField="BranchName" HeaderText="Branch" />

                                                    <asp:BoundField DataField="OperationDate" HeaderText="Time" />
                                                    <asp:BoundField DataField="OperationLogType" HeaderText="Action" />
                                                    <asp:BoundField DataField="Details" HeaderText="Details">
                                                        <ItemStyle Width="50%" />
                                                    </asp:BoundField>

                                                </Columns>
                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#666666" ForeColor="White" />
                                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderStyle BackColor="#f5f5f5" HorizontalAlign="Center" Font-Bold="True" ForeColor="#444444"
                                                    BorderColor="#aaaaaa" BorderWidth="1px" />
                                                <EditRowStyle BackColor="#7C6F57" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>

    </form>
    <asp:LinqDataSource ID="linqDSItems" runat="server" AutoPage="False" OnSelecting="linqDSItems_Selecting"></asp:LinqDataSource>
</asp:Content>
