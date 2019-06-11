package yankunwei.servlet;

import yankunwei.javabean.HistoryvideoDAO;
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
        String info = "";
        HistoryvideoDAO historyvideoDAO = new HistoryvideoDAO();
        if(historyvideoDAO.deleteAll(uid))
        {
            info = "删除成功";
        }
        else {
            info = "删除失败";
        }
        request.getRequestDispatcher("ToWatchHist").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
