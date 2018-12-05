<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/ControlPanel.Master" AutoEventWireup="true"
    CodeBehind="SystemSettingsNew.aspx.cs" Inherits="Accs.Web.Admin.SystemSettingsNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headControlPanel" runat="server">
    <link type="text/css" href="../Style/admin.css" rel="Stylesheet" />
    <style type="text/css">
        .rightAlign
        {
            text-align: right;
        }
        #scontainer > * {
            margin: 0px 10px 0px 0px;
        }
        #scontainer {
            border-bottom: 1px solid dimgray;
            display: table;
            margin-bottom: 5px

        }
    </style>
    <script type="text/javascript">

        function showFTPSettings() {

            var a = new Array;
            a[0] = 1;
            a[1] = 4;

            var url = '/FtpSettings.aspx';
            var r = window.showModalDialog(url, a, "dialogwidth: 700px; resizable: yes; dialogHide:yes");
            var formid = document.getElementsByTagName("form");
            if (r != null) {
                window.location.reload(true);
            }
        }    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_ControlPanel"
    runat="server">
    <form runat="server">
    <div id="msgdiv" runat="server" visible="False" enableviewstate="false" style="background-color: #FFFFDE; border: 1px solid #FFCF0F; font-size: 11px; margin-bottom: 10px; padding: 5px; width: 800px"></div>
    <table>
        <tr>
            <td>
                <span class="headText2" style="margin-left: 0px;">Edit System Parameters</span>
            </td>
        </tr>
        
    </table>
        <asp:Label runat="server" ID="selectedSettings"></asp:Label>
        <asp:PlaceHolder runat="server" ID="phSettinsPanel"></asp:PlaceHolder>   
        

    </form>
</asp:Content>
