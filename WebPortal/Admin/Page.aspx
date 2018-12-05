<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="Page.aspx.cs" Inherits="Accs.Web.Admin.Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" href="../Style/admin.css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="msgdiv" runat="server" visible="False" enableviewstate="false" style="background-color: #FFFFDE; border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px; width: 800px"/>
            <table width="95%" cellspacing="4" style="font-size:12px;">
                <tr>
                    <td valign="top" style="width: 60%;">
                        <span class="headText2" style="margin-left: 0px;">Add Page</span>
                        <div class="userBox" style="width: 95%;">
                            Page Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Address
                            <br />
                            <asp:TextBox runat="server" ID="txtPageName" Width="80px"></asp:TextBox>
                            &nbsp;
                            <asp:TextBox runat="server" ID="txtModule" Width="80px"></asp:TextBox>
                            &nbsp;
                            <asp:TextBox runat="server" ID="txtLink" Width="150px"></asp:TextBox>
                            <asp:Button ID="btnAddPage" runat="server" Text="Add" OnClick="btnAddPage_Click" />
                        </div>
                        <div class="userBox" style="width: 95%;">
                            <asp:GridView ID="gvPageList" runat="server" AutoGenerateColumns="False" CellPadding="6"
                                ForeColor="#333333" GridLines="None" OnRowDeleting="gvPageList_RowDeleting">
                                <RowStyle BackColor="#F6F6F6" ForeColor="#222222" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                                    <asp:BoundField DataField="tile_name" HeaderText="Title" />
                                    <asp:BoundField DataField="link" HeaderText="Link" />
                                    <asp:BoundField DataField="description" HeaderText="Module" />
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdPageID" runat="server" Value='<%# Eval("tile_id") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#e9e9e9" Font-Bold="True" ForeColor="#666666" />
                                <HeaderStyle BackColor="#e0e0e0" Font-Bold="True" ForeColor="#444444" />
                                <EditRowStyle BackColor="#b0b0b0" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#222222" />
                            </asp:GridView>
                        </div>
                    </td>
                    <td valign="top" style="width: 40%;">
                        <span class="headText2" style="margin-left: 0px;">Add Role</span>
                        <div class="userBox" style="width: 95%;">
                            Role Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Home Page
                            <br />
                            <asp:TextBox runat="server" ID="txtRoleName" Width="90px"></asp:TextBox>
                            &nbsp;&nbsp;
                            <asp:DropDownList ID="ddlPageList" Width="120px" DataValueField="link" DataTextField="tile_name" runat="server">
                            </asp:DropDownList>
                             &nbsp;&nbsp;
                            <asp:Button ID="btnAddRole" runat="server" Text="Add" OnClick="btnAddRole_Click" />
                        </div>
                        <div class="userBox" style="width: 95%;">
                            <asp:GridView ID="gvRoleList" runat="server" AutoGenerateColumns="False" CellPadding="6"
                                ForeColor="#333333" GridLines="None" OnRowDeleting="gvRoleList_RowDeleting">
                                <RowStyle BackColor="#F6F6F6" ForeColor="#303030" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                                    <asp:BoundField DataField="role_name" HeaderText="Name" />
                                    <asp:BoundField DataField="description" HeaderText="Home Page" />
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdRoleID" runat="server" Value='<%# Eval("role_id") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#e9e9e9" Font-Bold="True" ForeColor="#666666" />
                                <HeaderStyle BackColor="#e0e0e0" Font-Bold="True" ForeColor="#444444" />
                                <EditRowStyle BackColor="#b0b0b0" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#303030" />
                            </asp:GridView>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <span class="headText2" style="margin-left: 0px;">Add Role</span>
                        <div class="userBox" style="width: 95%;">
                            
                            <asp:DropDownList ID="ddlRoleRel" Width="150px" DataValueField="role_id" 
                                DataTextField="role_name" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="ddlRoleRel_SelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <asp:DropDownList ID="ddlPageRel" Width="150px" DataValueField="tile_id" DataTextField="tile_name" runat="server">
                            </asp:DropDownList>
                             &nbsp;&nbsp;
                            <asp:Button ID="btnAssignTileRole" runat="server" Text="Add" 
                                onclick="btnAssignTileRole_Click"  />
                        </div>
                        <div class="userBox" style="width: 95%;">
                            <asp:GridView ID="gvRolePage" runat="server" AutoGenerateColumns="False" CellPadding="6"
                                ForeColor="#333333" GridLines="None" 
                                onrowdeleting="gvRolePage_RowDeleting" >
                                <RowStyle BackColor="#F6F6F6" ForeColor="#303030" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                                    <asp:BoundField DataField="tile_name" HeaderText="Title" />
                                    <asp:BoundField DataField="link" HeaderText="Link" />
                                    <asp:BoundField DataField="description" HeaderText="Module" />
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdRolePageID" runat="server" Value='<%# Eval("tile_id") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#e9e9e9" Font-Bold="True" ForeColor="#666666" />
                                <HeaderStyle BackColor="#e0e0e0" Font-Bold="True" ForeColor="#444444" />
                                <EditRowStyle BackColor="#b0b0b0" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#303030" />
                            </asp:GridView>
                        </div>
                    </td>
                    <td valign="top">
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</asp:Content>
