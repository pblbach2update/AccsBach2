<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true" CodeBehind="ApproveUser.aspx.cs" Inherits="Accs.Web.Admin.ApproveUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">

    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/Script/jquery-migrate-1.1.1.js" type="text/javascript"></script>
    <script src="/Script/3.6/bootstrap.min.js" type="text/javascript"></script>

    <link href="/Style/3.6/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .containerWidth {
            width: 1200px;
            margin-left: 0px;
            margin-top: 0px;
        }
        .form-group {
            margin-bottom: 5px
        }
    </style>
    <script type="text/javascript">
        function ShowModal() {
            $("#myModal").modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel" runat="server">

    <form runat="server">
        <div id="msgdiv" runat="server" visible="False" enableviewstate="false" style="background-color: #FFFFDE; border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px; width: 800px"></div>
        <div class="container containerWidth">
            <div class="row">
                <div class="col-md-8">
                    <h3>Pending User</h3>
                    <hr />
                    <asp:ListView ID="lvPendingUserList" runat="server" ItemPlaceholderID="itemPlaceHolder"
                        ItemType="Accs.Core.Types.DBUserInfo" DataKeyNames="UserId"
                        ClientIDMode="Predictable" OnItemCommand="lvPendingUserList_OnItemCommand">
                        <LayoutTemplate>
                            <table class="table table-striped table-bordered text-center" style="margin: 4px 0px 0px 0px">
                                <tr>
                                    <td>User Name</td>
                                    <td>Employee Name
                                <td>Branch
                                <td>DesigNation</td>
                                    <td>Description</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>

                            <tr>
                                <td>
                                    <%# Item.UserName %>
                                </td>
                                <td>
                                    <%# Item.EmployeeName %>
                                
                                </td>
                                <td>
                                    <%# Item.BranchName %>
                                </td>

                                <td>
                                    <%# Item.Designation %>
                                </td>
                                <td>
                                    <%# Item.Description %>
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" ID="lbApproveUser" Text="Approve" CommandName="au" CommandArgument="1"></asp:LinkButton>
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" ID="lbCheckAndApprove" Text="View&amp;Approve" CommandName="vau" CommandArgument="2"></asp:LinkButton>
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
        <div id="myModal" class="modal fade">

            <div class="modal-dialog">

                <div class="modal-content">

                    <div class="modal-header">

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                        <h4 class="modal-title">
                            <asp:Label runat="server" ID="lbUserLoginName"></asp:Label></h4>

                    </div>

                    <div class="modal-body">

                        <div class="form-group row">
                            <label for="Name" class="col-sm-4 control-label">Employee Name</label>
                            <div class="col-sm-5">
                                <asp:Label runat="server" ID="lbEmployeeName"></asp:Label>
                            </div>
                            <asp:HiddenField runat="server" ID="hfRowUniqueId" />

                        </div>


                        <div class="form-group row">
                            <label for="lbBranchName" class="col-sm-4 control-label">Branch Name</label>
                            <div class="col-sm-6">
                                <asp:Label runat="server" ID="lbBranchName"></asp:Label>

                            </div>

                        </div>

                        <div class="form-group row">
                            <label for="lbDesignation" class="col-sm-4 control-label">Designation</label>
                            <div class="col-sm-6">
                                <asp:Label runat="server" ID="lbDesignation"></asp:Label>

                            </div>

                        </div>

                        <div class="form-group row">
                            <label for="StartDate" class="col-sm-4 control-label">Description</label>
                            <div class="col-sm-6">
                                <asp:Label runat="server" ID="lbDescription"></asp:Label>

                            </div>

                        </div>




                        <div class="form-group row">
                            <label for="StartDate" class="col-sm-4 control-label">Status</label>
                            <div class="col-sm-6">
                                <asp:Label runat="server" ID="lbIsUserActive"></asp:Label>

                            </div>

                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <h3>Operation Limit</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-8">
                                <asp:ListView ID="lvCurrencyWiseLimit" runat="server" ItemPlaceholderID="phOperationLimit" ItemType="Accs.Core.Types.BachCurrencyWiseLimit">
                                    <LayoutTemplate>
                                        <table class="table table-striped text-center" style="margin: 4px 0px 0px 0px">
                                            <tr>
                                                <td>Currency Name</td>
                                                <td>Outward Maker Limit</td>
                                                <td>Outward Checker Limit</td>
                                                <td>Inward Maker Limit</td>
                                                <td>Inwward Checker Limit</td>
                                            </tr>
                                            <asp:PlaceHolder runat="server" ID="phOperationLimit"></asp:PlaceHolder>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>

                                        <tr>
                                            <td>
                                                <%# Item.CurrencyType.ToString() %>
                                            </td>
                                            <td>
                                                <%# Item.OutwardMakerLimit %>
                                
                                            </td>
                                            <td>
                                                <%# Item.OutwardCheckerLimit %>
                                            </td>

                                            <td>
                                                <%# Item.InwardMakerLimit %>
                                            </td>
                                            <td>
                                                <%# Item.InwardCheckerLimit %>
                                            </td>

                                        </tr>


                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        No data found
                                    </EmptyDataTemplate>
                                </asp:ListView>
                            </div>
                        </div>


                    </div>

                    <div class="modal-footer">

                        <asp:Button ID="btUpdateAndRetry" Text="Approve" CssClass="btn btn-primary" runat="server" OnClick="btActivate_OnClick" />

                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>


                    </div>

                </div>

            </div>

        </div>
    </form>

</asp:Content>
