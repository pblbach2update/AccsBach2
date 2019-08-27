<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakerSingleItemProcess.aspx.cs" Inherits="Accs.Web.Inward.Basic.MakerSingleItemProcess" %>

<%@ Register TagPrefix="cc1" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.0.30512.17815, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maker Process Single Item</title>
    <script src="/Script/jquery-1.10.1.min.js"></script>
    <script src="/Script/jquery-migrate-1.1.1.js"></script>
    <script src="/Script/3.6/bootstrap.min.js"></script>

    <link href="/Style/3.6/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">


        function calendarShown(sender, args) {
            sender._popupBehavior._element.style.zIndex = 10005;
        }
        String.format = function () {
            var s = arguments[0];
            for (var i = 0; i < arguments.length - 1; i++) {
                var reg = new RegExp("\\{" + i + "\\}", "gm");
                s = s.replace(reg, arguments[i + 1]);
            }

            return s;
        }

        $(function () {

            if ($("#chkrejsel").is(":checked")) {
                $("#rrNumber").val($("#dropdownrreason").val());
                $("#rrNumber").removeAttr("disabled").focus();
            }


            $("#nextSigCard").on("click", function (e) {
                var curIndex = $("#curImgIndex").val();

                curIndex = 1 + parseInt(curIndex);

                console.log(curIndex);
                var stringFormat = $("#hdImageUrlTemplate").val();

                var imgUrl = String.format(stringFormat, curIndex);
                $("#curImgIndex").val(curIndex);
                console.log(imgUrl);

                $("#cbsImage").attr("src", imgUrl);
                e.preventDefault();

            });

            $("#prevSigCard").on("click", function (e) {
                var curIndex = $("#curImgIndex").val();

                if (curIndex !== "1") {
                    curIndex = parseInt(curIndex) - 1;

                    console.log(curIndex);
                    var stringFormat = $("#hdImageUrlTemplate").val();

                    var imgUrl = String.format(stringFormat, curIndex);
                    $("#curImgIndex").val(curIndex);
                    console.log(imgUrl);

                    $("#cbsImage").attr("src", imgUrl);
                }
                e.preventDefault();

            });


            $("#rrNumber").keydown(function (event) {
                var keyCode = event.which || event.keyCode;
                if (keyCode == 13 || keyCode == 9) {
                    event.preventDefault();
                    $("#reject").focus();
                    return false;
                }
                return true;
            });
            $("#rrNumber").keyup(function (event) {

                var rcode = $(this).val();
                if (rcode <= 0 || rcode > 29) return;
                $("#dropdownrreason").val(rcode);


            });
            $("#chkrejsel").click(function () {

                if ($(this).is(":checked")) {
                    $("#dropdownrreason").removeAttr("disabled");
                    $("#rrNumber").removeAttr("disabled").focus();
                    $("#accept").attr("disabled", "disabled");
                    $("#reject").removeAttr("disabled");
                } else {
                    $("#dropdownrreason").attr("disabled", "disabled");
                    $("#rrNumber").attr("disabled", "disabled");
                    $("#accept").removeAttr("disabled");
                    $("#reject").attr("disabled", "disabled");
                }
            });




        });


        function showCbsPanel() {
            $(".modal").show();

        }


    </script>

    <style>
        @-ms-viewport {
            width: auto !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id="msgdiv" runat="server" visible="False" enableviewstate="false" style="background-color: #FFFFDE; border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px; width: 800px"></div>
        <div class="container col-sm-offset-1">

            <div class="row">
                <div class="col-md-5">

                    <div class="panel panel-default">
                        <div class="panel-heading">Instument Detail</div>
                        <div class="panel-body">

                            <table style="width: 100%; margin-bottom: 2px;" cellpadding="1">
                                <tr>
                                    <td>Cheque No
                                    </td>
                                    <td>
                                        <asp:Label ID="checkno" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>ChequeAmount
                                    </td>
                                    <td>
                                        <span style="background-color: #FFFFCC; font-weight: bold; font-size: 12px; border-style: solid; border-width: 1px">
                                            <asp:Label ID="chqamount" runat="server" BackColor="#FFFFCC"></asp:Label>
                                            &nbsp; Tk</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Acc No
                                    </td>
                                    <td>
                                        <asp:Label ID="accno" runat="server" Text="123456789"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Transaction Code
                                    </td>
                                    <td>
                                        <asp:Label ID="tcode" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Currency
                                    </td>
                                    <td>
                                        <asp:Label ID="lbCurrency" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Issue Date
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbIssuedate" runat="server" BorderColor="#888888" BorderStyle="Solid"
                                            BorderWidth="1px" Width="100px" Font-Names="Trebuchet MS" Font-Size="12px" Visible="true" ></asp:TextBox>
                                        (dd/mm/yyyy)
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1"
                                            TargetControlID="tbIssuedate" Format="dd/MM/yyyy" OnClientShown="calendarShown">
                                        </cc1:CalendarExtender>
                                        <asp:Image ID="Image1" runat="server" Height="15px" ImageUrl="/media/images/calendar.gif" />

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Random Number(Pin)
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="tbBasicRandomNumber" MaxLength="3" TextMode="SingleLine" BorderColor="#888888"  BorderWidth="1px" Width="100px" BorderStyle="Solid" Font-Names="Trebuchet MS" Font-Size="12px"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender runat="server" TargetControlID="tbBasicRandomNumber" FilterType="Numbers" />
                                    </td>
                                </tr>
                               <%-- <tr>
                                    <td>Cheque Type
                                    </td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlMblChequeType" AppendDataBoundItems="True">
                                            <asp:ListItem Text="Select Type" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td>Presenting Bank Name
                                    </td>
                                    <td>
                                        <asp:Label ID="pbankname" runat="server" Text=""></asp:Label></td>
                                </tr>

                                <tr>
                                    <td>Status
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbItemStatusInBach"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                        </div>

                    </div>

                </div>

                <div class="col-md-5">

                    <div class="panel panel-default">
                        <div class="panel-heading">Customer Profile</div>
                        <div class="panel-body">
                            <table width="100%">
                                <tr>
                                    <td>Cbs Account No 
                                    </td>

                                    <td>

                                        <asp:Label runat="server" ID="lbCbsAccount"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Account Holder Name
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="lbCbsAccountTitle"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Balance</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbCbsBalance"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Contact Number</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbCbsContact"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Status</td>
                                    <td>
                                        <asp:Label runat="server" ID="lbCbsStatus"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-5">

                    <div class="panel panel-default">
                        <div class="panel-heading">Front</div>
                        <div class="panel-body">

                            <asp:Image runat="server" ID="chqfront" AlternateText="No Front Image Found" ToolTip="Cheque Front Image"
                                BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" Height="238px" Width="100%"></asp:Image>
                        </div>

                    </div>

                </div>

                <div class="col-md-5">

                    <div class="panel panel-default">
                        <div class="panel-heading">Back</div>
                        <div class="panel-body">

                            <asp:Image runat="server" ID="chqrear" AlternateText="No Rear Image Found" ToolTip="Cheque Rear Image"
                                BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" Height="238px" Width="100%"></asp:Image>
                        </div>

                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-md-5">

                    <div class="panel panel-default">
                        <div class="panel-heading">CBS Card</div>
                        <div class="panel-body">

                            <asp:Image runat="server" ID="cbsImage" AlternateText="Card Data not available" ToolTip="Cheque Front Image"
                                BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" Height="238px" Width="100%"></asp:Image>
                            <div>
                                <a href="#" id="prevSigCard">Prev</a> <a href="#" id="nextSigCard" style="float: right">Next</a>
                                <input type="hidden" id="curImgIndex" value="1" />
                                <asp:HiddenField runat="server" ID="hdImageUrlTemplate" />
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-md-5">

                    <div class="panel panel-default">
                        <div class="panel-heading">Customer Signature</div>
                        <div class="panel-body">
                            <asp:Image runat="server" ID="imgsigInCheque" AlternateText="No Front Image Found" ToolTip="Cheque Front Image"
                                BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" Height="238px" Width="100%"></asp:Image>
                        </div>

                    </div>
                </div>


            </div>
            <div class="row">
               <div class="col-md-10">
                   User Action
                <hr style="border: 1px solid darkgray"/>
               </div>
                
            </div>
            

            <div class="row">
                <div class="col-md-5 col-md-offset-3">
                    <table>

                        <tr>
                            <td class="style3">
                                <asp:CheckBox ID="chkrejsel" runat="server" AutoPostBack="false" OnCheckedChanged="rejectChecked"
                                    TabIndex="3" />Reject Reason
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="dropdownrreason" runat="server" Width="300px" Enabled="false" TabIndex="4">
                                </asp:DropDownList>
                                <input type="text" value="" id="rrNumber" style="width: 60px" disabled="disabled" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5 col-md-offset-3">
                    <asp:Button ID="accept" runat="server" Text="Honour" OnClick="OnInwardMakerAcceptClicked" />
                    <asp:Button ID="reject" runat="server" Text="Dishonour" OnClick="OnInwardMakerRejectClicked" Enabled="False" OnClientClick='return  true;' TabIndex="1" />
                   <asp:Button ID="closewin" runat="server" Text="Close" OnClick="BackToListPage" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
