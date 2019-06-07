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
    <link rel="shortcut icon" href="./resources/img/titleIcon.ico" />
    <link rel="stylesheet" type="text/css" href="./css/material-components-web.css" />
    <link rel="stylesheet" type="text/css" href="./css/material-icons.css" />
    <link rel="stylesheet" type="text/css" href="./css/CommonCSS.css" />
    <link rel="stylesheet" type="text/css" href="./css/MDCHelperCSS.css" />
    <script src="./js/jquery-3.4.1.js"></script>
    <script src="./js/material-components-web.js"></script>
    <script src="./js/MDCHelperJavaScript.js"></script>
    <script>
        $(function () {
            $(document).ready(function () {
                var textFields = initMDCComponentAttachTo(".mdc-text-field", mdc.textField.MDCTextField);
                var selects = initMDCComponentAttachTo(".mdc-select", mdc.select.MDCSelect);
                var buttons = initMDCComponentClass(".mdc-button", mdc.ripple.MDCRipple);
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
                        $("#GetEmailCAPTCHA").attr("disabled", true);
                        $.post("GetRegistryCAPTCHA", "email=" + $("#email").val(), function (data, status) {
                            console.log("DATA: " + data + " STATUS: " + status);
                            if (status === "success") {
                                var second = 60;
                                $("#GetEmailCAPTCHA").attr("disabled", true);
                                var timer = setInterval(function () {
                                    $("#GetEmailCAPTCHA").html(second + "秒后重发");
                                    second--;
                                    if (second <= 0) {
                                        clearInterval(timer);
                                        $("#GetEmailCAPTCHA").attr("disabled", false);
                                        $("#GetEmailCAPTCHA").html("获取验证码");
                                    }
                                }, 1000);
                            } else {
                                $("#GetEmailCAPTCHA").attr("disabled", false);
                            }
                        });
                    }
                });
                $("button[type=reset]").bind({"click": function () {
                        $("input").focus();
                        $("input").blur();
                    }})
            });
        });
        $.func = {
        }
    </script>
</head>

<body style="text-align: center">
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
    <form action="" method="post">
        <div class="MDCDivContainer">
            <div>
                <div style="width: 250px;" class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon">
                    <i class="material-icons mdc-text-field__icon">perm_identity</i>
                    <input id="userName" class="mdc-text-field__input" required>
                    <div class="mdc-notched-outline">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="userName" class="mdc-floating-label">用户名</label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                </div>
                <div class="mdc-text-field-helper-line">
                    <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">由字母数字下划线组成，长度4-10个字符</p>
                </div>
            </div>
        </div>
        <div class="MDCDivContainer">
            <div>
                <div style="width: 250px;" class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon">
                    <i class="material-icons mdc-text-field__icon">mail</i>
                    <input id="email" class="mdc-text-field__input" required>
                    <div class="mdc-notched-outline">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="email" class="mdc-floating-label">电子邮件地址</label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                </div>
                <div class="mdc-text-field-helper-line">
                    <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">请输入电子邮箱地址</p>
                </div>
            </div>
        </div>
        <div>
            <div style="display: inline-flex;">
                <div class="MDCDivContainer">
                    <div>
                        <div style="width: 135px;" class="mdc-text-field mdc-text-field--outlined">
                            <input id="CAPTCHA" class="mdc-text-field__input" required>
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
                            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">请输入验证码</p>
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
                <div style="width: 250px;" class="mdc-text-field mdc-text-field--outlined">
                    <input id="password" class="mdc-text-field__input" required>
                    <div class="mdc-notched-outline">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="password" class="mdc-floating-label">密码</label>
                        </div>
                        <div class="mdc-notched-outline__trailing"></div>
                    </div>
                </div>
                <div class="mdc-text-field-helper-line">
                    <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">请输入密码，长度6-16个字符</p>
                </div>
            </div>
        </div>
        <div class="MDCDivContainer">
            <div>
                <div style="width: 250px;" class="mdc-text-field mdc-text-field--outlined">
                    <input id="passwordRepeat" class="mdc-text-field__input" required>
                    <div class="mdc-notched-outline">
                        <div class="mdc-notched-outline__leading"></div>
                        <div class="mdc-notched-outline__notch">
                            <label for="passwordRepeat" class="mdc-floating-label">重复密码</label>
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
            <div style="width: 250px;" class="mdc-select mdc-select--outlined">
                <i class="mdc-select__dropdown-icon"></i>
                <select id="gender" class="mdc-select__native-control">
<%--                    <option value="" disabled=""></option>--%>
                    <option value="apple">保密</option>
                    <option value="orange">男</option>
                    <option value="Banana">女</option>
                </select>
                <div class="mdc-notched-outline mdc-notched-outline--upgraded mdc-notched-outline--notched">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch" style="width: 34.25px;">
                        <label for="gender" class="mdc-floating-label mdc-floating-label--float-above">性别</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>
        </div>
        <div>
            <p>生日</p>
            <div class="mdc-select mdc-select--outlined">
                <i class="mdc-select__dropdown-icon"></i>
                <select id="birthYear" class="mdc-select__native-control">
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
                <select id="birthMonth" class="mdc-select__native-control">
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
                <select id="birthDay" class="mdc-select__native-control">
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
        <div style="margin: 20px auto;width: 250px">
            <button type="button" class="mdc-button mdc-button--unelevated" style="float: left;display: inline;">注册</button>
            <button type="reset" class="mdc-button mdc-button--outlined" style="float: right;display: inline;">清空</button>
        </div>
    </form>
</html>