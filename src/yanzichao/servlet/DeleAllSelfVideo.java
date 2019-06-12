package yanzichao.servlet;

import yanzichao.dao.IVideoDAO;
import yankunwei.javabean.UserInfo;
import yanzichao.dao.VideoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleAllSelfVideo",urlPatterns = "/DeleAllSelfVideo")
public class DeleAllSelfVideo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = ((UserInfo)request.getSession().getAttribute("user")).getUID();
        IVideoDAO videoDAO = new VideoDAO();
        if(videoDAO.deleteAllVideo(uid))
        {
            request.setAttribute("info",true);
        }
        request.getRequestDispatcher("ShowSelfVideo").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
