<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="PassChange.aspx.cs" Inherits="Accs.Web.PassChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="passChangeError">
            <asp:Label ID="lblPassChangeError" runat="server" Text="Error Changing Password!" 
                ForeColor="#FF2244" Visible="False"></asp:Label>
        </div>  
        
        <div id="passChange">
        <form id="form1" runat="server">
        
        <table id="chPassTable" cellpadding="8px">
            <tr>
                <td>
                    Old Password
                </td>
                <td>
                    <asp:TextBox ID="loginNameTextBox" runat="server" Width="150px" ForeColor="#364365"
                         TextMode="Password" BorderWidth="1px"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td>
                    New Password
                </td>
                <td>
                    <asp:TextBox ID="passwordTextBox" runat="server" Width="150px" TextMode="Password"
                         ForeColor="#294056"  BorderWidth="1px"></asp:TextBox><br />
                    
                </td>
                
                
                
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td>
                    <asp:TextBox ID="cpTextBox" runat="server" Width="150px" TextMode="Password"
                         ForeColor="#294056"  BorderWidth="1px"></asp:TextBox><br />
                    <asp:CompareValidator ID="cmpValidatorPassword" runat="server" ErrorMessage="Password do not match" 
                        ControlToValidate="cpTextBox" ControlToCompare="passwordTextBox"  ></asp:CompareValidator>
                    
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: right; padding-top: 8px;">
                    <asp:ImageButton ID="loginButton" runat="server" Height="28" ImageUrl="~/media/images/svchangeBtn.png"
                        AlternateText="Login" BackColor="#E2E2E2" OnClick="loginButton_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="cancelButton" runat="server" Height="28" ImageUrl="~/media/images/cancel.png"
                         AlternateText="Cancel" BackColor="#E2E2E2" OnClick="cancelButton_Click" />
                </td>
            </tr>
        </table>
        </form>
    </div>
</asp:Content>
