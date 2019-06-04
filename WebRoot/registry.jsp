<%--
  Created by IntelliJ IDEA.
  User: MrST
  Date: 2019/6/3
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">


    <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
    <link rel="shortcut icon" href="./resources/img/titleIcon.ico" />
    <link rel="stylesheet" type="text/css" href="./css/material-components-web.css" />
    <link rel="stylesheet" type="text/css" href="./css/material-icons.css" />
    <link rel="stylesheet" type="text/css" href="./css/CommonCSS.css" />
    <script src="./js/jquery-3.4.1.js"></script>
    <script src="./js/index.js" type="text/javascript"></script>
    <script src="./js/framework.js" type="text/javascript"></script>
</head>

<body>
<header class=" mdc-top-app-bar mdc-top-app-bar--dense">
    <div class="mdc-top-app-bar__row">
        <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
            <a href="index.jsp" class="material-icons mdc-top-app-bar__navigation-icon">home</a>
        </section>
        <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
            <button class="material-icons mdc-top-app-bar__action-item" id="Favorite" title="收藏夹">star</button>
            <span href="./user/${userName}" class="mdc-top-app-bar__title" title="用户名">${userName}NULL</span>
            <a href="logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
        </section>
    </div>
</header>
<article>

<div class="mdc-text-field mdc-text-field--outlined">
    <input class="mdc-text-field__input" placeholder="请输入昵称">
    <div class="mdc-notched-outline">
        <div class="mdc-notched-outline__leading"></div>
        <div class="mdc-notched-outline__notch">
            <label class="mdc-floating-label">用户名</label>
        </div>
        <div class="mdc-notched-outline__trailing"></div>
    </div>
</div>
</article>
<%--<article>--%>
<%--    <div id="main">--%>
<%--        <div id="RegistryTop">注册</div>--%>
<%--        <div id="RegistryBottom">--%>
<%--            <form name="RegistryInfo" id="IDRegistryInfo" method="POST" action="" >--%>
<%--                <div id="MainRegistryInfo">--%>
<%--                    <div id="NickNameLine">--%>
<%--                        <div>昵&nbsp; &nbsp; &nbsp; &nbsp;称</div>--%>
<%--                        <input type="text" name="NickName" id="IDNickName" placeholder="请输入昵称" required>--%>
<%--                        <div class="RightWrongStyle">--%>
<%--                            <img id="NickNameRight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">--%>
<%--                            <img id="NickNameWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div id="FirstPassword">--%>
<%--                        <div>密&nbsp; &nbsp; &nbsp; &nbsp;码</div>--%>
<%--                        <input type="password" name="Password" id="IDPassword" placeholder="请输入密码" required>--%>
<%--                        <div class="RightWrongStyle">--%>
<%--                            <img id="FirstPasswordRight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">--%>
<%--                            <img id="FirstPasswordWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div id="RepeatPassword">--%>
<%--                        <div>重复密码</div>--%>
<%--                        <input type="password" name="PasswordRepeat" id="IDRepeatPassword" placeholder="请重复密码" required>--%>
<%--                        <div class="RightWrongStyle">--%>
<%--                            <img id="RepeatPasswordRight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">--%>
<%--                            <img id="RepeatPasswordWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div id="EmailAddress">--%>
<%--                        <div>电子邮箱</div>--%>
<%--                        <input type="text" name="EmailAddress" id="" placeholder="请输入电子邮箱" required>--%>
<%--                        <div class="RightWrongStyle">--%>
<%--                            <img id="EmailAddressRight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">--%>
<%--                            <img id="EmailAddressWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div id="EmailCAPTCHALine">--%>
<%--                        <div>验 证 码</div>--%>
<%--                        <input type="text" name="EmailCAPTCHA" id="IDEmailCAPTCHA" placeholder="请输入6位有数字与(或)字母组成的验证码" required>--%>
<%--                        <button id="GetEmailCAPTCHA">获取验证码</button>--%>
<%--                        <div class="RightWrongStyle">--%>
<%--                            <img id="EmailCAPTCHARight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">--%>
<%--                            <img id="EmailCAPTCHAWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div id="IDLine">--%>
<%--                        <div>身份证号</div>--%>
<%--                        <input type="text" name="IDNumber" id="IDIDNumber" placeholder="请输入身份证号码" required>--%>
<%--                        <div class="RightWrongStyle">--%>
<%--                            <img id="IDRight" src="./resources/img/CAPTCHA/CAPTCHA_Right.png" alt="">--%>
<%--                            <img id="IDWrong" src="./resources/img/CAPTCHA/CAPTCHA_Wrong.png" alt="">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div id="SexInfo">--%>
<%--                    <div>--%>
<%--                        <p>--%>
<%--                            <input type="radio" name="Sex" id="IDSexMale" value="Male">--%>
<%--                            <span class="SexText">男</span>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <input type="radio" name="Sex" id="IDSexFemale" value="Female">--%>
<%--                            <span class="SexText">女</span>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <input type="radio" name="Sex" id="IDSexSecret" value="Secret" checked>--%>
<%--                            <span class="SexText">保密</span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div id="HobbyInfo">--%>
<%--                    <div>--%>
<%--                        <div id="HobbyInfoLineA">--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby1" value="Hobby1">--%>
<%--                                <span class="HobbyName">爱好1</span>--%>
<%--                            </p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby2" value="Hobby2">--%>
<%--                                <span class="HobbyName">爱好2</span>--%>
<%--                            </p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby3" value="Hobby3">--%>
<%--                                <span class="HobbyName">爱好3</span>--%>
<%--                            </p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby4" value="Hobby4">--%>
<%--                                <span class="HobbyName">爱好4</span>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                        <div id="HobbyInfoLineB">--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby5" value="Hobby5">--%>
<%--                                <span class="HobbyName">爱好5</span>--%>
<%--                            </p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby6" value="Hobby6">--%>
<%--                                <span class="HobbyName">爱好6</span>--%>
<%--                            </p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby7" value="Hobby7">--%>
<%--                                <span class="HobbyName">爱好7</span>--%>
<%--                            </p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby8" value="Hobby8">--%>
<%--                                <span class="HobbyName">爱好8</span>--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                        <div id="HobbyInfoLineC">--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby9" value="Hobby9">--%>
<%--                                <span class="HobbyName">爱好9</span>--%>
<%--                            </p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby10" value="Hobby10">--%>
<%--                                <span class="HobbyName">爱好10</span--%>
<%--                                ></p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby11" value="Hobby11">--%>
<%--                                <span class="HobbyName">爱好11</span--%>
<%--                                ></p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby12" value="Hobby12">--%>
<%--                                <span class="HobbyName">爱好12</span--%>
<%--                                ></p>--%>
<%--                        </div>--%>
<%--                        <div id="HobbyInfoLineD">--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby13" value="Hobby13">--%>
<%--                                <span class="HobbyName">爱好13</span--%>
<%--                                ></p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby14" value="Hobby14">--%>
<%--                                <span class="HobbyName">爱好14</span--%>
<%--                                ></p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby15" value="Hobby15">--%>
<%--                                <span class="HobbyName">爱好15</span--%>
<%--                                ></p>--%>
<%--                            <p>--%>
<%--                                <input type="checkbox" name="Hobby" id="IDHobby16" value="Hobby16">--%>
<%--                                <span class="HobbyName">爱好16</span--%>
<%--                                ></p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div id="ButtonDiv">--%>
<%--                    <div id="RegistryButtonDiv">--%>
<%--                        <div id="RegistryButtonInfo">请正确填写所有信息</div>--%>
<%--                        <button class="ButtonStyle ButtonStyleLogin" id="RegistryButtonLayout" type="button"></button>--%>
<%--                        <button class="ButtonStyle ButtonStyleLogin" id="RegistryButton" type="button">注册</button>--%>
<%--                    </div>--%>
<%--                    <div  id="ResetButtonDiv">--%>
<%--                        <button class="ButtonStyle ButtonStyleReset" id="ResetButton" type="button">清除</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</article>--%>
</body>
</html>