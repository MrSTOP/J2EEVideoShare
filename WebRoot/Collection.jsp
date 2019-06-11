<%--
  Created by IntelliJ IDEA.
  User: 严子超
  Date: 2019/6/5
  Time: 8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML >
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'Collection.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
    <%--UserName--%>
    <%--Password--%>
    <%--Sex--%>
    <%--Birth--%>
    <%--Email--%>
    <%--RegDay--%>
    <%--coin--%>
</head>
<link rel="shortcut icon" href="./resources/img/titleIcon.ico"/>
<link rel="stylesheet" type="text/css" href="./css/material-components-web.css"/>
<link rel="stylesheet" type="text/css" href="./css/material-icons.css"/>
<link rel="stylesheet" type="text/css" href="./css/CommonCSS.css"/>
<LINK REL="stylesheet" type="text/css" href="./css/MDCHelperCSS.css">
<script src="js/material-components-web.js"></script>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/MDCHelperJavaScript.js"></script>
<script>
    $(function () {
        $(document).ready(function () {
            var textFieldss = initMDCComponentAttachTo(".mdc-text-field", mdc.textField.MDCTextField);
            var selectss = initMDCComponentAttachTo(".mdc-select", mdc.select.MDCSelect);
        })
    })
</script>
<script src="./js/jquery-3.4.1.js"></script>
<body>
<div style=" height: 50px; padding-left: 30px;border-bottom: 1px solid #ddd;">
    <i class =“material-icons”>
        view_headline
    </i>
    <span>收藏夹</span>
    <div class="mdc-card__actions">
        <div class="mdc-card__action-icons" style="text-align: right">

        </div>
    </div>
    <button>
</div>
<div class="mdc-layout-grid">
    <div class="mdc-layout-grid__inner">
        <c:forEach items="${requestScope.CollectList}" var="videoList">
            <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-3">
                <div class="mdc-card demo-card" style="margin: 20px">
                    <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                        <div class="mdc-card__media mdc-card__media--16-9 demo-card__media"
                             style="background-image: url('https://material-components.github.io/material-components-web-catalog/static/media/photos/3x2/2.jpg');"></div>
                        <div class="demo-card__primary">
                            <h2 class="demo-card__title mdc-typography mdc-typography--headline6">${videoList.getVideoName()}</h2>
                        </div>
                    </div>
                    <div class="mdc-card__actions">
                        <div class="mdc-card__action-icons">
                            <button  class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded"
                                    title="Delete" data-mdc-ripple-is-unbounded="true"
                                    onclick="window.location.href='DeleteCollect?VideoID=${videoList.getVideoID()}'">delete
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div style="text-align: center;">
    <c:if test="${requestScope.PageNo>1}">
    <button onclick="window.location.href='Collectvideo?page=1'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
            style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
        <span class="mdc-button__label">第一页</span></button>
    <button onclick="window.location.href='Collectvideo?page=${requestScope.PageNo - 1}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
            style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
        <span class="mdc-button__label">上一页</span></button>
    </c:if>
    第${requestScope.PageNo}页,共有${requestScope.PageCount}页
    <c:if test="${requestScope.PageNo != requestScope.PageCount}">
    <button onclick="window.location.href='Collectvideo?page=${requestScope.PageNo + 1}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
            style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
        <span class="mdc-button__label">下一页</span></button>
    <button onclick="window.location.href='Collectvideo?page=${requestScope.PageCount}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
            style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
        <span class="mdc-button__label">最后一页</span></button>
    </c:if>
</div>
</body>
</html>
