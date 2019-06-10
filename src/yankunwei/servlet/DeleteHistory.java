package yankunwei.servlet;

import yankunwei.javabean.HistoryvideoDAO;
import yankunwei.javabean.UserHistoryinfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteHistory",urlPatterns = "/DeleteHistory")
public class DeleteHistory extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int UID = 3;
        //  int UID = ((UserInfo)request.getSession().getAttribute("user")).getUID();
        String videoID = request.getParameter("VideoID");
        UserHistoryinfo userHistoryinfo = new UserHistoryinfo();
        userHistoryinfo.setUID(UID);
        userHistoryinfo.setVideoID(videoID);
        String info = null;
        HistoryvideoDAO historyvideoDAO = new HistoryvideoDAO();
        if(historyvideoDAO.deleteHistory(userHistoryinfo))
            info = "删除成功";
        request.setAttribute("info",info);
        request.getRequestDispatcher("ToWatchHistory").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
