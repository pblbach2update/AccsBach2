<%@ Page Title="" Language="C#" MasterPageFile="/Outward/Outward.Master" AutoEventWireup="true" CodeBehind="MblCbsStatusItemView.aspx.cs" Inherits="Accs.Web.Outward.Mbl.MblCbsStatusItemView" ClientIDMode="Static" %>

<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="OutwardHead" runat="server">
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/Script/jquery-migrate-1.1.1.js" type="text/javascript"></script>
    <script src="/Script/3.6/bootstrap.min.js" type="text/javascript"></script>
    <link href="/Style/3.6/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .containerWidth {
            width: 1100px;
        }
    </style>
    <script>
        $(function () {

            $("#chkboxSelectAll").change(function () {
                var toggle = false;
                if ($(this).is(":checked")) {
                    toggle = true;

                }

                $("input:checkbox").each(
                        function () {

                            $(this).prop("checked", toggle);
                        }

                 );




            });

        });
        function ShowModal() {
            $("#myModal").modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="OutwardBody" runat="server">
    <form runat="server">
        <div class="container containerWidth">

            <div class="row">

                <div class="col-sm-10">

                    <div class="panel panel-default">

                        <div class="panel-body">


                            <asp:DropDownList runat="server" ID="ddlClearingType" AppendDataBoundItems="True">
                                <asp:ListItem Text="All" Value="0"></asp:ListItem>
                            </asp:DropDownList>

                            <asp:DropDownList runat="server" ID="ddlCbsRequestType" />


                            <asp:DropDownList runat="server" ID="ddlCurrencyType" AppendDataBoundItems="True">

                                <asp:ListItem Text="All Currency" Value="-1"></asp:ListItem>

                            </asp:DropDownList>


                            <asp:PlaceHolder runat="server" ID="phbranchlist">
                                <uc:brlist ID="branchList" runat="server" selectLoginBranch="True" AutoPostBackOnChange="False"
                                    includeBureau="True" />
                            </asp:PlaceHolder>

                            <asp:DropDownList runat="server" ID="ddlCbsItemRequestState" />


                            <asp:Button runat="server" ID="btShowCbsRequestItems" Text="Show Result" CssClass="btn btn-primary" OnClick="btShowCbsRequestItems_OnClick" />


                        </div>
                    </div>
                </div>
                
                <div class="col-sm-5" style="margin-top:-20px">
                    <h3>
                        <asp:Label runat="server" ID="lbShowResultMessage" CssClass="label label-default"></asp:Label></h3>
                </div>
            </div>

            <asp:PlaceHolder runat="server" Visible="true" ID="phsSowActionButton">
                <div class="row">
                    <div class="col-sm-5 text-left">
                        <asp:Button ID="btActionRequired" runat="server" Text="Resend All" CssClass="btn btn-default" OnClick="BtActionRequired_OnClick"></asp:Button>
                    </div>

                </div>
            </asp:PlaceHolder>

            <div class="row">

                <div class="col-sm-10">

                    <asp:ListView ID="lvOutwardCbsItems" runat="server" ItemPlaceholderID="itemPlaceHolder"
                        ItemType="Accs.Core.Types.MblCbsOutwardItems" ClientIDMode="Predictable" OnItemDataBound="lvOutwardCbsItems_OnItemDataBound"
                        OnDataBound="lvOutwardCbsItems_OnDataBound" DataKeyNames="ChequeID" OnSelectedIndexChanging="cbsListViewSelectIndexChanging"
                        OnPagePropertiesChanging="lvOutwardCbsItems_OnPagePropertiesChanging">
                        <LayoutTemplate>
                            <table class="table table-striped table-bordered text-center">
                                <tr>
                                    <asp:PlaceHolder runat="server" ID="phShowEditOption" Visible="False">
                                        <td>Action
                                        </td>
                                    </asp:PlaceHolder>

                                    <asp:PlaceHolder runat="server" ID="phAllSelectBox" Visible="False">
                                        <td>
                                            <asp:CheckBox runat="server" Checked="True" ID="chkboxSelectAll" ClientIDMode="Static" />
                                        </td>
                                    </asp:PlaceHolder>
                                    <td>Br_Code</td>
                                    <td>Br_Name</td>
                                    <td>Ben A/C</td>
                                    <td>Ben A/C Name</td>
                                    <td>Settlement Date</td>
                                    <td>Bank Name</td>
                                    <td>Cheque No</td>
                                    <td>Amount</td>
                                    <td>Currency</td>
                                    <td>IsChargeApplcable</td>
                                    <td>FT No</td>
                                    <td>CC No</td>
                                    <td>Remarks</td>
                                    <td>Error Message</td>

                                </tr>
                                <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>

                            <tr>
                                <asp:PlaceHolder runat="server" ID="phShowEditButton" Visible="False">
                                    <td>
                                        <asp:LinkButton runat="server" ID="lbEditItems" Text="Edit" CommandName="Select"></asp:LinkButton>
                                    </td>
                                </asp:PlaceHolder>

                                <asp:PlaceHolder runat="server" ID="phShowCheckBoxMarker" Visible="False">
                                    <td>
                                        <asp:CheckBox runat="server" ID="chkBoxItem" Checked="true"></asp:CheckBox>
                                    </td>
                                </asp:PlaceHolder>
                                
                                 <td>
                                    <%# Item.InternalBranchCode %>
                                </td>
                               
                                <td >
                                    <span style="width: 300px" ><%# Item.BOFDBranchName %></span>
                                </td>
                                <td>
                                    <%# Item.BenificiaryAccount %>
                                </td>
                                
                                <td>
                                    <%# Item.BenifName %>
                                </td>

                                <td>
                                    <%# Item.SettlementDateString %>
                                </td>
                                 <td>
                                    <%# Item.IssuingBankShortName %>
                                </td>
                                <td>
                                    <%# Item.ChequeSequence %>
                                </td>
                                
                                <td>
                                    <%# Item.Amount %>
                                </td>
                                <td>
                                    <%# Item.CurrencyType %>
                                </td>
                                <td>
                                    <%# Item.isChargeApplicable %>
                                </td>
                               <td>
                                    <%# Item.OutwardFtNo %>
                               </td>
                                <td>
                                    <%# Item.OutwardCcNo %>
                               </td>
                                 <td>
                                    <%# Item.IsItemCleared?"Honor":"Return" %>
                               </td>
                                <td>
                                    <%# Item.CbsErrorMessage %>
                                </td>


                            </tr>


                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div class="panel panel-default">
                                
                                <div class="panel-body text-center">
                                    
                                    No Data Available
                                </div>
                                
                            </div>
                        </EmptyDataTemplate>

                    </asp:ListView>


                </div>

            </div>

            <div class="row">
                <div class="col-sm-10">
                    <asp:DataPager ID="dtPagerListView" runat="server" ViewStateMode="Disabled" PagedControlID="lvOutwardCbsItems" PageSize="5">
                        <Fields>
                            <asp:NextPreviousPagerField />
                        </Fields>
                    </asp:DataPager>
                </div>

            </div>
        </div>

        <div id="myModal" class="modal fade">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header">

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                        <h4 class="modal-title">Cbs Item Details</h4>

                    </div>

                    <div class="modal-body">

                        <div class="form-group row">
                            <label for="Name" class="col-sm-4 control-label">Cheque No</label>
                            <div class="col-sm-5">
                                <asp:Label runat="server" ID="lbChequeNo"></asp:Label>
                            </div>
                            <asp:HiddenField runat="server" ID="hfRowUniqueId" />

                        </div>


                        <div class="form-group row">
                            <label for="StartDate" class="col-sm-4 control-label">Account No</label>
                            <div class="col-sm-6">
                                <asp:Label runat="server" ID="lbAccountNo"></asp:Label>

                            </div>

                        </div>

                        <div class="form-group row">
                            <label for="StartDate" class="col-sm-4 control-label">Transaction Code</label>
                            <div class="col-sm-6">
                                <asp:Label runat="server" ID="lbTransationCode"></asp:Label>

                            </div>

                        </div>

                        <div class="form-group row">
                            <label for="StartDate" class="col-sm-4 control-label">Bank Name</label>
                            <div class="col-sm-6">
                                <asp:Label runat="server" ID="lbBankName"></asp:Label>

                            </div>

                        </div>

                        <div class="form-group row">
                            <label for="StartDate" class="col-sm-4 control-label">Branch Name</label>
                            <div class="col-sm-6">
                                <asp:Label runat="server" ID="lbBranchName"></asp:Label>

                            </div>

                        </div>

                        <div class="form-group row">
                            <label for="StartDate" class="col-sm-4 control-label">Settlement Date</label>
                            <div class="col-sm-6">
                                <asp:Label runat="server" ID="lbSettlementDate"></asp:Label>

                            </div>

                        </div>

                        <div class="form-group row">
                            <label for="StartDate" class="col-sm-4 control-label">Charge Applicable</label>
                            <div class="col-sm-6">
                                <asp:CheckBox runat="server" ID="chkSingleChargeApplicable"></asp:CheckBox>

                            </div>

                        </div>


                    </div>

                    <div class="modal-footer">

                        <asp:Button ID="btUpdateAndRetry" Text="UpdateAndRetry" CssClass="btn btn-primary" runat="server" OnClick="btUpdateAndRetry_OnClick" />

                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>


                    </div>

                </div>

            </div>

        </div>



    </form>

    <asp:LinqDataSource ID="linqDSItems" runat="server" AutoPage="False" OnSelecting="linqDSItems_Selecting"></asp:LinqDataSource>

</asp:Content>
