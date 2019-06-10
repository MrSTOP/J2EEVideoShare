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

</head>    <link rel="shortcut icon" href="./resources/img/titleIcon.ico" />
<link rel="stylesheet" type="text/css" href="./css/material-components-web.css" />
<link rel="stylesheet" type="text/css" href="./css/material-icons.css" />
<link rel="stylesheet" type="text/css" href="./css/CommonCSS.css" />
<script src="./js/jquery-3.4.1.js"></script>
<script>
    var Rightsrc = document.getElementById("rightPage");
    Rightsrc.src = "PersonalInfo";
    $("a").click(function(){
            var id = ($(this).attr('id'));
            switch (id) {
                case "PInfo":
                    Rightsrc.src = "PersonalInfo.jsp";
                case "PCollect":
                    Rightsrc.src = "Collectvideo";
                case "PHistory":
                    Rightsrc.src = "History";
                case "PUpload":
                    Rightsrc.src = "Upload";
                default:
                    Rightsrc.src = "changePwd.jsp";
            }
        }
</script>
<body>
<header class="mdc-top-app-bar mdc-top-app-bar--dense" style="z-index: 7">

    <div class="mdc-top-app-bar__row">
        <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
            <a href="index.jsp" class="material-icons mdc-top-app-bar__navigation-icon">home</a>
        </section>
        <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
            <div class="mdc-text-field text-field mdc-text-field--outlined" style="border-radius: 50%">
                <input type="text" id="text-field-shape-one" class="mdc-text-field__input">
                <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch" style="">
                        <label class="mdc-floating-label" for="text-field-shape-one" style="">Standard</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>
            <button class="material-icons mdc-top-app-bar__action-item" id="Favorite" title="收藏夹">star</button>
            <a href="./user/${userName}" class="mdc-top-app-bar__action-item" title="用户名">${userName}NULL</a>
            <a href="logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
        </section>
    </div>
</header>
<div style="height: 60px"></div>
<div style="display: flex;position: relative;height: 91vh;overflow: hidden;">
    <aside class="mdc-drawer">
        <div class="mdc-drawer__header">
            <h3 class="mdc-drawer__title">Mail</h3>
            <h6 class="mdc-drawer__subtitle">email@material.io</h6>
        </div>
        <div class="mdc-drawer__content">
            <nav class="mdc-list">
                <a class="mdc-list-item mdc-list-item--activated" id="PInfo">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">info</i>
                    <span class="mdc-list-item__text">个人信息</span>
                </a>
                <a class="mdc-list-item"  id="PCollect">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">star</i>
                    <span class="mdc-list-item__text">收藏夹</span>
                </a>
                <a class="mdc-list-item" href="#" id="PHistory">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">history</i>
                    <span class="mdc-list-item__text">历史记录</span>
                </a>
                <a class="mdc-list-item" href="#" id="PUpload">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">backup</i>
                    <span class="mdc-list-item__text">上传视频</span>
                </a>
                <a class="mdc-list-item" href="#" id="PCPwd">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">create</i>
                    <span class="mdc-list-item__text">修改密码</span>
                </a>
            </nav>
        </div>
    </aside>
    <%--    <article>--%>
    <iframe style="width: 100%" frameborder="0" id="rightPage">
    </iframe>
    <%--    </article>--%>
</div>
</body>
</html>
