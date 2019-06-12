<%--
  Created by IntelliJ IDEA.
  User: MrST
  Date: 2019/6/10
  Time: 15:36
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

    <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
    <link rel="shortcut icon" href="./resources/img/titleIcon.ico"/>
    <link rel="stylesheet" type="text/css" href="./css/material-components-web.css"/>
    <link rel="stylesheet" type="text/css" href="./css/material-icons.css"/>
    <link rel="stylesheet" type="text/css" href="./css/CommonCSS.css"/>
    <link rel="stylesheet" type="text/css" href="./css/MDCHelperCSS.css"/>
    <script src="./js/jquery-3.4.1.js"></script>
    <script src="./js/material-components-web.js"></script>
    <script src="./js/MDCHelperJavaScript.js"></script>
    <script src="./js/custom-function.js"></script>
    <script>
        var progress;
        var a = 0;
        $(function () {
            $(document).ready(function () {
                var dialog = new mdc.dialog.MDCDialog($("#UploadDialog")[0]);
                var success = ${requestScope.Info == null ? false : requestScope.Info == true};
                if (success) {
                    dialog.open();
                }
                progress = initMDCComponentAttachTo(".mdc-linear-progress", mdc.linearProgress.MDCLinearProgress);
            });
        });

        function preLook(file) {
            var blob = new Blob([file]), // 文件转化成二进制文件
                url = URL.createObjectURL(blob); //转化成url
            $("#PreLook").empty();
            if (/image/g.test(file.type)) {
                var img = $('<img src="' + url + '" style="width: 70%">');
                img[0].onload = function (e) {
                    URL.revokeObjectURL(this.src);  // 释放createObjectURL创建的对象
                }
                $("#PreLook").append(img);
            } else if (/video/g.test(file.type)) {
                var video = $('<video controls src="' + url + '" style="width: 70%">');
                $("#PreLook").append(video);
                video[0].onload = function (e) {
                    URL.revokeObjectURL(this.src);  // 释放createObjectURL创建的对象
                }
            }
        }
    </script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>

<body style="text-align: center">
<div style=" height: 50px; padding-left: 30px;border-bottom: 1px solid #ddd;">
        <span class="mdc-typography--body1" style="display: flex;margin-top: 10px;font-size: 20px">
        <i class="material-icons">view_headline</i>上传视频
        </span>
</div>
<div id="UploadDialog" class="mdc-dialog" role="alertdialog" aria-modal="true" aria-labelledby="my-dialog-title" aria-describedby="my-dialog-content">
    <div class="mdc-dialog__container">
        <div class="mdc-dialog__surface">
            <h2 class="mdc-dialog__title" id="Info">视频上传成功</h2>
            <footer class="mdc-dialog__actions">
                <button type="button" class="mdc-button mdc-dialog__button" data-mdc-dialog-action="ok">
                    <span class="mdc-button__label">确定</span>
                </button>
            </footer>
        </div>
    </div>
    <div class="mdc-dialog__scrim"></div>
</div>
<form action="VideoUpload" method="post" enctype="multipart/form-data">
    <div class="MDCDivContainer">
        <div>
            <div style="width: 400px;"
                 class="mdc-text-field mdc-text-field--outlined">
                <input id="VideoUpload" name="videoFile" type="file" oninput="preLook(this.files[0])"
                       class="mdc-text-field__input" required>
                <div class="mdc-notched-outline">
                    <div class="mdc-notched-outline__leading"></div>
                    <div class="mdc-notched-outline__notch">
                        <label for="VideoUpload" class="mdc-floating-label">用户名</label>
                    </div>
                    <div class="mdc-notched-outline__trailing"></div>
                </div>
            </div>
            <div class="mdc-text-field-helper-line">
                <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">
                    请选择文件
                </p>
            </div>
        </div>
    </div>
    <button type="submit" class="mdc-button mdc-button--unelevated">上传视频</button>
</form>
<div style="width: 60%;margin: 30px auto">
    <div class="hero-linear-progress-indicator">
        <div role="progressbar" class="mdc-linear-progress">
            <div class="mdc-linear-progress__buffering-dots"></div>
            <div class="mdc-linear-progress__buffer"></div>
            <div class="mdc-linear-progress__bar mdc-linear-progress__primary-bar" style="transform: scaleX(0.5);"><span
                    class="mdc-linear-progress__bar-inner"></span></div>
            <div class="mdc-linear-progress__bar mdc-linear-progress__secondary-bar"><span
                    class="mdc-linear-progress__bar-inner"></span></div>
        </div>
    </div>
</div>

<div id="PreLook" style="width: 70%;margin: 30px auto">

</div>
</body>
</html>