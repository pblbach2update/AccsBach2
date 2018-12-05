<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BranchListNew.ascx.cs" Inherits="Accs.Web.usercontrol.BranchListNew" %>
<asp:DropDownList runat="server" ID="ddlBranchList" AppendDataBoundItems="True" Width="150px" OnSelectedIndexChanged="DdlBranchListOnSelectedIndexChanged">
         <asp:ListItem Selected="True" Text="All Branch" Value="0"></asp:ListItem>
                                        </asp:DropDownList>