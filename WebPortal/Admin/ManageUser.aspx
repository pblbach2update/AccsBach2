<%@ Page Title="" Language="C#" MasterPageFile="/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="ManageUser.aspx.cs" Inherits="Accs.Web.Admin.ManagerUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" TagName="brlist" Src="~/usercontrol/BranchListNew.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" href="/Style/admin.css" rel="Stylesheet" />
    <link rel="stylesheet" type="text/css" href="/Style/table.css" />
    <style type="text/css">
        .style1 {
            /*height: 26px;*/
        }

        td {
            vertical-align: top;
        }



        .modalBackground {
            background-color: #336699;
            filter: alpha(opacity=80);
            opacity: 0.8;
        }
    </style>

    <script type="text/javascript" language="javascript">
        function pageLoad(sender, args) {

            if (!args.get_isPartialLoad()) {

                $addHandler(document, "keydown", onKeyDown);

            }

        }

        function onKeyDown(e) {

            if (e && e.keyCode == Sys.UI.Key.esc) {

                $find('<%=modalCurrencyPopup.ClientID%>').hide();

            }

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="MsgLabel" CssClass="messageLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                <div id="msgdiv" runat="server" visible="False" enableviewstate="false" style="background-color: #FFFFDE; border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px; width: 800px"></div>
                <asp:HiddenField ID="hfUserID" runat="server" />
                <div id="div1" class="userBox" style="width: 700px; margin-left: 5px;">
                    <table>
                        <tr>
                            <td>User Name :
                                <asp:TextBox runat="server" ID="tbUserName"></asp:TextBox>
                            </td>
                            <td>Select Branch
                            </td>
                            <td>
                                <uc:brlist ID="ddlBranch" runat="server" IsAdmin="True"
                                    includeBureau="True" selectLoginBranch="False" />
                                <%--<asp:DropDownList ID="ddlBranch" runat="server" DataTextField="BranchName" DataValueField="BranchID" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                    AutoPostBack="True" Font-Names="Trebuchet MS" Font-Size="10pt">
                                </asp:DropDownList>--%>
                            </td>
                            <td style="padding-left: 10px;">Status
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOption" Font-Names="Trebuchet MS" Font-Size="10pt" runat="server">
                                    <asp:ListItem Text="All" Value="-1"></asp:ListItem>
                                    <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Inactive" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </td>

                            <td>
                                <asp:Button runat="server" ID="btFindUser" Text="Find User" OnClick="btFindUser_OnClick" />
                            </td>

                        </tr>
                    </table>
                </div>
                <div id="div2" runat="server">
                    <table cellpadding="0" cellspacing="4">
                        <tr>
                            <td>
                                <span class="headText2" style="margin-left: 0px;">Add or Edit User</span>
                            </td>
                            <tr>
                                <td>
                                    <div class="userBox" style="width: 700px;">
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                                                                    DisplayAfter="0">
                                                                    <ProgressTemplate>
                                                                        Loading...
                                                                    </ProgressTemplate>
                                                                </asp:UpdateProgress>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName"
                                                                    ErrorMessage="Username required" ValidationGroup="UserAddEdit"></asp:RequiredFieldValidator>
                                                                <br />
                                                                <asp:RequiredFieldValidator ID="rvPasswordValidator" runat="server" ControlToValidate="txtPasswd"
                                                                    ErrorMessage="Password required" ValidationGroup="UserAddEdit"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="style1"></td>
                                                            <td class="style1">
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">Username
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtUserName" runat="server" Width="160px"></asp:TextBox>
                                                            </td>
                                                            <td align="right">Password
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtPasswd" runat="server" TextMode="Password" Width="160px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">Employee Name
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtEmployeeName" runat="server" Width="160px"></asp:TextBox>
                                                            </td>
                                                            <td align="right" class="style1">Description
                                                            </td>
                                                            <td class="style1">
                                                                <asp:TextBox ID="txtDescription" runat="server" Rows="3"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">Designation
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtDesignation" runat="server" Width="160px"></asp:TextBox>
                                                            </td>
                                                            <td align="right">Branch : 
                                                            </td>
                                                            <td>
                                                                <uc:brlist ID="ddlChangeBranch" runat="server" AutoPostBackOnChange="false" IsAdmin="True"
                                                                    includeBureau="True" selectLoginBranch="False" />
                                                                <%--<asp:DropDownList ID="ddlChangeBranch" runat="server" DataTextField="BranchName" DataValueField="BranchID" Font-Names="Trebuchet MS" Font-Size="10pt">
                                                                </asp:DropDownList>--%>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">Machine Ip
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="tbMachineIp" runat="server" Width="160px"></asp:TextBox>
                                                            </td>

                                                            <td>
                                                                <asp:CheckBox runat="server" ID="cbIsAccountActive" Text="IsActive" Checked="True" />
                                                            </td>

                                                        </tr>

                                                        <tr>
                                                            <td align="right">
                                                                <asp:CheckBox runat="server" ID="chkAccountLocked" Text="AccountLocked" AutoPostBack="true" OnCheckedChanged="UnlockUserAccount" />
                                                            </td>
                                                            <td>&nbsp; &nbsp;<asp:LinkButton runat="server" ID="lbSetUserLimit" OnClick="ShowUserLimit" Text="Set User Limit">
                                                                    
                                                                </asp:LinkButton>
                                                                <asp:HiddenField runat="server" ID="hfSelUserBranchId"/>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" style="text-align: right; padding-right: 30px;">
                                                                <asp:Button ID="btnAdd" Font-Names="Trebuchet MS" Font-Size="10pt" runat="server"
                                                                    OnClick="btnAdd_Click" Text="Add User" ValidationGroup="UserAddEdit" />
                                                                &nbsp;&nbsp;&nbsp;
                                                            <asp:Button ID="btnEdit" runat="server" Font-Names="Trebuchet MS" Font-Size="10pt"
                                                                OnClick="btnEdit_Click" Text="Update" ValidationGroup="UserAddEdit" />
                                                            </td>
                                                            <td colspan="2"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">Assigned Roles
                                                    <hr />

                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">

                                                    <asp:DataList ID="rptRoles" runat="server" RepeatDirection="Horizontal"
                                                        RepeatColumns="4">
                                                        <HeaderTemplate>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table cellpadding="4" style="font-size: 12px; font-weight: bold;">
                                                                <tr>
                                                                    <td>
                                                                        <%# Eval("RoleName") %> 
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                        </FooterTemplate>
                                                    </asp:DataList>

                                                </td>

                                            </tr>

                                        </table>
                                        <br />
                                        <table style="width: 100%;">
                                            <tr>
                                                <td align="center" bgcolor="#dddddd" style="line-height: 20px" colspan="2">
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#0e2043" Text="List of Users"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:GridView ID="gvUserList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                        ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="gvUserList_SelectedIndexChanging"
                                                        Width="100%" OnRowDeleting="gvUserList_RowDeleting">
                                                        <RowStyle BackColor="#FFFFFF" ForeColor="#333333" />
                                                        <Columns>
                                                            <asp:CommandField ShowSelectButton="True" />
                                                            <asp:BoundField DataField="Username" HeaderText="Username">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                              <asp:BoundField DataField="UserStatusString" HeaderText="Status">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Designation" HeaderText="Designation">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Description" HeaderText="Description">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Branch">
                                                                <EditItemTemplate>
                                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BranchName") %>'></asp:TextBox>
                                                                </EditItemTemplate>
                                                                <ItemTemplate>
                                                                    <asp:HiddenField ID="hdUserID" runat="server" Value='<%# Eval("UserID") %>' />
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("BranchName") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                        <HeaderStyle BackColor="#a0a0a0" Font-Bold="True" ForeColor="White" />
                                                        <EditRowStyle BackColor="#b0b0b0" />
                                                        <AlternatingRowStyle BackColor="#f8f8f8" ForeColor="#111111" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;
                                                </td>
                                                <td>&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </tr>
                    </table>
                </div>

                <asp:Panel ID="ModalCurrencyLimit" runat="server" Style="background-color: #8fbc8f; color: #FFFFFF; font-weight: bold; font-family: Cambria; font-style: normal; text-transform: capitalize; margin: 20px">
                    <div id="idCurrencyLimitSet">
                        <p>
                            Set Currency Limit
                        </p>
                        <hr />

                    </div>

                    <div>

                        <table class="ctable">
                            <thead>
                                <tr>
                                    <th>Currency 
                                    </th>
                                    <th>Outward Maker Limit 
                                    </th>
                                    <th>Outward Checker Limit 
                                    </th>
                                    <th>Inward Maker Limit 
                                    </th>
                                    <th>Inward Checker Limit
                                    </th>
                                </tr>
                            </thead>
                            <tr>
                                <td>BDT
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="tbBdtOutwardMakerLimit"></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox runat="server" ID="tbBdtOutwardCheckerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbBdtInwardMakerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbBdtInwardChckerLimit"></asp:TextBox>
                                </td>

                            </tr>

                            <tr>
                                <td>USD
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="tbUsdOutwardMakerLimit"></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox runat="server" ID="tbUsdOutwardCheckerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbUsdInwardMakerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbUsdInwardCheckerLimit"></asp:TextBox>
                                </td>

                            </tr>

                            <tr>
                                <td>GBP
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="tbGBPOutwardMakerLimit"></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox runat="server" ID="tbGBPOutwardCheckerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbGBPInwardMakerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbGBPInwardCheckerLimit"></asp:TextBox>
                                </td>

                            </tr>

                            <tr>
                                <td>EUR
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="tbEUROutwardMakerLimit"></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox runat="server" ID="tbEUROutwardCheckerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbEURInwardMakerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbEURInwardCheckerLimit"></asp:TextBox>
                                </td>

                            </tr>

                            <tr>
                                <td>JPY
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="tbJPYOutwardMakerLimit"></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox runat="server" ID="tbJPYOutwardCheckerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbJPYInwardMakerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbJPYInwardCheckerLimit"></asp:TextBox>
                                </td>

                            </tr>

                            <tr>
                                <td>CAD
                                </td>
                                <td>
                                    <asp:TextBox runat="server" ID="tbCADOutwardMakerLimit"></asp:TextBox>
                                </td>
                                <td>

                                    <asp:TextBox runat="server" ID="tbCADOutwardCheckerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbCADInwardMakerLimit"></asp:TextBox>
                                </td>

                                <td>
                                    <asp:TextBox runat="server" ID="tbCADInwardCheckerLimit"></asp:TextBox>
                                </td>

                            </tr>




                        </table>
                    </div>
                    <div style="margin: 20px">

                        <input id="btnOkay" type="button" value="Done" />

                    </div>







                </asp:Panel>

                <asp:ModalPopupExtender ID="modalCurrencyPopup" runat="server"
                    TargetControlID="lbSetUserLimit" PopupControlID="ModalCurrencyLimit"
                    OkControlID="btnOkay"
                    BackgroundCssClass="modalBackground" >
                </asp:ModalPopupExtender>/



            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
