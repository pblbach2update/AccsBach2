$(document).ready(function() {


    var _curIndex = 0;

    var _curObj;
    var _curId;

    var _frontImg;
    var _rearImg;
    var _depositSlipImg;


    $.blockUI.defaults.css.border = '2px solid #99BBE8';
    $.blockUI.defaults.fadeOut = 0;
    $.blockUI.defaults.fadeIn = 0;


    $(".check_label").click(function(evt) {
        var divtag = evt.target.parentNode.parentNode;

        if (evt.target.checked) {
            divtag.className = "no_notification";
        }
        else {
            divtag.className = "error_box";
        }
    });

    function testCheckLabel() {
        $(".check_label").each(function(cl) {
            var divtag = this.parentNode.parentNode;
            if (this.checked) {
                divtag.className = "no_notification";
            }
            else {
                divtag.className = "error_box";
            }
        });
    }

    function setClipRect(id, str) {
        $(id).attr("style", str.pos + str.clip);

        var divid = $(id).parent();
        $(divid).attr("style", "padding:0; height:" + str.height + "px; width:" + str.width + "px;");
    }

    function getChequeInfo(cindx) {
        _curObj = null;
        _curId = null;

        var cid = chqid[cindx];

        $.ajax({
            type: "POST",
            url: "OutwardDBService.aspx",
            data: ({ id: cid, type: "checker-get" }),
            complete: function() {
                $('#data_entry_dialog').unblock();
            },
            success: function(msg) {
                _curObj = eval("(" + msg + ")");
                _curId = cid;
                _rearImg = _curObj.bimg;
                _frontImg = _curObj.img;
                _depositSlipImg = _curObj.depositslip;

                if (_curObj.result == "success") {
                    //$("#cheque_type").val(_curObj.chq_type);

                    $("#cheque_log_title").text("Cheque " + (cindx + 1) + " of " + chqid.length);
                    if (_curObj.status == "accept") {
                        $("#cheque_log_details").attr("class", "correct_box");
                    }
                    else if (_curObj.status == "reject") {
                        $("#cheque_log_details").attr("class", "error_box");
                        $("#rejection_reason").text(_curObj.log);
                    }
                    else {
                        $("#cheque_log_details").attr("class", "notification");
                    }
                    $("#cheque_log_details").text(_curObj.log);

                    $("#payee_usability").attr('checked', _curObj.payee_usability);
                    $("#date_usability").attr('checked', _curObj.date_usability);
                    $("#con_amt_usability").attr('checked', _curObj.con_amt_usability);
                    $("#signature_usability").attr('checked', _curObj.signature_usability);
                    $("#payer_details_usability").attr('checked', _curObj.payer_details_usability);

                    testCheckLabel();

                    try {
                        setClipRect("#img_date", _curObj.coord.date);
                        setClipRect("#img_payee", _curObj.coord.payee);
                        setClipRect("#img_payer", _curObj.coord.payer);
                        setClipRect("#img_amount", _curObj.coord.amount);
                        setClipRect("#img_sig", _curObj.coord.signature);
                        setClipRect("#img_micr", _curObj.coord.micr);
                    } catch (e)
                    { }

                    $("#img_payee").attr("src", _curObj.img);
                    $("#img_date").attr("src", _curObj.img);
                    $("#img_payer").attr("src", _curObj.img);
                    $("#img_amount").attr("src", _curObj.img);
                    $("#img_sig").attr("src", _curObj.img);
                    $("#img_micr").attr("src", _curObj.img);

                    $("#cu_id").text("Processing for: " + _curObj.micr);
                    $("#cu_dbid").attr("value", _curId);
                    $("#cu_account").attr("value", _curObj.account);
                    $("#cu_amount").attr("value", _curObj.amount);
                    $("#cu_payee").attr("value", _curObj.payee);
                    $($(".cu_date")[0]).attr("value", _curObj.date);

                    $("#cu_micr_div").text(_curObj.micr);

                    //Type now ignored.

                    $("#chq_dimension").text(_curObj.size);
                    $("#chq_micr_quality").text(_curObj.micrq);
                    $("#chq_skew").text(_curObj.skew);
                    $("#chq_brightness").text(_curObj.brightness);
                }
                else {
                    alert("Error Loading Cheque Data.");
                }
            }
        });

        $("#cu_id").text = cid;
        $.blockUI({ message: $('#data_entry_dialog'),
            css: { width: '894px',
                top: ($(window).height() - 500) / 2 + 'px',
                left: ($(window).width() - 894) / 2 + 'px',
                background: 'rgb(235, 244, 251)'
            }
        });

        $('#data_entry_dialog').block({
            message: '<h1>Fetching Data...</h1>',
            css: { border: '3px solid #a00' }
        });

        //alert(evt.target.value);

    }


    function nextChequeInfo() {
        if (_curIndex + 1 >= chqid.length) {
            alert("No more cheques.");
        }
        else {
            _curIndex++;
            getChequeInfo(_curIndex);
        }
    }

    function prevChequeInfo() {
        if (_curIndex - 1 < 0) {
            alert("No previous cheques.");
        }
        else {
            _curIndex--;
            getChequeInfo(_curIndex);
        }
    }

    $(".cu_up").click(function(evt) {
        var cid = evt.target.title;

        _curIndex = 0;
        for (i = 0; i < chqid.length; i++) {
            if (cid == chqid[i]) {
                _curIndex = i;
            }
        }
        getChequeInfo(_curIndex);
        return false;
    });

    $('#next').click(function() {
        nextChequeInfo();
    });

    $('#prev').click(function() {
        prevChequeInfo();
    });

    //$.growlUI('Growl Notification', 'Have a nice day!');

    $('#yes').click(function() {
        $("#dialog").dialog('close');
        var li_autoValidation = getAutoValidation();
        if (li_autoValidation != "") {
            alert("Some, Required field are not present. Please Reject The Cheque.");
            return;
        }


        var payee_usability = $("#payee_usability").attr('checked') ? 2 : 1;
        var date_usability = $("#date_usability").attr('checked') ? 2 : 1;
        var con_amt_usability = $("#con_amt_usability").attr('checked') ? 2 : 1;
        var signature_usability = $("#signature_usability").attr('checked') ? 2 : 1;
        var payer_details_usability = $("#payer_details_usability").attr('checked') ? 2 : 1;


        $('#data_entry_dialog').block({
            message: '<h1>Processing Database</h1>',
            css: { border: '3px solid #a00' }
        });

        $.ajax({
            type: "POST",
            url: "OutwardDBService.aspx",
            data: ({ id: $("#cu_dbid").attr("value"),
                type: "update",
                role: "superviser",
                status: "accept",
                //chq_type: $("#cheque_type").attr("value"),
                account: $("#cu_account").attr("value"),
                amount: $("#cu_amount").attr("value"),
                payee: $("#cu_payee").attr("value"),
                date: $($(".cu_date")[0]).attr("value"),
                micr: $("#cu_micr_div").text(),
                us_payee: payee_usability,
                us_date: date_usability,
                us_amount: con_amt_usability,
                us_sig: signature_usability,
                us_payer: payer_details_usability
            }),
            success: function(msg) {
                $("#cu_up_" + _curId).parent().parent().attr("class", "SelectedRowStyle");
            },
            complete: function() {
                // unblock when remote call returns
                //$.unblockUI();
                $("#data_entry_dialog").unblock();
                nextChequeInfo();
            }
        });

    });


    function getAutoValidation() {
        var li_autoValidation = "";
        if ($("#payee_usability").attr('checked') == false)
            li_autoValidation += "<li>Payee Name not present.</li>";
        if ($("#date_usability").attr('checked') == false)
            li_autoValidation += "<li>Date not present.</li>";
        if ($("#con_amt_usability").attr('checked') == false)
            li_autoValidation += "<li>Amount not specified.</li>";
        if ($("#signature_usability").attr('checked') == false)
            li_autoValidation += "<li>Signature Problem.</li>";
        if ($("#payer_details_usability").attr('checked') == false)
            li_autoValidation += "<li>Payer details not found.</li>";
        return li_autoValidation;
    }

    $('#reject').click(function() {
        $("#dialog").dialog('close');
        var li_autoValidation = getAutoValidation();


        if (li_autoValidation == "") {
            $("#auto_reject_reason").attr("class", "hidden");
            $("#auto_reject_reason").html(li_autoValidation);
        }
        else {
            $("#auto_reject_reason").attr("class", "");
            $("#auto_reject_reason").html(li_autoValidation);
        }


        $("#data_entry_dialog").block({ message: $('#rejection_dialog'),
            css: { width: '260px',
                top: ($(window).height() - 400) / 2 + 'px',
                left: ($(window).width() - 260) / 2 + 'px',
                background: 'rgb(235, 244, 251)'
            }
        });
        return false;
    });


    $('#reject_confirm').click(function() {
        var payee_usability = $("#payee_usability").attr('checked') ? 2 : 1;
        var date_usability = $("#date_usability").attr('checked') ? 2 : 1;
        var con_amt_usability = $("#con_amt_usability").attr('checked') ? 2 : 1;
        var signature_usability = $("#signature_usability").attr('checked') ? 2 : 1;
        var payer_details_usability = $("#payer_details_usability").attr('checked') ? 2 : 1;

        $("#rejection_dialog").dialog('close');
        $('#data_entry_dialog').block({
            message: '<h1>Processing Rejection</h1>',
            css: { border: '3px solid #a00' }
        });

        $.ajax({
            type: "POST",
            url: "OutwardDBService.aspx",
            data: ({ id: $("#cu_dbid").attr("value"),
                type: "update",
                role: "superviser",
                status: "reject",
                //chq_type: $("#cheque_type").attr("value"),
                reason: $("#rejection_reason").text(),
                account: $("#cu_account").attr("value"),
                amount: $("#cu_amount").attr("value"),
                payee: $("#cu_payee").attr("value"),
                date: $($(".cu_date")[0]).attr("value"),
                micr: $("#cu_micr_div").text(),
                us_payee: payee_usability,
                us_date: date_usability,
                us_amount: con_amt_usability,
                us_sig: signature_usability,
                us_payer: payer_details_usability
            }),
            success: function(msg) {
                try {
                    $("#cu_up_" + _curId).parent().parent().attr("class", "SelectedRowStyle");
                }
                catch (_Error) {
                    alert(_Error);
                }
            },
            complete: function() {
                //unblock when remote call returns
                //$.unblockUI();
                $("#data_entry_dialog").unblock();
                nextChequeInfo();
            }
        });
    });

    $('#cancel_reject').click(function() {
        $("#data_entry_dialog").unblock();
    });

    $('#cancel').click(function() {
        $("#dialog").dialog('close');
        $.unblockUI();
    });

    $('#edit_micr').click(function() {
        $("#micr_div").addClass('hidden');
        $("#micr_div_edit").removeClass('hidden');
        $("#cu_micr_text").attr("value", $("#cu_micr_div").text());
    });

    $('#done_edit_micr').click(function() {
        $("#micr_div_edit").addClass('hidden');
        $("#micr_div").removeClass('hidden');
        $("#cu_micr_div").text($("#cu_micr_text").attr("value"));
    });

    $('#cancel_edit_micr').click(function() {
        $("#micr_div_edit").addClass('hidden');
        $("#micr_div").removeClass('hidden');
    });

    $('#front_image').click(function() {
        $('#popup_image').attr('src', _frontImg);
        $("#dialog").dialog('open');
    });


    $('#rear_image').click(function() {
        $('#popup_image').attr('src', _rearImg);
        $("#dialog").dialog('open');
    });

    $('#deposit_slip').click(function() {
        if (_depositSlipImg == "none") {
            alert("No Deposit Slip Found");
        }
        else {
            $('#popup_image').attr('src', _depositSlipImg);
            $("#dialog").dialog('open');
        }
    });

    $("#dialog").dialog({
        bgiframe: true,
        height: 400,
        width: 775,
        buttons: {
            Ok: function() {
                $(this).dialog('close');
            }
        }
    });
    $("#dialog").dialog('close');
});