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
import java.io.PrintWriter;

@WebServlet(name = "ServletCheckPWD",urlPatterns = "/CheckPWD")
public class ServletCheckPWD extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        String password = request.getParameter("PWD");
        UserInfoDAO userInfoDAO = new UserInfoDAO();
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
        password = MD5Tool.MD5Encrypt(password);
        if(userInfoDAO.isPasswordRightByUserInfo(userInfo,password))
        {
            out.print("");
        }
        else out.print("密码错误");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
