<%@ Page Title="" Language="C#" MasterPageFile="~/Outward/Outward.Master" AutoEventWireup="true"
    CodeBehind="UnlockBatch.aspx.cs" Inherits="Accs.Web.Outward.UnlockBatch" 
    ValidateRequest="false"
    %>
<%@ MasterType VirtualPath="~/Outward/Outward.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="OutwardHead" runat="server">
    <title>Outward Checker</title>
    <link href="../Style/admin.css" rel="stylesheet" type="text/css" />
    <link href="../Style/modal/css/outward_modal.css" rel="stylesheet" type="text/css" />
    <link href="../Style/modal/css/sprites.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="Stylesheet" href="../Style/outward2.css" />
    <link type="text/css" rel="Stylesheet" href="../Style/outward_button.css" />
    <link type="text/css" rel="Stylesheet" href="../Style/OutwardGridView.css" />
    <link type="text/css" href="../Style/redmond/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
    <link type="text/css" rel="Stylesheet" href="../Style/ach.css" />
    <style type="text/css">
        .m_batch td
        {
            padding: 1px 2px 1px 5px;
            height: 30px;
            margin-left: 240px;
            vertical-align: middle;
        }
        table.m_batch
        {
            border-width: 1px;
            border-spacing: 0px;
            border-style: solid;
            border-color: #dfdfdf;
            border-collapse: collapse;
            background-color: white;
        }
        table.m_batch th
        {
            border-width: 1px;
            padding: 0px;
            border-style: solid;
            border-color: #dfdfdf;
            background-color: white;
        }
        table.m_batch td
        {
            border-width: 1px;
            border-style: solid;
            border-color: #dfdfdf;
            background-color: white;
            padding: 2px 5px 2px 5px;
        }
        table.m_batch td
        {
            background-color: #fff;
        }
        table.m_batch td.td_alt
        {
            background-color: #eeeeee;
        }
        .count_label
        {
            vertical-align: middle;
            width: 125px;
            text-align: right;
        }
        .count_val
        {
            width: 100px;
            font-weight: bold;
            font-size: 16px;
        }
        .CheckBoxProcess
        {
            display: inline-block;
            width: 120px;
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="OutwardBody" runat="server">
    <form id="UnLockBatch" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/Script/jquery-1.3.2.js" />
        </Scripts>
    </asp:ScriptManager>
    <!-- Main Working Div -->
    <div style="padding: 10px;">
        <table style="width: 800px;">
            <tr>
                <td>
                    <asp:Label class="headText2" ID="TimeOfRefresh" runat="server">Locked Batches</asp:Label><br />
                </td>
            </tr>
            <tr>
                <td>
                    <div class="userBox" style="width: 800px;">
                        <div id="divBatchSelection" runat="server">
                            <asp:GridView ID="gvBatchList" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvBatchList_SelectedIndexChanged"
                                DataKeyNames="BatchId" CellPadding="4" ForeColor="#333333" 
                                GridLines="None" CaptionAlign="Left"
                                Width="800px" OnRowDataBound="gvBatchList_RowDataBound" 
                                Caption="Make sure Someone is not working on these Batches" HorizontalAlign="Center" style="color:Red;">
                                <RowStyle BackColor="#F6F6F6" ForeColor="#222222" BorderColor="#DFDFDF" BorderStyle="Solid"
                                    BorderWidth="1px" />
                                <Columns>
                                    <asp:BoundField HeaderText="Batch  No" DataField="BatchNo">
                                        <ItemStyle Font-Bold="True" Width="120px" />
                                    </asp:BoundField>
                                    <asp:BoundField ItemStyle-Width="80px" HeaderText="Creation Date" DataField="CreationDate"
                                        DataFormatString="{0:dd/MM/yyyy}">
                                        <ItemStyle Width="80px" HorizontalAlign="Right"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Status" DataField="BatchStatusCode">
                                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Total" DataField="Total">
                                        <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Unprocessed">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Accept" DataField="CheckerAccept">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Reject" DataField="CheckerReject">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Locked By" DataField="LastModifiedBy">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:ButtonField CommandName="Select" HeaderText="Action" ShowHeader="True" Text="Unlock">
                                        <ItemStyle Font-Bold="True" Font-Underline="True" Width="45px" />
                                    </asp:ButtonField>
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#e0e0e0" Font-Bold="True" ForeColor="#444444" BorderColor="#DFDFDF"
                                    BorderWidth="1px" />
                                <SelectedRowStyle />
                                <AlternatingRowStyle BackColor="White" ForeColor="#222222" />
                            </asp:GridView>
                            <div id="divNobatch" runat="server" style="text-align: center; padding: 20px;" visible="False">
                                <asp:Label ID="label2" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#666666"
                                    Text="There is no batch to unlock at the moment."></asp:Label>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <!-- Whole Document Modal Overlay -->
    <div id="modal-overlay" style="display: none;">
    </div>
    <!-- Modal for Blocking Data Entry Dialog. -->
    <div id="divModalInformation" class="ModalCenter" style="z-index: 600; height: 570px;
        width: 960px; margin-top: -280px; margin-left: -480px; background-color: #000;
        display: none;">
    </div>
    <!-- Rejection Dialog -->
    <div id="rejection_dialog" class="outward_form ModalCenter" style="z-index: 600;
        width: 260px; margin-top: -200px; margin-left: -130px; display: none;">
        <h3 class="topBar">
            Rejection Reason
        </h3>
        <div id="rejection">
            <ul class="hidden" id="auto_reject_reason" style="padding: 5px 0px 10px 20px; margin: 0px;">
            </ul>
            <label style="text-align: left; width: 200px;">
                Rejection Reason</label>
            <textarea id="rejection_reason" style="width: 240px; height: 100px; text-align: left"></textarea>
            <div class="buttons" style="margin-top: 5px; height: 30px;">
                <button type="button" class="positive" id="reject_confirm" name="reject_confirm">
                    <img src="../media/outward/apply.png" alt="" />
                    Reject
                </button>
                <button type="button" class="regular" id="cancel_reject" name="cancel_reject">
                    <img src="../media/outward/cross.png" alt="" />
                    Cancel
                </button>
                <div style="clear: both;">
                </div>
            </div>
        </div>
    </div>
    <!-- Moday Database Updating... -->
    <div id="divDatabaseUpdating" style="display: none;">
        <div id="divModalDialogBackground" class="ModalCenter">
        </div>
        <div id="divModalDialogContent" class="ModalCenter" style="border: 1px solid #AACCEE;">
            <div style="height: 32px; width: 490px; padding: 5px; margin-left: auto; margin-right: auto;">
                <img src="../media/images/busy.gif" style="width: 32px; height: 32px; float: left;" />
                <div style="height: 32px; float: left;">
                    <div id="divUpdateMessage" style="width: 400px; margin-top: 7px; margin-left: 10px;
                        font-size: 14px; font-weight: bold;">
                        Please wait for Server Response...
                    </div>
                </div>
                <div style="clear: both">
                </div>
            </div>
        </div>
    </div>
    <!-- jQuery Dialog -->
    <div id="dialogPopupImage" title="Image View" style="display: none; width: 500px;
        height: 250px;">
        <img style="" id="popup_image" height="100%" width="100%" alt="" src="" />
    </div>
    <!-- Control Ids -->
    <div id="control_ids" runat="server">

        <script type="text/javascript">
            $(document).ready(function() {
                $("#divOWEditorBackground").css("opacity", 0.20);
                //$("#divModalInformation").css("opacity", 0.20);
                $("#divModalDialogBackground").css("opacity", 0.20);
            });
        </script>

    </div>
    </form>
</asp:Content>
