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

@WebServlet(name = "ChangePassword",urlPatterns = "/ChangePassword")
public class ChangePassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String password = request.getParameter("password");
            password = MD5Tool.MD5Encrypt(password);
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
        UserInfoDAO userInfoDAO = new UserInfoDAO();
        userInfoDAO.updateUserInfo(userInfo,password);
        request.setAttribute("INFO","修改成功");
            request.getRequestDispatcher("ChangePwd.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
