package yankunwei.servlet;

import yankunwei.javabean.UserInfo;
import yankunwei.javabean.UserInfoDAO;
import yankunwei.utils.MD5Tool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginCheck", urlPatterns = "/LoginCheck")
public class LoginCheck extends HttpServlet {
    public static final String SESSION_ATTR_USER_INFO = "user";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String emailOrUID = request.getParameter("emailOrUID");
        String passwordEncrypt;
        UserInfoDAO userInfoDAO = new UserInfoDAO();
        String s = request.getParameter("position");
        int pos = Integer.valueOf(request.getParameter("position"));
        int loginCAPTCHA = (int) request.getSession().getAttribute(GetLoginCAPTCHA.LOGIN_CAPTCHA_ATTR_NAME);
        String msg = "";
        switch (type) {
            case "InfoCheck":
                passwordEncrypt = MD5Tool.MD5Encrypt(request.getParameter("password"));
                if (pos >= loginCAPTCHA + 30 || pos <= loginCAPTCHA - 30) {
                    msg = "CAPTCHA";
                } else {
                    if (userInfoDAO.isPasswordRightByEmailOrUID(emailOrUID, passwordEncrypt)) {
                        UserInfo userInfo = new UserInfo();
                        userInfoDAO.getUserInfoByEmailOrUID(emailOrUID, userInfo);
                        userInfo.updateCoin();
                        userInfoDAO.updateUserInfo(userInfo);
                        request.getSession().setAttribute(SESSION_ATTR_USER_INFO, userInfo);
                        msg = "ALLOW";
                    } else {
                        msg = "DENY";
                    }
                }
                break;
            case "CAPTCHA":
                msg = pos <= loginCAPTCHA + 30 && pos >= loginCAPTCHA - 30 ?
                        "ALLOW" : "DENY";
                break;
        }
        response.getWriter().write(msg);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
