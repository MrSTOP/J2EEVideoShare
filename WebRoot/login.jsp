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
        <script src="./js/material-components-web.js"></script>
        <script src="./js/jquery-3.4.1.js"></script>
        <script src="./js/attrchange.js"></script>
        <script src="./js/MDCHelperJavaScript.js"></script>
        <script src="./js/custom-function.js"></script>
        <script src="./js/login.js"></script>
        <style type="text/css">
            #CAPTCHADiv{
                position: relative;
                height: 306px;
                width: 512px;
            }
            #CAPTCHABorder{
                /*display: none;*/
                height: 256px;
                width: 512px;
                z-index: 1;
                position: absolute;
                background-color: #FFFFFF;
                overflow: hidden;
            }
            #CAPTCHAImgDiv{
                width: 512px;
                height: 256px;
                background-color: #FFFFFF;
                position: relative;
            }
            #CAPTCHAImgDiv img{
                width: 512px;
                height: 256px;
                /*position: absolute;*/
            }
            #CAPTCHASlider{
                width: 512px;
                position: absolute;
                bottom: 0;
            }
            #CAPTCHAResult{
                display: none;
                height: 256px;
                width: 512px;
                position: absolute;
                background-color: #FFFFFFCC;
                z-index: 3;
            }
            #CAPTCHAResult>img{
                display: none;
                height: 128px;
                width: 128px;
                left: 192px;
                top: 64px;
                position: absolute;
                z-index: 2;
            }
            #CAPTCHAImgForeground{
                position: absolute;
                left: 0;
                top: 0;
                z-index: 2;
            }
            #CAPTCHAImgBackground{
                position: absolute;
                left: 0;
                top: 0;
                z-index: 1;
            }
            /* #CAPTCHADivPosition{
                position: absolute;
            }
            #CAPTCHADiv>div>div>div{
                position: relative;
                height: 300px;
            }
            .CAPTCHAImg{
                position: relative;
                width: 256px;
                height: 256px;
            }
            #CAPTCHAImgDiv{
                position: absolute;
                margin: 0 100px;
            }
            #CAPTCHAImgDiv>input{
                position: absolute;
                left: 0px;
                bottom: 0px;
            }*/

            /*.CAPTCHAImg~input{
                position: absolute;
            } */
        </style>
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
    </head>

    <body style="text-align: center">
        <noscript><h1>请允许JavaScript运行</h1></noscript>
        <header class=" mdc-top-app-bar mdc-top-app-bar--dense">
            <div class="mdc-top-app-bar__row">
                <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
                    <a href="index.jsp" class="material-icons mdc-top-app-bar__navigation-icon">home</a>
                </section>
                <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
                    <a href="#" class="material-icons mdc-top-app-bar__action-item" id="Favorite" title="收藏夹">star</a>
                    <a href="#" class="material-icons mdc-top-app-bar__action-item" id="UserSpace" title="个人空间">perm_identity</a>
                    <span title="用户名">${sessionScope.user.userName}</span>
                    <a href="Logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
                </section>
            </div>
        </header>
        <div style="height: 60px"></div>
        <form>
            <div class="MDCDivContainer">
                <div>
                    <div style="width: 400px;"
                         class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon">
                        <i class="material-icons mdc-text-field__icon">perm_identity</i>
                        <input id="EmailOrUID" name="emailOrUID" type="text" onkeyup="$.func.spaceReplace(this)"
                               class="mdc-text-field__input" required>
                        <div class="mdc-notched-outline">
                            <div class="mdc-notched-outline__leading"></div>
                            <div class="mdc-notched-outline__notch">
                                <label for="EmailOrUID" class="mdc-floating-label">用户名/UID</label>
                            </div>
                            <div class="mdc-notched-outline__trailing"></div>
                        </div>
                    </div>
                    <div class="mdc-text-field-helper-line">
                        <p class="mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg">
                            请输入UID或电子邮件地址
                        </p>
                    </div>
                </div>
            </div>
            <div class="MDCDivContainer">
                <div>
                    <div style="width: 400px;"
                         class="mdc-text-field mdc-text-field--outlined">
                        <input id="Password" name="password" type="text" onkeyup="$.func.spaceReplace(this)"
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
                            请输入密码
                        </p>
                    </div>
                </div>
            </div>
            <button id="CAPTCHAButton" type="button" class="mdc-button mdc-button--unelevated">点我验证</button>
            <div id="CAPTCHADialog" class="mdc-dialog" role="alertdialog" aria-modal="true" aria-labelledby="my-dialog-title" aria-describedby="my-dialog-content">
                <div class="mdc-dialog__container">
                    <div class="mdc-dialog__surface">
                        <h2 class="mdc-dialog__title" id="my-dialog-title">拖动滑块拼合图片</h2>
                        <div class="mdc-dialog__content" id="DialogInfo">
                            <div id="CAPTCHADiv">
                                <div id="CAPTCHABorder">
                                    <div id="CAPTCHAImgDiv" style="">
                                        <div id="CAPTCHAResult">
                                            <img id="CAPTCHAResultRight" src="./resources/img/CAPTCHA/Info/CAPTCHA_Right.png" alt="CAPTCHA_Wrong">
                                            <img id="CAPTCHAResultWrong" src="./resources/img/CAPTCHA/Info/CAPTCHA_Wrong.png" alt="CAPTCHA_Right">
                                        </div>
                                        <img id="CAPTCHAImgBackground" class="CAPTCHAImg" src="" alt="CAPTCHA_Background">
                                        <img id="CAPTCHAImgForeground" class="CAPTCHAImg" src="" alt="CAPTCHA_Foreground">
                                        <div id="RangeDiv" style="z-index: 50; position: absolute; left: -20px; top: -20px">
                                            <p id="testInfo" style="z-index: 5;background-color: white; border: solid 1px;border-color: aqua; display: inline;">0</p>
                                            <p id="test_Info" style="z-index: 5;background-color: white; border: solid 1px;border-color: chocolate;color:#66CCFF; display: inline;">0</p>
                                        </div>
                                    </div>
                                </div>
                                <div id="CAPTCHASlider">
                                    <div class="mdc-slider" tabindex="0" role="slider"
                                         aria-valuemin="0" aria-valuemax="1024" aria-valuenow="0"
                                         aria-label="Select Value" aria-disabled="false">
                                        <div class="mdc-slider__track-container">
                                            <div class="mdc-slider__track"></div>
                                        </div>
                                        <div class="mdc-slider__thumb-container">
                                            <svg class="mdc-slider__thumb" width="21" height="21">
                                                <circle cx="10.5" cy="10.5" r="7.875"></circle>
                                            </svg>
                                            <div class="mdc-slider__focus-ring"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <footer class="mdc-dialog__actions">
                            <button type="button" class="mdc-button mdc-dialog__button" data-mdc-dialog-action="cancel">
                                <span class="mdc-button__label">取消</span>
                            </button>
                        </footer>
                    </div>
                </div>
                <div class="mdc-dialog__scrim"></div>
            </div>
            <div style="margin: 20px auto 90px;width: 250px">
                <div class="mdc-dialog" role="alertdialog" aria-modal="true" aria-labelledby="my-dialog-title" aria-describedby="my-dialog-content">
                    <div class="mdc-dialog__container">
                        <div class="mdc-dialog__surface">
                            <h2 class="mdc-dialog__title" id="ErrorInfoTitle"></h2>
                            <div class="mdc-dialog__content" id="ErrorInfo">
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
                <button id="SubmitInfo"  type="button" class="mdc-button mdc-button--unelevated"
                        style="float: left;display: inline;">登录</button>
                <button type="button" onclick="window.location.href='./registry.jsp'" class="mdc-button mdc-button--outlined" style="float: right;display: inline;">注册</button>
            </div>
        </form>
        <h1>Login JSP</h1>
        <a href="./registry.jsp">REG</a>
        <input type="text" id="TEST">
        <button id="HELP">TEST</button>
    </body>
</html>