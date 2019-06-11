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

@WebServlet(name = "ServletIndex",urlPatterns="/ServletIndex")
public class ServletIndex extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VideoDAO videoDAO = new VideoDAO();
        List<VideoInfo> videoList = videoDAO.SelectVideos();
        List<VideoInfo> Listvideo = new ArrayList<>();
        List<String> url = new ArrayList<>();
        if(videoList == null)
        {
            request.setAttribute("PageCount", 1);
            request.setAttribute("PageNo", 1);
            request.setAttribute("VideoList", Listvideo);
            request.setAttribute("URLS",url);
            request.getRequestDispatcher("index.jsp").forward(request,response);

        }
        else {
            String reqPageStr = request.getParameter("page");
            Integer pageNo = reqPageStr == null ? 1 : Integer.valueOf(reqPageStr);
            int PageSize = 12;
            int pageCount = videoList.size()/PageSize;
            pageCount += videoList.size() % PageSize == 0 ? 0 : 1;
            Listvideo = PageVideo.getpages(pageNo, PageSize, videoList);
            for(int i =0;i < Listvideo.size();i++)
            {
                String videoName = Listvideo.get(i).getVideoName().substring(0,Listvideo.get(i).getVideoName().lastIndexOf('.'));
                Listvideo.get(i).setVideoName(videoName);
                url.add("./resources/img/cover/"+ videoName);
            }
            request.setAttribute("PageCount",pageCount);
            request.setAttribute("PageNo", pageNo);
            request.setAttribute("VideoList", Listvideo);
            request.setAttribute("URLS",url);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
