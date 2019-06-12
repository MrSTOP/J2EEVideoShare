var reqCAPTCHA = false;
$(document).ready(function () {
    var textFields = initMDCComponentAttachTo(".mdc-text-field", mdc.textField.MDCTextField);
    var dialogs = initMDCComponentClass(".mdc-dialog", mdc.dialog.MDCDialog);
    var sliders = initMDCComponentClass(".mdc-slider", mdc.slider.MDCSlider);
    dialogs[0].listen("MDCDialog:opened", () => {
        sliders[0].layout();
        $.func.login_requestCAPTCHA();
        sliders[0].value = 0;
        reqCAPTCHA = true;
    });
    dialogs[1].scrimClickAction = "";
    dialogs[1].listen("MDCDialog:closed", () => {
        if ($("#ErrorInfoTitle").html() === "验证码错误") {
            dialogs[0].open();
        }
    });
    $("#CAPTCHASlider>div").attrchange({
        trackValues: true,
        callback: function (event) {
            var value = $(this).attr("aria-valuenow");
            var x = Math.floor(value / 2);
            $("#CAPTCHAImgForeground").css("left", x + "px");
        }
    });
    $("#CAPTCHADialog").bind({
        "mouseup": function () {
            $.ajax({
                url: "LoginCheck",
                data: "type=CAPTCHA&position=" + $("#CAPTCHASlider>div").attr("aria-valuenow"),
                type: "post",
                success: function (data, status) {
                    if (data === "ALLOW") {
                        $("#CAPTCHAResult").show();
                        $("#CAPTCHAResultWrong").hide();
                        $("#CAPTCHAResultRight").slideDown(500, function () {
                            setTimeout(function () {
                                dialogs[0].close();
                                $("#CAPTCHAResult").hide();
                                $("#SubmitInfo").click();
                            }, 500);
                        });
                    } else {
                        sliders[0].disabled = true;
                        $("#CAPTCHAResult").show();
                        $("#CAPTCHAResultRight").hide();
                        $("#CAPTCHAResultWrong").slideDown(500, function () {
                            setTimeout(function () {
                                sliders[0].disabled = false;
                                sliders[0].value = 0;
                                $("#CAPTCHAResult").hide();
                                $.func.login_requestCAPTCHA();
                            }, 500);
                        });
                    }
                },
                error: function () {
                    $("#ErrorInfoTitle").html("与服务器通信错误");
                    dialogs[1].open();
                }
            });
        }
    });
    $("#HELP").bind({
        "click": function () {
            window.location.href = "./" + $("#TEST").val() + "?test=true";
        }
    });
    $("#EmailOrUID").bind({
        "input blur propertychange": function () {
            var reg = /(^[0-9]+$)|(^[0-9a-zA-Z]+@[0-9a-zA-Z]+\.[a-z]+$)/;
            var input = $("#EmailOrUID").val();
            if (reg.test(input)) {
                textFields[0].valid = true;
            } else {
                textFields[0].valid = false;
            }
        }
    });
    $("#Password").bind({
        "input blur propertychange": function () {
            var reg = /[a-zA-Z0-9`~!@#$%^&*()_\-=+{}[\]\\|;:'",<.>/?]{6,16}/;
            var input = $("#Password").val();
            if (reg.test(input)) {
                textFields[1].valid = true;
            } else {
                textFields[1].valid = false;
            }
        }
    });
    $("#CAPTCHAButton").bind({
        "click": function () {
            dialogs[0].open();
        }
    });
    $("#SubmitInfo").bind({
        "click": function () {
            if (reqCAPTCHA) {
                $.ajax({
                    url: "LoginCheck",
                    type: "get",
                    data: "type=InfoCheck&emailOrUID=" + $("#EmailOrUID").val() +
                        "&password=" + $("#Password").val() +
                        "&position=" + $("#CAPTCHASlider>div").attr("aria-valuenow"),
                    success: function (data, status) {
                        if (data === "ALLOW") {
                            window.location.href = "./index.jsp";
                        } else if (data === "CAPTCHA") {
                            $("#ErrorInfoTitle").html("验证码错误");
                            dialogs[1].open();
                        } else {
                            $("#ErrorInfoTitle").html("UID/邮箱或密码错误");
                            sliders[0].value = 0;
                            dialogs[1].open();
                        }
                    },
                    error: function () {
                        $("#ErrorInfoTitle").html("与服务器通信错误");
                        dialogs[1].open();
                    }
                });
            } else {
                dialogs[0].open();
            }
        }
    });
});