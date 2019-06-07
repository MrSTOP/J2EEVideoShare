<%--
  Created by IntelliJ IDEA.
  User: MrST
  Date: 2019/6/3
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">


    <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
    <link rel="shortcut icon" href="./resources/img/titleIcon.ico"/>
    <link rel="stylesheet" type="text/css" href="./css/material-components-web.css"/>
    <link rel="stylesheet" type="text/css" href="./css/material-icons.css"/>
    <link rel="stylesheet" type="text/css" href="./css/CommonCSS.css"/>
    <link rel="stylesheet" type="text/css" href="./css/MDCHelperCSS.css"/>
    <script src="./js/jquery-3.4.1.js"></script>
    <script src="./js/material-components-web.js"></script>
    <script src="./js/MDCHelperJavaScript.js"></script>
    <script src="./js/CONST_VALUE.js"></script>
    <script>
        $(function () {
            $(document).ready(function () {
                var textFields = initMDCComponentAttachTo(".mdc-text-field", mdc.textField.MDCTextField);
                var selects = initMDCComponentAttachTo(".mdc-select", mdc.select.MDCSelect);
                var buttons = initMDCComponentClass(".mdc-button", mdc.ripple.MDCRipple);
                var dialogs = initMDCComponentClass(".mdc-dialog", mdc.dialog.MDCDialog);
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
        $.func = {
            initHtmlConstValue: function () {
                $("#PASSWORD_MIN_LENGTH").html(PASSWORD_MIN_LENGTH);
                $("#PASSWORD_MAX_LENGTH").html(PASSWORD_MAX_LENGTH);
                $("#USERNAME_MIN_LENGTH").html(USERNAME_MIN_LENGTH);
                $("#USERNAME_MAX_LENGTH").html(USERNAME_MAX_LENGTH);
            },
            userNameRegCheck: function (userName) {
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
            userNameExistCheck: function (userName) {
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
            emailRegCheck: function (email) {
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
            emailExistCheck: function (email) {
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
            CAPTCHARegCheck: function (CAPTCHA) {
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
            CAPTCHAExistCheck: function (CAPTCHA) {
                $.ajax({
                    url: "CAPTCHACheck",
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
            passwordRegCheck: function (password) {
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
            passwordRepeatCheck: function (passwordRep) {
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
            spaceReplace: function (element) {
                element.value = element.value.replace(/\s+/g, '');
            }
        }
    </script>
</head>

<body style="text-align: center">
<noscript><h1>请允许JavaScript运行</h1></noscript>
<header class=" mdc-top-app-bar mdc-top-app-bar--dense">
    <div class="mdc-top-app-bar__row">
        <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
            <a href="index.jsp" class="material-icons mdc-top-app-bar__navigation-icon">home</a>
        </section>
        <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
            <button class="material-icons mdc-top-app-bar__action-item" id="Favorite" title="收藏夹">star</button>
            <span href="./user/${userName}" class="mdc-top-app-bar__title" title="用户名">${userName}NULL</span>
            <a href="logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
        </section>
    </div>
</header>
<div style="height: 60px"></div>
<article>
    <form id="RegistryInfo" action="RegistryProcess" method="post">
        <div class="MDCDivContainer">
            <div>
                <div style="width: 400px;"
                     class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon">
                    <i class="material-icons mdc-text-field__icon">perm_identity</i>
                    <input id="UserName" name="userName" type="text" onkeyup="$.func.spaceReplace(this)"
                           class="mdc-text-field__input" required>
                    <div class="mdc-notched-outline">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="UserName" class="mdc-floating-label">用户名</label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                </div>
                <div class="mdc-text-field-helper-line">
                    <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg">
                        由字母数字下划线组成，长度<span id="USERNAME_MIN_LENGTH"></span>-<span id="USERNAME_MAX_LENGTH"></span>个字符
                    </p>
                </div>
            </div>
        </div>
        <div class="MDCDivContainer">
            <div>
                <div style="width: 400px;"
                     class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon">
                    <i class="material-icons mdc-text-field__icon">mail</i>
                    <input id="Email" name="email" type="text" onkeyup="$.func.spaceReplace(this)"
                           class="mdc-text-field__input" required>
                    <div class="mdc-notched-outline">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="Email" class="mdc-floating-label">电子邮件地址</label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                </div>
                <div class="mdc-text-field-helper-line">
                    <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg">
                        请输入电子邮箱地址</p>
                </div>
            </div>
        </div>
        <div>
            <div style="display: inline-flex;">
                <div class="MDCDivContainer">
                    <div>
                        <div style="width: 280px;" class="mdc-text-field mdc-text-field--outlined">
                            <input id="CAPTCHA" name="CAPTCHA" type="text" onkeyup="$.func.spaceReplace(this)"
                                   class="mdc-text-field__input" required>
                            <div class="mdc-notched-outline">
                                <div class="mdc-notched-outline__leading"></div>
                                <div class="mdc-notched-outline__notch">
                                    <label for="CAPTCHA" class="mdc-floating-label">验证码</label>
                                </div>
                                <div class="mdc-notched-outline__trailing">
                                </div>
                            </div>
                        </div>
                        <div class="mdc-text-field-helper-line">
                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg">
                                请输入验证码</p>
                        </div>
                    </div>
                </div>
            </div>
            <div style="display: inline-flex;">
                <button id="GetEmailCAPTCHA" type="button" class="mdc-button mdc-button--outlined">获取验证码</button>
            </div>
        </div>
        <div class="MDCDivContainer">
            <div>
                <div style="width: 400px;" class="mdc-text-field mdc-text-field--outlined">
                    <input id="Password" name="password" type="password" onkeyup="$.func.spaceReplace(this);"
                           class="mdc-text-field__input" required>
                    <div class="mdc-notched-outline">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="Password" class="mdc-floating-label">密码</label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                </div>
                <div class="mdc-text-field-helper-line">
                    <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg">
                        请输入密码，长度<span id="PASSWORD_MIN_LENGTH"></span>-<span id="PASSWORD_MAX_LENGTH"></span>个字符
                    </p>
                </div>
            </div>
        </div>
        <div class="MDCDivContainer">
            <div>
                <div style="width: 400px;" class="mdc-text-field mdc-text-field--outlined">
                    <input id="PasswordRepeat" name="passwordRepeat" type="password" class="mdc-text-field__input"
                           required>
                    <div class="mdc-notched-outline">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="PasswordRepeat" class="mdc-floating-label">重复密码</label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                </div>
                <div class="mdc-text-field-helper-line">
                    <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">请再次输入密码</p>
                </div>
            </div>
        </div>
        <div class="MDCDivContainer">
            <div style="width: 400px;" class="mdc-select mdc-select--outlined">
                <i class="mdc-select__dropdown-icon"></i>
                <select id="sex" name="sex" class="mdc-select__native-control">
                    <%--                    <option value="" disabled=""></option>--%>
                    <option value="保密">保密</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                <div class="mdc-notched-outline mdc-notched-outline--upgraded mdc-notched-outline--notched">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch" style="width: 34.25px;">
                        <label for="sex" class="mdc-floating-label mdc-floating-label--float-above">性别</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>
        </div>
        <div>
            <p>生日</p>
            <div class="mdc-select mdc-select--outlined">
                <i class="mdc-select__dropdown-icon"></i>
                <select id="birthYear" name="birthYear" class="mdc-select__native-control">
                    <%--                    <option value="" disabled=""></option>--%>
                    <c:forEach var="i" begin="1970" end="<%=Calendar.getInstance().get(Calendar.YEAR)%>" step="1">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
                <div class="mdc-notched-outline mdc-notched-outline--upgraded mdc-notched-outline--notched">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch" style="width: 34.25px;">
                        <label for="birthYear" class="mdc-floating-label mdc-floating-label--float-above">年</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>
            <div class="mdc-select mdc-select--outlined">
                <i class="mdc-select__dropdown-icon"></i>
                <select id="birthMonth" name="birthMonth" class="mdc-select__native-control">
                    <c:forEach var="i" begin="1" end="12" step="1">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
                <div class="mdc-notched-outline mdc-notched-outline--upgraded mdc-notched-outline--notched">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch" style="width: 34.25px;">
                        <label for="birthMonth" class="mdc-floating-label mdc-floating-label--float-above">月</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>
            <div class="mdc-select mdc-select--outlined">
                <i class="mdc-select__dropdown-icon"></i>
                <select id="birthDay" name="birthDay" class="mdc-select__native-control">
                    <c:forEach var="i" begin="1" end="28" step="1">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
                <div class="mdc-notched-outline mdc-notched-outline--upgraded mdc-notched-outline--notched">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch" style="width: 34.25px;">
                        <label for="birthDay" class="mdc-floating-label mdc-floating-label--float-above">日</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>
        </div>
        <div style="margin: 20px auto 90px;width: 250px">
            <div class="mdc-dialog"
                 role="alertdialog"
                 aria-modal="true"
                 aria-labelledby="my-dialog-title"
                 aria-describedby="my-dialog-content">
                <div class="mdc-dialog__container">
                    <div class="mdc-dialog__surface">
                        <h2 class="mdc-dialog__title" id="my-dialog-title">有不符合要求的项</h2>
                        <div class="mdc-dialog__content" id="DialogInfo"></div>
                        <footer class="mdc-dialog__actions">
                            <button type="button" class="mdc-button mdc-dialog__button" data-mdc-dialog-action="yes">
                                <span class="mdc-button__label">确定</span>
                            </button>
                        </footer>
                    </div>
                </div>
                <div class="mdc-dialog__scrim"></div>
            </div>
            <button id="SubmitInfo" type="button" class="mdc-button mdc-button--unelevated"
                    style="float: left;display: inline;">注册
            </button>
            <button type="reset" class="mdc-button mdc-button--outlined" style="float: right;display: inline;">清空
            </button>
        </div>
    </form>
</article>
</body>
</html>