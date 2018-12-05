function MICR() {
    this.micr_s = "";
    this.micr_r = "";
    this.micr_a = "";
    this.micr_t = "";
};

var ValidatorType = {
    OneParam: 1,
    TwoParam: 2
};

function checkUsabilityValue(element, value) {
    if (value == Accs.OutwardWebServiceObject.WS_IQAUsability.USABLE_AND_READABLE)
        element.attr('checked', true);
    else if (value == Accs.OutwardWebServiceObject.WS_IQAUsability.UNUSABLE_AND_UNREADABLE)
        element.attr('checked', false);
}

function testMicrField(elemMicr, params, validator, pcount) {
    if (pcount == ValidatorType.OneParam) {
        if (validator(params)) {
            elemMicr.attr("class", "micr_ok");
            return 0;
        }
        else {
            elemMicr.attr("class", "micr_invalid");
            return 1;
        }
    }
    else if (pcount == ValidatorType.TwoParam) {
        if (validator(params[0], params[1])) {
            elemMicr.attr("class", "micr_ok");
            return 0;
        }
        else {
            elemMicr.attr("class", "micr_invalid");
            return 1;
        }
    }
}

function validateAllMICR(elems, vals) {
    var r = 0;
    r += testMicrField(elems.serial, vals.micr_s, isValidSerial, ValidatorType.OneParam);
    var a = Array();
    a[0] = vals.micr_r;
    a[1] = vals.micr_t;
    r += testMicrField(elems.routing, a, isValidRouting, ValidatorType.TwoParam);
    r += testMicrField(elems.account, vals.micr_a, isValidAccount, ValidatorType.OneParam);
    r += testMicrField(elems.type, vals.micr_t, isValidTransactionType, ValidatorType.OneParam);
    return r;
}

function checkUsability(item, divtag) {
    var divtag = item.parentNode.parentNode;
    if (item.checked) {
        divtag.className = "no_notification";
    }
    else {
        divtag.className = "error_box";
    }
}

function testIqa(value, element) {
    if (value.indexOf("Good") != -1) {
        element.css("color", "#000");
        return 1;
    } else
        element.css("color", "#f00")
    return 0;
}

function setClipRect(id, str) {
    try {
        $(id).attr("style", str.pos + str.clip);

        var divid = $(id).parent();
        $(divid).attr("style", "padding:0; height:" + str.height + "px; width:" + str.width + "px;");
    } catch (e) {
    }
}

function zeroPad(num, count) {
    var numZeropad = num + '';
    while (numZeropad.length < count) {
        numZeropad = "0" + numZeropad;
    }
    return numZeropad;
}

function Comma(number) {
    number = parseFloat(number);

    var s = number + "";
    var frac = '';
    if (s.indexOf('.') < 0) {
        frac += '.00';
    }
    else {
        frac = s.substring(s.indexOf("."), s.length);
    }

    number = parseInt(number);

    var output1 = '';

    if (number > 999) {
        output1 = "," + zeroPad((number % 1000), 3) + output1;
        number = parseInt(number / 1000);
    } else {
        output1 = "" + number + output1;
        number = parseInt(number / 1000);
    }

    while (number > 0) {
        if (number > 99) {
            output1 = "," + zeroPad((number % 100), 2) + output1;
            number = parseInt(number / 100);
        } else {
            output1 = "" + (number % 100) + output1;
            number = parseInt(number / 100);
        }
    }
    return output1 + frac;
}

//Need to load regex.helper.js first

function StripComma(amount) {
    return amount.replaceAll(",", "");
}