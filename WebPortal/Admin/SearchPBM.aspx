<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="SearchPBM.aspx.cs" Inherits="Accs.Web.Admin.SearchPBM" ClientIDMode="Static" %>

<%@ Register TagPrefix="uc" TagName="blist" Src="~/usercontrol/BankListNew.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Style/OutwardGridView.css" />
    <script src="../Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <style type="text/css">
        .col12LabelStyle
        {
            padding: 0px 0px 0px 5px;
            height: 16px;
            font-weight: bold;
        }
        .col3LableStyle
        {
            padding: 0px 0px 0px 10px;
            height: 16px;
            width: 140px;
            font-weight: bold;
            text-align: right;
        }
        .amtLabel
        {
            padding: 0px 0px 0px 5px;
            height: 16px;
            font-weight: bold;
            text-align: right;
        }
        .textboxStyle
        {
            /*#667C9D	*/
            border-color: #667C9D;
            border-style: solid;
            border-width: 1px;
        }
    </style>
    <style type="text/css">
        .styleheader
        {
            border: 5px double #c5c5c0;
            height: 30px;
            background-color: #D0D0D0;
            color: #111111;
        }
        
        .input-mini
        {
            width: 60px;
        }
        label
        {
            display: block;
            margin-bottom: 5px;
        }
        .table-condensed th, .table-condensed td
        {
            padding: 4px 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server" enableviewstate="True">
    <div id="msgdiv" runat="server" visible="False" enableviewstate="True" style="background-color: #FFFFDE;
        border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px;
        width: 800px">
    </div>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Label ID="errLabel" runat="server" Text="No Date is provided" Font-Bold="True"
            ForeColor="#FF3300" Visible="False"></asp:Label>
        <table cellpadding="3" cellspacing="3" style="width: 900px;">
            <tr>
                <td style="width: 100%; border-style: double; border-color: #C0C0C0; padding: 3px"
                    valign="top" colspan="2">
                    <table style="width: 90%">
                        <tr>
                            <td>
                                Bank Name
                            </td>
                            <td style="padding-left: 3px;">
                                <uc:blist ID="blist" runat="server" IncludeOwnBank="True"></uc:blist>
                            </td>
                            <td>
                                WorkSource
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlWorkSource" AppendDataBoundItems="True">
                                    <asp:ListItem Text="All" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <%--<td class="col12LabelStyle">
                                        Clearing Type
                                    </td>
                                    <td style="padding-left: 10px;">
                                        <asp:DropDownList runat=server ID="ddlClearingtype" DataTextField="name" DataValueField="value"></asp:DropDownList>
                                    </td>--%>
                            <td>
                                SettlementDate
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSettlementDate" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100%; border-style: double; border-color: #C0C0C0; padding: 3px"
                    valign="top" colspan="2">
                    <table style="width: 100%">
                        <tr>
                            <td class="col12LabelStyle">
                                Cheque No
                            </td>
                            <td style="padding-left: 5px;">
                                <asp:TextBox ID="chequeTextBox" Font-Size="8pt" runat="server" CssClass="textboxStyle"
                                    Width="100px"></asp:TextBox>
                            </td>
                            <td class="col12LabelStyle">
                                Amount
                            </td>
                            <td>
                                &nbsp;<asp:TextBox ID="minTextBox" runat="server" CssClass="textboxStyle" Font-Size="8pt"
                                    Width="80px"></asp:TextBox>
                                &nbsp;to
                                <asp:TextBox ID="maxTextBox" runat="server" CssClass="textboxStyle" Font-Size="8pt"
                                    Width="80px"></asp:TextBox>
                            </td>
                            <td class="col12LabelStyle">
                                A/C No.
                            </td>
                            <td style="padding-left: 10px;">
                                <asp:TextBox ID="accTextBox" Font-Size="8pt" runat="server" CssClass="textboxStyle"
                                    Width="120px"></asp:TextBox>
                            </td>
                            <td style="padding-left: 5px;">
                                <asp:ImageButton ID="searchButton" runat="server" ImageUrl="~/media/images/search.png"
                                    OnClick="searchButton_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="border-color: #C0C0C0; border-style: double; padding-left: 0px; padding: 5px 0 0 3px;"
                    valign="top" colspan="2">
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="250px" Width="100%">
                        <asp:Label ID="LabelCount" runat="server"></asp:Label>
                        <br />
                        <asp:GridView Width="95%" ID="gvSearch" runat="server" CellPadding="1" AutoGenerateColumns="False"
                            GridLines="Horizontal" PageSize="20" CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle"
                            HeaderStyle-CssClass="OW_HeaderStyle" RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle"
                            Font-Names="Trebuchet MS" Font-Size="9pt">
                            <RowStyle CssClass="RowStyle" />
                            <Columns>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:HiddenField Visible="false" ID="hidgenid" runat="server" Value='<%# Eval("GenerationId") %>' />
                                        <asp:LinkButton ID="lbRemoveCheque" CommandName="genarationid" CommandArgument='<%# Eval("GenerationId") %>'
                                            OnClick="editThisCheque" runat="server">Remove Cheque</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:HiddenField Visible="false" ID="hidrunid" runat="server" Value='<%# Eval("run") %>' />
                                        <asp:LinkButton ID="lbPrint" CommandArgument='<%# Eval("run") %>'  OnClientClick="return  confirm('Are you sure to remove?') "    OnClick="printThisCheque" runat="server">Remove Run</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Run" HeaderText="Run" />
                                <asp:BoundField DataField="ChequeNo" HeaderText="ChequeNo" />
                                <asp:BoundField DataField="ChequeAccount" HeaderText="Account No" />
                                <asp:BoundField DataField="IssuingBankShortName" HeaderText="Issuing Bank" />
                                <asp:BoundField DataField="BoftBankName" HeaderText="Presenting Bank" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                <asp:BoundField DataField="WorkSourceString" HeaderText="Work Source" />
                                <asp:BoundField DataField="ReturnReason" HeaderText="Retrun Text" />
                                <asp:BoundField DataField="IQA" HeaderText="IQA Failure" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td valign="top" style="width: 290px; border-color: #C0C0C0; display: none" id="editcheck"
                    runat="server">
                    <table class="style1">
                        <tr>
                            <td>
                                <asp:Label ID="lbResult" runat="server" Font-Bold="True" Font-Size="10pt" ForeColor="#096023"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 520px; display: none" runat="server" id="chkimage">
                    <asp:Image ID="chqfront" runat="server" AlternateText="No Front Image Found" BorderColor="#3C516A"
                        BorderStyle="Solid" BorderWidth="3px" ToolTip="Front Image" Width="600px" />
                    <asp:Image ID="chqBack" runat="server" AlternateText="No back Image Found" BorderColor="#3C516A"
                        BorderStyle="Solid" BorderWidth="3px" ToolTip="back Image" Width="600px" />
                </td>
            </tr>
        </table>
        <div id="printdiv" title="Image View" style="display: none;" runat="server">
            <asp:Image ID="chqFrontPrint" runat="server" AlternateText="No Front Image Found"
                BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" ToolTip="Front Image"
                Width="600px" />
            <br />
            <br />
            <asp:Image ID="chqRearPrint" runat="server" AlternateText="No Back Image Found" BorderColor="#3C516A"
                BorderStyle="Solid" BorderWidth="3px" ToolTip="Front Image" Width="600px" />
        </div>
    </div>
    </form>
</asp:Content>
