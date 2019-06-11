<%--
  Created by IntelliJ IDEA.
  User: 严子超
  Date: 2019/6/5
  Time: 8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="yankunwei.javabean.UserInfo" %>
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
            <%request.setCharacterEncoding("UTF-8");%>
            var textFieldss = initMDCComponentAttachTo(".mdc-text-field", mdc.textField.MDCTextField);
            var selectss = initMDCComponentAttachTo(".mdc-select", mdc.select.MDCSelect);
            var i = 0;
            switch ("${sessionScope.user.sex}") {
                case "保密":
                    i = 0;break;
                case "男":
                    i = 1;break;
                case  "女":
                    i = 2;break;
            }
            document.getElementById("sex")[i].selected = true;
        })
    })
</script>
<body>
<div>
    <%session.setAttribute("YearStr", Integer.valueOf(((UserInfo)request.getSession().getAttribute("user")).getStrBirth().split("-")[0]));%>
    <%session.setAttribute("MonthStr", Integer.valueOf(((UserInfo)request.getSession().getAttribute("user")).getStrBirth().split("-")[1]));%>
    <%session.setAttribute("DayStr", Integer.valueOf(((UserInfo)request.getSession().getAttribute("user")).getStrBirth().split("-")[2]));%>
    <div style=" height: 45px; padding-left: 30px;border-bottom: 1px solid #ddd;">
        <span class="mdc-typography--body1" style="display: flex;margin-top: 10px;font-size: 20px">
            <i class="material-icons">view_headline</i>个人信息
        </span>
    </div>
    <div style="height: 30px"></div>
    <div style="    padding: 20px 20px 0; position: relative;">
        <div>
            <form action="ToPersonalInfo" method="post" style="text-align: center">
                <div class="MDCDivContainer">
                    <div style="width: 210px">
                        <div class="mdc-text-field">
                            <input type="text" id="username" class="mdc-text-field__input" name="username" value="${sessionScope.user.userName}">
                            <label class="mdc-floating-label" for="username">用户名</label>
                            <div class="mdc-line-ripple"></div>
                        </div>
                        <div class="mdc-text-field-helper-line">
                            <div class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">用户名</div>
                        </div>
                    </div>
                </div>
                <div class="mdc-select mdc-ripple-upgraded" style="--mdc-ripple-fg-size:60px;width: 210px; --mdc-ripple-fg-scale:2.08852; --mdc-ripple-fg-translate-start:24.8px, -22.2px; --mdc-ripple-fg-translate-end:20.4px, -2px;">
                    <i class="mdc-select__dropdown-icon"></i>
                    <select id="sex" name = "sex" class="mdc-select__native-control">
                        <option value="保密">
                            <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">保密</font></font>
                        </option>
                        <option value="男"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">男</font></font></option>
                        <option value="女"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">女</font></font></option>
                    </select>
                    <label for="sex" class="mdc-floating-label mdc-floating-label--float-above"><font
                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">性别</font></font></label>
                    <div class="mdc-line-ripple" style="transform-origin: 54.2px center;"></div>
                </div>
                <div class="MDCDivContainer">
                    <div style="width: 210px">
                        <div class="mdc-text-field">
                            <input type="text" id="email" class="mdc-text-field__input" name="email" value="${sessionScope.user.email}">
                            <label class="mdc-floating-label" for="email">电子邮件</label>
                            <div class="mdc-line-ripple"></div>
                        </div>
                        <div class="mdc-text-field-helper-line">
                            <div class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">电子邮件</div>
                        </div>
                    </div>
                </div>
                <div class="mdc-select mdc-ripple-upgraded" style="--mdc-ripple-fg-size:60px;width: 110px; --mdc-ripple-fg-scale:2.08852; --mdc-ripple-fg-translate-start:24.8px, -22.2px; --mdc-ripple-fg-translate-end:20.4px, -2px;">
                    <i class="mdc-select__dropdown-icon"></i>
                    <select id="Year" class="mdc-select__native-control" name="Year">
                        <option value="" disabled=""></option>
                        <c:forEach var="i" begin="1970" end="<%=Calendar.getInstance().get(Calendar.YEAR)%>" step="1">
                            <c:choose>
                                <c:when test="${sessionScope.YearStr == i}">
                                    <option value="${i}" style="vertical-align: inherit;" selected>${i}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${i}" style="vertical-align: inherit;">${i}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                    <label for="Year" class="mdc-floating-label mdc-floating-label--float-above"><font
                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">年</font></font></label>
                    <div class="mdc-line-ripple" style="transform-origin: 54.2px center;"></div>
                </div>
                <div class="mdc-select mdc-ripple-upgraded" style="--mdc-ripple-fg-size:60px;width: 100px; --mdc-ripple-fg-scale:2.08852; --mdc-ripple-fg-translate-start:24.8px, -22.2px; --mdc-ripple-fg-translate-end:20.4px, -2px;">
                    <i class="mdc-select__dropdown-icon"></i>
                    <select id="Month" class="mdc-select__native-control" name="Month">
                        <option value="" disabled=""></option>
                        <c:forEach var="i" begin="1" end="12" step="1">
                            <c:choose>
                                <c:when test="${sessionScope.MonthStr == i}">
                                    <option value="${i}" style="vertical-align: inherit;" selected>${i}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${i}" style="vertical-align: inherit;">${i}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                    <label for="Month" class="mdc-floating-label mdc-floating-label--float-above"><font
                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">月</font></font></label>
                    <div class="mdc-line-ripple" style="transform-origin: 54.2px center;"></div>
                </div>
                <div class="mdc-select mdc-ripple-upgraded" style="--mdc-ripple-fg-size:60px;width: 100px; --mdc-ripple-fg-scale:2.08852; --mdc-ripple-fg-translate-start:24.8px, -22.2px; --mdc-ripple-fg-translate-end:20.4px, -2px;">
                    <i class="mdc-select__dropdown-icon"></i>
                    <select id="Day" class="mdc-select__native-control" name = "Day">
                        <option value="" disabled=""></option>
                        <c:forEach var="i" begin="1" end="28" step="1">
                            <c:choose>
                                <c:when test="${sessionScope.DayStr == i}">
                                    <option value="${i}" style="vertical-align: inherit;" selected>${i}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${i}" style="vertical-align: inherit;">${i}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                    <label for="Day" class="mdc-floating-label mdc-floating-label--float-above"><font
                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">日</font></font></label>
                    <div class="mdc-line-ripple" style="transform-origin: 54.2px center;"></div>
                </div>
                <div class="MDCDivContainer">
                    <div style="width: 210px">
                        <div class="mdc-text-field">
                            <input type="text" id="regday" class="mdc-text-field__input" name="regday" value="${sessionScope.user.getStrRegDay()}" readonly>
                            <label class="mdc-floating-label" for="email">注册日期</label>
                            <div class="mdc-line-ripple"></div>
                        </div>
                        <div class="mdc-text-field-helper-line">
                            <div class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">注册日期</div>
                        </div>
                    </div>
                </div>
                <div class="MDCDivContainer">
                    <div style="width: 210px">
                        <div class="mdc-text-field">
                            <input type="text" id="coinCount" class="mdc-text-field__input" name="coinCount" value="${sessionScope.user.coin}" readonly>
                            <label class="mdc-floating-label" for="email">硬币数量</label>
                            <div class="mdc-line-ripple"></div>
                        </div>
                        <div class="mdc-text-field-helper-line">
                            <div class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">硬币数量</div>
                        </div>
                    </div>
                </div>
                <input type="submit"  class="demo-button mdc-button mdc-button--outlined mdc-ripple-upgraded" value="提交"style="width: 170px">
            </form>
        </div>
    </div>
</div>
</body>
</html>
