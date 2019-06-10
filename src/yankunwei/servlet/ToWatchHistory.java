package yankunwei.servlet;

import yankunwei.javabean.HistoryvideoDAO;
import yankunwei.javabean.PageVideo;
import yankunwei.javabean.UserHistoryinfo;
import yankunwei.javabean.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ToWatchHistory", urlPatterns = "/ToWatchHistory")
public class ToWatchHistory extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // int UID = ((UserInfo)request.getSession().getAttribute("user")).getUID();
        int UID = 3;
        List<UserHistoryinfo> userHistoryinfoList = new ArrayList<>();
        HistoryvideoDAO  historyvideoDAO = new HistoryvideoDAO();
        userHistoryinfoList = historyvideoDAO.selectAllHistory(UID);
        if (userHistoryinfoList == null)
        {
            request.getRequestDispatcher("WatchHistory.jsp").forward(request,response);
        }
        else{
            List<String> files1 = new ArrayList<>();
            for(int i = 0; i < userHistoryinfoList.size(); i++)
            {
                files1.add(userHistoryinfoList.get(i).getVideoname());
            }
            String[] files = new String[files1.size()];
            files1.toArray(files);
            String reqPageStr = request.getParameter("page");
            Integer pageNo = reqPageStr == null ? 1 : Integer.valueOf(reqPageStr);
            List<String> filenames = PageVideo.getpages(pageNo, 12, files);
            request.setAttribute("PageCount", PageVideo.getPage());
            request.setAttribute("PageNo",pageNo);
            request.setAttribute("FileList",filenames);
            request.getRequestDispatcher("WatchHistory.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
