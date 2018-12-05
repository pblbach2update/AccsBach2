String.prototype.replaceAll = function(strTarget, strSubString) {
    var strText = this;
    var intIndexOfMatch = strText.indexOf(strTarget);

    // Keep looping while an instance of the target string
    // still exists in the string.
    while (intIndexOfMatch != -1) {
        // Replace out the current instance.
        strText = strText.replace(strTarget, strSubString);
        // Get the index of any next matching substring.
        intIndexOfMatch = strText.indexOf(strTarget);
    }

    // Return the updated string with ALL the target strings
    // replaced out with the new substring.
    return (strText);
}

Date.prototype.addDays = function(days) {
    this.setDate(this.getDate()+days);
}


function isValidDate(date_string, format) {
	/* Validate string user entered as a date in 
	 * 1 of 6 formats
	 *	m/d/y		American month, day, year with 2 or 4 digit year
	 *	mm/dd/yy	Short American with 2 digit year
	 *	mm/dd/yyyy	Long American with 4 digit year
	 *	y/m/d		European year, month, day with 2 or 4 digit year
	 *	yy/mm/dd	European with 2 digit year
	 *	yyyy/mm/dd	European with 4 digit year
	 *	dd/mm/yyyy	UK Date
	 */
	var days = [0,31,28,31,30,31,30,31,31,30,31,30,31];
	var year, month, day, date_parts = null;
	var rtrn = false;

	/* JS Object/Hash table to branch for format */
	var decisionTree = {
		'm/d/y':{
			're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{2}|\d{4})$/,
			'month': 1,'day': 2, 'year': 3
		},
		'mm/dd/yy':{
			're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{2})$/,
			'month': 1,'day': 2, 'year': 3
		},
		'mm/dd/yyyy':{
			're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{4})$/,
			'month': 1,'day': 2, 'year': 3
		},
		'y/m/d':{
			're':/^(\d{2}|\d{4})[./-](\d{1,2})[./-](\d{1,2})$/,
			'month': 2,'day': 3, 'year': 1
		},
		'yy/mm/dd':{
			're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{1,2})$/,
			'month': 2,'day': 3, 'year': 1
		},
		'yyyy/mm/dd':{
				're':/^(\d{4})[./-](\d{1,2})[./-](\d{1,2})$/,
				'month': 2,'day': 3, 'year': 1
		},
		'dd/mm/yyyy':{
				're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{2,4})$/,
				'month': 2,'day': 1, 'year': 3
		}
	};

	var test = decisionTree[format]; //Get regexp, etc matching format
	if (test) {
		date_parts = date_string.match(test.re); //parse string
		if (date_parts) {
			year = date_parts[test.year] | 0;
			month = date_parts[test.month] | 0;
			day = date_parts[test.day] | 0;

			//Get number of days in month -- zero for invalid months
			test = (month == 2 && 
					isLeapYear() && 
					29 || days[month] || 0);

			rtrn = 1 <= day && day <= test; //Check day is in range; false for invalid months
		}
	}

	function isLeapYear() {
		return (year % 4 != 0 ? false : 
			( year % 100 != 0? true: 
			( year % 1000 != 0? false : true)));
	}
	return rtrn;
}//eof isValidDate

function getValidDate(date_string, format, format2) {
	/* Validate string user entered as a date in 
	 * 1 of 6 formats
	 *	m/d/y		American month, day, year with 2 or 4 digit year
	 *	mm/dd/yy	Short American with 2 digit year
	 *	mm/dd/yyyy	Long American with 4 digit year
	 *	y/m/d		European year, month, day with 2 or 4 digit year
	 *	yy/mm/dd	European with 2 digit year
	 *	yyyy/mm/dd	European with 4 digit year
	 *	dd/mm/yyyy	UK Date
	 */
	var days = [0,31,28,31,30,31,30,31,31,30,31,30,31];
	var year, month, day, date_parts = null;
	var rtrn = false;

	/* JS Object/Hash table to branch for format */
	var decisionTree = {
		'm/d/y':{
			're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{2}|\d{4})$/,
			'month': 1,'day': 2, 'year': 3
		},
		'mm/dd/yy':{
			're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{2})$/,
			'month': 1,'day': 2, 'year': 3
		},
		'mm/dd/yyyy':{
			're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{4})$/,
			'month': 1,'day': 2, 'year': 3
		},
		'y/m/d':{
			're':/^(\d{2}|\d{4})[./-](\d{1,2})[./-](\d{1,2})$/,
			'month': 2,'day': 3, 'year': 1
		},
		'yy/mm/dd':{
			're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{1,2})$/,
			'month': 2,'day': 3, 'year': 1
		},
		'yyyy/mm/dd':{
				're':/^(\d{4})[./-](\d{1,2})[./-](\d{1,2})$/,
				'month': 2,'day': 3, 'year': 1
		},
		'dd/mm/yyyy':{
				're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{1,4})$/,
				'month': 2,'day': 1, 'year': 3
		},
		'dd/mm/yy':{
				're':/^(\d{1,2})[./-](\d{1,2})[./-](\d{1,2})/,
				'month': 2,'day': 1, 'year': 3
		}
	};

	var test = decisionTree[format]; //Get regexp, etc matching format
	if (test) {
		date_parts = date_string.match(test.re); //parse string
		if (date_parts) {
			year = date_parts[test.year] | 0;
			month = date_parts[test.month] | 0;
			day = date_parts[test.day] | 0;

			//Get number of days in month -- zero for invalid months
			test = (month == 2 && 
					isLeapYear() && 
					29 || days[month] || 0);

			rtrn = 1 <= day && day <= test; //Check day is in range; false for invalid months
		}
		else
		{
		    var test = decisionTree[format2]; //Get regexp, etc matching format
		    if (test) {
		        date_parts = date_string.match(test.re); //parse string
		        if (date_parts) {
		            year = date_parts[test.year] | 0;
			        month = date_parts[test.month] | 0;
			        day = date_parts[test.day] | 0;
			        
			        if(year<100)
			            year+=2000;

			//Get number of days in month -- zero for invalid months
			        test = (month == 2 && isLeapYear() && 
					29 || days[month] || 0);

			    rtrn = 1 <= day && day <= test; //Check day is in range; false for invalid months
		        }
		    }
		}
		
	}

	function isLeapYear() {
		return (year % 4 != 0 ? false : 
			( year % 100 != 0? true: 
			( year % 1000 != 0? false : true)));
	}
	
	if(rtrn)
	{
	    return new Date(year, month-1, day);
	}
	else
	{
	    return null;
	}
}//eof isValidDate


function isValidAmount(str) {
    try{
    return /^[0-9]{0,10}(\.[0-9]{0,2})?$/.test(str);
    }catch(e){return false;}
}

function isValidSerial(str) {
    try{
    return /^[0-9]{7}$/.test(str);
    }catch(e){return false;}
}

function isValidRouting(str, ttype) {
    try{
        return /^[0-9]{9}$/.test(str);
    }catch(e){return false;}
}

function isValidAccount(str) {
    try{
    return /^[0-9]{13}$/.test(str);
    }catch(e){return false;}
}

function isValidBenifAccount(str) {
    try{
    var isDigits = /^[A-Za-z0-9]+$/.test(str);
        
    var isLength = str.length == benifAccLength;
    return isDigits && isLength;
    }catch(e){return false;}
}

function isValidTransactionType(str) {
    try{
    return /^[0-9]{2}$/.test(str);
    }catch(e){return false;}
}

function isValidDigit(str) {
    try{
    return /^[0-9]+$/.test(str);
    }catch(e){return false;}
}

function isValidDIN(str) {
    try{
    return /^[0-9]{9} [0-9]{8} [0-9]{6}$/.test(str);
    }catch(e){return false;}
}

function checkValidRouting(routing) {
    var rArr = routing.split("");
    var weight = "571571571".split("");


    var sum = 0;
    for (i = 0; i < 9; i++) {
        sum += rArr[i] * weight[i];
    }

    if (sum % 10 == 0) {
        //alert(routing + ": Yes");
        return true;
    }
    else {
        //alert(routing + ": No");
        return false;
    }
}