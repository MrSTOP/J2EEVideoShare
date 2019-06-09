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
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Map;

@WebServlet(name = "RegistryProcess", urlPatterns = "/RegistryProcess")
public class RegistryProcess extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String userName = request.getParameter("userName");
        System.out.println("U: " + userName);
        String email = request.getParameter("email");
        String passwordEncrypted = MD5Tool.MD5Encrypt(request.getParameter("password"));
        String CAPTCHASubmited = request.getParameter("CAPTCHA");
        String sex = request.getParameter("sex");
        String birth = request.getParameter("birthYear") + '-' +
                request.getParameter("birthMonth") + '-' +
                request.getParameter("birthDay");
        String today = new Timestamp(Calendar.getInstance().getTimeInMillis()).toString().split("\\s+")[0];
        UserInfo userInfo = new UserInfo(userName,email, sex, birth, today, today, 0);
        UserInfoDAO userInfoDAO = new UserInfoDAO();
        if (userInfoDAO.addUserInfo(userInfo, passwordEncrypted)) {
            userInfoDAO.getUserInfoByUserName(userName, userInfo);
            request.getSession().setAttribute(LoginCheck.SESSION_ATTR_USER_INFO, userInfo);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/registry.jsp").forward(request, response);
        }
        System.out.println(userInfo);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
