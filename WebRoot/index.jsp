<%
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
<body style="position: relative;text-align: center">
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
            <a href="./PersonalMain.jsp" class="material-icons mdc-top-app-bar__action-item" id="UserSpace"
               title="个人空间">perm_identity</a>
            <span title="用户名">${sessionScope.user.userName}</span>
            <a href="Logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
        </section>
    </div>
</header>
<div style="height: 80px"></div>
<c:if test="${requestScope.FileList.size() ==0||requestScope.FileList == null}">
    <h2 style="margin: 100px">无视频</h2>
</c:if>
<c:if test="${requestScope.VideoList.size() != 0}">
<div style="text-align: center;">
    <button onclick="window.location.href='ServletIndex?page=1'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"${requestScope.PageNo>1?null:"disabled"}>
        <span class="mdc-button__label">第一页</span></button>
    <button onclick="window.location.href='ServletIndex?page=${requestScope.PageNo - 1}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
    ${requestScope.PageNo>1?null:"disabled"}>
        <span class="mdc-button__label">上一页</span></button>
    第${requestScope.PageNo}页,共有${requestScope.PageCount}页
    <button onclick="window.location.href='ServletIndex?page=${requestScope.PageNo + 1}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"${requestScope.PageNo < requestScope.PageCount?null:"disabled"}>
        <span class="mdc-button__label">下一页</span></button>
    <button onclick="window.location.href='ServletIndex?page=${requestScope.PageCount}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
    ${requestScope.PageNo < requestScope.PageCount?null:"disabled"}>
        <span class="mdc-button__label">最后一页</span></button>
</div>
<article>
    <div class="mdc-layout-grid">
        <div class="mdc-layout-grid__inner">

                <c:forEach var="i" begin="0" end="${requestScope.VideoList.size()-1}" step="1">
                    <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-4">
                        <div class="mdc-card demo-card">
                            <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                                <a href="VideoWatch?VideoID=${VideoList.get(i).getVideoID()}">
                                    <div class="mdc-card__media mdc-card__media--16-9 demo-card__media"
                                         style="background-image: url('${requestScope.URLS.get(i)}');"></div>
                                </a>
                                <div class="demo-card__primary">
                                    <h2 class="demo-card__title mdc-typography mdc-typography--headline6">${requestScope.VideoList.get(i).getVideoName()}</h2>
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
