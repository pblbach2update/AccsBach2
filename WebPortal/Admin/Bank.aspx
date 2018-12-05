<%@ Page Title="Bank And Branch Management" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="Bank.aspx.cs" Inherits="Accs.Web.Admin.Bank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" href="../Style/admin.css" rel="Stylesheet" />
    <style type="text/css">
        .style12 {
            width: 800px;
        }

        .style50p {
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackErrorMessage="Row Can't be deleted">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                 <div id="msgdiv" runat="server" visible="False" enableviewstate="false" style="background-color: #FFFFDE; border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px; width: 800px">
                </div>
                <table class="style12">
                    <tr>
                        <td colspan="2">
                            <div style="height: 20px;">
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                                    DisplayAfter="0">
                                    <ProgressTemplate>
                                        Loading...
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style50p">
                            <span class="headText2" style="margin-left: 0px;">Add / Edit Bank</span>
                        </td>
                        <td class="style50p">
                            <span class="headText2" style="margin-left: 0px;">Add / Edit Branch
                                <asp:Label runat="server" ID="lbNoOfBranchLic" ForeColor="#FF3300"></asp:Label></span>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <div class="userBox" style="float: left; width: 350px;">
                                <table cellpadding="5">
                                    <tr>
                                        <td>Bank Name
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBankName" runat="server" Style="margin-left: 0px" Width="257px"
                                                TabIndex="1"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Bank Code
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBankCode" runat="server" TabIndex="2" Width="140px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Short Name
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBankNameShort" runat="server" TabIndex="3" Width="140px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                        </td>
                                        <td>
                                            <asp:Button ID="btnAddBank" runat="server" OnClick="btnAddBank_Click" TabIndex="4"
                                                Text="Add Bank" />
                                            &nbsp;
                                        <asp:Button ID="btnEditBank" runat="server" Width="80px" OnClick="btnEditBank_Click"
                                            TabIndex="5" Text="Save " />
                                            &nbsp;
                                        <asp:Button ID="btnClearBank" runat="server" TabIndex="5" Width="70px" Text="Clear"
                                            OnClick="btnClearBank_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td>
                            <div class="userBox" style="float: left; width: 520px;">
                                <table width="100%">
                                    <tr>
                                        <td>Bank Name
                                        </td>
                                        <td>
                                            <asp:Label ID="lbSelectedBank" runat="server" ForeColor="#991111" Text="No Bank Selected"></asp:Label>
                                            &nbsp;
                                        <asp:Label ID="lbBranchCount" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Branch Name
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBranchName" runat="server" Style="margin-left: 0px" TabIndex="6"
                                                Width="170px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Branch Code
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBranchCode" runat="server" TabIndex="7" Width="86px"></asp:TextBox>
                                            (3 digits)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>District Code
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlDistrict" runat="server" TabIndex="8">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Check Digit
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCheckDigit" runat="server" Width="86px" TabIndex="9"></asp:TextBox>
                                            (1 digit)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Private Code
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtPriCode" runat="server" Width="86px" TabIndex="9"></asp:TextBox>
                                            (max 4 digit)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Active?
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtRowState" runat="server" TabIndex="9" Width="57px"></asp:TextBox>
                                            (1=Active 0=Inactive)
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>IsAdBranch
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="cbAdBranchMarker" runat="server" TabIndex="9" Width="57px"></asp:CheckBox>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Zone
                                        </td>
                                        <td>
                                            <div style="float: left">
                                                <div style="float: left">
                                                    <asp:DropDownList AutoPostBack="true"
                                                        ID="ddlZoneList" runat="server"
                                                        DataTextField="BranchName" OnSelectedIndexChanged="ddlActtiveBranchList_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                                <div id="sname" runat="server" visible="False" style="float: left; padding-left: 15px;">
                                                    Short Name :
                                                    <asp:TextBox ID="tbShortName" runat="server" Width="103px"></asp:TextBox>
                                                </div>
                                            </div>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            Settlement A/C
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="tbSettlementAcc"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnAddBranch" runat="server" OnClick="btnAddBranch_Click" TabIndex="11"
                                                Text="Add Branch" />
                                            &nbsp;
                                        <asp:Button ID="btnEditBranch" runat="server" OnClick="btnEditBranch_Click" TabIndex="12"
                                            Text="Save Changes" />
                                            &nbsp;
                                        <asp:Button ID="btnClearBranch" runat="server" TabIndex="13" Text=" Clear" OnClick="btnClearBranch_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="headText2" style="width: 75%; margin-left: 0px;">List of Banks</span>
                        </td>
                        <td>
                            <span class="headText2" style="margin-left: 0px;">List of Branches</span>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <div class="userBox" style="float: left; width: 350px;">
                                <asp:DropDownList ID="ddlBankList" runat="server" AutoPostBack="true" 
                                     OnSelectedIndexChanged="ddlBankList_SelectedIndexChanged"
                                    Width="95%" AppendDataBoundItems="True">
                                    <asp:ListItem Text="Select a Bank" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </td>
                        <td valign="top">
                            <div class="userBox" style="float: left; width: 350px;">
                                <asp:DropDownList AutoPostBack="true" ID="ddlBranchList" Width="95%" runat="server"
                                    DataTextField="BranchName" DataValueField="BranchID" OnSelectedIndexChanged="ddlBranchList_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </td>
                    </tr>
                    <%--<tr>
                    <td>
                        <span class="headText2" style="width: 75%; margin-left: 0px;">Add Quick Branch</span>
                    </td>
                    <td>
                        <span class="headText2" style="margin-left: 0px;">Info</span>
                    </td>
                </tr>--%>
                    <%--<tr>
                    <td>
                        Routing Number : 
                        <asp:TextBox ID="txtRoutNo" runat="server" Style="margin-left: 0px" TabIndex="6" Width="170px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnQckAdd" runat="server" TabIndex="13" Text=" Add" 
                            onclick="btnQckAdd_Click" />
                    </td>
                    <td>
                        <asp:Label ID="lbquickInfo" runat="server"></asp:Label>
                    </td>
                </tr>--%>
                </table>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
