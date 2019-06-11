<%--
  Created by IntelliJ IDEA.
  User: MrST
  Date: 2019/6/11
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
    <head>
        <base href="<%=basePath%>">

        <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
        <link rel="shortcut icon" href="./resources/img/titleIcon.ico"/>
        <link rel="stylesheet" type="text/css" href="./css/material-components-web.css"/>
        <link rel="stylesheet" type="text/css" href="./css/material-icons.css"/>
        <link rel="stylesheet" type="text/css" href="./css/CommonCSS.css"/>
        <script src="./js/material-components-web.js"></script>
        <script src="./js/jquery-3.4.1.js"></script>
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

    <body>
        <header class=" mdc-top-app-bar mdc-top-app-bar--dense">
            <div class="mdc-top-app-bar__row">
                <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                    <a href="index.jsp" class="material-icons mdc-top-app-bar__navigation-icon">home</a>
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
                    <a href="./Collection.jsp" class="material-icons mdc-top-app-bar__action-item" id="Favorite" title="收藏夹">star</a>
                    <a href="./PersonalMain.jsp" class="material-icons mdc-top-app-bar__action-item" id="UserSpace"
                       title="个人空间">perm_identity</a>
                    <span title="用户名">${sessionScope.user.userName}</span>
                    <a href="Logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
                </section>
            </div>
        </header>
        <div style="height: 80px"></div>
        <div style="text-align: center;">
            <button onclick="window.location.href='Search?VideoName=${requestScope.VideoName}&reqPage=1'"
                class="demo-button mdc-button mdc-button--dense mdc-button--outlined"
            ${requestScope.reqPage > 1 ? null : "disabled"}>
                第一页</button>
            <button onclick="window.location.href='Search?VideoName=${requestScope.VideoName}&reqPage=${requestScope.reqPage - 1}'"
                    class="demo-button mdc-button mdc-button--dense mdc-button--outlined"
                    ${requestScope.reqPage > 1 ? null : "disabled"}>上一页</button>
            <span>
                第${requestScope.reqPage}页,共有${requestScope.pageCount}页
            </span>
            <button onclick="window.location.href='Search?VideoName=${requestScope.VideoName}&reqPage=${requestScope.reqPage + 1}'"
                    class="demo-button mdc-button mdc-button--dense mdc-button--outlined"
            ${requestScope.reqPage != requestScope.pageCount ? null : "disabled"}>
                下一页</button>
            <button onclick="window.location.href='Search?VideoName=${requestScope.VideoName}&reqPage=${requestScope.pageCount}'"
                    class="demo-button mdc-button mdc-button--dense mdc-button--outlined"
                    ${requestScope.reqPage != requestScope.pageCount ? null : "disabled"}>
                最后一页</button>
        </div>
        <article>
            <div class="mdc-layout-grid">
                <div class="mdc-layout-grid__inner">
                    <c:if test="${requestScope.searchResult != null && requestScope.searchResult.size() != 0}">
                        <c:forEach var="i" begin="0" end="${requestScope.searchResult.size() - 1}" step="1">
                            <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-4">
                                <div class="mdc-card demo-card">
                                    <a href="VideoWatch?VideoID=${requestScope.searchResult.get(i).getVideoID()}">
                                        <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                                            <div class="mdc-card__media mdc-card__media--16-9 demo-card__media"
                                                 style="background-image: url('./resources/img/covers/${requestScope.imgURLs.get(i)}');"></div>
                                            <div class="demo-card__primary">
                                                <h2 class="demo-card__title mdc-typography mdc-typography--headline6" style="margin-left: 10px">${requestScope.searchResult.get(i).getVideoName()}</h2>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </article>
    </body>
</html>