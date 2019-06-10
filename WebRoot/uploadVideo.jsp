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
                progress = initMDCComponentAttachTo(".mdc-linear-progress", mdc.linearProgress.MDCLinearProgress);
                $("#VideoUpload").bind({
                    "input blur propertychange": function () {
                        //preLook($(this).prop('files')[0]);
                    }
                });
                $("#Upload").bind({
                    "click": function () {
                        upload();
                    }
                });
                $("#Up").bind({
                    "click": function () {
                        a += 0.1;
                        progress[0].progress = a;
                    }
                })
                $("#Down").bind({
                    "click": function () {
                        a -= 0.1;
                        progress[0].progress = a;
                    }
                })
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

        function upload() {
            //创建FormData对象，初始化为form表单中的数据。需要添加其他数据可使用formData.append("property", "value");
            var formData = new FormData($('form')[0]);

            //ajax异步上传
            $.ajax({
                url: "VideoUpload",
                type: "POST",
                data: formData,
                xhr: function () { //获取ajaxSettings中的xhr对象，为它的upload属性绑定progress事件的处理函数

                    myXhr = $.ajaxSettings.xhr();
                    if (myXhr.upload) { //检查upload属性是否存在
                        //绑定progress事件的回调函数
                        myXhr.upload.addEventListener('progress', progressHandlingFunction, false);
                    }
                    return myXhr; //xhr对象返回给jQuery使用
                },
                success: function (result) {
                    $("#result").html(result.data);
                },
                contentType: false, //必须false才会自动加上正确的Content-Type
                processData: false  //必须false才会避开jQuery对 formdata 的默认处理
            });
        }

        //上传进度回调函数：
        function progressHandlingFunction(e) {
            console.log("Process");
            if (e.lengthComputable) {
                progress[0].progress = e.loaded / e.total;
                console.log("PRE: " + e.loaded / e.total);
                $('progress').attr({value: e.loaded, max: e.total}); //更新数据到进度条
                var percent = e.loaded / e.total * 100;
                $('#progress').html(e.loaded + "/" + e.total + " bytes. " + percent.toFixed(2) + "%");
            }
        }
    </script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>

<body style="text-align: center">
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
            <a href="./PersonalMain.jsp" class="material-icons mdc-top-app-bar__action-item" id="UserSpace"
               title="个人空间">perm_identity</a>
            <span title="用户名">${sessionScope.user.userName}</span>
            <a href="Logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
        </section>
    </div>
</header>
<div style="height: 50px"></div>
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
    <button>asdfasdfasdrf</button>
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

<button id="Upload" class="mdc-button mdc-button--unelevated">上传</button>
<button id="Up" class="mdc-button mdc-button--unelevated">UP</button>
<button id="Down" class="mdc-button mdc-button--unelevated">DO</button>
<div id="PreLook" style="width: 70%;margin: 30px auto">

</div>
</body>
</html>