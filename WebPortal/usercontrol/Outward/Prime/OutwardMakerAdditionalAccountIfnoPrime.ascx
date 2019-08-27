<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OutwardMakerAdditionalAccountIfnoPrime.ascx.cs" Inherits="Accs.Web.usercontrol.Outward.Prime.OutwardMakerAdditionalAccountIfnoPrime" ClientIDMode="Static" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<script type="text/javascript">

    function LoadCbsAdditionalInfo(cbsAccountInfoObj) {

        var mobileLabel = $("#lbCustomerMobile").html(cbsAccountInfoObj.contact);
        var statusLabel = $("#lbCustomerStatus").html(cbsAccountInfoObj.Status);

    }
    function OnClientShown(sender, args) {
        sender._popupBehavior._element.style.zIndex = 10005;
    }
    function GetJQobjFirstInputBoxOfOtherPanel() {

        return $("#pbl_slip_date");
    }
    function dateToYMD(date) {
        var d = date.getDate();
        var m = date.getMonth() + 1; //Month from 0 to 11
        var y = date.getFullYear();
        return '' + (d <= 9 ? '0' + d : d) + '/' + (m <= 9 ? '0' + m : m) + '/' + y;
    }

    function showCbsExtraInfo(chqObj) {
        
        if (chqObj.CbsExtraInfo == null || chqObj.CbsExtraInfo === '') {
            $("#tbDistCode").val('');
            $("#tbDepositSlipNo").val('');
            $("#pbl_slip_date").val(dateToYMD(new Date()));
            return;

        }
        var extraInfo = chqObj.CbsExtraInfo.split("|");
        $("#tbDistCode").val(extraInfo[0]);
        $("#tbDepositSlipNo").val(extraInfo[1]);
        $("#pbl_slip_date").val(extraInfo[2]);

        
            

        //$("#tbChqHolderName").val(chqObj.CbsExtraInfo);
    }

    function fillCbsExtraInfo(chqObj) {
        chqObj.CbsExtraInfo = $("#tbDistCode").val() + "|" + $("#tbDepositSlipNo").val() +"|"+ $("#pbl_slip_date").val();
    }

    $(document).ready(function () {
        //$("#tbChqHolderName").keydown(function(e) {


        //    var keyCode = e.which || e.keyCode;

        //    if (keyCode == 13 || keyCode == 9) {
        //        $("#cu_amount").focus();
        //        $("#cu_amount").select();
        //        e.preventDefault();
        //    }
        //});

        $("input[id][type=text][name='tbPrime'],textarea[name='tbPrime'],.cu_slip_date").each(function () {
            $(this).keydown(function (e) {

                var keyCode = e.which || e.keyCode;

                if (keyCode == 13 || keyCode == 9) {

                    var next = $(this).closest("div").next().find('input,textarea');
                    if (!next.length) {
                        next = $(this).closest('body').find('button#yes');
                        
                    } 
                    next.focus();
                    next.select();

                    e.preventDefault();
                }
            });

        });
    });


</script>
<style>
    .cbsTextArea {
        width: 135px;
        vertical-align: top;
        overflow-x: hidden;
        font-size: 14px
    }
</style>

<fieldset>
    <legend>Other</legend>
    <div>
          <div>
            <span style="padding-right: 18px">Slip Date :</span>
            <asp:TextBox ID="pbl_slip_date" runat="server" EnableViewState="False" CssClass="cu_slip_date" name="tbPrime"
                                                    Width="100px" TabIndex="3" ></asp:TextBox>
                                                <asp:Image CssClass="cu_date_img" ID="Image3" runat="server" ImageUrl="~/media/images/calendar.gif" />
                                                <cc2:CalendarExtender Format="dd/MM/yyyy" ID="CalendarExtender3" runat="server" TargetControlID="pbl_slip_date"
                                                    PopupButtonID="Image3" OnClientShown="OnClientShown">
                                                </cc2:CalendarExtender>
        </div>
        <div>
            <span style="padding-right: 8px">Dealer Code :</span>
            <textarea name="tbPrime" id="tbDistCode" class="cbsTextArea" rows="2"></textarea>
        </div>
        <div>
            <span style="padding-right: 35px">Slip No :</span>
            <textarea name="tbPrime" id="tbDepositSlipNo" tabindex="14" class="cbsTextArea" rows="2"></textarea>
        </div>
      
    </div>
 </fieldset>
