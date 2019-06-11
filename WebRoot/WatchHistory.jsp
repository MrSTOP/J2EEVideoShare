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
<div style=" height: 60px; padding-left: 30px;border-bottom: 1px solid #ddd; position: relative">
    <i class=“material-icons”>view_headline</i>
    <span style="white-space: nowrap">历史记录</span>
    <button class="demo-button mdc-button mdc-button--unelevated demo-button-shaped mdc-ripple-upgraded" style="float: right">
        <i class="material-icons mdc-button__icon">delete</i><span class="mdc-button__label">清空</span></button>
</div>
<div class="mdc-layout-grid">
    <div class="mdc-layout-grid__inner">
        <c:if test="${requestScope.FileList.size()!=0}">
        <c:forEach items="${requestScope.FileList}" var="fileName">
            <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-3">
                <div class="mdc-card demo-card" style="margin: 20px">
                    <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                        <div class="mdc-card__media mdc-card__media--16-9 demo-card__media"
                             style="background-image: url('https://material-components.github.io/material-components-web-catalog/static/media/photos/3x2/2.jpg');"></div>
                        <div class="demo-card__primary">
                            <h2 class="demo-card__title mdc-typography mdc-typography--headline6">${fileName.getVideoname()}</h2>
                        </div>
                    </div>
                    <div class="mdc-card__actions">
                        <div class="mdc-card__action-icons">
                            <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded"
                                    title="Delete" data-mdc-ripple-is-unbounded="true"
                                    onclick="window.location.href='DeleteHistory?VideoID=${fileName.getVideoID()}'">
                                delete
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        </c:if>
    </div>
</div>

</body>
</html>
