<%--
  Created by IntelliJ IDEA.
  User: MrST
  Date: 2019/6/7
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">

    <title>login.jsp</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="./css/material-components-web.css">
    <link rel="stylesheet" type="text/css" href="./css/material-icons.css">
    <link rel="stylesheet" type="text/css" href="./css/CommonCSS.css">
    <link rel="stylesheet" type="text/css" href="./css/MDCHelperCSS.css">
    <script src="./js/jquery-3.4.1.js"></script>
    <script>
        $(document).ready(function () {
            $("#HELP").bind({
                "click": function () {
                    window.location.href = "./" + $("#TEST").val() + "?test=true";
                }
            })
        })
    </script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>

<body>
<h1>Login JSP</h1>
<a href="./registry.jsp">REG</a>
<input type="text" id="TEST">
<button id="HELP">TEST</button>
</body>
</html>