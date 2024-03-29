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

    <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
    <link rel="shortcut icon" href="./resources/img/titleIcon.ico"/>
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>    <link rel="shortcut icon" href="./resources/img/titleIcon.ico" />
<link rel="stylesheet" type="text/css" href="./css/material-components-web.css" />
<link rel="stylesheet" type="text/css" href="./css/material-icons.css" />
<link rel="stylesheet" type="text/css" href="./css/CommonCSS.css" />
<script src="./js/material-components-web.js"></script>
<script src="./js/jquery-3.4.1.js"></script>
<script src="./js/SearchBar.js"></script>
<script>
    $(function () {
        $(document).ready(function () {
            var Rightsrc = document.getElementById("rightPage");
            SearchBarInit();
            Rightsrc.src = "PersonalInfo.jsp";
            $("a").bind({"click": function(){
                var id = ($(this).attr('id'));
                switch (id) {
                    case "PInfo":
                        $("a").removeClass("mdc-list-item--activated");
                        $("#PInfo").addClass("mdc-list-item--activated");
                        Rightsrc.src = "PersonalInfo.jsp";
                        break;
                    case "PCollect":
                        $("a").removeClass("mdc-list-item--activated");
                        $("#PCollect").addClass("mdc-list-item--activated");
                        Rightsrc.src = "Collectvideo";
                        break;
                    case "PHistory":
                        $("a").removeClass("mdc-list-item--activated");
                        $("#PHistory").addClass("mdc-list-item--activated");
                        Rightsrc.src = "ToWatchHistory";
                        break;
                    case "PUpload":
                        $("a").removeClass("mdc-list-item--activated");
                        $("#PUpload").addClass("mdc-list-item--activated");
                        Rightsrc.src = "uploadVideo.jsp";
                        break;
                    case "MyVideo":
                        $("a").removeClass("mdc-list-item--activated");
                        $("#MyVideo").addClass("mdc-list-item--activated");
                        Rightsrc.src = "ShowSelfVideo";
                        break;
                    default:
                        $("a").removeClass("mdc-list-item--activated");
                        $("#PCPwd").addClass("mdc-list-item--activated");
                        Rightsrc.src = "changePwd.jsp";
                }
            }})
        })
    })

</script>
<body>

<header class=" mdc-top-app-bar mdc-top-app-bar--dense">
    <div class="mdc-top-app-bar__row">
        <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
            <a href="index.jsp" class="material-icons mdc-top-app-bar__navigation-icon">home</a>
            <span class="mdc-top-app-bar__title">视频分享</span>
        </section>
        <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
            <div style="position: relative">
                <button id="Search" class="mdc-top-app-bar__action-item material-icons">search</button>
                <div id="SearchBar" style="display: none">
                    <div class="mdc-text-field mdc-text-field--outlined">
                        <input type="text" id="SearchText" class="mdc-text-field__input">
                        <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                            <div class="mdc-notched-outline__leading"></div>
                            <div class="mdc-notched-outline__notch">
                                <label class="mdc-floating-label" for="SearchText">搜索</label>
                            </div>
                            <div class="mdc-notched-outline__trailing"></div>
                        </div>
                    </div>
                    <button id="SearchButton" class="demo-button mdc-button mdc-button--outlined mdc-ripple-upgraded">
                        <i class="material-icons mdc-button__icon">search</i>
                        <span class="mdc-button__label">搜索</span>
                    </button>
                </div>
            </div>
            <a href="./PersonalMain.jsp" class="material-icons mdc-top-app-bar__action-item" id="UserSpace"
               title="个人空间">perm_identity</a>
            <span title="用户名">${sessionScope.user.userName}</span>
            <a href="Logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
        </section>
    </div>
</header>
<div style="height: 60px"></div>
<div style="display: flex;position: relative;height: 91vh;overflow: hidden;">
    <aside class="mdc-drawer">
        <div class="mdc-drawer__header">
            <h3 class="mdc-drawer__title">${sessionScope.user.userName}</h3>
            <h6 class="mdc-drawer__subtitle">${sessionScope.user.email}</h6>
        </div>
        <div class="mdc-drawer__content">
            <nav class="mdc-list">
                <a class="mdc-list-item mdc-list-item--activated" id="PInfo">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">info</i>
                    <span class="mdc-list-item__text">个人信息</span>
                </a>
                <a class="mdc-list-item"  id="PCollect">
                    <i class="material-icons mdc-list-item__graphic"  aria-hidden="true">star</i>
                    <span class="mdc-list-item__text">收藏夹</span>
                </a>
                <a class="mdc-list-item"  id="PHistory">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">history</i>
                    <span class="mdc-list-item__text">历史记录</span>
                </a>
                <a class="mdc-list-item"  id="PUpload">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">backup</i>
                    <span class="mdc-list-item__text">上传视频</span>
                </a>
                <a class="mdc-list-item"  id="PCPwd">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">create</i>
                    <span class="mdc-list-item__text">修改密码</span>
                </a>
                <a class="mdc-list-item"  id="MyVideo">
                    <i class="material-icons mdc-list-item__graphic" aria-hidden="true">create</i>
                    <span class="mdc-list-item__text">已上传视频</span>
                </a>
            </nav>
        </div>
    </aside>
    <%--    <article>--%>
    <iframe style="width: 100%" frameborder="0" id="rightPage" src="">
    </iframe>
    <%--    </article>--%>
</div>
</body>
</html>
