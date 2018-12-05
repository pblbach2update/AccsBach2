var _curObj;
var _curId;

var _frontImg;
var _rearImg;

function arc_up() {
    var evt = this;

    _curObj = null;
    _curId = null;
    _frontImg = null;
    _rearImg = null;

    ACCS.Outward.OutwardService.GetChequeImageArch(
                         evt.event.srcElement,
    //Success.
                         function(msg) {

                             if (msg.result == 0) {

                                 _rearImg = msg.data.rear
                                 _frontImg = msg.data.front;

                                 $('#popup_image').attr('src', _frontImg);
                                 $("#dialog").dialog('open');
                             }
                             else {
                                 _frontImg = null;
                                 _rearImg = null;

                                 alert("Error Loading Cheque Image.");
                             }
                         },
    //TimeOut
                         function(err) {
                         });
    return false;
}

function arc_down() {
    var evt = this;

    _curObj = null;
    _curId = null;
    _frontImg = null;
    _rearImg = null;

    ACCS.Outward.OutwardService.GetChequeImageArch(
                         evt.event.srcElement,
    //Success.
                         function(msg) {

                             if (msg.result == 0) {

                                 _rearImg = msg.data.rear
                                 _frontImg = msg.data.front;

                                 $('#popup_image').attr('src', _rearImg);
                                 $("#dialog").dialog('open');
                             }
                             else {
                                 _frontImg = null;
                                 _rearImg = null;

                                 alert("Error Loading Cheque Image.");
                             }
                         },
    //TimeOut
                         function(err) {
                         });
    return false;
}

$(document).ready(function() {
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