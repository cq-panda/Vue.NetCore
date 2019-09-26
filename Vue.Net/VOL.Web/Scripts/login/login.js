(function BrowserType() {
    var userAgent = navigator.userAgent;
    var isIE = window.ActiveXObject || "ActiveXObject" in window
    if (!isIE) { return; }
    var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
    reIE.test(userAgent);

    var fIEVersion = parseFloat(RegExp["$1"]);
    if (userAgent.indexOf('MSIE 6.0') != -1 || fIEVersion < 10) {
        window.location.href = "/html/brower.html";
    }
}());


$(function () {
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
    $("#bottom").height(document.body.clientHeight * 0.15);
    $("#content").height(document.body.clientHeight * 0.85);
})

function refreshCode(obj) {
    $("#codeImage").attr("src", '/Login/GetVerificationCode?' + Math.random());
}
function login() {
    var $msg = $("#msg");
    $msg.text('');
    var loginData = {
        userName: $("#userName").val(),
        passWord: $("#passWord").val(),
        VerificationCode: $("#code").val()
    }
    if (loginData.userName == '') { $msg.text('用户名不能为空'); return };

    if (loginData.passWord == '') { $msg.text('密码不能为空'); return };

    if (loginData.VerificationCode == '') { $msg.text('验证码不能为空'); return };

    $msg.text("正在登陆。。。")
    $.post("/Login/ValidateLogin", loginData, function (data) {
        $("#process").hide();
        if (data.Status) { window.location = "/"; return; }
        refreshCode();
        $("#code").val("");
        $msg.text(data.Desc);
    });
}
document.onkeydown = function (even) { if (even.keyCode != 13) return; login(); };


