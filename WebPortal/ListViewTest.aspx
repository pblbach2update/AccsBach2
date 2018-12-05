<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListViewTest.aspx.cs" Inherits="Accs.Web.ListViewTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ListView ID="lvBranchBankWise" ItemPlaceholderID="binfo" runat="server" 
            onlayoutcreated="lvBranchBankWise_LayoutCreated">
        <LayoutTemplate>
            <table>
                <tr>
                    <td>
                        TestCol
                    </td>

                </tr>
                <asp:PlaceHolder runat="server" ID="binfo"></asp:PlaceHolder>
                <tfoot>
                    <td>
                        <asp:Label ID="lbFootext" runat="server" Text=""></asp:Label>
                    </td>
                </tfoot>
            </table>

        </LayoutTemplate>
        
        <ItemTemplate>
            <tr>
                
                <td><%#Eval("colVal")%></td>
            </tr>
            

        </ItemTemplate>

    </asp:ListView>
    </div>
    </form>
</body>
</html>
