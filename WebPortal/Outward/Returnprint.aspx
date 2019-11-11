<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Returnprint.aspx.cs" Inherits="Accs.Web.Outward.Returnprint" %>

<%@ Register Assembly="Shared.WebControls" Namespace="Shared.WebControls" TagPrefix="wc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Return Cheque</title>
    <link href="../Style/ach.css" rel="stylesheet" type="text/css" />
    <link href="../Style/admin.css" rel="stylesheet" type="text/css" />

    <script src="../Script/jquery-1.3.2.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

        $(document).ready(function () {

            $('#hinfo').css('display', 'none');
            window.print();
            $('#hinfo').css('display', 'block')


        });
    </script>

</head>
<body style="padding: 10px">
    <form id="form1" runat="server">
        <div style="">
            <div id="hinfo">
                <table width="600px">
                    <tr>
                        <td align="right">
                            <a href="#" onclick="$('#hinfo').css('display','none');window.print();$('#hinfo').css('display','block') ">Print</a> <a href="#" onclick="window.close();">Close</a>
                        </td>
                    </tr>
                </table>
            </div>
            <%--<span class="headText2" style="margin-left: 0px; clear: both">Batch No :<%= gvPrint.__batchNo.ToString() %></span><br />--%>
            <div style="margin-left: auto; margin-right: auto; width: 600px">

                <div style="font-size: 12px;">
                    <%=UserProfile.BankName %>
                    <div style="padding: 1px; height: 2px"></div>
                    <asp:Label ID="lbbranchName" runat="server">
                    </asp:Label>&nbsp&nbsp 
        <div style="padding: 1px; height: 2px"></div>
                    Outward Dishonored Cheque
        <hr />
                </div>
            </div>

            <div style="margin-left: auto; margin-right: auto; width: 600px">
                <wc1:ReportGridView runat="server" ID="gvPrint" AutoGenerateColumns="false" PrintPageSize="1"
                    AllowPrintPaging="true" MultiBatch="false" BorderWidth="0" Style="border-collapse: separate"
                    showFooterHtml="false" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <%--<asp:CheckBox ID="accstatus" runat="server" />
                    <asp:HiddenField ID="lasttrue" Value='<%# Eval("lastTrue")  %>' runat="server" />
                    <asp:HiddenField ID="batchno" Value='<%# Eval("BatchNo") %>' runat="server" />--%>

                                <table cellpadding="4px">
                                    <tr>
                                        <td>
                                            <div style="padding-left: 25%">
                                                <table cellpadding="4" cellspacing="4">
                                                    <tr>
                                                        <td align="right">Cheque No :
                                                        </td>
                                                        <td align="left">
                                                            <%# Eval("ChequeSequence")%>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td align="right">Amount :
                                                        </td>
                                                        <td>
                                                            <%# Eval("FormatAmount") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Return Reason :
                                                        </td>
                                                        <td>
                                                            <%# Eval("ReturnReason")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Clearing Date :
                                                        </td>
                                                        <td align="left">
                                                            <%# Eval("SettlementDateString")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Beneficiary Name :
                                                        </td>
                                                        <td>
                                                            <%# Eval("Payee")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">Beneficiary Account :
                                                        </td>
                                                        <td>
                                                            <%# Eval("BenificiaryAccount")%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img alt="" src='<%# Eval("FrontImageUrl")  %>' height="260px" width="550px" style="border-width: 2px; border-style: solid" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img alt="" src='<%# Eval("BackImageUrl")  %>' height="260px" width="550px" style="border-width: 2px; border-style: solid" />
                                        </td>
                                    </tr>
                                </table>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField DataField="ChequeAccount" HeaderText="Account No" 
                    ItemStyle-HorizontalAlign="center" >                
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField>
                <HeaderTemplate>
                  TransType
                </HeaderTemplate>
                <ItemTemplate >
                   L
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                <HeaderTemplate>
                  Debit/Credit
                </HeaderTemplate>
                <ItemTemplate >
                   D
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                <asp:BoundField DataField="ChequeSequence" HeaderText="Narration" />--%>
                    </Columns>
                    <PageHeaderTemplate>
                        <%--<br />
                <span class="headText2" style="margin-left: 0px; clear: both">Batch No :<%# gvPrint.__batchNo.ToString() %></span>
                <br />--%>
                    </PageHeaderTemplate>
                    <PageFooterTemplate>
                        <br />
                        <%--<hr />--%>
                Page
                <%# gvPrint.CurrentPrintPage.ToString() %>
                /
                <%# gvPrint.mbprint + gvPrint.PrintPageCount%>
                    </PageFooterTemplate>
                    <%--<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#909090" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#b0b0b0" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />--%>
                </wc1:ReportGridView>

                <br />
                <span style="padding-right: 10px">clearing In Charge: _____________________ </span><span style="padding-left: 10px">clearing officer: ____________________________</span>
            </div>

        </div>

    </form>
</body>
</html>
