<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OutwardCheckerAdditionalAccountIfnoPrime.ascx.cs" Inherits="Accs.Web.usercontrol.Outward.Prime.OutwardCheckerAdditionalAccountIfnoPrime" %>
<script type="text/javascript">

    function LoadCbsAdditionalInfo(cbsAccountInfoObj) {



        if (cbsAccountInfoObj.CbsExtraInfo == null || cbsAccountInfoObj.CbsExtraInfo === '') {
            return;

        }
        var extraInfo = cbsAccountInfoObj.CbsExtraInfo.split("|");
        $("#lbDealerCode").html(extraInfo[0]);
        $("#lbSlipNo").html(extraInfo[1]);
        $("#lbSlipDate").html(extraInfo[2]);





    }



</script>




<fieldset>
    <legend>Other</legend>
    <div style="font-size: 14px">
        <div style="padding-bottom: 10px">
            <span style="padding-right: 10px;">Slip Date :</span>
            <span id="lbSlipDate"></span>
        </div>
        <div style="padding-bottom: 10px">
            <span style="padding-right: 10px">Dealer Code :</span>
            <span id="lbDealerCode"></span>
        </div>

        <div style="padding-bottom: 10px">
            <span style="padding-right: 10px">Slip No :</span>
            <span id="lbSlipNo"></span>
        </div>
    </div>
</fieldset>


