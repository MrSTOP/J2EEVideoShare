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
    <script src="./js/custom-function.js"></script>
    <script src="./js/registry.js"></script>
</head>

<body style="text-align: center">
<noscript><h1>请允许JavaScript运行</h1></noscript>
<header class=" mdc-top-app-bar mdc-top-app-bar--dense">
    <div class="mdc-top-app-bar__row">
        <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
            <a href="index.jsp" class="material-icons mdc-top-app-bar__navigation-icon">home</a>
        </section>
        <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
            <a href="#" class="material-icons mdc-top-app-bar__action-item" id="Favorite" title="收藏夹">star</a>
            <a href="#" class="material-icons mdc-top-app-bar__action-item" id="UserSpace" title="个人空间">perm_identity</a>
            <span title="用户名">${sessionScope.user.userName}</span>
            <a href="Logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
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
            <button id="SubmitInfo" type="button" class="mdc-button mdc-button--unelevated" style="float: left;display: inline;">注册</button>
            <button type="reset" class="mdc-button mdc-button--outlined" style="float: right;display: inline;">清空
            </button>
        </div>
    </form>
</article>
</body>
</html>