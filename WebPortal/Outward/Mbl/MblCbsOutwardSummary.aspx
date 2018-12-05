<%@ Page Title="" Language="C#" MasterPageFile="/Outward/Outward.Master" AutoEventWireup="true" CodeBehind="MblCbsOutwardSummary.aspx.cs" Inherits="Accs.Web.Outward.Mbl.MblCbsOutwardSummary" %>
<%@ Register TagPrefix="uc" TagName="brlist" Src="/usercontrol/BranchListNew.ascx" %>
<%@ Import Namespace="Accs.Core.Common" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="OutwardBody" runat="server">
    
    <form runat="server">
    <div class="container containerWidth">

        <asp:PlaceHolder runat="server" ID="phbranchlist">
            <uc:brlist id="branchList" runat="server" selectloginbranch="True" autopostbackonchange="true" includebureau="True" OnOnAutoPostBackControl="ddlBranchList_SelectedIndexChanged" CssClass="form-control" />
        </asp:PlaceHolder>
        <h3>FundTransfer</h3>
        <hr />

        <div class="row">

            <div class="col-sm-8">

                <asp:ListView ID="lvOutwardFtSummary" runat="server" ItemPlaceholderID="itemPlaceHolder"
                    ItemType="Accs.Core.Types.MblOutwardCbsSummary"
                    ClientIDMode="Predictable">
                    <LayoutTemplate>
                        <table class="table table-striped table-bordered text-center">
                            <tr>
                                <td>Clearing Type
                                </td>
                                <td>Pending 
                                <td>Successful
                                <td>Failed</td>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>

                        <tr>
                            <td>
                                <%# (ECEType)Item.ClearingType %>
                            </td>
                            <td style="font-size: 20px">
                                <%# AddItemViewLink(Item,MblCbsRequestType.FundTransfer,MblCbsItemRequestState.Pending) %>
                                
                            </td>
                            <td class="text-success" style="font-size: 20px">
                                <%# AddItemViewLink(Item,MblCbsRequestType.FundTransfer,MblCbsItemRequestState.Successful) %>
                            </td>

                            <td class="text-danger" style="font-size: 20px">
                                <%# AddItemViewLink(Item,MblCbsRequestType.FundTransfer,MblCbsItemRequestState.Failed) %>
                            </td>

                        </tr>


                    </ItemTemplate>
                    <EmptyDataTemplate>
                        No data Found
                    </EmptyDataTemplate>

                </asp:ListView>


            </div>
        </div>

        <h3>Collection</h3>
        <hr />
        <div class="row">

            <div class="col-sm-8">

                <asp:ListView ID="lvCbsOutwardCollectionRequest" runat="server" ItemPlaceholderID="itemPlaceHolder"
                    ItemType="Accs.Core.Types.MblOutwardCbsSummary"
                    ClientIDMode="Predictable">
                    <LayoutTemplate>
                        <table class="table table-striped table-bordered text-center">
                            <tr>
                                <td>Clearing Type</td>
                                <td>Pending </td>
                                <td>Marked For Collection</td>
                                <td>Successful</td>
                                <td>Failed</td>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>

                        <tr>
                            <td>
                                <%# (ECEType)Item.ClearingType %>
                            </td>
                            <td style="font-size: 20px">
                                <%# AddItemViewLink(Item,MblCbsRequestType.Collection,MblCbsItemRequestState.Pending) %>
                            </td>
                            <td style="font-size: 20px">
                                <%# AddItemViewLink(Item,MblCbsRequestType.Collection,MblCbsItemRequestState.MarkedForCollection) %>
                            </td>
                            <td class="text-success" style="font-size: 20px">
                                <%# AddItemViewLink(Item,MblCbsRequestType.Collection,MblCbsItemRequestState.Successful) %>
                            </td>

                            <td class="text-danger" style="font-size: 20px">
                                <%# AddItemViewLink(Item,MblCbsRequestType.Collection,MblCbsItemRequestState.Failed) %>
                            </td>

                        </tr>


                    </ItemTemplate>
                    <EmptyDataTemplate>
                        No data Found
                    </EmptyDataTemplate>

                </asp:ListView>


            </div>
        </div>

      </div>

</form>
</asp:Content>
