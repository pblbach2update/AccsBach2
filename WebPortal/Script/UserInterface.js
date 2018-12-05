
function toWord(input) {
    //var input = window.document.getElementById("taka").value;
    var seperator = ".";
    var trim = "";
    var ignoreEmptyTokens = true;

    var output = input.tokenize(seperator, trim, ignoreEmptyTokens);

    var out = "";

    if (output.length == 1) {
        //out = test_skill(output[0]) + " Taka Only";
        var tk = output[0];
        if (tk.length <= 7)
            out = test_skill(output[0]) + " Taka";
        else {
            var crore = tk.substr(0, tk.length - 7);
            var rest = tk.substr(tk.length - 7, 7);
            out = test_skill(crore) + " Crore ";

            var restWord = test_skill(rest);
            if (restWord != "Zero")
                out += restWord;

            out += " Taka";
        }
    }
    else if (output.length == 2) {
        //out = test_skill(output[0]) + " Taka and " + test_skill(output[1]) + " Paisa Only";
        var tk = output[0];
        if (tk.length <= 7)
            out = test_skill(output[0]) + " Taka";
        else {
            var crore = tk.substr(0, tk.length - 7);
            var rest = tk.substr(tk.length - 7, 7);
            out = test_skill(crore) + " Crore ";

            var restWord = test_skill(rest);
            if (restWord != "Zero")
                out += restWord;

            out += " Taka";
        }

        var paisa = output[1];
        if (paisa.length == 1)
            paisa = paisa.concat("0");
        else if (paisa.length == 2)
            paisa = paisa;
        else
            paisa = paisa.substr(0, 2);

        out += " and " + test_skill(paisa) + " Paisa";
    }
    else
        out = "Invalid";

    //var join = getString(window.document.getElementById("join").value);

    //document.getElementById("word").innerHTML = out;
    return out;
}


function tokenizeString() {
    var input = window.document.getElementById("taka").value;
    var seperator = ".";
    var trim = "";
    var ignoreEmptyTokens = true;

    var output = input.tokenize(seperator, trim, ignoreEmptyTokens);

    var out = "";

    if (output.length == 1) {
        out = test_skill(output[0]) + " Taka";
    }
    else if (output.length == 2) {
        out = test_skill(output[0]) + " Taka and " + test_skill(output[1]) + " Paisa";
    }
    else
        out = " Invalid";

    //var join = getString(window.document.getElementById("join").value);

    document.getElementById("word").innerHTML = out;
}

function getString() {
    var myString = getString.arguments[0];

    while (myString.indexOf("\\n") != -1)
        myString = myString.replace("\\n", "\n");

    while (myString.indexOf("\\f") != -1)
        myString = myString.replace("\\f", "\f");

    while (myString.indexOf("\\b") != -1)
        myString = myString.replace("\\b", "\b");

    while (myString.indexOf("\\r") != -1)
        myString = myString.replace("\\r", "\r");

    while (myString.indexOf("\\t") != -1)
        myString = myString.replace("\\t", "\t");

    return myString;
}