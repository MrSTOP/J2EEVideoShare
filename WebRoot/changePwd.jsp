<%--
  Created by IntelliJ IDEA.
  User: 严子超
  Date: 2019/6/8
  Time: 9:37
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

    <title>My JSP 'changePwd.jsp' starting page</title>

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
    <script src="js/CONST_VALUE.js"></script>
    <script src="js/custom-function.js"></script>
    <script type="text/javascript" src="js/custom-function.js"></script>
    <script type="text/javascript" src="js/CONST_VALUE.js"></script>
    <script src="js/MDCHelperJavaScript.js"></script>
    <script>
        $(function () {
            $(document).ready(function () {
                var textFieldss = initMDCComponentAttachTo(".mdc-text-field", mdc.textField.MDCTextField);
                var selectss = initMDCComponentAttachTo(".mdc-select", mdc.select.MDCSelect);
                $.func.initHtmlConstValue();
                $("#Password").bind({
                    "blur": function () {
                        $.func.registry_passwordRegCheck(textFieldss[1]);
                    }
                });
                $("#PasswordRepeat").bind({
                    "blur": function () {
                        $.func.registry_passwordRepeatCheck(textFieldss[2]);
                    }
                });
                $("#NowPassword").bind({
                    "blur":function () {
                        $.ajax({
                            url:"CheckPWD",
                            data:"PWD="+$("#NowPassword").val(),
                            type:"post",
                            success:function (data, status) {
                                if(data !== "")
                                {
                                    textFieldss[0].valid = false;
                                    textFieldss[0].helperTextContent = data;
                                    $('input[type=button]').attr("disabled",true);
                                }
                                else{
                                    textFieldss[0].valid = true;
                                    textFieldss[0].helperTextContent = "";
                                    $('input[type=button]').attr("disabled",false);
                                }
                                console.log("SU");
                            },
                            error:function () {
                                textFieldss[0].valid = false;
                            }
                        })
                    }
                })
            })
        })
    </script>
</head>

<body>
<div style=" height: 45px; padding-left: 30px;border-bottom: 1px solid #ddd;">
        <span class="mdc-typography--body1" style="display: flex;margin-top: 10px;font-size: 20px">
            <i class="material-icons">view_headline</i>修改密码
        </span>
</div>
<form method="post" action="ChangePassword" style="text-align: center">
<div class="MDCDivContainer">
    <div>
        <div style="width: 400px;" class="mdc-text-field mdc-text-field--outlined">
            <input id="NowPassword" name="password" type="password" onkeyup="$.func.spaceReplace(this);"
                   class="mdc-text-field__input" required>
            <div class="mdc-notched-outline">
                <div class="mdc-notched-outline__leading"></div>
                <div class="mdc-notched-outline__notch">
                    <label for="NowPassword" class="mdc-floating-label">请输入当前密码</label>
                </div>
                <div class="mdc-notched-outline__trailing"></div>
            </div>
        </div>
        <div class="mdc-text-field-helper-line">
            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg">
            </p>
        </div>
    </div>
</div>
<div class="MDCDivContainer">
    <div>
        <div style="width: 400px;" class="mdc-text-field mdc-text-field--outlined">
            <input id="Password" name="password" type="password" onkeyup="$.func.spaceReplace(this);"
                   class="mdc-text-field__input" required>
            <div class="mdc-notched-outline">
                <div class="mdc-notched-outline__leading"></div>
                <div class="mdc-notched-outline__notch">
                    <label for="Password" class="mdc-floating-label">密码</label>
                </div>
                <div class="mdc-notched-outline__trailing"></div>
            </div>
        </div>
        <div class="mdc-text-field-helper-line">
            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg">
                请输入密码，长度<span id="PASSWORD_MIN_LENGTH"></span>-<span id="PASSWORD_MAX_LENGTH"></span>个字符
            </p>
        </div>
    </div>
</div>
<div class="MDCDivContainer">
    <div>
        <div style="width: 400px;" class="mdc-text-field mdc-text-field--outlined">
            <input id="PasswordRepeat" name="passwordRepeat" type="password" class="mdc-text-field__input"
                   required>
            <div class="mdc-notched-outline">
                <div class="mdc-notched-outline__leading"></div>
                <div class="mdc-notched-outline__notch">
                    <label for="PasswordRepeat" class="mdc-floating-label">重复密码</label>
                </div>
                <div class="mdc-notched-outline__trailing"></div>
            </div>
        </div>
        <div class="mdc-text-field-helper-line">
            <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent">请再次输入密码</p>
        </div>
    </div>
</div>
    <input type="submit"  class="demo-button mdc-button mdc-button--outlined mdc-ripple-upgraded" value="提交" style="width: 170px">
</form>
</body>
</html>
