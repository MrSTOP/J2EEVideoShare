﻿<%
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


        <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
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
    </head>

    <body style="position: relative">
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
            <c:if test="${requestScope.PageNo>1}">
                <button onclick="window.location.href='ServletIndex?page=1'"
                        class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
                        style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
                    <span class="mdc-button__label">第一页</span></button>
                <button onclick="window.location.href='ServletIndex?page=${requestScope.PageNo - 1}'"
                        class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
                        style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
                    <span class="mdc-button__label">上一页</span></button>
            </c:if>
            第${requestScope.PageNo}页,共有${requestScope.PageCount}页
            <c:if test="${requestScope.PageNo != requestScope.PageCount}">
                <button onclick="window.location.href='ServletIndex?page=${requestScope.PageNo + 1}'"
                        class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
                        style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
                    <span class="mdc-button__label">下一页</span></button>
                <button onclick="window.location.href='ServletIndex?page=${requestScope.PageCount}'"
                        class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
                        style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
                    <span class="mdc-button__label">最后一页</span></button>
            </c:if>
        </div>
        <article>
            <div class="mdc-layout-grid">
                <div class="mdc-layout-grid__inner">
                    <c:if test="${requestScope.VideoList.size() != 0}">
                        <c:forEach var="i" begin="0" end="${requestScope.VideoList.size()}" step="1">
                            <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-4">
                                <div class="mdc-card demo-card">
                                    <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                                        <div class="mdc-card__media mdc-card__media--16-9 demo-card__media"
                                             style="background-image: url('${requestScope.url.get(i)}');"></div>
                                        <div class="demo-card__primary">
                                            <h2 class="demo-card__title mdc-typography mdc-typography--headline6">${requestScope.Lisvideo.get(i).getVideoName()}</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </article>
    </body>
</html>
