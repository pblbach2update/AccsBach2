<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkerprocessKrishi.aspx.cs"
    Inherits="Accs.Web.Inward.checkerprocessKrishi" EnableEventValidation="false" ValidateRequest="false" %>

<html>
<head>
    <title>ACCS checker</title>


    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/Script/tjpzoom.js" type="text/javascript"></script>

    <script src="/Script/tjpzoom_config_roundfun.js" type="text/javascript"></script>

    <link href="/Style/Header.css" rel="stylesheet" type="text/css" />
    <link href="/Style/ach.css" rel="stylesheet" type="text/css" />
    <link href="/Style/admin.css" rel="stylesheet" type="text/css" />
    <link href="/Style/SimpleModal.css" rel="stylesheet" />

    <script type="text/javascript">



        $(function () {

            if ($("#chkrejsel").is(":checked")) {
                $("#rrNumber").val($("#dropdownrreason").val());
                $("#rrNumber").removeAttr("disabled").focus();
            }



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

            $(document).keypress(function (e) {
                if (e.keyCode == 27) {
                    $(".modal").hide();
                }

            });


        });


        function showCbsPanel() {
            $(".modal").show();

        }


    </script>

    <style type="text/css">
        .infogap {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form runat="server" id="form1">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <script language="javascript" type="text/javascript">
            //this method will be called when the html part is loaded.
            //it simply registers a method with one of the ajax events.
            //for now we are  for the end request which
            //will be called when the ajax request is fully complete

            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequestHandler);
            Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
          
            //this method will be invoked when the ajax request is complete
            //do anything you want in this block
            //for now we just display a message
            function BeginRequestHandler(sender, args) {

                var elem = args.get_request();
                //$("#actionProgress").css("visibility", "visible");

                //alert(elem.ID);

            }
            function endRequestHandler(sender, args) {
                //check if any error or exceptions occured and show the appropriate message

                var scroll = true;
                if (args.get_error() == null) {
                    var dataItems = args.get_dataItems();
                    if (dataItems['dberror'] != null) {
                        alert(dataItems['chqnotfound']);

                    }
                    if (dataItems['updatestat'] != null) {
                        if (dataItems['updatestat'] == "0") {

                            window.close();

                        }


                    }


                }
                else {
                    alert("A Network error Occured.Please Try Again");
                }
                if (scroll) {
                    window.scroll(0, 0);
                }

            }

        </script>

        <asp:UpdatePanel ID="processpanel" runat="server">
            <ContentTemplate>
                <input type="hidden" id="cheque_id" runat="server" value="" />
                <input type="hidden" id="clrType" runat="server" value="" />
                <table style="width: 100%; margin-top: 2px;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="2">
                            <table style="width: 100%">
                                <tr>
                                   <td align="right">
                                        <asp:Label ID="chequecount" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="width: 52%; padding-top: 10px; padding-left: 5px">
                            <div style="margin-bottom: 10px">
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked="false" Text="Enable Zoom" AutoPostBack="true"
                                    OnCheckedChanged="enableZooming" />
                            </div>
                            <div style="margin-bottom: 10px">
                                <asp:Image runat="server" ID="chqfront" AlternateText="No Front Image Found" ToolTip="Cheque Front Image"
                                    BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" Height="238px" Width="520px"></asp:Image>
                            </div>
                            <div>
                                <asp:Image runat="server" ID="chqrear" AlternateText="No Rear Image Found" ToolTip="Cheque Rear Image"
                                    BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" Height="238px" Width="520px"></asp:Image>
                            </div>
                        </td>
                        <td valign="top" style="width: 44%; padding-top: 5px; padding-left: 5px;">
                            <div style="margin-top: 35px">
                                <span class="headText2">Cheque Info</span>
                                <div class="userBox" style="width: 100%">
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
                                    </table>
                                </div>
                            </div>
                            <div class="infogap">
                                <%-- <span class="headText2">Image Quality</span>
                            <div class="userBox" style="width: 100%">
                                <table cellpadding="0" style="margin-bottom: 0px; width: 100%">
                                    <tr>
                                        <td class="style6">
                                            Brightness
                                        </td>
                                        <td id="brightness" runat="server">
                                            [brightness]
                                        </td>
                                        <td class="style6">
                                            Skew
                                        </td>
                                        <td id="skew" runat="server">
                                            [skew]
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            MICR Quality
                                        </td>
                                        <td id="micrq" runat="server">
                                            [micrq]
                                        </td>
                                        <td class="style6">
                                            Size
                                        </td>
                                        <td id="chqsize" runat="server">
                                            [chqsize]
                                        </td>
                                    </tr>
                                </table>
                            </div>--%>
                            </div>
                            <div class="infogap">
                                <span class="headText2">Presenting Bank Info</span>
                                <div class="userBox" style="width: 100%">
                                    <table style="width: 100%; margin-bottom: 0px;" cellpadding="0">
                                        <tr>
                                            <td>
                                                <asp:Label ID="pbankname" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <%--<div class="infogap">
                        <div class="userBox"  style="width: 100%;padding:5px 10px 5px 10px;">
                            <table style="width: 100%;" cellpadding="0">
                                <tr>
                                    <td>
                                        Maker Action
                                    </td>
                                    <td>
                                        <asp:Label ID="makerAction" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        </div>--%>
                            <div class="infogap">
                                <asp:Label ID="serverRsp" runat="server" Text="Label" Visible="False" CssClass="messageLabel"
                                    Height="22px" Width="100%" Style="text-align: center"></asp:Label>
                            </div>
                            <span class="headText2">Checker Action</span>
                            <div class="userBox" style="width: 100%">
                                <table style="width: 100%;" cellpadding="4">
                                    <tr>
                                        <td>
                                            <asp:Label ID="checkerAction" runat="server" Width="100%" BackColor="#f0f1e9" ForeColor="Navy"
                                                Text="<b>Select an action from below"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            <asp:CheckBox ID="chkrejsel" runat="server" AutoPostBack="false" OnCheckedChanged="rejectChecked"
                                                TabIndex="3" />Reject Reason
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style3">
                                            <asp:DropDownList ID="dropdownrreason" runat="server" Width="300px" Enabled="false" TabIndex="4">
                                            </asp:DropDownList>
                                            <input type="text" value="" id="rrNumber" style="width: 60px" disabled="disabled" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="accept" runat="server" Text="Honour" OnClick="userAction" />
                                            <asp:Button ID="reject" runat="server" Text="Dishonour" OnClick="userAction" Enabled="False" OnClientClick='return  true;'
                                                TabIndex="1" />
                                            <asp:Button ID="hold" runat="server" Text="Hold" OnClick="userAction" Visible="false" />
                                            &nbsp;&nbsp;<asp:Button ID="prev" runat="server" Text="Prev" OnClick="userAction"
                                                Visible="false" />
                                            <asp:Button ID="btShowCbsPanel" runat="server" Text="CBS" OnClick="ShowCbsPanel" Visible="False" />
                                            &nbsp;
                                        <asp:Button ID="unlock" runat="server" Text="Next Batch" OnClick="userAction" TabIndex="2"
                                            Visible="false" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                        <%--<input id="cancel" type="button" value="close" onclick=" window.returnValue ='cancel';window.close() " />--%>
                                            <asp:Button ID="closewin" runat="server" Text="Close" OnClick="BackToListPage" />
                                        </td>
                                    </tr>
                                </table>
                            </div>


                        </td>
                    </tr>
                </table>


                <asp:UpdateProgress ID="actionProgress" runat="server" DisplayAfter="50">
                    <ProgressTemplate>
                        <%--<asp:Panel ID="p1" CssClass="overlay" runat="server">
                        <asp:Panel ID="p2" CssClass="loader" runat="server" Style="margin-top: 0px">
                            loading.......
                            <img src="/media/images/busy.gif" /></asp:Panel>
                    </asp:Panel>--%>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <div id="ac2" style="visibility: hidden; display: block;">
                    <%--<div id="p1" class="overlay">
                    <div id="p2" class="loader" style="margin-top: 0px">
                        loading.......
                        <img src="/media/images/busy.gif" />
                    </div>
                </div>--%>
                </div>

                <asp:PlaceHolder runat="server" ID="phCbsPanel" Visible="True">
                    <div class="modal">
                        <div class="modal-content">
                            <div style="padding: 0 0 10px 10px;width:800px">
                                <div>
                                    <h1>A/C No : 1111254789635</h1>
                                </div>
                                <div style="display: inline-block">

                                    <div style="float: left; margin-right: 20px" class="userBox">
                                        <div>
                                            CBS
                                        </div>
                                        <div>
                                            Current Balance :
                                        <asp:Label runat="server" ID="lbCbsCurrentBalance"></asp:Label>
                                        </div>
                                        <div>
                                            <p>Signature</p>
                                            <asp:Image ID="imgCbsSignature" runat="server" AlternateText="CbsImageNotAvailable" Width="300px" Height="250px" />
                                        </div>
                                    </div>
                                    <div style="float: left;" class="userBox">
                                        <div>
                                            BACH
                                        </div>
                                        <div>
                                            Cheque Amount :
                                        <asp:Label runat="server" ID="lbChequeAmount"> </asp:Label>
                                        </div>
                                        <div>
                                            <p>Signature</p>
                                            <asp:Image ID="imgInChequeImage" runat="server" AlternateText="Item image not available" Width="300px" Height="250px" />
                                        </div>
                                    </div>

                                </div>
                                <div>
                                    <input type="button" id="btCloseButton" value="Close" OnClick="BackToListPage" />
                                </div>

                            </div>
                        </div>
                    </div>

                </asp:PlaceHolder>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
