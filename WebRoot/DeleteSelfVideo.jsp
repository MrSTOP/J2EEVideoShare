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
<LINK REL="stylesheet" type="text/css" href="./css/table.css">
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
<body style="text-align: center">
<div style=" height: 45px; padding-left: 30px;border-bottom: 1px solid #ddd; position: relative;">
    <button class="demo-button mdc-button mdc-button--unelevated demo-button-shaped mdc-ripple-upgraded" style="float:right;font-size: 20px" onclick="window.location.href='DeleAllSelfVideo'">
        <i class="material-icons mdc-button__icon">delete</i><span class="mdc-button__label">清空</span></button>
    <div style="margin-top: 10px">
          <span class="mdc-typography--body1" style="display: flex;font-size: 20px">
            <i class="material-icons">view_headline</i>已上传视频库
        </span>

    </div>
</div>
<div style="text-align: center;">
    <button onclick="window.location.href='ShowSelfVideo?page=1'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"${requestScope.PageNo>1?null:"disabled"}>
        <span class="mdc-button__label">第一页</span></button>
    <button onclick="window.location.href='ShowSelfVideo?page=${requestScope.PageNo - 1}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
    ${requestScope.PageNo>1?null:"disabled"}>
        <span class="mdc-button__label">上一页</span></button>
    第${requestScope.PageNo}页,共有${requestScope.PageCount}页
    <button onclick="window.location.href='ShowSelfVideo?page=${requestScope.PageNo + 1}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"${requestScope.PageNo < requestScope.PageCount?null:"disabled"}>
        <span class="mdc-button__label">下一页</span></button>
    <button onclick="window.location.href='ShowSelfVideo?page=${requestScope.PageCount}'"
            class="demo-button mdc-button mdc-button--dense mdc-button--outlined mdc-ripple-upgraded"
    ${requestScope.PageNo < requestScope.PageCount?null:"disabled"}>
        <span class="mdc-button__label">最后一页</span></button>
</div>


        <c:if test="${requestScope.CollectList.size() !=0}">
            <table style="text-align: center;width:70%;margin: auto;">
            <c:forEach items="${requestScope.CollectList}" var="videoList">
                <tr><td><a onclick="top.document.location.href='VideoWatch?VideoID=${videoList.getVideoID()}'">${videoList.getVideoName()}</a></td>
                    <td>
                            <div class="mdc-card__action-icons">
                                <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded"
                                        title="Delete" data-mdc-ripple-is-unbounded="true"
                                        onclick="window.location.href='DeleteSelfVideo?VideoID=${videoList.getVideoID()}'">
                                    delete
                                </button>
                            </div>
                </td>
                </tr>
            </c:forEach>
            </table>
        </c:if>

</body>
</html>
