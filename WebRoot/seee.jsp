<%--
  Created by IntelliJ IDEA.
  User: 严子超
  Date: 2019/6/9
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'seee.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="shortcut icon" href="./resources/img/titleIcon.ico"/>
    <link rel="stylesheet" type="text/css" href="./css/material-components-web.css"/>
    <link rel="stylesheet" type="text/css" href="./css/material-icons.css"/>
    <link rel="stylesheet" type="text/css" href="./css/CommonCSS.css"/>
    <LINK REL="stylesheet" type="text/css" href="./css/MDCHelperCSS.css">
    <script src="js/material-components-web.js"></script>
    <script src="js/jquery-3.4.1.js"></script>
    <script src="js/MDCHelperJavaScript.js"></script>
</head>

<body>
<div id="root">
    <div class="drawer-frame-root">
        <aside class="mdc-drawer mdc-drawer--dismissible">
            <div class="mdc-drawer__header"><h3 class="mdc-drawer__title">Mail</h3><h6 class="mdc-drawer__subtitle">
                email@material.io</h6></div>
            <div class="mdc-drawer__content">
                <nav class="mdc-list"><a class="mdc-list-item mdc-list-item--activated" href="#" tabindex="0"
                                         aria-selected="true"><i class="material-icons mdc-list-item__graphic"
                                                                 aria-hidden="true">inbox</i>Inbox</a><a
                        class="mdc-list-item" href="#" tabindex="-1"><i class="material-icons mdc-list-item__graphic"
                                                                        aria-hidden="true">star</i>Star</a><a
                        class="mdc-list-item" href="#" tabindex="-1"><i class="material-icons mdc-list-item__graphic"
                                                                        aria-hidden="true">send</i>Sent Mail</a><a
                        class="mdc-list-item" href="#" tabindex="-1"><i class="material-icons mdc-list-item__graphic"
                                                                        aria-hidden="true">drafts</i>Drafts</a>
                    <hr class="mdc-list-divider">
                    <h6 class="mdc-list-group__subheader">Labels</h6><a class="mdc-list-item" href="#" tabindex="-1"><i
                            class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>Family</a><a
                            class="mdc-list-item" href="#" tabindex="-1"><i
                            class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>Friends</a><a
                            class="mdc-list-item" href="#" tabindex="-1"><i
                            class="material-icons mdc-list-item__graphic" aria-hidden="true">bookmark</i>Work</a>
                    <hr class="mdc-list-divider">
                    <a class="mdc-list-item" href="#" tabindex="-1"><i class="material-icons mdc-list-item__graphic"
                                                                       aria-hidden="true">settings</i>Settings</a><a
                            class="mdc-list-item" href="#" tabindex="-1"><i
                            class="material-icons mdc-list-item__graphic" aria-hidden="true">announcement</i>Help &amp;
                        feedback</a></nav>
            </div>
        </aside>
        <div class="mdc-drawer-app-content">
            <header class="mdc-top-app-bar drawer-top-app-bar">
                <div class="mdc-top-app-bar__row">
                    <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                        <button class="material-icons mdc-top-app-bar__navigation-icon mdc-ripple-upgraded--unbounded mdc-ripple-upgraded"
                                style="--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;">
                            menu
                        </button>
                        <span class="mdc-top-app-bar__title">Dismissible Drawer</span></section>
                </div>
            </header>
            <div class="drawer-main-content">
                <div class="mdc-top-app-bar--fixed-adjust"></div>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
                    enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                    aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
                    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                    occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                    anim id est laborum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
                    enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                    aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
                    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                    occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                    anim id est laborum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
                    enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                    aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
                    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                    occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                    anim id est laborum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
                    enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                    aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
                    voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                    occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                    anim id est laborum.</p></div>
        </div>
    </div>
</div>
</body>
</html>
