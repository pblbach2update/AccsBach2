<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OutwardMakerAdditionalAccountIfnoBasic.ascx.cs" Inherits="Accs.Web.usercontrol.Outward.OutwardMakerAdditionalAccountIfnoBasic" %>

<style >
    
    .cbsInfoData {

        margin: 10px;
        font-size: 14px;
            
    }

</style>
<script type="text/javascript">
    
    function LoadCbsAdditionalInfo(cbsAccountInfoObj) {

        var mobileLabel = $("#lbCustomerMobile").html(cbsAccountInfoObj.contact);
        var statusLabel = $("#lbCustomerStatus").html(cbsAccountInfoObj.Status);

    }

</script>


<div>
    <span style="padding-right: 10px">Mobile</span>
    <span id="lbCustomerMobile" class="cbsInfoData"></span>
</div>
<div>
    <span style="padding-right: 10px">Status</span>
    <span id="lbCustomerStatus" class="cbsInfoData"></span>
</div>



