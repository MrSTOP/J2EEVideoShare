$.func = {
    initHtmlConstValue: function () {
        $("#PASSWORD_MIN_LENGTH").html(PASSWORD_MIN_LENGTH);
        $("#PASSWORD_MAX_LENGTH").html(PASSWORD_MAX_LENGTH);
        $("#USERNAME_MIN_LENGTH").html(USERNAME_MIN_LENGTH);
        $("#USERNAME_MAX_LENGTH").html(USERNAME_MAX_LENGTH);
    },
    registry_userNameRegCheck: function (userName) {
        var reg = /^[a-zA-Z0-9_\u4e00-\u9fa5]{1,20}$/;
        $.func.spaceReplace($("#UserName")[0]);
        var inputUserName = $("#UserName").val();
        if (reg.test(inputUserName)) {
            userName.valid = true;
            userName.helperTextContent = "用户名可以使用";
            return true;
        } else {
            userName.valid = false;
            userName.label_.shake(true);
            if (inputUserName.length < USERNAME_MIN_LENGTH ||
                inputUserName.length > USERNAME_MAX_LENGTH) {
                userName.helperTextContent = "用户名长度必须在" + USERNAME_MIN_LENGTH + "-" + USERNAME_MAX_LENGTH + "之间";
            } else {
                userName.helperTextContent = "用户名只能包含英文数字下划线";
            }
            return false;
        }
    },
    registry_userNameExistCheck: function (userName) {
        var inputUserName = $("#UserName").val();
        var checkStatus = false;
        $.ajax({
            url: "UserExistCheck",
            data: "type=UserName&userName=" + inputUserName,
            type: "post",
            success: function (data, status) {
                if (status === "success") {
                    if (data === "ALLOW") {
                        userName.valid = true;
                        userName.helperTextContent = "用户名可以使用";
                        checkStatus = true;
                        $("#SubmitInfo").attr("disabled", false);
                    } else {
                        userName.valid = false;
                        userName.helperTextContent = "用户名已存在";
                        checkStatus = false;
                        $("#SubmitInfo").attr("disabled", true);
                    }
                }
            },
            error: function () {
                userName.valid = false;
                userName.helperTextContent = "与服务器通信发生错误";
            }
        });
        return checkStatus;
    },
    registry_emailRegCheck: function (email) {
        var reg = /[0-9a-zA-Z]+@[0-9a-zA-Z]+\.[a-z]+/;
        $.func.spaceReplace($("#Email")[0]);
        var inputEmail = $("#Email").val();
        if (reg.test(inputEmail)) {
            email.valid = true;
            email.helperTextContent = "电子邮件地址正确";
            return true;
        } else {
            email.valid = false;
            email.label_.shake(true);
            email.helperTextContent = "请输入正确的电子邮件地址";
            return false;
        }
    },
    registry_emailExistCheck: function (email) {
        var checkStatus = false;
        $.ajax({
            url: "UserExistCheck",
            data: "type=Email&email=" + $("#Email").val(),
            type: "post",
            success: function (data, status) {
                if (status === "success") {
                    if (data === "ALLOW") {
                        email.valid = true;
                        email.helperTextContent = "电子邮件地址可以使用";
                        checkStatus = true;
                        $("#SubmitInfo").attr("disabled", false);
                    } else {
                        email.valid = false;
                        email.helperTextContent = "电子邮件地址已被使用";
                        checkStatus = false;
                        $("#SubmitInfo").attr("disabled", true);
                    }
                }
            },
            error: function () {
                email.valid = false;
                email.helperTextContent = "与服务器通信发生错误";
            }
        });
        return checkStatus;
    },
    registry_CAPTCHARegCheck: function (CAPTCHA) {
        var reg = /^[0-9]{6}$/;
        $.func.spaceReplace($("#CAPTCHA")[0]);
        var inputCAPTCHA = $("#CAPTCHA").val();
        if (reg.test(inputCAPTCHA)) {
            CAPTCHA.valid = true;
            CAPTCHA.helperTextContent = "";
            return true;
        } else {
            CAPTCHA.valid = false;
            CAPTCHA.label_.shake(true);
            CAPTCHA.helperTextContent = "验证码应由6位数字组成";
            return false;
        }
    },
    registry_CAPTCHAExistCheck: function (CAPTCHA) {
        $.ajax({
            url: "RegistryCAPTCHACheck",
            data: "email=" + $("#Email").val() + "&CAPTCHA=" + $("#CAPTCHA").val(),
            type: "post",
            success: function (data, status) {
                if (status === "success") {
                    if (data === "ALLOW") {
                        CAPTCHA.valid = true;
                        CAPTCHA.helperTextContent = "验证码正确";
                        $("#SubmitInfo").attr("disabled", false);
                    } else {
                        CAPTCHA.valid = false;
                        CAPTCHA.label_.shake(true);
                        CAPTCHA.helperTextContent = "验证码错误";
                        $("#SubmitInfo").attr("disabled", true);
                    }
                }
            },
            error: function () {
                CAPTCHA.valid = false;
                CAPTCHA.label_.shake(true);
                CAPTCHA.helperTextContent = "与服务器通信发生错误";
            }
        })
    },
    registry_passwordRegCheck: function (password) {
        var reg = /[a-zA-Z0-9`~!@#$%^&*()_\-=+{}[\]\\|;:'",<.>/?]{6,16}/;
        var inputPassword = $("#Password").val();
        if (reg.test(inputPassword)) {
            password.valid = true;
            password.helperTextContent = "密码符合要求";
            return true;
        } else {
            password.valid = false;
            password.label_.shake(true);
            if (inputPassword.length < PASSWORD_MIN_LENGTH ||
                inputPassword > PASSWORD_MAX_LENGTH) {
                password.helperTextContent = "密码长度必须在" + PASSWORD_MIN_LENGTH + "-" + PASSWORD_MAX_LENGTH + "之间";
            } else {
                password.helperTextContent = "请勿输入非英文字符、非英文标点符号或空格";
            }
            return false;
        }
    },
    registry_passwordRepeatCheck: function (passwordRep) {
        if ($("#Password").val() === $("#PasswordRepeat").val()) {
            passwordRep.valid = true;
            return true;
        } else {
            passwordRep.valid = false;
            passwordRep.label_.shake(true);
            passwordRep.helperTextContent = "两次输入的密码不一致";
            return false;
        }
    },
    login_requestCAPTCHA: function () {
        $.ajax({
            url: "GetLoginCAPTCHA",
            type: "post",
            success: function (data, status) {
                console.log("JSON: " + data);
                var JSONData = JSON.parse(data);
                $("#CAPTCHAImgForeground").attr("src", "./resources/img/CAPTCHA/" + JSONData.foreGround);
                $("#CAPTCHAImgBackground").attr("src", "./resources/img/CAPTCHA/" + JSONData.backGround);
            }
        });
    },
    videoPage_printComment: function (commentData) {
        $("#VideoCommentMain").empty();
        $("#LastPage").attr("disabled", commentData.currentPage === commentData.totalPage);
        $("#NextPage").attr("disabled", commentData.currentPage === commentData.totalPage);
        $("#FirstPage").attr("disabled", commentData.currentPage === 1);
        $("#PrePage").attr("disabled", commentData.currentPage === 1);
        for (var i = 0; i < commentData.count; i++) {
            $("#VideoCommentTotalPage").html("共" + comment.totalPage + "页 第" + commentData.currentPage + "页");
            $("#VideoCommentMain").append("<div class='mdc-card' style='width: 70%;margin: 40px auto;'>" +
                "<div class='mdc-card__primary-action demo-card__primary-action' tabindex='0'>" +
                "<div class='videoComment mdc-typography mdc-typography--body2'>" +
                commentData.comment[i] +
                "</div></div><div class='commentAuthor'>" +
                "<h3 class='mdc-typography mdc-typography--subtitle2'>" +
                commentData.userName[i] +
                "</h3></div></div>");
        }
    },
    videoPage_requestComment: function (element) {
        if (isFirst) {
            $.ajax({
                url: "GetPagedVideoComment",
                data: "VideoID=" + $("#VideoID").val() +
                    "&reqPage=1",
                type: "post",
                success: function (data, status) {
                    if (status === "success") {
                        var commentDat = JSON.parse(data);
                        comment = commentDat;
                        $.func.videoPage_printComment(commentDat);
                    }
                }
            });
            isFirst = false;
        } else {
            var reqPage = 1;
            switch ($(element).attr("id")) {
                case "FirstPage":
                    reqPage = 1;
                    break;
                case "PrePage":
                    reqPage = comment.currentPage - 1;
                    break;
                case "NextPage":
                    reqPage = comment.currentPage + 1;
                    break;
                case "LastPage":
                    reqPage = comment.totalPage;
            }
            $.ajax({
                url: "GetPagedVideoComment",
                data: "VideoID=" + $("#VideoID").val() +
                    "&reqPage=" + reqPage,
                type: "post",
                success: function (data, status) {
                    console.log(data);
                    if (status === "success") {
                        var commentDat = JSON.parse(data);
                        comment = commentDat;
                        $.func.videoPage_printComment(commentDat);
                    }
                }
            });
        }
    },
    spaceReplace: function (element) {
        element.value = element.value.replace(/\s+/g, '');
    }
}