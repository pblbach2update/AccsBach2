<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Accs.Web.Report.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title></title>
	<link rel="stylesheet" href="/Style/calendar.css"/>
	<link rel="stylesheet" href="/Style/ach.css"/>

    <style type="text/css">

        .style1
        {
            font-weight: bold;
        }
        #startDate
        {
            width: 123px;
        }
        #endDate
        {
            width: 122px;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:PlaceHolder id="Holder" runat="server" />
           
   

  
</asp:Content>
