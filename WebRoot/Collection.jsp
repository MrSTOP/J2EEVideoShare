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
            var dialog = new mdc.dialog.MDCDialog($("#Dialog")[0]);
            if (${requestScope.info !=null})
                dialog.open();
        })
    })
</script>
<body style="text-align: center">
<div id="Dialog" class="mdc-dialog" role="alertdialog" aria-modal="true" aria-labelledby="my-dialog-title"
     aria-describedby="my-dialog-content">
    <div class="mdc-dialog__container">
        <div class="mdc-dialog__surface">
            <h2 class="mdc-dialog__title" id="Info">删除成功</h2>
            <footer class="mdc-dialog__actions">
                <button type="button" class="mdc-button mdc-dialog__button" data-mdc-dialog-action="ok">
                    <span class="mdc-button__label">确定</span>
                </button>
            </footer>
        </div>
    </div>
    <div class="mdc-dialog__scrim"></div>
</div>
<div style=" height: 45px; padding-left: 30px;border-bottom: 1px solid #ddd; position: relative;">
    <button class="demo-button mdc-button mdc-button--unelevated demo-button-shaped mdc-ripple-upgraded"
            style="float:right;font-size: 20px" onclick="window.location.href='DeleteAllCollection'">
        <i class="material-icons mdc-button__icon">delete</i><span class="mdc-button__label">清空</span></button>
    <div style="margin-top: 10px">
          <span class="mdc-typography--body1" style="display: flex;font-size: 20px">
            <i class="material-icons">view_headline</i>收藏夹
        </span>

    </div>
</div>
<c:if test="${requestScope.CollectList.size() ==0||requestScope.CollectList == null}">
    <h2 style="margin: 100px">无收藏内容</h2>
</c:if>
<c:if test="${requestScope.CollectList.size() !=0}">
<div style="text-align: center;">
    <button onclick="window.location.href='Collectvideo?page=1'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"${requestScope.PageNo>1?null:"disabled"}>
        <span class="mdc-button__label">第一页</span></button>
    <button onclick="window.location.href='Collectvideo?page=${requestScope.PageNo - 1}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
        ${requestScope.PageNo>1?null:"disabled"}>
        <span class="mdc-button__label">上一页</span></button>
    第${requestScope.PageNo}页,共有${requestScope.PageCount}页
    <button onclick="window.location.href='Collectvideo?page=${requestScope.PageNo + 1}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"${requestScope.PageNo < requestScope.PageCount?null:"disabled"}>
        <span class="mdc-button__label">下一页</span></button>
    <button onclick="window.location.href='Collectvideo?page=${requestScope.PageCount}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
        ${requestScope.PageNo < requestScope.PageCount?null:"disabled"}>
        <span class="mdc-button__label">最后一页</span></button>
</div>
<div class="mdc-layout-grid">
    <div class="mdc-layout-grid__inner">

        <c:forEach var="i" begin="0" end="${requestScope.CollectList.size() - 1}" step="1">
            <div class="mdc-layout-grid__cell mdc-layout-grid__cell--span-3">
                <div class="mdc-card demo-card">
                    <a href="VideoWatch?VideoID=${requestScope.CollectList.get(i).getVideoID()}">
                        <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                            <div class="mdc-card__media mdc-card__media--16-9 demo-card__media" style="background-image: url('${requestScope.URLS.get(i)}');">
                            </div>
                            <div class="demo-card__primary">
                                <h2 class="demo-card__title mdc-typography mdc-typography--headline6" style="margin-left: 10px">${requestScope.CollectList.get(i).getVideoName()}</h2>
                            </div>
                        </div>
                    </a>
                    <div class="mdc-card__actions">
                        <div class="mdc-card__action-icons">
                            <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded"
                                    title="Delete" data-mdc-ripple-is-unbounded="true"
                                    onclick="document.location.href='DeleteCollect?VideoID=${CollectList.get(i).getVideoID()}'">
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
