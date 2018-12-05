// Remember to invoke within jQuery(window).load(...)
// If you don't, Jcrop may not initialize properly
jQuery(document).ready(function() {

    var _clientid = $("#clientid").val();
    var _cropbox = "#" + _clientid;

    //For faster access
    var jElementTable = $("#elements");
    var jCropbox = $(_cropbox);


    try {
        var _height = $(_cropbox).height();
        var _width = $(_cropbox).width();

        jCropbox.height(_height);
        jCropbox.width(_width);

        var jcrop_api = $.Jcrop(_cropbox);
        jQuery(_cropbox).Jcrop({
            onChange: showCoords,
            onSelect: showCoords
        });
        jcrop_api.release();
    }
    catch (e) {
    }

    $("#image_scale").slider({ value: 50, min: 25, max: 100, step: 5 });
    $('#image_scale').bind('slidechange',
    function(event, ui) {
        var _scale = $('#image_scale').slider('option', 'value') / 100.0;

        jcrop_api.destroy();

        jCropbox.height((_height * _scale) | 0);
        jCropbox.width((_width * _scale) | 0);

        jcrop_api = $.Jcrop(_cropbox);
        jQuery(_cropbox).Jcrop({
            onChange: showCoords,
            onSelect: showCoords
        });
        jcrop_api.release();
    });

    // Our simple event handler, called from onChange and onSelect
    // event handlers, as per the Jcrop invocation above
    function showCoords(c) {
        $('#x').val(c.x);
        $('#y').val(c.y);
        $('#x2').val(c.x2);
        $('#y2').val(c.y2);
        $('#w').val(c.w);
        $('#h').val(c.h);
    };





    function getRandom() {
        var dim = jcrop_api.getBounds();
        return [
					$('#x').val(),
                    $('#y').val(),
                    $('#x2').val(),
                    $('#y2').val()
					];
    };

    // Attach interface buttons
    // This may appear to be a lot of code but it's simple stuff

    $('#btnSetCrop').click(function(e) {
        // Sets a random selection
        var test_bound = getRandom();
        jcrop_api.animateTo(test_bound);
    });
    // Attach interface buttons
    // This may appear to be a lot of code but it's simple stuff


    function chq_element_row_event(e) {
        if (e.target.tagName == "TD") {
            var tag = e.target.parentNode;

            var test = $('td:eq(1)', tag)[0];

            var x1 = $('td:eq(1)', tag)[0].innerHTML;
            var y1 = $('td:eq(2)', tag)[0].innerHTML;
            var x2 = $('td:eq(3)', tag)[0].innerHTML;
            var y2 = $('td:eq(4)', tag)[0].innerHTML;
            var w = $('td:eq(5)', tag)[0].innerHTML;
            var h = $('td:eq(6)', tag)[0].innerHTML;

            if (jCropbox.height() != h) {
                jcrop_api.destroy();

                $(_cropbox).height(h | 0);
                $(_cropbox).width(w | 0);

                jcrop_api = $.Jcrop(_cropbox);
                jQuery(_cropbox).Jcrop({
                    onChange: showCoords,
                    onSelect: showCoords
                });
                jcrop_api.release();
            }

            var test_bound = [x1, y1, x2, y2];
            jcrop_api.animateTo(test_bound);
        }
    }

    function delete_sample_element(e) {
        var tr_tag = e.target.parentNode.parentNode;
        var tb_tag = tr_tag.parentNode;


        var sampl_id = $("#" + $("#ddSampleId").val()).val();
        var elem_id = tr_tag.title;

        ACCS.Outward.OutwardService.DeleteSampleElement(
        sampl_id, elem_id,
        function(ws_rsp) {
        },
        function(e) {
        });
        $(tr_tag).remove();
    }

    $(".chq_element_row").click(function(e) {
        chq_element_row_event(e);
    });

    $(".delete").click(function(e) {
        delete_sample_element(e);
        return false;
    });

    $("#addNewElement").click(function(e) {
        $("#add_x1").text($('#x').val());
        $("#add_y1").text($('#y').val());
        $("#add_x2").text($('#x2').val());
        $("#add_y2").text($('#y2').val());
        $("#add_width").text($(_cropbox).width());
        $("#add_height").text($(_cropbox).height());

        $("#dialog").dialog('open');
    });

    $("#dialog").dialog({
        bgiframe: true,
        autoOpen: false,
        height: 200,
        width: 535,
        title: 'Add new Element',
        buttons: {
            Cancel: function() {
                $(this).dialog('close');
            },
            Ok: function() {
                var sampl_id = $("#" + $("#ddSampleId").val()).val();

                var elemNode = $("#" + $("#ddElementsId").val());
                var elem_id = $("#" + $("#ddElementsId").val()).val();
                var elem_txt = $('option:selected', elemNode).text();

                var etr = $('tr[title=' + elem_id + ']', jElementTable);

                var x1 = $("#add_x1").text();
                var y1 = $("#add_y1").text();
                var x2 = $("#add_x2").text();
                var y2 = $("#add_y2").text();
                var height = $("#add_height").text();
                var width = $("#add_width").text();

                if (etr.length > 0) {
                    $('td:eq(1)', etr)[0].innerHTML = x1;
                    $('td:eq(2)', etr)[0].innerHTML = y1;
                    $('td:eq(3)', etr)[0].innerHTML = x2;
                    $('td:eq(4)', etr)[0].innerHTML = y2;
                    $('td:eq(5)', etr)[0].innerHTML = width;
                    $('td:eq(6)', etr)[0].innerHTML = height;
                }
                else {
                    var table_body = $("#table_body");

                    tds = "<tr title=" + elem_id + " class='chq_element_row'>"
                    tds += "<td>" + elem_txt + "</td>"
                        + "<td>" + x1 + "</td>"
                        + "<td>" + y1 + "</td>"
                        + "<td>" + x2 + "</td>"
                        + "<td>" + y2 + "</td>"
                        + "<td>" + width + "</td>"
                        + "<td>" + height + "</td>"
                        + "<td colspan='3'>"
                            + "<a href='' class='delete' title=''>Delete</a> "
                        + "</td>"
                    + "</tr>";

                    table_body.append(tds);
                    $(".chq_element_row").click(function(e) {
                        chq_element_row_event(e);
                    });
                    $(".delete").click(function(e) {
                        delete_sample_element(e);
                    });
                }

                var dlg = $(this);

                ACCS.Outward.OutwardService.InsertSampleElement(
                x1, y1, x2, y2, width, height, sampl_id, elem_id,
                function(ws_rsp) {
                    dlg.dialog('close');
                },
                function(e) {
                    dlg.dialog('close');
                });
            }
        }
    });
});

