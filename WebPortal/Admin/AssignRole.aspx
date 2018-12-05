<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="AssignRole.aspx.cs" Inherits="Accs.Web.Admin.AssignRole" %>

<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" href="/Style/admin.css" rel="Stylesheet" />
    <style type="text/css">
        .style3 {
            height: 19px;
            width: 207px;
        }

        .style4 {
            width: 150px;
            height: 22px;
            padding-left: 10px;
        }

        .style44 {
            padding-left: 10px;
        }

        .style7 {
            width: 207px;
            height: 49px;
        }

        .style9 {
            height: 15px;
        }

        .style10 {
            height: 19px;
            width: 80px;
            padding-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="msgdiv" runat="server" visible="False" enableviewstate="false" style="background-color: #FFFFDE; border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px; width: 800px">
                </div>
                <table cellspacing="1" cellpadding="0">
                    <tr>
                        <td>
                            <span class="headText2" style="margin-left: 0px;">Select User</span>
                        </td>
                        <td><span class="headText2" style="margin-left: 10px;">User Information</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="float: left; width: 350px;" class="userBox">
                                <table style="width: 100%;" cellspacing="0" cellpadding="2">

                                    <tr>
                                        <td class="style9" colspan="2">
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                                                DisplayAfter="1">

                                                <ProgressTemplate>
                                                    Loading...
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </td>
                                    </tr>
                                    <tr>
                                        user      
                                        <td class="style10">Branch
                                        </td>
                                        <td class="style3">
                                            <%-- <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" DataValueField="BranchID" DataTextField="BranchName"
                                            OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                        </asp:DropDownList>--%>
                                            <asp:PlaceHolder runat="server" ID="phbrlist">
                                                <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="True" includeBureau="True" selectLoginBranch="False" OnOnAutoPostBackControl="OnBranchSelected" />
                                            </asp:PlaceHolder>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style10">Username
                                        </td>
                                        <td class="style3">
                                            <asp:DropDownList ID="ddlUserName" runat="server" OnSelectedIndexChanged="ddlUserName_SelectedIndexChanged"
                                                AutoPostBack="True">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style10">Role
                                        </td>
                                        <td class="style3">
                                            <asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="False">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style10">Default
                                        </td>
                                        <td class="style3">
                                            <asp:CheckBox runat="server" ID="cbMarkAsDefault" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td class="style7">
                                            <asp:Button ID="btnAssign" runat="server" OnClick="btnAssign_Click" Text="Assign" />
                                        </td>
                                    </tr>

                                </table>
                            </div>
                        </td>
                        <td valign="top">
                            <div class="userBox" style="float: left; width: 300px; margin-left: 10px;">
                                <table>

                                    <tr>
                                        <td class="style44">Employee Name
                                        </td>
                                        <td class="style4">
                                            <asp:Label ID="lblEmployee" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style44">Designation
                                        </td>
                                        <td class="style4">
                                            <asp:Label ID="lblDesignation" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style44">Branch
                                        </td>
                                        <td class="style4">
                                            <asp:Label ID="lblBranch" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style44">Description
                                        </td>
                                        <td class="style4">
                                            <asp:Label ID="lblDescription" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td valign="top">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><span class="headText2" style="margin-left: 0px;">List of Assigned Roles</span><td></td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="userBox" style="float: left; width: 320px; margin-left: 0px;">
                                <asp:GridView ID="gvRoleList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" Width="100%" OnRowDeleting="gvRoleList_RowDeleting">
                                    <RowStyle BackColor="#F3f3F3" ForeColor="#333333" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Default">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="cbEditMarker" Checked='<%# Eval("IsDefault")%>' OnCheckedChanged="cbEditMarker_OnCheckedChanged" AutoPostBack="True" />
                                             </ItemTemplate>

                                        </asp:TemplateField>
                                        <asp:CommandField ShowDeleteButton="True">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:CommandField>

                                        <asp:TemplateField HeaderText="Role">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RoleName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdRoleID" runat="server" Value='<%# Eval("DbRoleId") %>' />
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#909090" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#b0b0b0" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#222222" />
                                </asp:GridView>
                            </div>
                        </td>
                        <td valign="top">&nbsp;</td>
                    </tr>

                </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
