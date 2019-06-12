package yanzichao.servlet;

import yankunwei.javabean.UserInfo;
import yankunwei.dao.UserInfoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ToPersonalInfo",urlPatterns = "/ToPersonalInfo")
public class ToPersonalInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
        userInfo.setUserName(request.getParameter("username"));
        userInfo.setSex(request.getParameter("sex"));
        String birth = request.getParameter("Year")+'-'+request.getParameter("Month")+'-'+request.getParameter("Day");
        userInfo.setBirth(birth);
        UserInfoDAO userInfoDAO = new UserInfoDAO();
        userInfoDAO.updateUserInfo(userInfo);
        request.getRequestDispatcher("PersonalInfo.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
