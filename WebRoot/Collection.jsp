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
</head>    <link rel="shortcut icon" href="./resources/img/titleIcon.ico" />
<link rel="stylesheet" type="text/css" href="./css/material-components-web.css" />
<link rel="stylesheet" type="text/css" href="./css/material-icons.css" />
<link rel="stylesheet" type="text/css" href="./css/CommonCSS.css" />
<script src="js/material-components-web.js"></script>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/MDCHelperJavaScript.js"></script>
<script>
    $(function () {
        $(document).ready(function () {
            var textFieldss = initMDCComponentAttachTo(".mdc-text-field", mdc.textField.MDCTextField);
        })
    })
</script>
<script src="./js/jquery-3.4.1.js"></script>
<body>
    <div>
        <div style=" height: 50px; padding-left: 30px;border-bottom: 1px solid #ddd;">
        </div>
        <div style="    padding: 20px 20px 0; position: relative;">
            <div>
                <form action="" method="post" style="text-align: center">
                    <div class="mdc-text-field">
                        <input type="text" id="username" class="mdc-text-field__input" name="username" value="">
                        <label class="mdc-floating-label" for="username">用户名</label>
                        <div class="mdc-line-ripple"></div>
                    </div>
                    <div class="mdc-text-field-helper-line">
                        <div class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">用户名</div>
                    </div>
                    <div class="mdc-text-field">
                        <input type="text" id="Birth" class="mdc-text-field__input" name="Birth" value="">
                        <label class="mdc-floating-label" for="Birth">出生年月</label>
                        <div class="mdc-line-ripple"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
