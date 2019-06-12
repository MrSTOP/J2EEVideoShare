package yankunwei.servlet;

import yankunwei.javabean.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShowSelfVideo",urlPatterns = "/ShowSelfVideo")
public class ShowSelfVideo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = ((UserInfo)request.getSession().getAttribute("user")).getUID();
        VideoDAO videoDAO = new VideoDAO();
        List<VideoInfo> videoInfoList = videoDAO.SelectSelfVideos(uid);
        List<VideoInfo> Listvideo = new ArrayList<>();
        if(videoInfoList == null)
        {
            request.setAttribute("PageCount", 1);
            request.setAttribute("PageNo", 1);
            request.setAttribute("CollectList", Listvideo);
            request.getRequestDispatcher("Collection.jsp").forward(request,response);
        }
        else {
            String reqPageStr = request.getParameter("page");
            for(int i =0;i < videoInfoList.size();i++)
            {
                String videoName = videoInfoList.get(i).getVideoName().substring(0,videoInfoList.get(i).getVideoName().lastIndexOf('.'));
                videoInfoList.get(i).setVideoName(videoName);
            }
            int PageSize = 12;
            int pageCount = videoInfoList.size()/PageSize;
            pageCount += videoInfoList.size() % PageSize == 0 ? 0 : 1;
            if(pageCount == 0) pageCount=1;
            Integer pageNo = reqPageStr == null ? 1 : Integer.valueOf(reqPageStr);
            Listvideo = PageVideo.getpages(pageNo, PageSize, videoInfoList);
            request.setAttribute("PageCount",pageCount);
            request.setAttribute("PageNo", pageNo);
            request.setAttribute("CollectList", Listvideo);
            request.getRequestDispatcher("DeleteSelfVideo.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
