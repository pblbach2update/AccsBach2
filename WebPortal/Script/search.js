$(document).ready(function() {

    var _curObj;
    var _curId;

    var _frontImg;
    var _rearImg;

    $(".cu_up").click(
        function(evt) {

            _curObj = null;
            _curId = null;
            _frontImg = null;
            _rearImg = null;

            ACCS.Outward.OutwardService.GetChequeImage(
                         evt.target.title,
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
        });

    $(".cu_down").click(
        function(evt) {

            _curObj = null;
            _curId = null;
            _frontImg = null;
            _rearImg = null;

            ACCS.Outward.OutwardService.GetChequeImage(
                         evt.target.title,
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