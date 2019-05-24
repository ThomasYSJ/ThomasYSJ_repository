var arr =[];
function chabaidu(element) {
    if (element.style.backgroundColor == "") {
        arr.push(element.value.split(",")[0]);
        element.style.backgroundColor = "yellow";
        window.open("https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&rsv_idx=1&tn=baidu&wd=" + element.value.split(",")[0]);
        window.history.back(-1);
    } else {
        element.style.backgroundColor = "";
        var index = arr.indexOf(element.value.split(",")[0]);
        if (index > -1) {
            arr.splice(index, 1);
        }
    }
}

function biaohuang(element) {
    if (element.style.backgroundColor == "") {
        arr.push(element.value.split(",")[0]);
        element.style.backgroundColor = "yellow";
    } else {
        element.style.backgroundColor = "";
        var index = arr.indexOf(element.value.split(",")[0]);
        if (index > -1) {
            arr.splice(index, 1);
        }
    }
}

function baocun() {
	var str = "";
	for (var i = 0; i < arr.length; i++) {
		str += arr[i];
		str += "\n";
	}
	var uri = "data:text/txt;charset=utf-8,\ufeff" + encodeURIComponent(str);
	var link = document.createElement("a");
	link.href = uri;
	link.download =  document.title + "_" + getCurrentDate(2) + ".txt";
	document.body.appendChild(link);
	link.click();
	document.body.removeChild(link);
}


function getCurrentDate(format) {
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth()+ 1;
	var date = now.getDate();
	var day = now.getDay();
	var hour = now.getHours();
	var minu = now.getMinutes();
	var sec = now.getSeconds();
	if (month < 10) month = "0" + month;
	if (date < 10) date = "0" + date;
	if (hour < 10) hour = "0" + hour;
	if (minu < 10) minu = "0" + minu;
	if (sec < 10) sec = "0" + sec;
	var time = "";
	if (format == 1) {
		time = time + year + month + date;
	} else if (format == 2) {
		time = time + year + month + date + hour + minu + sec;
	}
	return time;
}
//------------------------------------------------------------------------------------------------------

