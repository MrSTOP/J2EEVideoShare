$(function () {
    $(document).ready(function () {
        var textFields = initMDCComponentAttachTo(".mdc-text-field", mdc.textField.MDCTextField);
        var selects = initMDCComponentAttachTo(".mdc-select", mdc.select.MDCSelect);
        var buttons = initMDCComponentClass(".mdc-button", mdc.ripple.MDCRipple);
        var dialogs = initMDCComponentClass(".mdc-dialog", mdc.dialog.MDCDialog);
        dialogs[0].scrimClickAction = "";
        $.func.initHtmlConstValue();
        $("#UserName").bind({
            "input blur propertychange": function () {
                if ($.func.userNameRegCheck(textFields[0])) {
                    $.func.userNameExistCheck(textFields[0]);
                }
            }
        });
        $("#Email").bind({
            "input blur propertychange": function () {
                if ($.func.emailRegCheck(textFields[1])) {
                    $.func.emailExistCheck(textFields[1]);
                }
            }
        });
        $("#CAPTCHA").bind({
            "input blur propertychange": function () {
                if ($.func.CAPTCHARegCheck(textFields[2])) {
                    $.func.CAPTCHAExistCheck(textFields[2]);
                }
            }
        });
        $("#Password").bind({
            "input blur propertychange": function () {
                $.func.passwordRegCheck(textFields[3]);
            }
        });
        $("#PasswordRepeat").bind({
            "input blur propertychange": function () {
                $.func.passwordRepeatCheck(textFields[4]);
            }
        });
        $("#birthDay").focus(function () {
            // $("#birthDay").focus();
            console.log("FOCUS");
            console.log($("#birthMonth option[value='29']"));
            $("#birthDay>option[value='29']").remove();
            $("#birthDay>option[value='30']").remove();
            $("#birthDay>option[value='31']").remove();
            console.log("REM");
            var month = $("#birthMonth").val();
            var year = parseInt($("#birthYear").val());
            if (month !== "2") {
                $("#birthDay").append("<option value='29'>29</option>");
                $("#birthDay").append("<option value='30'>30</option>");
                if (month === "1" || month === "3" || month === "5" || month === "7" || month === "8" || month === "10" || month === "12") {
                    $("#birthDay").append("<option value='31'>31</option>");
                }
            } else if ((year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0)) {
                $("#birthDay").append("<option value='29'>29</option>");
            }
        });
        $("#GetEmailCAPTCHA").bind({
            "click": function () {
                if (!$.func.emailRegCheck(textFields[1])) {
                    $("#Email").focus();
                    textFields[1].valid = false;
                    textFields[1].helperTextContent = "请输入正确的电子邮件地址";
                } else {
                    $.ajax({
                        url: "UserExistCheck",
                        data: "type=Email&email=" + $("#Email").val(),
                        type: "post",
                        success: function (data, status) {
                            if (status === "success") {
                                if (data === "ALLOW") {
                                    textFields[1].valid = true;
                                    textFields[1].helperTextContent = "电子邮件地址可以使用";
                                    $("#GetEmailCAPTCHA").attr("disabled", true);
                                    $.ajax({
                                        url: "GetRegistryCAPTCHA",
                                        data: "email=" + $("#Email").val(),
                                        type: "post",
                                        success: function (data, status) {
                                            if (status === "success") {
                                                var second = 60;
                                                $("#GetEmailCAPTCHA").attr("disabled", true);
                                                if (data !== "SUCCESS") {
                                                    $("#GetEmailCAPTCHA").attr("disabled", false);
                                                    $("#GetEmailCAPTCHA").html("获取验证码");
                                                } else {
                                                    var timer = setInterval(function () {
                                                        $("#GetEmailCAPTCHA").html(second + "秒后重发");
                                                        second--;
                                                        if (second <= 0) {
                                                            clearInterval(timer);
                                                            $("#GetEmailCAPTCHA").attr("disabled", false);
                                                            $("#GetEmailCAPTCHA").html("获取验证码");
                                                        }
                                                    }, 1000);
                                                }
                                            } else {
                                                $("#GetEmailCAPTCHA").attr("disabled", false);
                                            }
                                        },
                                        error: function () {
                                            textFields[2].valid = false;
                                            textFields[2].helperTextContent = "与服务器通信失败";
                                            $("#GetEmailCAPTCHA").attr("disabled", false);
                                        }
                                    });
                                    $("#SubmitInfo").attr("disabled", false);
                                } else {
                                    textFields[1].valid = false;
                                    textFields[1].helperTextContent = "电子邮件地址已被使用";
                                    $("#SubmitInfo").attr("disabled", true);
                                }
                            }
                        },
                        error: function () {
                            email.valid = false;
                            email.helperTextContent = "与服务器通信发生错误";
                        }
                    });
                }
            }
        });
        $("button[type=reset]").bind({
            "click": function () {
                $("input").focus();
                $("input").blur();
            }
        });
        $("#SubmitInfo").bind({
            "click": function () {
                var msg = "";
                if (!$.func.userNameRegCheck(textFields[0])) {
                    msg += "用户名不符合规则<br/>";
                }
                if (!$.func.emailRegCheck(textFields[1])) {
                    msg += "电子邮件地址不符合规则<br/>";
                }
                if (!$.func.CAPTCHARegCheck(textFields[2])) {
                    msg += "验证码不符合要求<br/>";
                }
                if (!$.func.passwordRegCheck(textFields[3])) {
                    msg += "密码不符合要求<br/>";
                }
                if (!$.func.passwordRepeatCheck(textFields[4])) {
                    msg += "两次输入的密码不一致";
                }
                if (msg === "") {
                    $("#RegistryInfo").submit();
                } else {
                    $("#DialogInfo").html(msg);
                    dialogs[0].open();
                }
            }
        });
    });
});