<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DuplicateInward.aspx.cs"
    Inherits="Accs.Web.Admin.DuplicateInward" Culture="bn-BD" UICulture="bn-BD" %>

<%@ Register TagPrefix="uc" TagName="brlist" Src="~/usercontrol/BranchListNew.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="uc" TagName="clrTypeInfo" Src="~/usercontrol/DropdownClearingType.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Group Item</title>
    <link rel="stylesheet" type="text/css" href="../Style/table.css" />
    <script src="../Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <link href="../Style/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <script src="../Script/jquery.fancybox.js" type="text/javascript"></script>
    <script>

        $(function () {

            $('.fancybox').fancybox({

                height: 800
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Item Distribution
        <asp:DropDownList ID="ddlMismatch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="loadItemDistribution">
            <asp:ListItem Text="Inward Normal" Value="11"></asp:ListItem>
            <asp:ListItem Text="InwardHighValue" Value="19"></asp:ListItem>
        </asp:DropDownList>
        
        <asp:PlaceHolder runat="server" ID="phbrlist">
            <uc:brlist ID="branchList" runat="server" AutoPostBackOnChange="True" IsAdmin="True"
                OnOnAutoPostBackControl="selectedindexchanged" includeBureau="True" />
        </asp:PlaceHolder>
        <hr />
    </div>
    <div style="width: 800px; margin: 0 auto">
        <asp:ListView ID="lvGroupItem" runat="server" ItemPlaceholderID="lvItem">
            <LayoutTemplate>
                <table class="ctable" width="100%">
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            Cheque No
                        </td>
                        <td>
                            Branch Name
                        </td>
                        <td>
                            Acc No
                        </td>
                        <td>
                            Tran Code
                        </td>
                        <td>
                            Amount
                        </td>
                    </tr>
                    <asp:PlaceHolder runat="server" ID="lvItem"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                
                <tr>
                    <td>
                        <a href='ViewItemImage.aspx?cid=<%#Eval("ChequeID") %>' class="fancybox fancybox.iframe">
                            View</a>
                    </td>
                    <td>
                        <%# Eval("ChequeSeqNo")%>
                    </td>
                    <td>
                        <%# Eval("BranchName")%>
                    </td>
                    <td>
                        <%# Eval("ChequeAccNo")%>
                    </td>
                    <td>
                        <%# Eval("tranCode")%>
                    </td>
                    
                    <td>
                        <%# Eval("Amount", "{0:##,##,##,##0.00}")%>
                    </td>
                </tr>
                
            </ItemTemplate>
            <EmptyDataTemplate>
                <tr>
                    <td>
                        No item not found
                    </td>
                </tr>
            </EmptyDataTemplate>
        </asp:ListView>
    </div>
    </form>
</body>
</html>
