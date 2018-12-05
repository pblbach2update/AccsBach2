<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiImageForm.aspx.cs" Inherits="Accs.Web.Inward.NRB.MultiImageForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ACCS checker</title>

    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="/Script/tjpzoom.js" type="text/javascript"></script>
    <script src="/Script/tjpzoom_config_roundfun.js" type="text/javascript"></script>
    <script src="/Script/jquery.loupe.min.js"></script>

    <link href="/Style/Header.css" rel="stylesheet" type="text/css" />
    <link href="/Style/ach.css" rel="stylesheet" type="text/css" />
    <link href="/Style/admin.css" rel="stylesheet" type="text/css" />
    <link href="/Style/SimpleModal.css" rel="stylesheet" />
    <style>
        .loupe {
            background-color: #555;
            z-index: 4;
            border: 5px solid rgba(0, 0, 0, 0);
            cursor: url(blank.png), url(blank.cur), none;
        }
    </style>


    <script type="text/javascript">

        $(function () {
            showCbsPanel();

        });
        function showCbsPanel() {
            $(".modal").show();
            $("#imgCbsSignature").loupe();


        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="modal">
                <div class="modal-content">

                    <div>
                        <h1>A/C No : 11111111111 </h1>
                    </div>
                    <div class="userBox" style="height: 20px">

                        <span style="font-size: 20px; color: darkgreen; font-weight: bold; float: left">CBS Balance 100000 BDT </span>
                        <span style="font-size: 20px; color: #EE2211; font-weight: bold; float: right">Cheque Amount 5000BDT</span>

                    </div>
                    <div class="userBox" style="height:500px">
                        <div>
                            <div style="float: left">
                                <p>CBS Signature 1</p>
                                <asp:Image ID="imgCbsSignature" runat="server" AlternateText="Item image not available" Width="360px"
                                    BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" Style="max-height: 200px" ImageUrl="/media/temp/corpcard1.jpg" />
                            </div>
                            <div style="float: left">
                                <p>CBS Signature 2</p>
                                <asp:Image ID="Image1" runat="server" AlternateText="Item image not available" Width="360px" Height="200px"
                                    BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" ImageUrl="/media/temp/corpcard2.jpg" />
                            </div>
                        </div>

                        <div>
                            <div style="float: left">
                                <p>CBS Signature 3</p>
                                <asp:Image ID="Image2" runat="server" AlternateText="Item image not available" Width="360px" Height="200px"
                                    BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" ImageUrl="/media/temp/corpcard2.jpg" />
                            </div>
                            <div style="float: left">
                                <p>Bach Image</p>
                                <asp:Image ID="Image3" runat="server" AlternateText="Item image not available" Width="360px" Height="200px"
                                    BorderColor="#3C516A" BorderStyle="Solid" BorderWidth="3px" ImageUrl="/media/temp/sig1.jpg" />
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
