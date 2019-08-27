<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OutwardCheckerAdditionalAccountIfnoBasic.ascx.cs" Inherits="Accs.Web.usercontrol.Outward.OutwardMakerAdditionalAccountIfnoBasic" %>
<script type="text/javascript">
    
    function LoadCbsAdditionalInfo(cbsAccountInfoObj) {

        $("#lbPayerName").html(cbsAccountInfoObj.CbsExtraInfo);
         

    }


    
</script>






<div>
    <span style="padding-right: 10px">Payee :</span>
    <span id="lbPayerName" class="lbPayerName"></span>
</div>

