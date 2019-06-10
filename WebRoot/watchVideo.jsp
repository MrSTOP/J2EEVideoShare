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
        <script src="./js/material-components-web.js"></script>
        <script src="./js/MDCHelperJavaScript.js"></script>
        <script src="./js/ckeditor.js"></script>
        <script>
            var isFirst = true;
            var comment;
            var requestComment = function (element) {
                if (isFirst) {
                    $.ajax({
                        url: "GetPagedVideoComment",
                        data: "VideoID=" + $("#VideoID").val() +
                            "&reqPage=1",
                        type: "post",
                        success: function (data, status) {
                            if (status === "success") {
                                var commentDat = JSON.parse(data);
                                comment = commentDat;
                                printComment(commentDat);
                            }
                        }
                    });
                    isFirst = false;
                } else {
                    var reqPage = 1;
                    switch ($(element).attr("id")) {
                        case "FirstPage":
                            reqPage = 1;
                            break;
                        case "PrePage":
                            reqPage = comment.currentPage - 1;
                            break;
                        case "NextPage":
                            reqPage = comment.currentPage + 1;
                            break;
                        case "LastPage":
                            reqPage = comment.totalPage;
                    }
                    $.ajax({
                        url: "GetPagedVideoComment",
                        data: "VideoID=" + $("#VideoID").val() +
                        "&reqPage=" + reqPage,
                        type: "post",
                        success: function (data, status) {
                            console.log(data);
                            if (status === "success") {
                                var commentDat = JSON.parse(data);
                                comment = commentDat;
                                printComment(commentDat);
                            }
                        }
                    });
                }
            };
            var printComment = function (commentData) {
                $("#VideoCommentMain").empty();
                $("#LastPage").attr("disabled", commentData.currentPage === commentData.totalPage);
                $("#NextPage").attr("disabled", commentData.currentPage === commentData.totalPage);
                $("#FirstPage").attr("disabled", commentData.currentPage === 1);
                $("#PrePage").attr("disabled", commentData.currentPage === 1);
                for (var i = 0; i < commentData.count; i++) {
                    $("#VideoCommentTotalPage").html("共" + comment.totalPage + "页 第" + commentData.currentPage + "页");
                    $("#VideoCommentMain").append("<div class='mdc-card' style='width: 70%;margin: 40px auto;'>" +
                        "<div class='mdc-card__primary-action demo-card__primary-action' tabindex='0'>" +
                        "<div class='videoComment mdc-typography mdc-typography--body2'>" +
                        commentData.comment[i] +
                        "</div></div><div class='commentAuthor'>" +
                        "<h3 class='mdc-typography mdc-typography--subtitle2'>" +
                        commentData.userName[i] +
                        "</h3></div></div>");
                }
            };
            $(function () {
                $(document).ready(function () {
                    var commentEditor;
                    var dialogs = initMDCComponentClass(".mdc-dialog", mdc.dialog.MDCDialog);
                    ClassicEditor.create(document.querySelector("#CommentEditor"))
                        .then(editor => {
                        console.log(editor);
                        $(".ck-editor").css("width", "70%");
                        $(".ck-editor").css("margin", "40px auto 40px");
                        commentEditor = editor;
                    }).catch(error => {console.error(error)});
                    requestComment();
                    $("#FirstPage").bind({
                        "click": function () {
                            requestComment(this);
                        }
                    });
                    $("#PrePage").bind({
                        "click": function () {
                            requestComment(this);
                        }
                    });
                    $("#NextPage").bind({
                        "click": function () {
                            requestComment(this);
                        }
                    });
                    $("#LastPage").bind({
                        "click": function () {
                            requestComment(this);
                        }
                    });
                    $("#SubmitComment").bind({
                        "click": function () {
                            $.ajax({
                                url: "AddNewVideoComment",
                                data: "VideoID=" + $("#VideoID").val() +
                                "&comment=" + commentEditor.getData(),
                                type: "post",
                                success: function () {
                                    commentEditor.setData("");
                                    $("#InfoTitle").html("成功");
                                    $("#Info").html("评论提交成功！");
                                    isFirst = true;
                                    requestComment();
                                    dialogs[0].open();
                                },
                                error: function () {
                                    $("#InfoTitle").html("失败");
                                    $("#Info").html("评论提交失败！");
                                    dialogs[0].open();
                                }
                            })
                        }
                    })
                });
            });
        </script>
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
                    <button class="mdc-icon-button mdc-card__action mdc-card__action--icon--unbounded" aria-pressed="false" aria-label="Add to favorites" title="Add to favorites">
                        <i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">favorite</i>
                        <i class="material-icons mdc-icon-button__icon">favorite_border</i>
                    </button>
                    <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="投币" data-mdc-ripple-is-unbounded="true">attach_money</button>
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