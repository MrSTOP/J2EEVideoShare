package yanzichao.servlet;

import yanzichao.dao.HistoryvideoDAO;
import yankunwei.javabean.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteAllHistory",urlPatterns = "/DeleteAllHistory")
public class DeleteAllHistory extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = ((UserInfo)request.getSession().getAttribute("user")).getUID();
        HistoryvideoDAO historyvideoDAO = new HistoryvideoDAO();
        if(historyvideoDAO.deleteAll(uid))
        {
           request.setAttribute("info",true);
        }
        request.getRequestDispatcher("ToWatchHistory").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}