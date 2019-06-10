package yankunwei.servlet;

import yankunwei.javabean.IUserInfoDAO;
import yankunwei.javabean.UserInfoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserExistCheck", urlPatterns = "/UserExistCheck")
public class UserExistCheck extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String msg = "DENY";
        IUserInfoDAO userInfoDAO = new UserInfoDAO();
        switch (type) {
            case "UserName":
                msg = userInfoDAO.isUserNameExist(request.getParameter("userName")) ?
                        "DENY" : "ALLOW";
                break;
            case "Email":
                msg = userInfoDAO.isEmailExist(request.getParameter("email")) ?
                        "DENY" : "ALLOW";
                break;
        }
        response.getWriter().write(msg);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
