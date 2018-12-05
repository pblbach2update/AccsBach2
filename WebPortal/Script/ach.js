
function showCheckerDetails(chkno) {


    var a = new Array;
    
    var url = 'checkerprocessKrishi.aspx?chkno=' + chkno;

    

    var r = window.open(url, a, "dialogwidth: 1024px; dialogheight: 700px; resizable: yes; dialogHide:yes");

    if (r == "stimeout") {
        alert("Your session has been expired.You will be redirected to a login page......");
        window.location.href = "../login.aspx";

    }
    $(".afprocess").click();
    //if (r == "cancel" || r == null) {

    //    $(".afprocess").click();
    //}

}

function showInwardDetailModal(detailUrl) {


    var a = new Array;

    var r = window.showModalDialog(detailUrl, a, "dialogwidth: 1024px; dialogheight: 700px; resizable: yes; dialogHide:yes");

    if (r == "stimeout") {
        alert("Your session has been expired.You will be redirected to a login page......");
        window.location.href = "../login.aspx";

    }
    if (r == "cancel" || r == null) {

        $(".afprocess").click();
    }

}

function showLog(chkno) {

    var a = new Array;
    a[0] = 1;
    a[1] = 4;

    var url = 'showlog.aspx?chkno=' + chkno;
    //alert(chkno);
    //ajaxRequest("get", "process.aspx", checkId, ajaxresp);
    var r = window.open(url, a, "width=400,height=400");
    //if (r != null && r != 'cancel') {
    //    window.location.reload(true);
    //}

}


