var AJAXXMLHttpRequest = null;
try {
    AJAXXMLHttpRequest = new XMLHttpRequest();
} catch (e1) {
    console.log(e1);
    var MSXMLHttpRequestArray = new Array(
        "Msxml2.XMLHTTP.6.0", "Msxml2.XMLHTTP.5.0",
        "Msxml2.XMLHTTP.4.0", "Msxml2.XMLHTTP.3.0",
        "Msxml2.XMLHTTP", "Microsoft.XMLHTTP");
    for (var i = 0; i < MSXMLHttpRequestArray.length; i++) {
        try {
            AJAXXMLHttpRequest = new ActiveXObject(MSXMLHttpRequestArray[i]);
            if (AJAXXMLHttpRequest != null) {
                break;
            }
        } catch (e2) {
            console.log(e2);
        }
    }
}
if (AJAXXMLHttpRequest == null) {
    alert("不能创建AJAX对象！");
}