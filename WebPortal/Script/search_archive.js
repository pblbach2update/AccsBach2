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
            $.ajax({
                type: "POST",
                url: "/DAL/Handler/AjaxDBControllerMySQL.aspx",
                data: ({ id: evt.target.title, type: "search-image" }),
                success: function(msg) {
                    _curObj = eval("(" + msg + ")");
                    _curId = evt.target.title;

                    if (_curObj.result == "success") {
                        
                        _rearImg = _curObj.bimg;
                        _frontImg = _curObj.img;

                        $('#popup_image').attr('src', _frontImg);
                        $("#dialog").dialog('open');
                    }
                    else {
                        _frontImg = null;
                        _rearImg = null;

                        alert("Error Loading Cheque Image.");
                    }
                }
            });
            return false;
        });

        $(".cu_down").click(
        function(evt) {

            _curObj = null;
            _curId = null;
            _frontImg = null;
            _rearImg = null;
            $.ajax({
                type: "POST",
                url: "/DAL/Handler/AjaxDBControllerMySQL.aspx",
                data: ({ id: evt.target.title, type: "search-image" }),
                success: function(msg) {
                    _curObj = eval("(" + msg + ")");
                    _curId = evt.target.title;

                    if (_curObj.result == "success") {

                        _rearImg = _curObj.bimg;
                        _frontImg = _curObj.img;

                        $('#popup_image').attr('src', _rearImg);
                        $("#dialog").dialog('open');
                    }
                    else {
                        _frontImg = null;
                        _rearImg = null;

                        alert("Error Loading Cheque Image.");
                    }
                }
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