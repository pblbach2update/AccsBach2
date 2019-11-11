<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="True" CodeBehind="AdminDashBoard.aspx.cs" Inherits="Accs.Web.Admin.AdminDashBoard"  %>

<%@ Register TagPrefix="uc" TagName="CheckInfo" Src="~/usercontrol/DashBoardControl.ascx" %>
<%@ Register TagPrefix="uc" TagName="clrTypeInfo" Src="~/usercontrol/DropdownClearingType.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="refresh" content="30" />
    <style>
        #column-right-box
        {
            background: none repeat scroll 0 0 #FFFFFF;
            margin: 0 0 5px 0px;
            width: 1480px;
        }
        .shadow
        {
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
        }
        .rounded-corners
        {
            border-radius: 4px;
        }
        #column-right-box .box-header
        {
            background: none repeat scroll 0 0 #F0F0F0;
            border-bottom: 1px solid #DEDEDE;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            padding: 1px 1px;
        }
        .engraved-text
        {
            text-shadow: 1px 1px 1px #FFFFFF;
        }
        #column-right-box .box-content
        {
            padding: 1px;
            width: 1480px;
        }
        
        
        
        
        .brCellWidth
        {
            width: 50px;
        }
        .brCellMaxWidth
        {
            width: 50px;
            word-wrap: break-word;
            display: block;
        }
        .brDataCellCWidth
        {
            width: 20px;
        }
        .brDataCellCMaxWidth
        {
            width: 20px;
            word-wrap: break-word;
            display: block;
        }
        
        .brDataCellAWidth
        {
            width: 40px;
        }
        .brDataCellAMaxWidth
        {
            width: 40px;
            word-wrap: break-word;
            display: block;
        }
        .linkClass
        {
            color: #035bac;
            font-size: 11px;
            line-height: 15px;
            text-decoration: underline;
        }
        .linkClassRed
        {
            color: #F34;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/Style/smalltable.css" />
    <script src="/Script/jquery-1.10.1.min.js" type="text/javascript"></script>
    <link href="/Style/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <script src="/Script/jquery.fancybox.js" type="text/javascript"></script>
    <link type="text/css" href="/Style/admin.css" rel="Stylesheet" />
    <link href="/Style/dropit.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/Script/dropit.js"></script>
    <script>

        $(function () {

            $('.fancybox').fancybox({

                height: 800
            });
            $('.menu').dropit();

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="dform" runat="server">
    <div style="float: left">
        <div style="float: left">
            <uc:clrTypeInfo ID="clrtype" runat="server" AutoPostBackOnChange="True" Type="0"
                OndropDownChanging="loadinfo"></uc:clrTypeInfo>
            
            
            <asp:DropDownList runat="server" ID="ddlCurrencyType" Font-Names="Trebuchet MS" Font-Size="9pt" AutoPostBack="True" 
                OnSelectedIndexChanged="FilterCurrencyInNetSettlement" AppendDataBoundItems="True">
                <asp:ListItem Text="All Currency" Value="-1"></asp:ListItem>
            </asp:DropDownList>

            <asp:HyperLink ID="hpReport" runat="server" Target="_blank"></asp:HyperLink>
        </div>
        <div style="float: left; margin-left: 200px; padding-top: 10px">
            <ul class="menu">
                <li><a href="#" class="linkClass">Quick Links</a>
                    <ul>
                        <li><a href="EditCheque.aspx" target="_blank">Edit Cheque</a></li>
                        <li><a href="ViewCheque.aspx"  target="_blank">Search Cheque</a></li>
                        <li><a href="Bank.aspx"  target="_blank">Add Bank/Branch</a></li>
                        <li><a href="User.aspx"  target="_blank">Add/Edit User</a></li>
                        <li><a href="AssignRole.aspx"  target="_blank">Assing Role</a></li>
                        <li><a href="ClearingDayEnd.aspx"  target="_blank">Day Close</a></li>
                        <li><a href="SearchPBM.aspx"  target="_blank">Search PBM</a></li>
                        <li><a href="CreateMessage.aspx"  target="_blank">New Message</a></li>
                        <li><a href="UpdateAdviceNo.aspx"  target="_blank">Advice</a></li>
                        <li><a href="SystemSettings.aspx"  target="_blank">Settings</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <asp:PlaceHolder ID="phPbmWarning" runat="server" Visible="False" EnableViewState="False">
            <div style="float: left; margin-left: 100px">
                <a href="PBMWaring.aspx" class="linkClass" target="_blank">
                    <img src="/media/images/warning.png" border="0" /><asp:Label ID="lbwaring" runat="server"
                        Text=""></asp:Label></a></div>
        </asp:PlaceHolder>
        <div style="float: left; margin-left: 100px">
            <asp:ImageButton ID="ImageButton1" runat="server" OnClick="RefreshSendList" ImageUrl="~/media/images/reload.png" /></div>
    </div>
    <div style="width: 1480px; clear: both">
        <uc:CheckInfo runat="server" ID="bachSUmmaryHignvalue" ClearingType="9"></uc:CheckInfo>
    </div>
    <div style="width: 1480px">
        <uc:CheckInfo runat="server" ID="bachSUmmaryNormal" ClearingType="1"></uc:CheckInfo>
    </div>
    </form>
</asp:Content>
