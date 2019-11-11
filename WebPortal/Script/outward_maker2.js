$(document).ready(function () {

    var DOM =
    {
        dialogPopupImage: $('#dialogPopupImage'),
        title: $("#cheque_log_details"),
        today: $("#today_date"),
        cbs: {
            account: $("#cu_account"),
            inWord: $("#taka"),
            amount: $("#cu_amount"),
            date: $($(".cu_date")[0]),
            payee: $("#cu_payee"),
            payeeBranchRoutingNumber: $("#ddlMPBranchList"),
            contact: $("#cu_contact_div"),
            address: $("#cu_benif_address"),
            error: {
                amount: $("#cu_amount_p"),
                account: $("#cu_account_p")
            }
        },
        cheque: {
            dbid: $("#cu_dbid"),
            currencyCode: $("#cu_itemCurrency"),
            
            rejection_reason: $("#rejection_reason"),
            auto_rejection_reason: $("#auto_reject_reason"),
            log_details: $("#chequeinfo_cheque_log_details"),
            bank: $("#divIssuingBank"),
            branch: $("#divIssuingBranch"),
            isChargeApplicable: $("#cu_chargeApplied"),
            outofchargeRemarks: $("#txtOutofChargeReason")
        },
        img: {
            payee: $("#img_payee"),
            date: $("#img_date"),
            payer: $("#img_payer"),
            amount: $("#img_amount"),
            signature: $("#img_sig"),
            micr: $("#img_micr"),
            amountInWord: $("#img_amountWord"),
            endorsement: $("#img_endorsement")
        },
        micr: {
            micr: $("#cu_micr_div"),
            main: $("#cu_micr_text"),
            div: {
                serial: $("#cu_micr_div_s"),
                routing: $("#cu_micr_div_r"),
                account: $("#cu_micr_div_a"),
                type: $("#cu_micr_div_t")
            },
            text: {
                serial: $("#cu_micr_text_s"),
                routing: $("#cu_micr_text_r"),
                account: $("#cu_micr_text_a"),
                type: $("#cu_micr_text_t")
            }
        },
        usability: {
            payee: $("#payee_usability"),
            date: $("#date_usability"),
            amount: $("#con_amt_usability"),
            signature: $("#signature_usability"),
            payer_details: $("#payer_details_usability"),
            amount_in_words: $("#amountinwords_legal_usability"),
            benif_ac: $("#benif_ac_usability")
        },
        iqa: {
            overall: $("#iqaResult"),
            micr_quality: $("#chq_micr_quality"),
            skew: $("#chq_skew"),
            brightness: $("#chq_brightness"),
            dimension: $("#chq_image_size")
        },
        dialog: {
            CBSLoading: $("#divCBSLoading")
        }
    };

    //Dialog//
    var dialogPopupImage = $('#dialogPopupImage');
    var dialogDataEntry = $('#dialogDataEntry');
    var divModal = $("#divOWEditorBackground");


    var divRejectionDialog = $("#rejection_dialog");

    var divDatabaseUpdating = $("#divDatabaseUpdating");
    var divUpdateMessage = $("#divUpdateMessage");
    /////////////////////////
    var modal_overlay = $("#modal-overlay");
    var modal_information = $("#divModalInformation");
    //$("#modal-behind-test").css("opacity", 0.20);
    $("#modal-overlay").css("opacity", 0.60);
    ////////////////////////////////////////////////////
    var _curIndex = 0;
    var _curTableRow;

    var _curObj;
    var _curId;

    var _frontImg;
    var _rearImg;
    var _depositSlipImg;


    function clearCBSInfo() {
        DOM.cbs.payee.val("");
        DOM.cbs.address.text("");
        DOM.cbs.contact.text("");
    }
    function showDBModal(message) {
        divUpdateMessage.text(message);
        modal_information.show();
        divDatabaseUpdating.show();
    }

    function hideDBModal() {
        modal_information.hide();
        divDatabaseUpdating.hide();
    }

    function showRejectModal() {
        modal_information.show();
        divRejectionDialog.show();
    }

    function hideRejectModal() {
        modal_information.hide();
        divRejectionDialog.hide();
    }

    $(".check_label").click(function (evt) {
        checkUsability(evt.target);
    });

    function testCheckLabel() {
        $(".check_label").each(function (cl) {
            checkUsability(this);
        });
    }


    function clearAccountInfo() {

        DOM.cbs.payee.val("");
        DOM.cbs.address.text("");
        DOM.cbs.contact.text("");

    }


    function lookupAccount(account) {
        
        DOM.dialog.CBSLoading.show();
        //alert("Calling Cbs");
        clearAccountInfo();
        Accs.Web.Outward.OutwardService.GetAccountName(account,
        //Success Callback
        function(ws_rsp) {
        DOM.dialog.CBSLoading.hide();
        if (ws_rsp.result == Accs.OutwardWebServiceObject.WS_OutwardServiceResponseResult.success) {
            
            if (ws_rsp.data.name ==null || ws_rsp.data.name === '') {
                alert("Account not Found");
                DOM.cbs.account.focus();
            } else {
                DOM.cbs.payee.val(ws_rsp.data.name);
                if (typeof LoadCbsAdditionalInfo === "function") {
                    LoadCbsAdditionalInfo(ws_rsp.data);
                    // safe to use the function
                }

                if (typeof FormatAndDisplayAccountNo === "function") {
                    FormatAndDisplayAccountNo(DOM.cbs.account,ws_rsp.data);
                    // safe to use the function
                }


            }
        } else {
            alert("Could Not Load account");
        DOM.cbs.payee.val("");
        DOM.cbs.address.text("N/A");
        DOM.cbs.contact.text("N/A");
        }
        },
        //Timeout
        function (e) {
            alert("Connection timeout");
        DOM.dialog.CBSLoading.hide();
        DOM.cbs.address.text("N/A");
        DOM.cbs.contact.text("N/A");
        }
        );
        
    }

    function ValidateAccount(account) {
        return true;
        //if (isValidBenifAccount(account)) {
        //    DOM.cbs.error.account.hide();
        //    return true;
        //}
        //else {
        //    DOM.cbs.error.account.show();
        //    return false;
        //}
    }

    //DOM.cbs.account.blur(function () {
    //    clearAccountInfo();
    //    if (ValidateAccount(DOM.cbs.account.val())) {
    //        //Webservice Call
    //      lookupAccount(DOM.cbs.account.val());
    //    }
    //    alert(1);
    //});

    // DOM.cbs.account.keydown(function (e) {
    DOM.cbs.account.on("focus", function(e) {
        $(this).data('done', false);
    });
    DOM.cbs.account.bind("blur keydown",function (e) {


        var keyCode = e.which || e.keyCode;
        if (e.type == 'blur' || keyCode == 13 || keyCode == 9) {
            if (!$(this).data('done')) {
                $(this).data('done', true);
                if (typeof focusAfterGettingsAccountInfo === "function") {
                    focusAfterGettingsAccountInfo();
                    // safe to use the function
                } else {
                    DOM.cbs.amount.focus();
                    DOM.cbs.amount.select();

                }

                clearAccountInfo();
                if (ValidateAccount(DOM.cbs.account.val())) {
                    //Webservice Call
                    lookupAccount(DOM.cbs.account.val());
                }
                e.preventDefault();
            }
        }
    });

    DOM.cheque.isChargeApplicable.change(function () {
        if ($(this).attr("checked")) {
            $("#remarks").css("display", "block");
        } else {
            $("#remarks").css("display", "none");
        }
    });
    function ValidateAmount(amount) {
        amount = StripComma(amount);
       var selSessionType = $("#hvSelectedClearingType").val();
       if (!isValidAmount(amount) || parseFloat(amount) <= 0 || (selSessionType == "9" && amount < 500000)) {
            DOM.cbs.inWord.text("");
            DOM.cbs.error.amount.show();
            return false;
        }
        else {
            DOM.cbs.amount.val(Comma(StripComma(amount)) + "");
            DOM.cbs.error.amount.hide();
            var _word = toWord(StripComma(amount));
            DOM.cbs.inWord.text(_word);
            return true;
        }
    }

    DOM.cbs.amount.focus(function () {
        try {
            var _stripped = StripComma(DOM.cbs.amount.val());
            DOM.cbs.amount.val(_stripped);
            DOM.cbs.amount.select();
        } catch (err) { }
    });

    DOM.cbs.amount.blur(function () {
        var amount = $(this).val();
        ValidateAmount(amount);
    });

    DOM.cbs.amount.keydown(function (e) {

        var keyCode = e.which || e.keyCode;
        if (keyCode == 13 || keyCode == 9) {

            var amount = $(this).val();
            if (DOM.cheque.currencyCode.val() != Accs.OutwardWebServiceObject.WSCurrencyType.BDT || amount < 50000) {
                DOM.cheque.isChargeApplicable.attr("checked", true);
                $("#remarks").css("display", "block");

                var chargeRemarks = DOM.cheque.currencyCode.val() != Accs.OutwardWebServiceObject.WSCurrencyType.BDT ? "Foreign Currency" : "Below 50000";
                DOM.cheque.outofchargeRemarks.val(chargeRemarks);

            } else {
                DOM.cheque.isChargeApplicable.attr("checked", false);
                $("#remarks").css("display", "none");
                DOM.cheque.outofchargeRemarks.val("");
            }
            DOM.cbs.date.focus();
        }





    });

    function getChequeInfo(cindx) {

        _curObj = null;
        _curId = null;
        _frontImg = null;
        _rearImg = null;

        var cid = chqid[cindx];

        var ws_request = new Accs.OutwardWebServiceObject.WS_OutwardServiceRequest();
        ws_request.id = cid;
        ws_request.role = Accs.OutwardWebServiceObject.WS_Role.maker;
        ws_request.type = Accs.OutwardWebServiceObject.WS_RequestType.get_data;


        clearCBSInfo();


        //Webservice Call
        Accs.Web.Outward.OutwardService.GetChequeInfo(ws_request,
        function (ws_rsp) {
            try {

                _curObj = ws_rsp.data;
                _curId = cid;
                _rearImg = _curObj.bimg;
                _frontImg = _curObj.img;
                _depositSlipImg = _curObj.depositslip;

                if (ws_rsp.result == Accs.OutwardWebServiceObject.WS_OutwardServiceResponseResult.success) {
                    DOM.title.text("Cheque " + (cindx + 1) + " of " + chqid.length);

                    //DOM.cbs.account.focus();
                    
                    if (_curObj.status == Accs.OutwardWebServiceObject.WS_ActionStatus.accept) {
                        DOM.cheque.log_details.attr("class", "correct_box");
                        DOM.cheque.rejection_reason.val("");
                        DOM.cbs.error.amount.hide();
                    }
                    else if (_curObj.status == Accs.OutwardWebServiceObject.WS_ActionStatus.reject) {
                        DOM.cheque.log_details.attr("class", "error_box");

                        var sIndex = _curObj.log.indexOf("\n");
                        if (sIndex < 0) sIndex = -1;
                        var reason = _curObj.log.substring(sIndex + 1);
                        DOM.cheque.rejection_reason.val(reason);
                        ValidateAccount(_curObj.account);
                        ValidateAmount(_curObj.amount);
                    }
                    else {
                        DOM.cheque.log_details.attr("class", "notification");
                        DOM.cheque.rejection_reason.val("");
                    }

                    DOM.cheque.log_details.text(_curObj.log);
                    DOM.cheque.isChargeApplicable.attr("checked", _curObj.isChargeApplicable);

                    checkUsabilityValue(DOM.usability.payee, _curObj.payee_usability);
                    checkUsabilityValue(DOM.usability.date, _curObj.date_usability);
                    checkUsabilityValue(DOM.usability.amount, _curObj.con_amt_usability);
                    checkUsabilityValue(DOM.usability.signature, _curObj.signature_usability);
                    checkUsabilityValue(DOM.usability.payer_details, _curObj.payer_details_usability);
                    checkUsabilityValue(DOM.usability.amount_in_words, _curObj.amountinwords_legal_usability);


                    //Test
                    checkUsabilityValue(DOM.usability.benif_ac, _curObj.benef_ac_usability);
                    if (_curObj.isChargeApplicable) {
                        DOM.cheque.outofchargeRemarks.val(_curObj.OutOfChargeRemarks);
                        $("#remarks").css("display", "block");
                    } else {
                        $("#remarks").css("display", "none");
                        DOM.cheque.outofchargeRemarks.val("");
                    }

                    testCheckLabel();

                    try {
                        setClipRect(DOM.img.date, _curObj.coord.date);
                        setClipRect(DOM.img.payee, _curObj.coord.payee);
                        setClipRect(DOM.img.payer, _curObj.coord.payer);
                        setClipRect(DOM.img.amount, _curObj.coord.amount);
                        setClipRect(DOM.img.signature, _curObj.coord.signature);
                        setClipRect(DOM.img.micr, _curObj.coord.micr);
                        setClipRect(DOM.img.amountInWord, _curObj.coord.amountinword);
                    }
                    catch (e)
                    { }

                    DOM.img.payee.attr("src", _curObj.img);
                    DOM.img.date.attr("src", _curObj.img);
                    DOM.img.payer.attr("src", _curObj.img);
                    DOM.img.amount.attr("src", _curObj.img);






                    DOM.cheque.currencyCode.val(_curObj.CurrencyType);

                    //if (_curObj.CurrencyType == ACCS.Outward.WSCurrencyType.BDT) {
                    
                    //}


                    DOM.img.signature.attr("src", _curObj.img);
                    DOM.img.micr.attr("src", _curObj.img);
                    DOM.img.amountInWord.attr("src", _curObj.img);
                    DOM.img.endorsement.attr("src", _curObj.endorsement);

                    //$("#cu_id").text("Processing for: " + _curObj.micr);
                    DOM.cheque.dbid.attr("value", _curId);
                    DOM.cheque.bank.text(_curObj.bank);

                    //DOM.chequeinfo.branch.text(_curObj.branch);
                    //if (_curObj.account === "")
                    //    _curObj.account = "0000000000000";

                    //console.log(useDefaultAccount);
                    
                    if (useDefaultAccount === true) {
                        //_curObj.account = "0000000000000";
                        DOM.cbs.amount.focus();
                        _curObj.account = defaultAccountPrefix;
                        
                    } else {

                        DOM.cbs.account.focus();
                    }
                    
                    DOM.cbs.account.attr("value", _curObj.account);

                    //DOM.cbs.account.attr("value", "00");
                    DOM.cheque.log_details.attr("value", _curObj.log);
                    DOM.cbs.amount.attr("value", Comma(_curObj.amount));
                    //DOM.cbs.payee.attr("value", _curObj.payee);
                    DOM.cbs.payee.val(_curObj.payee);

                    

                    if (!_curObj.BenifRoutingNumber) {
                        DOM.cbs.payeeBranchRoutingNumber.val($("#ownRoutingNumber").val());
                        
                    } else {
                        
                        DOM.cbs.payeeBranchRoutingNumber.val(_curObj.BenifRoutingNumber);
                        
                    }
                    DOM.cbs.date.attr("value", _curObj.date);
                    DOM.cbs.address.text(_curObj.address);
                    DOM.cbs.contact.text(_curObj.contact);

                    DOM.cbs.inWord.text(toWord(_curObj.amount));

                    DOM.micr.micr.text(_curObj.micr);

                    //console.log(_curObj.micr_r + ":" + _curObj.micr_s);

                    DOM.micr.div.serial.text(_curObj.micr_s);
                    DOM.micr.div.routing.text(_curObj.micr_r);
                    DOM.micr.div.account.text(_curObj.micr_a);
                    DOM.micr.div.type.text(_curObj.micr_t);

                    $("#micr_div_edit").addClass('hidden');
                    $("#micr_div").removeClass('hidden');

                    

                    //More Validation to come....
                    validateAllMICR(DOM.micr.div, _curObj);

                    try {
                        if (!checkValidRouting(_curObj.micr_r)) {
                            DOM.micr.div.routing.attr("class", "micr_invalid");
                        }
                    } catch (err) { }


                    //Type now ignored.

                    var success = 0;
                    success += testIqa(_curObj.micrq, DOM.iqa.micr_quality);
                    success += testIqa(_curObj.skew, DOM.iqa.skew);
                    success += testIqa(_curObj.brightness, DOM.iqa.brightness);
                    success += testIqa(_curObj.size, DOM.iqa.dimension);
                    //
                    if (success == 4) {
                        DOM.iqa.overall.css("color", "#000");
                    }
                    else {
                        DOM.iqa.overall.css("color", "#f00");
                    }
                    DOM.iqa.overall.text(success + "/4 IQA Test Succeeeded");

                    //$("#chq_dimension").text(_curObj.size);
                    DOM.iqa.micr_quality.text(_curObj.micrq);
                    DOM.iqa.skew.text(_curObj.skew);
                    DOM.iqa.brightness.text(_curObj.brightness);
                    DOM.iqa.dimension.text(_curObj.size);



                    if (typeof showCbsExtraInfo === "function") {
                        showCbsExtraInfo(_curObj);
                    }

                } else {
                    alert("Error Loading Cheque Data.\n" + ws_rsp.data);
                }
            }
            catch (exp) {
            }

            hideDBModal();
        },
        function (e) {
            alert("Network Problem. Can not get Cheque Data.\n" + e);
            hideDBModal();
        });

        $("#cu_id").text = cid;

        //Replace it
        modal_overlay.show();
        dialogDataEntry.show();

        showDBModal("Collecting Data...");
    }

    function nextChequeInfo() {
        if (_curIndex + 1 >= chqid.length) {
            showDBModal("Updating List. Please Wait...");


            __doPostBack('ctl00$ctl00$ContentPlaceHolder1$OutwardBody$btnShowAll', '');
            //alert("No more chequeinfos.");
        }
        else {
            _curIndex++;
            _curTableRow = _curTableRow.next();
            getChequeInfo(_curIndex);
        }
    }

    function prevChequeInfo() {
        if (_curIndex - 1 < 0) {
            alert("No previous chequeinfos.");
        }
        else {
            _curIndex--;
            _curTableRow = _curTableRow.prev();
            getChequeInfo(_curIndex);
        }
    }

    function getAutoValidation() {
        var li_autoValidation = "";
        if (!DOM.usability.payee.is(':checked'))
            li_autoValidation += "<li>Payee Name not present.</li>";
        if (!DOM.usability.date.is(':checked'))
            li_autoValidation += "<li>Date not present.</li>";
        if (!DOM.usability.amount.is(':checked'))
            li_autoValidation += "<li>Amount not specified.</li>";
        if (!DOM.usability.amount_in_words.is(':checked'))
            li_autoValidation += "<li>Amount in words not specified.</li>";
        if (!DOM.usability.signature.is(':checked'))
            li_autoValidation += "<li>Signature Problem.</li>";
        if (!DOM.usability.payer_details.is(':checked'))
            li_autoValidation += "<li>Payer details not found.</li>";
        if (!DOM.usability.benif_ac.is(':checked'))
            li_autoValidation += "<li>Benificiary account not found!</li>";

        //Account Validation
        //var account = DOM.cbs.account.val();
        //if (!isValidBenifAccount(account))
        //    li_autoValidation += "<li>Account not Valid!</li>";

        //Amount Validation
        var amount = StripComma(DOM.cbs.amount.val());
        if (!ValidateAmount(amount)) {
            li_autoValidation += "<li>Amount not Valid!</li>";
        }

        //MICR Validation
        var micr = new MICR();
        micr.micr_s = DOM.micr.div.serial.text();
        micr.micr_r = DOM.micr.div.routing.text();
        micr.micr_a = DOM.micr.div.account.text();
        micr.micr_t = DOM.micr.div.type.text();

        var vr = validateAllMICR(DOM.micr.div, micr);
        if (vr > 0) {
            li_autoValidation += "<li>MICR Problem!</li>";
        }

        if (!checkValidRouting(micr.micr_r)) {
            li_autoValidation += "<li>Routing No invalid, Check Digit is incorrect!</li>";
            DOM.micr.div.routing.attr("class", "micr_invalid");
        }

        //Date Validation.
        try {
            var strDate = DOM.cbs.date.attr("value");
            if (strDate.length == 0) {
                li_autoValidation += "<li>Date is Empty!</li>";
            }
            else {
                var dateIssuing = getValidDate(strDate, "dd/mm/yyyy", "dd/mm/yy");
                if (dateIssuing != null) {
                    var dateNow = new Date(DOM.today.val());
                    var dateNowPlus3 = dateNow;
                    dateNowPlus3.addDays(futureBusinessDaysAllowed);

                    var date6Prev = new Date(DOM.today.val());

                    //var dateDiff = new Date(dateNow - dateIssuing);

                    if (date6Prev.getMonth >= 6) {
                        date6Prev.setMonth(date6Prev.getMonth() - 6);
                    }
                    else {
                        date6Prev.setFullYear(date6Prev.getFullYear() - 1);
                        date6Prev.setMonth(date6Prev.getMonth() + 12 - 6);
                    }

                    if (dateIssuing > dateNowPlus3) {
                        //alert("Future Dated Cheque.");
                        li_autoValidation += "<li>Future Dated cheque not permitted.</li>";
                    }
                    else if (dateIssuing < date6Prev) {
                        //alert("Cheque is more than 6 months back.");
                        li_autoValidation += "<li>Cheque is older than 6 Months.</li>";
                    }
                    else {
                        //alert("Correct Cheque.");
                    }
                }
                else {
                    li_autoValidation += "<li>Invalid Date Format.</li>";
                }
            }
        }
        catch (exp) {
            li_autoValidation += "<li>Invalid Date Format.</li>";
        }
        return li_autoValidation;
    }

    function processChequeUpdate(action) {

        try {
            //hide any dialog.
            dialogPopupImage.dialog('close');


            if (action == Accs.OutwardWebServiceObject.WS_ActionStatus.accept) {
                var li_autoValidation = getAutoValidation();

                //For accept
                if (li_autoValidation != "") {
                    var errors = li_autoValidation.replaceAll("<li>", "").replaceAll("</li>", "\n");
                    alert("Some, fields are not valid. Please review!\n\n" + errors);
                    return;
                }
            }

            var payee_usability = DOM.usability.payee.attr('checked') ? 2 : 1;
            var date_usability = DOM.usability.date.attr('checked') ? 2 : 1;
            var con_amt_usability = DOM.usability.amount.attr('checked') ? 2 : 1;
            var amountinwords_legal_usability = DOM.usability.amount_in_words.attr('checked') ? 2 : 1;
            var signature_usability = DOM.usability.signature.attr('checked') ? 2 : 1;
            var payer_details_usability = DOM.usability.payer_details.attr('checked') ? 2 : 1;
            //
            var benef_ac_usability = DOM.usability.benif_ac.attr('checked') ? 2 : 1;

            //Show a modal Working Dialog.


            //Create WebService Request
            var ws_request = new Accs.OutwardWebServiceObject.WS_OutwardServiceRequest();
            ws_request.id = DOM.cheque.dbid.attr("value");
            ws_request.role = Accs.OutwardWebServiceObject.WS_Role.maker;
            ws_request.type = Accs.OutwardWebServiceObject.WS_RequestType.update;

            ws_request.data = new Accs.OutwardWebServiceObject.WS_ChequeInformation();
            ws_request.data.action = action;

            if (action != Accs.OutwardWebServiceObject.WS_ActionStatus.accept) {
                ws_request.data.reason = DOM.cheque.rejection_reason.val();
            }
            else {
                ws_request.data.reason = "";
            }

            ws_request.data.micr = DOM.micr.micr.text();

            ws_request.data.account = DOM.cbs.account.val();
            ws_request.data.amount = StripComma(DOM.cbs.amount.val()) + "";
            ws_request.data.date = DOM.cbs.date.attr("value");
            ws_request.data.payee = DOM.cbs.payee.val();
            ws_request.data.BenifRoutingNumber = DOM.cbs.payeeBranchRoutingNumber.val();
            ws_request.data.isChargeApplicable = DOM.cheque.isChargeApplicable.is(":checked");
            ws_request.data.OutOfChargeRemarks = DOM.cheque.outofchargeRemarks.val();
            ws_request.data.CurrencyType = DOM.cheque.currencyCode.val();
            if (ws_request.data.isChargeApplicable == true && ws_request.data.OutOfChargeRemarks == "") {


                alert("Out of charge remarks required");
                return;

            }

            ws_request.data.con_amt_usability = con_amt_usability;
            ws_request.data.amountinwords_legal_usability = amountinwords_legal_usability;
            ws_request.data.signature_usability = signature_usability;
            ws_request.data.payer_details_usability = payer_details_usability;
            ws_request.data.payee_usability = payee_usability;
            ws_request.data.date_usability = date_usability;
            ws_request.data.benef_ac_usability = benef_ac_usability;
            if (typeof fillCbsExtraInfo === "function") {
                fillCbsExtraInfo(ws_request.data);
            }
            showDBModal("Processing...");
            //Webservice Call
            Accs.Web.Outward.OutwardService.UpdateChequeInfo(ws_request,
            //Success
            function (ws_rsp) {
                if (ws_rsp.result == Accs.OutwardWebServiceObject.WS_OutwardServiceResponseResult.success) {
                    //Now Can update the status....
                    // // //
                    $("#cu_up_" + _curId).parent().parent().attr("class", "OW_SelectedRowStyle");

                    try {
                        $('td:eq(4)', _curTableRow).text(ws_request.data.amount);
                        $('td:eq(5)', _curTableRow).text(ws_request.data.date);
                        $('td:eq(6)', _curTableRow).text(ws_request.data.account);

                        if (action == Accs.OutwardWebServiceObject.WS_ActionStatus.accept)
                            $('td:eq(7)', _curTableRow).text("Accepted");
                        else
                            $('td:eq(7)', _curTableRow).text("Rejected");
                    } catch (e) {
                    }
                    nextChequeInfo();
                    //$("#ddlMPBranchList").val($("#ownRoutingNumber").val());
                }
                else {
                    alert("Problem..\n" + ws_rsp.data);
                }

                hideDBModal();
            },
            //Error
            function (ws_err) {
                alert("Network Problem. Could not update Cheque data.\n" + ws_err);
                hideDBModal();
            });
        }
        catch (exp) {
            alert("Error:407:" + exp);
            hideDBModal();
        }
    }

    //Click Events//
    $(".cu_up").click(function (evt) {

        document.getElementById(btnUnlock).disabled = true;
        document.getElementById(btnUpdate).disabled = true;

        var cid = evt.target.title;

        _curTableRow = $(this).parent().parent();

        _curIndex = 0;
        for (i = 0; i < chqid.length; i++) {
            if (cid == chqid[i]) {
                _curIndex = i;
            }
        }

        getChequeInfo(_curIndex);
        return false;
    });

    $('#next').click(function () {
        nextChequeInfo();
    });

    $('#prev').click(function () {
        prevChequeInfo();
    });

    $('#yes').click(function () {
        processChequeUpdate(Accs.OutwardWebServiceObject.WS_ActionStatus.accept);
    });


    $('#reject').click(function () {
        dialogPopupImage.dialog('close');
        var li_autoValidation = getAutoValidation();

        if (li_autoValidation == "") {
            DOM.cheque.auto_rejection_reason.attr("class", "hidden");
            DOM.cheque.auto_rejection_reason.html(li_autoValidation);
        }
        else {
            DOM.cheque.auto_rejection_reason.attr("class", "");
            DOM.cheque.auto_rejection_reason.html(li_autoValidation);
        }

        showRejectModal();
        return false;
    });

    $('#reject_confirm').click(function () {
        hideRejectModal();
        processChequeUpdate(Accs.OutwardWebServiceObject.WS_ActionStatus.reject);
    });


    $('#cancel_reject').click(function () {
        hideRejectModal();
    });

    $('#cancel').click(function () {

        dialogPopupImage.dialog('close');

        document.getElementById(btnUnlock).disabled = false;
        document.getElementById(btnUpdate).disabled = false;

        //modal_overlay.hide();
        //dialogDataEntry.hide();

        showDBModal("Updating List. Please Wait...");


        __doPostBack('ctl00$ctl00$ContentPlaceHolder1$OutwardBody$btnShowAll', '');
    });

    $('#edit_micr').click(function () {
        $("#micr_div").addClass('hidden');
        $("#micr_div_edit").removeClass('hidden');

        var micr = new MICR();
        micr.micr_s = DOM.micr.div.serial.text();
        micr.micr_r = DOM.micr.div.routing.text();
        micr.micr_a = DOM.micr.div.account.text();
        micr.micr_t = DOM.micr.div.type.text();

        DOM.micr.main.attr("value", "<" + micr.micr_s + "< " + micr.micr_r + ": " + micr.micr_a + "< " + micr.micr_t);

        //console.log("Modifying Micr " + micr.micr_s);

        DOM.micr.text.serial.val(micr.micr_s);
        DOM.micr.text.routing.val(micr.micr_r);
        DOM.micr.text.account.val(micr.micr_a);
        DOM.micr.text.type.val(micr.micr_t);

        validateAllMICR(DOM.micr.text, micr);
        //testMicrField(DOM.micr.text.serial, micr_s, isValidSerial);
        //testMicrField(DOM.micr.text.routing, micr_r, isValidRouting);
        //testMicrField(DOM.micr.text.account, micr_a, isValidAccount);
        //testMicrField(DOM.micr.text.type, micr_t, isValidTransactionType);
    });

    $('#done_edit_micr').click(function () {

        if (!checkValidRouting(DOM.micr.text.routing.val())) {
            alert("Routing no is not valid! Check Digit does not match!");
            DOM.micr.text.routing.focus();
            DOM.micr.text.routing.attr("class", "micr_invalid");
            return false;
        }

        $("#micr_div_edit").addClass('hidden');
        $("#micr_div").removeClass('hidden');


        var micr = new MICR();
        micr.micr_s = DOM.micr.text.serial.val();
        micr.micr_r = DOM.micr.text.routing.val();
        micr.micr_a = DOM.micr.text.account.val();
        micr.micr_t = DOM.micr.text.type.val();

        DOM.micr.micr.text("<" + micr.micr_s + "< " + micr.micr_r + ": " + micr.micr_a + "< " + micr.micr_t);

        DOM.micr.div.serial.text(micr.micr_s);
        DOM.micr.div.routing.text(micr.micr_r);
        DOM.micr.div.account.text(micr.micr_a);
        DOM.micr.div.type.text(micr.micr_t);

        validateAllMICR(DOM.micr.div, micr);
        //testMicrField(DOM.micr.div.serial, micr_s, isValidSerial);
        //testMicrField(DOM.micr.div.routing, micr_r, isValidRouting);
        //testMicrField(DOM.micr.div.account, micr_a, isValidAccount);
        //testMicrField(DOM.micr.div.type, micr_t, isValidTransactionType);
    });

    $('#cancel_edit_micr').click(function () {
        $("#micr_div_edit").addClass('hidden');
        $("#micr_div").removeClass('hidden');
    });

    $('#front_image').click(function () {
        $('#popup_image').attr('src', _frontImg);
        dialogPopupImage.show();
        dialogPopupImage.dialog('open');
    });


    $('#rear_image').click(function () {
        $('#popup_image').attr('src', _rearImg);
        dialogPopupImage.show();
        dialogPopupImage.dialog('open');
    });

    $('#deposit_slip').click(function () {
        if (_depositSlipImg == "none") {
            alert("No Deposit Slip Found");
        }
        else {
            $('#popup_image').attr('src', _depositSlipImg);
            dialogPopupImage.show();
            dialogPopupImage.dialog('open');
        }
    });

    dialogPopupImage.dialog({
        title: "Cheque Image",
        bgiframe: false,
        autoOpen: false,
        modal: false,
        position: 'top',
        top: 50,
        height: 400,
        width: 775,
        buttons: {
            Ok: function () {
                $(this).dialog('close');
            }
        }
    });

    DOM.cbs.date.keypress(function (e) {
        var keyCode = e.which || e.keyCode;
        if (keyCode == 13 || keyCode == 9) {
            //DOM.cbs.payee.focus();

            if (typeof GetJQobjFirstInputBoxOfOtherPanel === "function") {
                var nextObj = GetJQobjFirstInputBoxOfOtherPanel();
                nextObj.focus();
                nextObj.select();
            } else 
                $("#yes").focus();
            e.preventDefault();
            return false;
        }
    });

    DOM.cbs.payee.keydown(function (e) {

        var keyCode = e.which || e.keyCode;
        if (keyCode == 13 || keyCode == 9) {
            $("#yes").focus();
            return false;
        }
    });

    DOM.cbs.date.mask("99/99/9999", { placeholder: " " });

});

window.onunload = confirmExit;
function confirmExit() {
    return "You have attempted to leave this page.  If you have made any changes to the fields without clicking the Save button, your changes will be lost.  Are you sure you want to exit this page?";
}
