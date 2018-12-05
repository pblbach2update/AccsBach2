<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fancyboxtest.aspx.cs" Inherits="Accs.Web.fancyboxtest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript" src="/Script/jquery-1.10.1.min.js"></script>

    <script src="Script/jquery.lightbox_me.js"></script>

    <script>
        $(function () {
           // $("#my_popup").lightbox_me();
            $("#btShowMe").click(function() {
                $("#my_popup").lightbox_me();
            });
            $("#inline").click(function () {
                alert(1);
                $("#my_popup").trigger('close');
            });

        })
    </script>
    <style>
        #my_popup {
            -moz-border-radius: 6px;
            background: #eef2f7;
            -webkit-border-radius: 6px;
            border: 1px solid #536376;
            -webkit-box-shadow: rgba(0,0,0,.6) 0px 2px 12px;
            -moz-box-shadow: rgba(0,0,0,.6) 0px 2px 12px;;
            padding: 14px 22px;
            width: 800px;
            position: relative;
            display: none;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <input type="button" value="shwo me" id='btShowMe'/>
        <div id="my_popup" >
            <div>
              <h3> A/C No : 1111254789635</h3> 
            </div>
            <div style="display: inline-block">

                <div style="float: left">
                    <div>
                        CBS
                    </div>
                    <div>Current A/C Balance : 5255.255 BDT</div>
                    <div>
                        <p>Signature</p>
                        <img width="300px" src="image/customersignature.png" />
                    </div>
                </div>
                <div style="float: left">
                    <div>
                        Batch
                    </div>
                    <div>Cheque Amount : 5255.255 BDT</div>
                    <div>
                        <p>Signature</p>
                        <img width="300px" height="300px" src="image/customersignature.png" />
                    </div>
                </div>

            </div>
            
            <input type="button" id="inline" value="close"/>

        </div>
        

    </form>
</body>
</html>
