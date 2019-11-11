<%@ Page Title="" Language="C#" MasterPageFile="/Outward/Outward.Master" AutoEventWireup="true"
    CodeBehind="OutwardPrint.aspx.cs" Inherits="Accs.Web.Outward.OutwardPrint"
    ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="OutwardHead" runat="server">
    <link type="text/css" rel="Stylesheet" href="/Style/ach.css" />
    <link type="text/css" rel="Stylesheet" href="/Style/outward.css" />
    <link type="text/css" rel="Stylesheet" href="/Style/outward_button.css" />
    <link type="text/css" rel="Stylesheet" href="/Style/OutwardGridView.css" />
    <link type="text/css" href="/Style/admin.css" rel="Stylesheet" />
    <title>Outward Image Print </title>
    <script src="/Script/jquery-1.3.2.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="OutwardBody" runat="server">
    <form runat="server" style="padding: 10px;">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table style="width: 850px" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <span class="headText2" style="margin-left: 0px;">Select Options</span>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="userBox" style="">
                        &nbsp;&nbsp;&nbsp;
                    <asp:PlaceHolder runat="server" ID="phbrlist">
                        <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="false" IsAdmin="True"
                            includeBureau="True" selectLoginBranch="True" />
                        &nbsp;&nbsp;
                        
                    </asp:PlaceHolder>
                        &nbsp;&nbsp;
                     <asp:PlaceHolder runat="server" ID="phShowDatePicker">
                         <asp:TextBox ID="batchDate" runat="server" BorderColor="#888888" BorderStyle="Solid"
                             BorderWidth="1px" Width="100px" Font-Names="Trebuchet MS" Font-Size="12px" Visible="true"></asp:TextBox>
                         <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                             TargetControlID="batchDate" Format="dd/MM/yyyy">
                         </cc1:CalendarExtender>
                         <asp:Image ID="Image1" runat="server" Height="15px" ImageUrl="~/media/images/calendar.gif" />
                     </asp:PlaceHolder>


                        &nbsp;&nbsp; Clearing Type&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlClearType" runat="server" DataTextField="name" DataValueField="value"
                        Font-Names="Trebuchet MS" Font-Size="10pt">
                    </asp:DropDownList>
                        &nbsp;&nbsp;
                    <asp:DropDownList runat="server" ID="ddlCurrency" AutoPostBack="true" OnSelectedIndexChanged="ddlCurrency_OnSelectedIndexChanged" />

                        <asp:DropDownList ID="ddlAccountType" runat="server" AutoPostBack="false" Width="100px" Font-Names="Trebuchet MS" Font-Size="10pt" AppendDataBoundItems="True">
                            <asp:ListItem Value="0" Text="All"></asp:ListItem>
                        </asp:DropDownList>&nbsp;&nbsp;
                    <asp:Button ID="btnGetBatch" runat="server" Text="Print" OnClick="btnGetBatch_Click" />
                    </div>
                </td>
                <%--<td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upSendOce"
                            DisplayAfter="1" DynamicLayout="False">
                            <ProgressTemplate>
                                
                                <asp:Panel ID="p1" CssClass="overlay" runat="server">
                                    <asp:Panel ID="p2" CssClass="loader" runat="server">
                                        Loading.......
                                        <img src="/media/images/busy.gif" /></asp:Panel>
                                </asp:Panel>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>--%>
            </tr>
            <tr>
                <td>
                    <div class="userBox" style="">
                        <asp:Label runat="server" ID="lbNoBatch" Visible="true" Text=""></asp:Label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
            </tr>
        </table>
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    </form>
</asp:Content>
