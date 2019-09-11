<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BBReportOld.aspx.cs" Inherits="Accs.Web.Admin.BBReportOld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <title>BB Report</title>
    <link href="../Style/table.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        BB Report
        <hr/>
    <div>
        <asp:ListView ID="lvBBReport" runat="server" ItemPlaceholderID="bbreportlink"  DataKeyNames="FileName" OnSelectedIndexChanging="lvBBReport_OnSelectedIndexChanging">
            <LayoutTemplate>
                <table class="ctable">
                    <tr>
                        <td>Report File Name</td>
                        <td>Action</td>
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
    </form>
</body>
</html>
