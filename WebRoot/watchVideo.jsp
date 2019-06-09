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
        <style type="text/css">
            .videoTitle{
                text-align: left;
                padding: 2%;
            }
            .videoIntroduction{
                text-align: left;
                padding: 0 2% 1%;
            }
            .commentAuthor {
                text-align: right;
                padding: 2%;
            }
            .videoComment{
                text-align: left;
                padding: 3% 2%;
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
                    <a href="#" class="material-icons mdc-top-app-bar__action-item" id="Favorite" title="收藏夹">star</a>
                    <a href="#" class="material-icons mdc-top-app-bar__action-item" id="UserSpace" title="个人空间">perm_identity</a>
                    <span title="用户名">${sessionScope.user.userName}</span>
                    <a href="Logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
                </section>
            </div>
        </header>
        <div style="height: 50px"></div>
        <div class="mdc-card demo-card" style="width: 70%;margin: 40px auto 80px;">
            <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                <div class="mdc-card__media">
                    <video width="100%" controls>
                        <source src="" type="video/mp4"/>
                    </video>
                </div>
                <div class="videoTitle">
                    <h2 class="demo-card__title mdc-typography mdc-typography--headline6">Our Changing Planet</h2>
                    <h3 class="demo-card__subtitle mdc-typography mdc-typography--subtitle2">by Kurt Wagner</h3>
                </div>
                <div class="videoIntroduction mdc-typography mdc-typography--body2">Visit ten places on our planet that are undergoing the biggest changes today.</div>
            </div>
            <div class="mdc-card__actions">
                <div class="mdc-card__action-icons">
                    <button class="mdc-icon-button mdc-card__action mdc-card__action--icon--unbounded" aria-pressed="false" aria-label="Add to favorites" title="Add to favorites">
                        <i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">favorite</i>
                        <i class="material-icons mdc-icon-button__icon">favorite_border</i>
                    </button>
                    <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="Share" data-mdc-ripple-is-unbounded="true">share</button>
                </div>
            </div>
        </div>
        <div class="mdc-card demo-card" style="width: 70%;margin: 40px auto;">
            <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                <div class=videoComment mdc-typography mdc-typography--body2">
                Visit ten places on our planet that are undergoing the biggest changes today.
                </div>
            </div>
            <div class="commentAuthor">
                <h3 class="mdc-typography mdc-typography--subtitle2">by Kurt Wagner</h3>
            </div>
        </div>
    </body>
</html>