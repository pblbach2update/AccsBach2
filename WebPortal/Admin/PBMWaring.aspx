<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PBMWaring.aspx.cs" Inherits="Accs.Web.Admin.PBMWaring" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <title>BB Report</title>
    <link href="../Style/table.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        PBM Warning
        <hr/>
    <div>
        <asp:ListView ID="lvWaring" runat="server" ItemPlaceholderID="bbreportlink">
            <LayoutTemplate>
                <table class="ctable">
                    <th>Business Date</th>
                    <th>WorkSource</th>
                    <th>Run</th>
                    <th>Data</th>
                    <th>Info</th>
                    <asp:PlaceHolder ID="bbreportlink" runat="server"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        
                            <%#Eval("BusinessDate")%>
                        
                    </td>
                     <td>
                        
                            <%#Eval("WorkSource")%>
                        
                    </td>
                     <td>
                        
                            <%#Eval("Run")%>
                        
                    </td>
                     <td>
                        
                            <%#Eval("Data")%>
                        
                    </td>
                     <td>
                        
                            <%#Eval("ErrorMessage")%>
                        
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
