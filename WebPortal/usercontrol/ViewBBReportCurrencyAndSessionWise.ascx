<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewBBReportCurrencyAndSessionWise.ascx.cs" Inherits="Accs.Web.usercontrol.ViewBbReportCurrencyAndSessionWise" %>


 <div style="float: left">
        <asp:ListView ID="lvBBReport" runat="server" ItemPlaceholderID="bbreportlink"  
            DataKeyNames="AbsFileName" OnSelectedIndexChanging="lvBBReport_OnSelectedIndexChanging" OnDataBound="lvBBReport_OnDataBound">
            <LayoutTemplate>
                <table class="ctable" style="width: 350px">
                    <tr>
                        <td colspan="2" style="text-align: center;font-size: 26px"><asp:Label runat="server" ID="lbReportHeader"></asp:Label></td>
                        
                    </tr>
                    <asp:PlaceHolder ID="bbreportlink" runat="server"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%# Eval("FileName") %>
                        
                    </td>
                    <td>
                        <asp:LinkButton runat="server" ID="lbDownLoadFile" CommandName="Select">Download File</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <EmptyDataTemplate>
            </EmptyDataTemplate>
        </asp:ListView>
    </div>
