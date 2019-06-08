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
            var i = 0;
            switch (${sex}) {
                case "secret":
                    i = 0;break;
                case "man":
                    i = 1;break;
                case  "woman":
                    i = 2;break;
            }
            document.getElementById("sex")[i].selected = true;
        })
    })
</script>
<script src="./js/jquery-3.4.1.js"></script>
<body>
<div>
    <div style=" height: 50px; padding-left: 30px;border-bottom: 1px solid #ddd;">
        <i class =“material-icons”>
            view_headline
        </i>
        <span>个人信息</span>
    </div>
    <div style="    padding: 20px 20px 0; position: relative;">
        <div>
            <form action="ToPersonalInfo" method="post" style="text-align: center">
                <div class="MDCDivContainer">
                    <div style="width: 210px">
                        <div class="mdc-text-field">
                            <input type="text" id="username" class="mdc-text-field__input" name="username" value="${UserName}">
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
                        <option value="" disabled=""></option>
                        <option value="secret">
                            <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">保密</font></font>
                        </option>
                        <option value="man"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">男</font></font></option>
                        <option value="women"><font style="vertical-align: inherit;"><font
                                style="vertical-align: inherit;">女</font></font></option>
                    </select>
                    <label for="sex" class="mdc-floating-label mdc-floating-label--float-above"><font
                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">性别</font></font></label>
                    <div class="mdc-line-ripple" style="transform-origin: 54.2px center;"></div>
                </div>
                <div class="MDCDivContainer">
                    <div style="width: 210px">
                        <div class="mdc-text-field">
                            <input type="text" id="email" class="mdc-text-field__input" name="email" value="${Email}">
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
                    <select id="Year" class="mdc-select__native-control">
                        <option value="" disabled=""></option>
                        <c:forEach var="i" begin="1970" end="<%=Calendar.getInstance().get(Calendar.YEAR)%>" step="1">
                            <option value="${i}" style="vertical-align: inherit;">${i}</option>
                        </c:forEach>
                    </select>
                    <label for="Year" class="mdc-floating-label mdc-floating-label--float-above"><font
                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">年</font></font></label>
                    <div class="mdc-line-ripple" style="transform-origin: 54.2px center;"></div>
                </div>
                <div class="mdc-select mdc-ripple-upgraded" style="--mdc-ripple-fg-size:60px;width: 100px; --mdc-ripple-fg-scale:2.08852; --mdc-ripple-fg-translate-start:24.8px, -22.2px; --mdc-ripple-fg-translate-end:20.4px, -2px;">
                    <i class="mdc-select__dropdown-icon"></i>
                    <select id="Month" class="mdc-select__native-control">
                        <option value="" disabled=""></option>
                        <c:forEach var="i" begin="1" end="12" step="1">
                            <option value="${i}" style="vertical-align: inherit;">${i}</option>
                        </c:forEach>
                    </select>
                    <label for="Month" class="mdc-floating-label mdc-floating-label--float-above"><font
                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">月</font></font></label>
                    <div class="mdc-line-ripple" style="transform-origin: 54.2px center;"></div>
                </div>
                <div class="mdc-select mdc-ripple-upgraded" style="--mdc-ripple-fg-size:60px;width: 100px; --mdc-ripple-fg-scale:2.08852; --mdc-ripple-fg-translate-start:24.8px, -22.2px; --mdc-ripple-fg-translate-end:20.4px, -2px;">
                    <i class="mdc-select__dropdown-icon"></i>
                    <select id="Day" class="mdc-select__native-control">
                        <option value="" disabled=""></option>
                        <c:forEach var="i" begin="1" end="28" step="1">
                            <option value="${i}" style="vertical-align: inherit;">${i}</option>
                        </c:forEach>
                    </select>
                    <label for="Day" class="mdc-floating-label mdc-floating-label--float-above"><font
                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">日</font></font></label>
                    <div class="mdc-line-ripple" style="transform-origin: 54.2px center;"></div>
                </div>
                <div class="MDCDivContainer">
                    <div style="width: 210px">
                        <div class="mdc-text-field">
                            <input type="text" id="regday" class="mdc-text-field__input" name="email" value="${Email}" readonly>
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
                            <input type="text" id="coinCount" class="mdc-text-field__input" name="email" value="${Email}" readonly>
                            <label class="mdc-floating-label" for="email">硬币数量</label>
                            <div class="mdc-line-ripple"></div>
                        </div>
                        <div class="mdc-text-field-helper-line">
                            <div class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">硬币数量</div>
                        </div>
                    </div>
                </div>
                <input type="button"  class="demo-button mdc-button mdc-button--outlined mdc-ripple-upgraded" value="提交"style="width: 170px">
            </form>
        </div>
    </div>
</div>
</body>
</html>
