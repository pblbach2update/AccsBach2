$(document).ready(function() {

    var _curIndex = 0;

    var _curObj;
    var _curId;

    var _frontImg;
    var _rearImg;

    var dialogPopup = $('#dialog');

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
        _frontImg = null;
        _rearImg = null;

        var cid = chqid[cindx];

        var ws_request = new ACCS.Outward.WS_OutwardServiceRequest();
        ws_request.id = cid;
        ws_request.role = ACCS.Outward.WS_Role.maker;
        ws_request.type = ACCS.Outward.WS_RequestType.get_data;

        //Webservice Call
        ACCS.Outward.OutwardService.GetDepositSlipInfo(
        ws_request,
        //Success
        function(ws_rsp) {
            try {
                _curObj = ws_rsp.data;
                _curId = cid;
                _rearImg = _curObj.bimg;
                _frontImg = _curObj.img;

                if (ws_rsp.result == ACCS.Outward.WS_OutwardServiceResponseResult.success) {

                    $("#deposit_slip_img").attr("src", _curObj.img);

                    $("#cu_dbid").attr("value", _curId);
                    $("#cu_account").attr("value", _curObj.account);
                    $("#cu_payee").attr("value", _curObj.payee);
                    $($(".cu_date")[0]).attr("value", _curObj.date);
                }
                else {
                    alert("Error Loading Cheque Data.");
                }
            }
            catch (e) {
            }
            $('#data_entry_dialog').unblock();
        },
        //Failure
        function(e) {
            $('#data_entry_dialog').unblock();
        }
        );

        $("#table_body").html("");

        $("#cu_id").text = cid;
        $.blockUI({ message: $('#data_entry_dialog'),
            css: { width: '950px',
                top: ($(window).height() - 530) / 2 + 'px',
                left: ($(window).width() - 950) / 2 + 'px',
                background: 'rgb(235, 244, 251)'
            }
        });

        $('#data_entry_dialog').block({
            message: '<h1>Fetching Data...</h1>',
            css: { border: '3px solid #a00' }
        });
    }

    function nextChequeInfo() {
        if (_curIndex + 1 >= chqid.length) {
            alert("No more chequeinfos.");
        }
        else {
            _curIndex++;
            getChequeInfo(_curIndex);
        }
    }

    function prevChequeInfo() {
        if (_curIndex - 1 < 0) {
            alert("No previous chequeinfos.");
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

    $('#yes').click(function() {
        dialogPopup.dialog('close');

        $('#data_entry_dialog').block({
            message: '<h1>Processing Accept</h1>',
            css: { border: '3px solid #a00' }
        });

        var depositslip = new ACCS.Outward.WS_DepositSlipInfo();
        var cheques = Array();

        var jTableBody = $("#table_body");
        var jTr = $("tr", jTableBody);

        for (i = 0; i < jTr.length; i++) {
            var cheque = new ACCS.Outward.WS_DepositChequeInfo();
            cheque.cheque_id = jTr[i].title | 0;
            cheque.date = "";
            cheque.amount = "";

            cheques.push(cheque);

            var y1 = $('td:eq(2)', jTr[i])[0].innerHTML;
        }

        depositslip.slip_id = $("#cu_dbid").attr("value");
        depositslip.cheques = cheques;
        depositslip.status = "accept";
        depositslip.account = $("#cu_account").val();
        depositslip.payee = $("#cu_payee").val();
        depositslip.date = $($(".cu_date")[0]).val();

        var ws_request = new ACCS.Outward.WS_OutwardServiceRequest();
        ws_request.id = $("#cu_dbid").attr("value");
        ws_request.role = ACCS.Outward.WS_Role.maker;
        ws_request.type = ACCS.Outward.WS_RequestType.update;
        ws_request.data = depositslip;


        ACCS.Outward.OutwardService.UpdateDepositSlip(
        ws_request,
        function(ws_rsp) {
            $("#cu_up_" + _curId).parent().parent().attr("class", "SelectedRowStyle");
            // unblock when remote call returns
            $('#data_entry_dialog').unblock();
            nextChequeInfo();
        },
        function() {

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
        dialogPopup.dialog('close');
        var li_autoValidation = getAutoValidation();

        if (li_autoValidation == "") {
            $("#auto_reject_reason").attr("class", "hidden");
            $("#auto_reject_reason").html(li_autoValidation);
        }
        else {
            $("#auto_reject_reason").attr("class", "");
            $("#auto_reject_reason").html(li_autoValidation);
        }

        //$("#rejection_dialog").dialog('open');

        $("#data_entry_dialog").block({ message: $('#rejection_dialog'), css: { width: '260px',
            top: ($(window).height() - 400) / 2 + 'px',
            left: ($(window).width() - 260) / 2 + 'px',
            background: 'rgb(235, 244, 251)'
        }
        });
        return false;
    });

    /*

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
    role: "maker",
    status: "reject",
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
    // unblock when remote call returns
    $("#data_entry_dialog").unblock();
    //$.unblockUI();

                nextChequeInfo();
    }
    });
    });

    $('#cancel_reject').click(function() {
    $("#data_entry_dialog").unblock();
    });

    $('#cancel').click(function() {
    dialogPopup.dialog('close');
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
    */
    /*
    $('#front_image').click(function() {
    $('#popup_image').attr('src', _frontImg);
    dialogPopup.dialog('open');
    });


    $('#rear_image').click(function() {
    $('#popup_image').attr('src', _rearImg);
    dialogPopup.dialog('open');
    });
    */
    
    //Chain Reaction
    $("#sel_bank").change(function(evt) {

        var valll = $("#sel_bank").val();
        var elem_txt = $('option:selected', this).text();

        $("#sel_branch").html("");

        if (valll != "") {

            ACCS.Outward.OutwardService.GetBranchList(
            elem_txt,
            function(ws_rsp) {
                if (ws_rsp.result == ACCS.Outward.WS_OutwardServiceResponseResult.success) {
                    $("#sel_branch").html(ws_rsp.data);
                }
            },
            function(e) {
            });
        }
    });

    $("#depositAddCheque").click(function() {
        var branchid = $("#sel_branch").val() | 0;
        var serial_num = $("#txt_chequeinfo_serial").val();

        ACCS.Outward.OutwardService.GetChequeList(
         branchid, serial_num,
         function(ws_rsp) {
             if (ws_rsp.result == ACCS.Outward.WS_OutwardServiceResponseResult.success) {

                 for (i = 0; i < ws_rsp.data.length; i++) {
                     var chq = ws_rsp.data[i];

                     var jElementTable = $("#elements");
                     var etr = $('tr[title=' + chq.cheque_id + ']', jElementTable);

                     if (etr.length > 0) {
                     }
                     else {
                         var table_body = $("#table_body");

                         tds = "<tr title=" + chq.cheque_id + " class='chq_element_row'>"
                         tds += "<td>" + chq.bank + "</td>";
                         tds += "<td>" + chq.branch + "</td>";
                         tds += "<td>" + chq.account + "</td>";
                         tds += "<td>" + chq.serial + "</td>";
                         tds += "<td>" + chq.date + "</td>";
                         tds += "<td>" + chq.amount + "</td>";
                         tds += "<td>" + "<a href='" + chq.front + "' class='popupimage' title=''>Front</a> "
                         tds += "<td>" + "<a href='" + chq.rear + "' class='popupimage' title=''>Rear</a> "
                         tds += "<td>" + "<a href='' class='delete' title=''>Remove</a> " + "</td>";
                         tds += "</tr>";

                         table_body.append(tds);

                         $(".delete").click(function(e) {
                             delete_sample_element(e);
                             return false;
                         });

                         $(".popupimage").click(function(e) {
                             $('#popup_image').attr('src', this.href);
                             dialogPopup.dialog('open');
                             return false;
                         });
                     }
                 }
             }
             else {
                 alert("No Cheques found...");
             }
         },
         function(e) {
             alert("Error:" + e);
         });
    });


    function delete_sample_element(e) {
        var tr_tag = e.target.parentNode.parentNode;
        var tb_tag = tr_tag.parentNode;
        $(tr_tag).remove();
    }

    $(".delete").click(function(e) {
        delete_sample_element(e);
        return false;
    });


    /*
    //$("#cu_id").text = cid;
    $.blockUI({ message: $('#data_entry_dialog'),
    css: { width: '950px',
    top: ($(window).height() - 530) / 2 + 'px',
    left: ($(window).width() - 950) / 2 + 'px',
    background: 'rgb(235, 244, 251)'
    }
    });
    */

    dialogPopup.dialog({
        title: "Popup Image",
        bgiframe: false,
        autoOpen: false,
        modal: true,
        height: 400,
        width: 775,
        buttons: {
            Ok: function() {
                $(this).dialog('close');
            }
        }
    });

});