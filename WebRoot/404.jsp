<%--
  Created by IntelliJ IDEA.
  User: MrST
  Date: 2019/6/11
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
    <head>
        <base href="<%=basePath%>">

        <title>页面不见啦</title>
        <link rel="shortcut icon" href="./resources/img/titleIcon.ico"/>
        <link rel="stylesheet" type="text/css" href="./css/material-components-web.css"/>
        <link rel="stylesheet" type="text/css" href="./css/material-icons.css"/>
        <link rel="stylesheet" type="text/css" href="./css/CommonCSS.css"/>

        <script src="./js/material-components-web.js"></script>
        <script src="./js/jquery-3.4.1.js"></script>
        <script src="./js/MDCHelperJavaScript.js"></script>
        <script src="./js/SearchBar.js"></script>
        <script>
            $(function () {
                $(document).ready(function () {
                    SearchBarInit();
                })
            })
        </script>
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
    </head>

    <body style="text-align: center">
    <header class=" mdc-top-app-bar mdc-top-app-bar--dense">
        <div class="mdc-top-app-bar__row">
            <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                <a href="index.jsp" class="material-icons mdc-top-app-bar__navigation-icon">home</a>
                <span class="mdc-top-app-bar__title">视频分享</span>
            </section>
            <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
                <div style="position: relative">
                    <button id="Search" class="mdc-top-app-bar__action-item material-icons">search</button>
                    <div id="SearchBar" style="display: none">
                        <div class="mdc-text-field mdc-text-field--outlined">
                            <input type="text" id="SearchText" class="mdc-text-field__input">
                            <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                                <div class="mdc-notched-outline__leading"></div>
                                <div class="mdc-notched-outline__notch">
                                    <label class="mdc-floating-label" for="SearchText">搜索</label>
                                </div>
                                <div class="mdc-notched-outline__trailing"></div>
                            </div>
                        </div>
                        <button id="SearchButton" class="demo-button mdc-button mdc-button--outlined mdc-ripple-upgraded">
                            <i class="material-icons mdc-button__icon">search</i>
                            <span class="mdc-button__label">搜索</span>
                        </button>
                    </div>
                </div>
                <a href="./PersonalMain.jsp" class="material-icons mdc-top-app-bar__action-item" id="UserSpace"
                   title="个人空间">perm_identity</a>
                <span title="用户名">${sessionScope.user.userName}</span>
                <a href="Logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
            </section>
        </div>
    </header>
    <div style="height: 80px"></div>
        <div id="Img404"><img src="./resources/img/404.jpg" alt="404也不见了"></div>
    </body>
</html>