<%@ Page Title="" Language="C#" MasterPageFile="/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="UpdateAdviceNo.aspx.cs" Inherits="Accs.Web.Admin.UpdateAdviceNo" culture="bn-BD" uiCulture="bn-BD"  EnableEventValidation="false"  %>
<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" rel="Stylesheet" href="/Style/OutwardGridView.css" />
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script>
        
        $(function() {
            $(".mtable tr td:first-child").css("text-align", "right");
        })

        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form id="form1" runat="server">
    <div id="msgdiv" runat="server" visible="False" enableviewstate="false" style="background-color: #FFFFDE;
        border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px;
        width: 800px">
    </div>
    <asp:ValidationSummary ID="vdsummary" runat="server" ShowMessageBox="True" />
    Select Advice Type :
    <asp:DropDownList ID="ddlAdviceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ShowAdviceForm">
        <asp:ListItem Text="Settlement Advice" Value="0"></asp:ListItem>
        <asp:ListItem Text="Monthly Bach CHarge Advice" Value="1"></asp:ListItem>
    </asp:DropDownList>
     <asp:PlaceHolder runat="server" ID="phbrlist">
                        <uc:brlist id="branchList" runat="server" autopostbackonchange="true" 
                             selectloginbranch="True" OnOnAutoPostBackControl="OnBranchChange" />
                    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="phdaily">
        <div style="margin: 10px 0 10px 0">
            <div style="font-weight: bold; font-size: 16px">
                Daily Advice Generation:
                <asp:Label runat="server" ID="cldate"></asp:Label>
            </div>
            <div style="width: 800px; height: 0px; border: 1px solid #DDDDDD; margin-top: 4px">
            </div>
        </div>
        <asp:GridView ID="gvClearingSummary" runat="server" AutoGenerateColumns="False" Width="800px"
            OnRowDataBound="gvClearingSummary_RowDataBound" GridLines="Horizontal" PageSize="20"
            CssClass="OW_GridViewStyle" PagerStyle-CssClass="OW_PagerStyle" HeaderStyle-CssClass="OW_HeaderStyle"
            RowStyle-CssClass="OW_RowStyle" AlternatingRowStyle-CssClass="OW_AltRowStyle"
            Font-Names="Trebuchet MS" Font-Size="9pt" OnRowCreated="gvClearingSummary_RowCreated">
            <RowStyle CssClass="OW_RowStyle"></RowStyle>
            <Columns>
                <asp:BoundField DataField="ClrTypeStringString" HeaderText="" />
                <asp:BoundField DataField="outSentCount" HeaderText="Count">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="outSentAmount" DataFormatString="{0:##,##,##,###.##}"
                    HeaderText="Amount">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="inHonoredCount" HeaderText="Count">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="inHonoredAmount" DataFormatString="{0:##,##,##,###.##}"
                    HeaderText="Amount">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="inDishonoredCount" HeaderText="Count">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="inDishonoredAmount" DataFormatString="{0:##,##,##,###.##}"
                    HeaderText="Amount">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="outDishonoredCount" HeaderText="Count">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="outDishonoredAmount" DataFormatString="{0:##,##,##,###.##}"
                    HeaderText="Amount">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="outTotalAmount" DataFormatString="{0:N}" HeaderText="Net Settlement"
                    HtmlEncode="False">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Advice No">
                    <ItemTemplate>
                        <asp:TextBox ID="tbAdviceNo" runat="server" Width="50px" Text='<%# Eval("AdviceNo")%>'></asp:TextBox>
                        <asp:LinkButton ID="updateStatus" runat="server" OnClick="UpdateAdvice" OnClientClick="return confirm('Are you sure  ?')"
                            CommandArgument='<%# Eval("ClrTypeStringString") %>'>Update</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="OW_PagerStyle"></PagerStyle>
            <HeaderStyle CssClass="OW_HeaderStyle"></HeaderStyle>
            <AlternatingRowStyle CssClass="OW_AltRowStyle"></AlternatingRowStyle>
        </asp:GridView>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="phmonth" Visible="False">
        <div style="margin: 10px 0 10px 0">
            <div style="font-weight: bold; font-size: 16px">
                Monthly Advice Generation:
                <asp:Label runat="server" ID="lbrange"></asp:Label>
            </div>
            <div style="width: 800px; height: 0px; border: 1px solid #DDDDDD; margin-top: 4px">
            </div>
        </div>
        <table cellpadding="4" class="mtable">
            <tr>
                <td>Select Month</td>
                <td><asp:DropDownList ID="ddlMonthMBC" runat="server" AutoPostBack="True" OnSelectedIndexChanged="UpdateAdviceMonth">
                      <asp:ListItem Text="Current Month" Value="0"></asp:ListItem>
                      <asp:ListItem Text="Previous Month" Value="1"></asp:ListItem>
                </asp:DropDownList> </td>
            </tr>
            <tr>
                <td>
                    No of High Value Cheques :
                </td>
                <td>
                    <asp:Label ID="lbNoOfHighValueCheques" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    BB Charge On High Value Cheques :
                </td>
                <td>
                    <asp:Label ID="lbHighValueCharge" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    No of Regular Value Cheques :
                </td>
                <td>
                    <asp:Label ID="lbNoOfRgValueCheques" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    BB Charge On Regular Value Cheques :
                </td>
                <td>
                    <asp:Label ID="lbNormalValueCharge" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Total Charge :
                </td>
                <td>
                    <asp:Label ID="lbTotal" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Advice No :

                </td>
                <td>
                    <asp:TextBox ID="tbAdviceNo" runat="server"></asp:TextBox>

                </td>

            </tr>
            <tr>
                <td>
                <asp:Button ID="btUpdate" runat="server" Text="Update Advice" OnClick="UpdateAdvice" OnClientClick="return confirm('Are you sure  ?')"/>
                </td>
                

            </tr>
        </table>
    </asp:PlaceHolder>
    </form>
</asp:Content>
