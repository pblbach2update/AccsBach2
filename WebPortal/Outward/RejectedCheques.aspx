<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RejectedCheques.aspx.cs"
    Inherits="Accs.Web.Outward.RejectedCheques" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rejected Cheques</title>
    <style>
        body
        {
            font-family: "Trebuchet MS" , Arial, Sans-Serif;
        }
        table
        {
            width: 90%;
        }
        th
        {
            margin-bottom: 10px;
            border-bottom: 2px solid #333;
            height: 24px;
            padding: 5px;
        }
        
        .dddborder
        {
            border: 1px solid #ddd;
        }
        
        td
        {
            padding: 5px;
            text-align: left;
        }
    </style>
    <script type="text/javascript" src="../Script/jquery-1.3.2.min.js"></script>
    <script type="text/javascript">




        $(document).ready(function () {


            $("#printButton").click(function () {
                $("#printDiv").hide();
                window.print();
                $("#printDiv").show();
            });

            var divRejectedChequesList = $("#rejectedChequesList");


            var cheques = window.dialogArguments.cheques;
            var dbResponse = window.dialogArguments.dbResponse;


            var table_scanned = $("#tableRejectedChequesList");
            $('tbody', table_scanned).remove();
            var table_body = table_scanned.append('<tbody></tbody>');

            var tds = "", tdClass = "";
            var n = cheques.length;
            var k = 0;
            for (var i = 0; i < n; i++) {

                if (dbResponse.cheques[i].status == 1) {
                    k++;
                    tds = '<tr><td><table>';
                    tds += '<caption>Cheque No: <b>' + k + '</b></caption>';
                    tds += '<thead><tr><th>Cheque Details</th></tr></thead>';

                    if (i % 2) {
                        tdClass = "alt";
                    }
                    else {
                        tdClass = "";
                    }

                    tds += "<tr><td><b>MICR:</b>&nbsp;" + cheques[i].micr.micr + "</td></tr>";
                    tds += '<tr><td><b>Server Response:</b>&nbsp;' + dbResponse.cheques[i].details + "</td></tr>"

                    tiffviewer = '<object classid="clsid:6C8D8005-DA18-4acc-BDE1-40B523DCC6E1" width="500px" height="230px" id="imgTiffFront' + i + '" name="frontimage" visible="true"></object>';
                    tds += '<tr><td class="dddborder" style="border-bottom: 0;">' + tiffviewer + '</td></tr>';
                    tiffviewer = '<object classid="clsid:6C8D8005-DA18-4acc-BDE1-40B523DCC6E1" width="500px" height="230px" id="imgTiffRear' + i + '" name="frontimage" visible="true"></object>';
                    tds += '<tr><td class="dddborder" style="border-top: 0;">' + tiffviewer + '</td></tr>';
                    tds += "</table></td></tr>";
                    table_body.append(tds);

                    document.getElementById("imgTiffFront" + i).LoadFile(cheques[i].img.front, 1);
                    document.getElementById("imgTiffRear" + i).LoadFile(cheques[i].img.rear, 1);

                    if (i != n - 1) {
                        tds = '<tr><td><div style="page-break-after:always;"></div></td></tr>';
                        table_body.append(tds);
                    }
                }
            }
        });
    </script>
</head>
<body>
    <div id="rejectedChequesList">
        <table id="tableRejectedChequesList" class="ScanTable" cellspacing="0" summary="The Scanned Cheques.">
            <thead>
                <tr>
                    <td>
                        <div id="printDiv">
                            Server response for Rejected Cheques: <a id="printButton" href="#">Print</a>
                        </div>
                    </td>
                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
                <tr>
                    <td id="postInsertSummary" colspan="7" style="border-right: #c1dad7 1px solid; border-left: #c1dad7 1px solid;">
                        &nbsp;
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</body>
</html>
