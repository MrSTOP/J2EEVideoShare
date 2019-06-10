<%--
  Created by IntelliJ IDEA.
  User: 严子超
  Date: 2019/6/10
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
    <style type="text/css">
        .footer {
            margin-top: -50px;
            height: 50px;
            background-color: #eee;
            z-index: 9999;
        }
    </style>
</head>
<body>

<div class="mdc-layout-grid">
    <div class="mdc-layout-grid__inner">
        <c:forEach items="${requestScope.FileList}" var="fileName">
            <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-3">
                <div class="mdc-card demo-card" style="margin: 20px">
                    <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                        <div class="mdc-card__media mdc-card__media--16-9 demo-card__media"
                             style="background-image: url('https://material-components.github.io/material-components-web-catalog/static/media/photos/3x2/2.jpg');"></div>
                        <div class="demo-card__primary">
                            <h2 class="demo-card__title mdc-typography mdc-typography--headline6">${fileName}</h2>
                        </div>
                    </div>
                    <div class="mdc-card__actions">
                        <div class="mdc-card__action-icons">
                            <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded"
                                    title="Delete" data-mdc-ripple-is-unbounded="true" onclick="">delete
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div style="text-align: center;">
    第${requestScope.PageNo}页,共有${requestScope.PageCount}页
    <c:if test="${requestScope.PageNo>1}">
    <button onclick="window.location.href='ToWatchHistory?page=1'" class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
            style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
        <span class="mdc-button__label">第一页</span></button>
    <button onclick="window.location.href='ToWatchHistory?page=${requestScope.PageNo - 1}'" class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
            style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
        <span class="mdc-button__label">上一页</span></button>
    </c:if>
    <c:if test="${requestScope.PageNo != requestScope.PageCount}">
    <button onclick="window.location.href='ToWatchHistory?page=${requestScope.PageNo + 1}'" class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
            style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
        <span class="mdc-button__label">下一页</span></button>
    <button onclick="window.location.href='ToWatchHistory?page=${requestScope.PageCount}'" class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
            style="--mdc-ripple-fg-size:46px; --mdc-ripple-fg-scale:2.0517; --mdc-ripple-fg-translate-start:1.41248px, -7.59995px; --mdc-ripple-fg-translate-end:16.0375px, -7px;">
        <span class="mdc-button__label">最后一页</span></button>
    </c:if>
</body>
</html>
