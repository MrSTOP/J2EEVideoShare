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
        List<UserHistoryinfo> userHistoryinfoList1 = new ArrayList<>();
        if (userHistoryinfoList == null)
        {
            request.setAttribute("PageCount",1);
            request.setAttribute("PageNo",1);
            request.setAttribute("FileList",userHistoryinfoList1);
            request.getRequestDispatcher("WatchHistory.jsp").forward(request,response);
        }
        else{
            String reqPageStr = request.getParameter("page");
            int PageSize = 9;
            int pageCount = userHistoryinfoList.size()/PageSize;
            pageCount += userHistoryinfoList.size() % PageSize == 0 ? 0 : 1;
            if(pageCount == 0) pageCount=1;
            for(int i =0;i < userHistoryinfoList.size();i++)
            {
                String videoName = userHistoryinfoList.get(i).getVideoname().substring(0,userHistoryinfoList.get(i).getVideoname().lastIndexOf('.'));
                userHistoryinfoList.get(i).setVideoname(videoName);
            }
            Integer pageNo = reqPageStr == null ? 1 : Integer.valueOf(reqPageStr);
            userHistoryinfoList1 = PageVideo.getpages(pageNo, PageSize, userHistoryinfoList);
            request.setAttribute("PageCount", pageCount);
            request.setAttribute("PageNo",pageNo);
            request.setAttribute("FileList",userHistoryinfoList1);
            request.getRequestDispatcher("WatchHistory.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
