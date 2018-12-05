//String Prototype
var micrRegex = {
    'strict': /^\s*<(\d{7})<\s*(\d{9}):\s*(\d{13})<\s*(\d{2})\s*(\s*;\s*(\d{12})\s*;\s*)?\s*$/,
    'strict2': /^[\s<]+(\d{7})[\s<]+(\d{9})[\s:]+(\d{13})[\s<]+(\d{2})\s*([\s;]+(\d{12})[\s;]+)?$/,
    'anyCharGroup': /^\s*<(.+?)<\s*(.+?):\s*(.+?)<\s*(.+?)\s*(;(.+?);)?/,
    'digitGroup': /^[^\d]+(\d+)[^\d]+(\d+)[^\d]+(\d+)[^\d]+(\d+)([^\d]+(\d+))?/
};



var WS_InstrumentType = {
    DepositSlip: 0,
    Cheque: 1,
    ReScanCheque: 2,
    ICE: 3
};

var WS_OutwardServiceResponseResult = {
    success: 0,
    fail: 1
};
//Some Functions needed for OCE
var ScanModeEnum = {
    Batch: 0,
    Single: 1,
    DepositSlipBatch: 2,
    DepositSlipSingle: 3,
    ReScanBatch: 4,
    ReScanSingle: 5
};

function WS_IQA() {
    this.partial_image = 0;
    this.excessive_image_skew = 0;
    this.piggyback_image = 0;
    this.too_light_or_too_dark = 0;
    this.streaksandor_bands = 0;
    this.below_min_image_size = 0;
    this.exceeds_max_image_size = 0;
    this.image_enabled_pod = 0;
    this.source_doc_bad = 0;
    this.date_usability = 0;
    this.payee_usability = 0;
    this.con_amt_usability = 0;
    this.leg_amt_usability = 0;
    this.signature_usability = 0;
    this.payer_details_usability = 0;
    this.micr_line_usability = 0;
    this.memo_line_usability = 0;
    this.payer_bank_details_usability = 0;
    this.payee_endorsement_usability = 0;
    this.presenting_bank_endorse_usability = 0;
    this.transit_endorse_usability = 0;
    this.usr_fld = "";
}

function CheckSize(_size) {
    var x = _size / 256.0;
    var y = _size % 256;

    this.y = (y + 0.5) / 10.0;
    this.x = (x + 0.5) / 10.0
}

function MICR(_micr, _ocr, _quality) {
    this.quality = _quality;
    this.micr = _micr.replace("E", "");
    this.ocr = _ocr;
}

function CheckImage(_iamge, _length) {
    this.image = _image;
    this.length = _length;
}

function ScannedCheck(_micr, _front, _back, _iqa) {
    this.iqa = _iqa;
    this.front = _front;
    this.rear = _back;
    this.micr = _micr;
    this.amount = 0;
    this.account = 0;
    this.payee = "";
    this.date = "";
    this.status;
    //this.type = ACCS.Outward.WS_InstrumentType.Cheque;
    this.type = ACCS.Outward.WS_InstrumentType.ICE;
}

window.onload = function() {

    /////////////////////
    var _scanMode;
    var scannedDocs;
    var scanIndex = 0;
    var _useOcr;
    //COM Object//
    var comScanner = document.getElementById("COM123");
    var comScanFront = document.getElementById("frontimage");
    var comScanRear = document.getElementById("backimage");
    var comPreviewFront = document.getElementById("popupFrontImage");
    var comPreviewRear = document.getElementById("popupBackImage");
    //Dialog//
    var dialogPopupImage = $('#dialogPopupImage');
    var dialogPopup = $('#dialog');
    ///////////////////////////
    var tablePreInsert = $('#tablePreInsert');
    var tablePostInsert = $('#tablePostInsert');
    /////////////////////////
    var divPreInsertTable = $('#divPreInsertTable');
    var divPostInsertTable = $('#divPostInsertTable');

    var divScanningImagesView = $('#divScanningImagesView');
    var divDatabaseUpdating = $("#divDatabaseUpdating");

    var modal_overlay = $("#modal-overlay");
    var divScannerController = $('#divScannerController');

    var spanNoChequeScanned = $("#spanNoChequeScanned");

    /////////////////////////////////////////
    var _curObj;
    var _curId;

    var _frontImg;
    var _rearImg;
    /////////////////////


    // Get DeviceLib object
    function GetScannerCom() {
        if (comScanner == null) {
            comScanner = document.getElementById("COM123");
        }
        return comScanner;
    }

    // Load the specified images
    function LoadCheckImages(frontImage, backImage) {
        comScanFront.LoadFile(frontImage, 1);
        comScanRear.LoadFile(backImage, 1);
    }

    function CreateEndorsementBitmap(endorsement) {
        comScanner.SetEndorsementString(endorsement);
        comScanner.SetEndorsementOffset(800);
        comScanner.SetEndorsementFilename("date_end.bmp");
        comScanner.SetEndorsement(true);
        comScanner.CreateEndorsementBitmap();
    }

    // Initialize the scanner
    function InitializeScanner() {
        comScanner = GetScannerCom();
        comScanner.Initialize();

        var serial = comScanner.GetSerialNo();
        _useOcr = $("#use_ocr").val();
        //
        comScanner.attachEvent('OnScanComplete', fOnScanComplete);
    }

    // Scan a single check
    function ScanSingle() {
        try {
            _scanMode = ScanModeEnum.Single; //MyDef
            scannedDocs = new Array();
            scanIndex = 0;
            spanNoChequeScanned.text("");

            CreateEndorsementBitmap($("#endorsement_text").val());

            //Show Modal Scanning Dialog....
            modal_overlay.show();
            divScanningImagesView.show();
            divPreInsertTable.hide();
            divPostInsertTable.hide();

            //Blocked until scanning is finished.
            var num = comScanner.ScanSingle();

            // Load the last image
            if (num > 0) {
                alert( num + " cheques were scanned.");
            }
            else {
                alert("No checks scanned.");
                //Reset Settings...
                ResetPage();
                return;
            }
        }
        catch (e) {
            alert("Error:255:" + e.description);
            ResetPage();
            return;
        }
        //Close Modal Scanning Dialog....
        modal_overlay.hide();
        divScanningImagesView.hide();
        divPreInsertTable.show();
        divScannerController.hide();

        createPreInsertTable(scannedDocs);

        StopScanning();
    }

    // Scans a batch of checks
    function ScanBatch() {
        try {
            _scanMode = ScanModeEnum.Batch; //MyDef
            scannedDocs = new Array();
            scanIndex = 0;
            spanNoChequeScanned.text("");

            CreateEndorsementBitmap($("#endorsement_text").val());

            //Show Modal Scanning Dialog....
            modal_overlay.show();
            divScanningImagesView.show();
            divPreInsertTable.hide();
            divPostInsertTable.hide();

            //Blocked until scanning is finished.
            var num = comScanner.ScanBatch();

            // Load the last image
            if (num > 0) {
                alert( num + " cheques were generated.");
            }
            else {
                alert("No checks scanned.");
                //Reset Settings...
                ResetPage();
                return;
            }
        }
        catch (e) {
            alert("Error:255:" + e.description);
            ResetPage();
            return;
        }
        //Close Modal Scanning Dialog....
        modal_overlay.hide();
        divScanningImagesView.hide();
        divPreInsertTable.show();
        divScannerController.hide();

        createPreInsertTable(scannedDocs);


        StopScanning();
    }

    function ReScanBatch() {
        //////////////////////////////////////////////////
        try {
            _scanMode = ScanModeEnum.ReScanBatch; //MyDef
            scannedDocs = new Array();
            scanIndex = 0;
            spanNoChequeScanned.text("");

            CreateEndorsementBitmap($("#endorsement_text").val());

            //Show Modal Scanning Dialog....
            modal_overlay.show();
            divScanningImagesView.show();
            divPreInsertTable.hide();
            divPostInsertTable.hide();

            //Blocked until scanning is finished.
            var num = comScanner.ScanBatch();

            // Load the last image
            if (num > 0) {
                alert( num + " cheques were rescanned.");
            }
            else {
                alert("No checks rescanned.");
                //Reset Settings...
                ResetPage();
                return;
            }
        }
        catch (e) {
            alert("Error:302:" + e.description);
            ResetPage();
            return;
        }
        //Close Modal Scanning Dialog....
        modal_overlay.hide();
        divScanningImagesView.hide();
        divPreInsertTable.show();
        divScannerController.hide();

        createPreInsertTable(scannedDocs);


        StopScanning();
        ///////////////////////////////////////////////
        /*
        try {
        _scanMode = ScanModeEnum.Batch; //MyDef
        scannedDocs = new Array();
        CreateEndorsementBitmap($("#endorsement_text").val());
        $("#divPreInsertTable").hide();
        var num = comScanner.ScanBatch();

            // Load the last image
        if (num > 0) {
        alert( num + " cheques were scanned.");
        }
        else {
        alert("No checks scanned.");
        return;
        }
        }
        catch (e) {
        alert("Error:289:" + e.description);
        return;
        }

        var _count = scannedDocs.length;
        for (i = 0; i < _count; i++) {
        scannedDocs[i].status = "outward_scanned";
        scannedDocs[i].batchid = "-";
        scannedDocs[i].type = WS_InstrumentType.ReScanCheque;
        }

        //Upload All The Data into Server
        postOCEWebRequestBatch();
        StopScanning();
        */
    }

    function ScanDepositSlip() {
        try {
            _scanMode = ScanModeEnum.DepositSlipBatch; //MyDef
            scannedDocs = new Array();
            scanIndex = 0;
            spanNoChequeScanned.text("");

            CreateEndorsementBitmap($("#endorsement_text").val());

            //Show Modal Scanning Dialog....
            modal_overlay.show();
            divScanningImagesView.show();
            divPreInsertTable.hide();
            divPostInsertTable.hide();

            //Blocked until scanning is finished.
            var num = comScanner.ScanBatch();

            // Load the last image
            if (num > 0) {
                alert( num + " deposit slips were scanned.");
            }
            else {
                alert("No deposit slips were scanned.");
                //Reset Settings...
                ResetPage();
                return;
            }
        }
        catch (e) {
            alert("Error:335:" + e.description);
            ResetPage();
            return;
        }
        //Close Modal Scanning Dialog....
        modal_overlay.hide();
        divScanningImagesView.hide();
        divPreInsertTable.show();
        divScannerController.hide();

        createPreInsertTable(scannedDocs);


        StopScanning();
    }

    // Eject any documents
    function EjectDocument() {
        comScanner.Eject();
    }

    function ResetPage() {
        divPostInsertTable.hide();
        divPreInsertTable.hide();
        modal_overlay.hide();
        divScanningImagesView.hide();
        divDatabaseUpdating.hide();

        divScannerController.show();


    }


    // Cancel batch scan
    function CancelBatch() {
        comScanner.CancelBatch();
    }

    function StartScanning() {
        //document.getElementById("eventdata").value = "";
        document.getElementById("scansingletiff").disabled = true;
        //document.getElementById("scansinglejpeg").disabled = true;
        //document.getElementById("scansingleboth").disabled = true;
        document.getElementById("scan_batch_tiff").disabled = true;
        document.getElementById("rescan_batch_tiff").disabled = true;
        document.getElementById("scan_deposit_slip").disabled = true;
        //document.getElementById("scanbatchjpeg").disabled = true;
        //document.getElementById("scanbatchboth").disabled = true;
        //document.getElementById("ejectdocument").disabled = true;

        //$("#divScanningImagesView").attr("class", "");
        $("#divPreInsertTable").hide();
    }

    function StopScanning() {
        document.getElementById("scansingletiff").disabled = false;
        //document.getElementById("scansinglejpeg").disabled = false;
        //document.getElementById("scansingleboth").disabled = false;
        document.getElementById("scan_batch_tiff").disabled = false;
        document.getElementById("rescan_batch_tiff").disabled = false;
        document.getElementById("scan_deposit_slip").disabled = false;
        //document.getElementById("scanbatchjpeg").disabled = false;
        //document.getElementById("scanbatchboth").disabled = false;
        //document.getElementById("ejectdocument").disabled = false;
    }

    function fOnScanComplete(jsonScanRes) {
        scanIndex++;

        spanNoChequeScanned.text(scanIndex);

        var __cheque = eval("(" + jsonScanRes + ")");
        var imgFront;
        var imgRear;
        try {
            imgFront = __cheque.img.front.replace(/\//gi, "\\");
            imgRear = __cheque.img.rear.replace(/\//gi, "\\");
            LoadCheckImages(imgFront, imgRear);

            __cheque.front = comScanner.GetBase64Tiff(imgFront);
            __cheque.rear = comScanner.GetBase64Tiff(imgRear);

            if (_scanMode == ScanModeEnum.Batch || _scanMode == ScanModeEnum.DepositSlipBatch || _scanMode == ScanModeEnum.ReScanBatch) {
                __cheque.date = "";
                __cheque.amount = 0;
                __cheque.payee = "";
                __cheque.account = "";
                __cheque.selected = true;

                scannedDocs.push(__cheque);
            }
            else if (_scanMode == ScanModeEnum.Single) {
                __cheque.date = "";
                __cheque.amount = 0;
                __cheque.payee = "";
                __cheque.account = "";
                __cheque.selected = true;

                scannedDocs.push(__cheque);

                /*
                scannedDocs[0] = __cheque;
                var micrval = "";
                if (__cheque.micr.quality > 5) {
                micrval = __cheque.micr.micr;
                }
                else if (_useOcr == "yes") {
                micrval = __cheque.micr.ocr;
                }
                else {
                micrval = "";
                }

                _curObj = null;
                _frontImg = null;
                _rearImg = null;

                $("#img_payee").attr("src", "");
                $("#img_date").attr("src", "");
                $("#img_payer").attr("src", "");
                $("#img_amount").attr("src", "");
                $("#img_sig").attr("src", "");
                $("#img_micr").attr("src", "");


                var front64str = comScanner.GetBase64Tiff(scannedDocs[0].img.front.replace(/\//gi, "\\"));

                $.ajax({
                type: "POST",
                url: "OutwardDBService.aspx",
                data: ({
                id: 0,
                type: "tmp-img",
                micr: micrval,
                img: front64str
                }),
                success: function(msg) {
                _curObj = eval("(" + msg + ")");
                _frontImg = _curObj.img;

                        if (_curObj.result == "success") {
                $("#payee_usability").attr('checked', true);
                $("#date_usability").attr('checked', true);
                $("#con_amt_usability").attr('checked', true);
                $("#signature_usability").attr('checked', true);
                $("#payer_details_usability").attr('checked', true);

                            $("#img_payee").attr("src", _curObj.img);
                $("#img_date").attr("src", _curObj.img);
                $("#img_payer").attr("src", _curObj.img);
                $("#img_amount").attr("src", _curObj.img);
                $("#img_sig").attr("src", _curObj.img);
                $("#img_micr").attr("src", _curObj.img);

                            $("#cu_id").text("Processing for: " + micrval);
                $("#cu_dbid").attr("value", "");
                $("#cu_account").attr("value", "");
                $("#cu_amount").attr("value", "");
                $("#cu_payee").attr("value", "");
                $($(".cu_date")[0]).attr("value", "");

                            $("#cu_micr_div").text(micrval);

                            //Type now ignored.

                            $("#chq_dimension").text("Good");
                $("#chq_micr_quality").text("Good");
                $("#chq_skew").text("No Skew");
                $("#chq_brightness").text("Enough");
                }
                else {
                alert("Error Loading Cheque Data.");
                }
                }
                });


                $.blockUI({
                message: $('#data_entry_dialog'),
                css: {
                width: '894px',
                top: ($(window).height() - 500) / 2 + 'px',
                left: ($(window).width() - 894) / 2 + 'px',
                background: 'rgb(235, 244, 251)'
                }
                });
                
                */
            }
        }
        catch (err) {
            alert("Error:516:" + err);
        }
    }

    function postOCEWebRequestBatch() {
        try {
            var bofd_id = $($(".ddBranchList")[0]).val() | 0;


            modal_overlay.show();
            divDatabaseUpdating.show();

            ACCS.Outward.OutwardService.InsertCheques(
            //Parameters
                scannedDocs, bofd_id,

            //Success
                function(ws_rsp) {
                    divPreInsertTable.hide();
                    divPostInsertTable.show();
                    createPostInsertTable(ws_rsp);

                    modal_overlay.hide();
                    divDatabaseUpdating.hide();
                },

            //Error
                function(e) {
                    modal_overlay.hide();
                    divDatabaseUpdating.hide();
                    alert("Error:537:" + e);
                    ResetPage();
                }
                );
        }
        catch (err) {
            alert("Error:543:" + err);
            return false;
        }
    }

    function sortTable() {
        $("#tablePreInsert").tablesorter({
            debug: false,
            sortList: [[0, 0]],
            widgets: ['zebra']
        })
        .tablesorterPager({
            container: $("#pagerPreInsert"),
            positionFixed: false
        });
    }

    function createPreInsertTable(cheques) {
        try {

            if (cheques != null && cheques.length > 0) {

                var table_scanned = tablePreInsert;

                $('tbody', table_scanned).remove();
                var table_body = table_scanned.append('<tbody></tbody>');

                // Number of td's in the last table row
                var n = cheques.length;
                var tds = '';
                var micr;
                var tdClass = "";
                for (var i = 0; i < n; i++) {

                    tds += '<tr>';

                    if (i % 2) {
                        tdClass = "alt";
                    }
                    else {
                        tdClass = "";
                    }

                    //Cheque Selection Checkbox
                    tds += "<th class='spec" + tdClass + "'><input type='checkbox' class='cheque_select' id='chi_" + i + "' checked='checked' /></th>";

                    //MICR
                    if (cheques[i].micr.quality > 5) {
                        micr = cheques[i].micr.micr;
                    }
                    else if (_useOcr == "yes") {
                        micr = cheques[i].micr.ocr;
                    }
                    else {
                        micr = "Unrecognized MICR";
                    }
                    tds += '<td class="' + tdClass + '">' + micr + '</td>';

                    //MICR Validation
                    var valid = validateMICRData(micr);
                    tds += '<td class="' + tdClass + '">' + valid + '</td>';

                    //MICR Quality
                    if (cheques[i].micr.quality > 5)
                        tds += '<td class="' + tdClass + '">' + 'Good MICR' + '</td>';
                    else if (_useOcr == "yes")
                        tds += '<td class="' + tdClass + '">' + 'OCR Used' + '</td>';
                    else
                        tds += '<td class="' + tdClass + '">' + 'Not Valid MICR' + '</td>';

                    //Popup Image Link
                    tds += '<td class="' + tdClass + '">' + '<a title="' + i + '" href="#" class="scanned_img">Show Images</a>' + '</td>';

                    //IQA Details, to be added...
                    tds += '<td class="' + tdClass + '">' + '</td>';

                    tds += '</tr>';
                }

                $("#preInsertSummary").text("Total " + n + " cheques.");

                table_body.append(tds);

                $(".scanned_img").click(function(evt) {
                    popupScanImage(evt);
                });

                $(".cheque_select").click(function(evt) {
                    var m = this.id.match(/chi_(\d+)/);
                    var index = m[1];
                    cheques[index].selected = this.checked;
                });
            }
            else {
                alert("No Cheques to show.");
                $("#divScannerController").show();
                $("#divPreInsertTable").hide();
            }
        } catch (e) {
            alert("Error:637:" + e);
            ResetPage();
            return;
        }
    }

    function createPostInsertTable(response) {
        try {
            if (response.result == WS_OutwardServiceResponseResult.success && scannedDocs) {

                var table_scanned = tablePostInsert;
                $('tbody', table_scanned).remove();
                var table_body = table_scanned.append('<tbody></tbody>');


                // Number of td's in the last table row
                var n = scannedDocs.length;
                var tds = '';
                var tdClass = "";
                var micr;
                for (var i = 0; i < n; i++) {

                    tds += '<tr>';

                    if (i % 2) {
                        tdClass = "alt";
                    }
                    else {
                        tdClass = "";
                    }

                    //MICR
                    if (scannedDocs[i].micr.quality > 5) {
                        micr = scannedDocs[i].micr.micr;
                    }
                    else if (_useOcr == "yes") {
                        micr = scannedDocs[i].micr.ocr;
                    }
                    else {
                        micr = "Unrecognized MICR";
                    }
                    tds += '<td class="nobold' + tdClass + '">' + micr + '</td>';

                    //MICR Validation
                    //var valid = validateMICRData(micr);
                    //tds += '<td>' + valid + '</td>';

                    //MICR Quality
                    //if (scannedDocs[i].micr.quality > 5)
                    //    tds += '<td>' + 'Good MICR' + '</td>';
                    //else if (_useOcr == "yes")
                    //    tds += '<td>' + 'OCR Used' + '</td>';
                    //else
                    //    tds += '<td>' + 'Nor Valid MICR' + '</td>';

                    //Popup Image Link
                    tds += '<td class="' + tdClass + '">' + '<a title="' + i + '" href="#" class="scanned_img">Show Images</a>' + '</td>';

                    //DB Response//
                    if (response.data[i].status == WS_OutwardServiceResponseResult.success) {
                        tds += '<td class="' + tdClass + '">' + 'Successfully Inserted into DB' + '</td>';
                    }
                    else
                        tds += '<td class="' + tdClass + '">' + 'Error: ' + response.data[i].details + '</td>';
                    tds += '</tr>';
                }
                table_body.append(tds);
                $("#postInsertSummary").text("Total " + n + " cheques.");

                $(".scanned_img").click(function(evt) {
                    popupScanImage(evt);
                });
            }
            else {
                alert("Error Message\n" + response.data);
                divScannerController.show();
                divPostInsertTable.hide();
            }
        } catch (e) {
            alert("Error:713:" + e);
            ResetPage();
            return;
        }
    }

    function popupScanImage(evt) {
        id = evt.target.title;

        src = scannedDocs[id].img.front.replace(/\//gi, "\\")
        src = src.replace('file:///', '');
        src = src.replaceAll("%20", " ");
        comPreviewFront.LoadFile(src, 1);

        src = scannedDocs[id].img.rear.replace(/\//gi, "\\")
        src = src.replace('file:///', '');
        src = src.replaceAll("%20", " ");
        comPreviewRear.LoadFile(src, 1);

        dialogPopupImage.show();
        dialogPopupImage.dialog("open");
    }

    function validateMICRData(micr) {
        if (micr.match(micrRegex.strict2) != null)
            return "Valid";
        else
            return "Invalid";
    }

    //Button Click//
    $("#scansingletiff").click(function(event) {
        ScanSingle();
    });

    $("#scan_batch_tiff").click(function(event) {
        ScanBatch();
    });

    $("#rescan_batch_tiff").click(function(event) {
        ReScanBatch();
    });

    $("#scan_deposit_slip").click(function(event) {
        ScanDepositSlip();
    });

    $("#Eject").click(function(event) {
        EjectDocument();
    });

    $("#insert_db").click(function(event) {
        InsertIntoDatabase();
    });


    $('#yes').click(function() {
        $("#dialog").dialog('close');
        var li_autoValidation = getAutoValidation();
        if (li_autoValidation != "") {
            alert("Some, Required field are not present. Please Reject The Cheque.");
            return;
        }

        $('#data_entry_dialog').block({
            message: '<h1>Processing Database</h1>',
            css: {
                border: '3px solid #a00'
            }
        });

        var payee_usability = $("#payee_usability").attr('checked') ? 2 : 1;
        var date_usability = $("#date_usability").attr('checked') ? 2 : 1;
        var con_amt_usability = $("#con_amt_usability").attr('checked') ? 2 : 1;
        var signature_usability = $("#signature_usability").attr('checked') ? 2 : 1;
        var payer_details_usability = $("#payer_details_usability").attr('checked') ? 2 : 1;


        scannedDocs[0].iqa.payee_usability = payee_usability;
        scannedDocs[0].iqa.date_usability = date_usability;
        scannedDocs[0].iqa.con_amt_usability = con_amt_usability;
        scannedDocs[0].iqa.signature_usability = payee_usability;
        scannedDocs[0].iqa.payee_usability = payer_details_usability;

        scannedDocs[0].date = $($(".cu_date")[0]).attr("value");
        scannedDocs[0].amount = $("#cu_amount").attr("value");
        scannedDocs[0].account = $("#cu_account").attr("value");
        scannedDocs[0].payee = $("#cu_payee").attr("value");
        scannedDocs[0].status = "outward_maker_accept";

        postOCEWebRequest(0);
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

        $("#data_entry_dialog").block({
            message: $('#rejection_dialog'),
            css: {
                width: '260px',
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

        scannedDocs[0].iqa.payee_usability = payee_usability;
        scannedDocs[0].iqa.date_usability = date_usability;
        scannedDocs[0].iqa.con_amt_usability = con_amt_usability;
        scannedDocs[0].iqa.signature_usability = payee_usability;
        scannedDocs[0].iqa.payee_usability = payer_details_usability;

        scannedDocs[0].date = $($(".cu_date")[0]).attr("value");
        scannedDocs[0].amount = $("#cu_amount").attr("value");

        scannedDocs[0].account = $("#cu_account").attr("value");
        scannedDocs[0].payee = $("#cu_payee").attr("value");
        scannedDocs[0].status = "outward_maker_reject";

        $('#data_entry_dialog').unblock();

        postOCEWebRequest(0);

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

    $("#cancelBatch").click(function() {
        divPreInsertTable.hide();
        divScannerController.show();
    });
    $("#okPostScanned").click(function() {
        ResetPage();
    });


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


    dialogPopupImage.dialog({
        title: "Scanned Cheques...",
        bgiframe: false,
        autoOpen: false,
        modal: true,
        resizable: false,
        height: 350,
        width: 900,
        buttons: {
            Ok: function() {
                $(this).dialog('close');
            }
        }
    });


    function InsertIntoDatabase() {
        var len = scannedDocs.length;
        for (i = len - 1; i >= 0; i--) {
            if (!scannedDocs[i].selected)
                scannedDocs.splice(i, 1);
        }

        var _count = scannedDocs.length;
        for (i = 0; i < _count; i++) {

            scannedDocs[i].batchid = ""; //Batch No will be handled in server side.
            if (_scanMode == ScanModeEnum.Batch || _scanMode == ScanModeEnum.Single) {
                scannedDocs[i].type = WS_InstrumentType.ICE;
                scannedDocs[i].status = "outward_scanned";
            }
            else if (_scanMode == ScanModeEnum.ReScanBatch || _scanMode == ScanModeEnum.ReScanSingle) {
                scannedDocs[i].type = WS_InstrumentType.ReScanCheque;
                scannedDocs[i].status = "outward_scanned";
            }
            else if (_scanMode == ScanModeEnum.DepositSlipBatch || _scanMode == ScanModeEnum.DepositSlipSingle) {
                scannedDocs[i].type = WS_InstrumentType.DepositSlip;
                scannedDocs[i].status = "deposit_slip_scanned";
            }
        }
        //Upload All The Data into Server
        postOCEWebRequestBatch();
    }

    ///main()//
    try {
        InitializeScanner();
        //InitializeImageWindows();
    }
    catch (e) {
        alert("Error:986:Unable to initialize Scanner: \n" + e.description);
        window.close();
    }
};