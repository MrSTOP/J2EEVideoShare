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
                    <option value="" disabled=""></option>
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
<%--</article>--%>
<%--&lt;%&ndash;<article>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div id="main">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div id="RegistryTop">注册</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div id="RegistryBottom">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <form name="RegistryInfo" id="IDRegistryInfo" method="POST" action="" >&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div id="MainRegistryInfo">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div id="NickNameLine">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div>昵&nbsp; &nbsp; &nbsp; &nbsp;称</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="text" name="NickName" id="IDNickName" placeholder="请输入昵称" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="RightWrongStyle">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="NickNameRight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="NickNameWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div id="FirstPassword">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div>密&nbsp; &nbsp; &nbsp; &nbsp;码</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="password" name="Password" id="IDPassword" placeholder="请输入密码" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="RightWrongStyle">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="FirstPasswordRight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="FirstPasswordWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div id="RepeatPassword">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div>重复密码</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="password" name="PasswordRepeat" id="IDRepeatPassword" placeholder="请重复密码" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="RightWrongStyle">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="RepeatPasswordRight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="RepeatPasswordWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div id="EmailAddress">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div>电子邮箱</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="text" name="EmailAddress" id="" placeholder="请输入电子邮箱" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="RightWrongStyle">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="EmailAddressRight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="EmailAddressWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div id="EmailCAPTCHALine">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div>验 证 码</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="text" name="EmailCAPTCHA" id="IDEmailCAPTCHA" placeholder="请输入6位有数字与(或)字母组成的验证码" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <button id="GetEmailCAPTCHA">获取验证码</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="RightWrongStyle">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="EmailCAPTCHARight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="EmailCAPTCHAWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div id="IDLine">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div>身份证号</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <input type="text" name="IDNumber" id="IDIDNumber" placeholder="请输入身份证号码" required>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div class="RightWrongStyle">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="IDRight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <img id="IDWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div id="SexInfo">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <input type="radio" name="Sex" id="IDSexMale" value="Male">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <span class="SexText">男</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <input type="radio" name="Sex" id="IDSexFemale" value="Female">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <span class="SexText">女</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <input type="radio" name="Sex" id="IDSexSecret" value="Secret" checked>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <span class="SexText">保密</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div id="HobbyInfo">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div id="HobbyInfoLineA">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby1" value="Hobby1">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好1</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby2" value="Hobby2">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好2</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby3" value="Hobby3">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好3</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby4" value="Hobby4">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好4</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div id="HobbyInfoLineB">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby5" value="Hobby5">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好5</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby6" value="Hobby6">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好6</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby7" value="Hobby7">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好7</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby8" value="Hobby8">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好8</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div id="HobbyInfoLineC">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby9" value="Hobby9">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好9</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby10" value="Hobby10">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好10</span&ndash;%&gt;--%>
<%--&lt;%&ndash;                                ></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby11" value="Hobby11">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好11</span&ndash;%&gt;--%>
<%--&lt;%&ndash;                                ></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby12" value="Hobby12">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好12</span&ndash;%&gt;--%>
<%--&lt;%&ndash;                                ></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div id="HobbyInfoLineD">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby13" value="Hobby13">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好13</span&ndash;%&gt;--%>
<%--&lt;%&ndash;                                ></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby14" value="Hobby14">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好14</span&ndash;%&gt;--%>
<%--&lt;%&ndash;                                ></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby15" value="Hobby15">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好15</span&ndash;%&gt;--%>
<%--&lt;%&ndash;                                ></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="checkbox" name="Hobby" id="IDHobby16" value="Hobby16">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <span class="HobbyName">爱好16</span&ndash;%&gt;--%>
<%--&lt;%&ndash;                                ></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div id="ButtonDiv">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div id="RegistryButtonDiv">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <div id="RegistryButtonInfo">请正确填写所有信息</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <button class="ButtonStyle ButtonStyleLogin" id="RegistryButtonLayout" type="button"></button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <button class="ButtonStyle ButtonStyleLogin" id="RegistryButton" type="button">注册</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <div  id="ResetButtonDiv">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <button class="ButtonStyle ButtonStyleReset" id="ResetButton" type="button">清除</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </form>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</article>&ndash;%&gt;--%>
<%--</body>--%>
</html>