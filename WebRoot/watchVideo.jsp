<%--
  Created by IntelliJ IDEA.
  User: MrST
  Date: 2019/6/9
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
    <head>
        <base href="<%=basePath%>">

        <title>watchVideo.jsp</title>
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
        <link rel="shortcut icon" href="./resources/img/titleIcon.ico" />
        <link rel="stylesheet" type="text/css" href="./css/material-components-web.css" />
        <link rel="stylesheet" type="text/css" href="./css/material-icons.css" />
        <link rel="stylesheet" type="text/css" href="./css/CommonCSS.css" />
        <script src="./js/jquery-3.4.1.js"></script>
        <script src="./js/custom-function.js"></script>
        <script src="./js/material-components-web.js"></script>
        <script src="./js/MDCHelperJavaScript.js"></script>
        <script src="./js/ckeditor.js"></script>
        <script src="./js/watchVideo.js"></script>
        <style type="text/css">
            .videoTitle{
                text-align: left;
                padding: 2%;
            }
        </style>
    </head>

    <body style="text-align: center;">
        <header class=" mdc-top-app-bar mdc-top-app-bar--dense">
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
                    <a href="./Collection.jsp" class="material-icons mdc-top-app-bar__action-item" id="Favorite" title="收藏夹">star</a>
                    <a href="./PersonalMain.jsp" class="material-icons mdc-top-app-bar__action-item" id="UserSpace" title="个人空间">perm_identity</a>
                    <span title="用户名">${sessionScope.user.userName}</span>
                    <a href="Logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
                </section>
            </div>
        </header>
        <div style="height: 50px"></div>
        <div id="VideoCard" class="mdc-card" style="width: 70%;margin: 40px auto 80px;">
            <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                <div class="mdc-card__media">
                    <video width="100%" controls>
                        <source src="./resources/video/${requestScope.VideoFileName}" type="video/mp4"/>
                    </video>
                </div>
                <div class="videoTitle">
                    <h2 class="demo-card__title mdc-typography mdc-typography--headline6">${requestScope.VideoFileName}</h2>
                    <h3 class="demo-card__subtitle mdc-typography mdc-typography--subtitle2" style="text-align: right">
                        UP: ${requestScope.VideoAuthor}
                    </h3>
                </div>
            </div>
            <div class="mdc-card__actions">
                <div class="mdc-card__action-icons">
                    <button id="VideoFavorite" class="mdc-icon-button mdc-card__action mdc-card__action--icon--unbounded" aria-pressed="false" aria-label="Add to favorites" title="收藏">
                        <i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">star</i>
                        <i class="material-icons mdc-icon-button__icon">star_border</i>
                    </button>
                    <button id="GiveVideoCoin" class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="投币" data-mdc-ripple-is-unbounded="true">monetization_on</button>
                    <span id="CoinCount" class="mdc-typography--body1">0</span>
                </div>
            </div>
        </div>
        <input id="VideoID" type="text" hidden value="${requestScope.VideoID}">
        <textarea name="comment" id="CommentEditor" style="width: 70%;margin: auto"></textarea>
        <div style="width: 70%;height: 50px;margin: 50px auto;margin-top: 0;position: relative">
            <div id="CommentSubmitInfo" class="mdc-dialog" role="alertdialog" aria-modal="true" aria-labelledby="my-dialog-title" aria-describedby="my-dialog-content">
                <div class="mdc-dialog__container">
                    <div class="mdc-dialog__surface">
                        <h2 class="mdc-dialog__title" id="InfoTitle"></h2>
                        <div class="mdc-dialog__content" id="Info">
                        </div>
                        <footer class="mdc-dialog__actions">
                            <button type="button" class="mdc-button mdc-dialog__button" data-mdc-dialog-action="ok">
                                <span class="mdc-button__label">确定</span>
                            </button>
                        </footer>
                    </div>
                </div>
                <div class="mdc-dialog__scrim"></div>
            </div>
            <button id="SubmitComment" class="mdc-button mdc-button--unelevated" style="position: absolute;right: 5%">提交评论</button>
        </div>
        <div id="VideoComment">
            <div id="VideoCommentMain"></div>
            <div>
                <button id="FirstPage" class="mdc-button mdc-button--outlined">第一页</button>
                <button id="PrePage" class="mdc-button mdc-button--outlined">上一页</button>
                <span id="VideoCommentTotalPage">共页</span>
                <button id="NextPage" class="mdc-button mdc-button--outlined">下一页</button>
                <button id="LastPage" class="mdc-button mdc-button--outlined">最后一页</button>
            </div>
        </div>
    </body>
</html>