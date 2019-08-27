<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OutwardMakerAdditionalAccountIfnoBasic.ascx.cs" Inherits="Accs.Web.usercontrol.Outward.OutwardMakerAdditionalAccountIfnoBasic" %>
<script type="text/javascript">
    
    function LoadCbsAdditionalInfo(cbsAccountInfoObj) {

        var mobileLabel = $("#lbCustomerMobile").html(cbsAccountInfoObj.contact);
        var statusLabel = $("#lbCustomerStatus").html(cbsAccountInfoObj.Status);

    }

    function FormatAndDisplayAccountNo(jqueryDomObject, cbsAccountInfoObj) {


        var accToBeFormatted = cbsAccountInfoObj.acc_no;
        var accLength = accToBeFormatted.length;
        var formattedAccount = "";
        if (accLength > 13) {

            accToBeFormatted = accToBeFormatted.substring(accLength - 13);
        }

        if (accLength > 4) {
            formattedAccount = formattedAccount + accToBeFormatted.substring(0, 4) + "-";
        }
        if (accLength > 6) {
            formattedAccount = formattedAccount + accToBeFormatted.substring(4, 6) + "-" + zeroPad(accToBeFormatted.substring(6), 7);
            

        }

        jqueryDomObject.val(formattedAccount);


//jqueryDomObject.valueOf()

    }

    function showCbsExtraInfo(chqObj) {

        $("#tbChqHolderName").val(chqObj.CbsExtraInfo);
    }

    function fillCbsExtraInfo(chqObj) {
        chqObj.CbsExtraInfo = $("#tbChqHolderName").val();
    }

    $(document).ready(function() {
        $("#tbChqHolderName").keydown(function(e) {


            var keyCode = e.which || e.keyCode;
            
            if (keyCode == 13 || keyCode == 9) {
                $("#cu_amount").focus();
                $("#cu_amount").select();
                e.preventDefault();
            }
        });
    });

    function focusAfterGettingsAccountInfo() {

        $("#tbChqHolderName").focus();
        $("#tbChqHolderName").select();
        $("#cu_payee").attr('readonly', 'readonly');
    }

</script>
<style >
    
    .cbsInfoData {

        margin: 10px;
        font-size: 14px;
            
    }

</style>



<div>
    <span style="padding-right: 10px">Mobile</span>
    <span id="lbCustomerMobile" class="cbsInfoData"></span>
</div>
<div>
    <span style="padding-right: 10px">Status</span>
    <span id="lbCustomerStatus" class="cbsInfoData"></span>
</div>
<div>
     <span style="padding-right: 8px">Payee :</span>
     <input type="text" name="tbPayerName" id="tbChqHolderName" tabindex="2" value="" />
</div>


