package yankunwei.servlet;

import yankunwei.javabean.CollectVideoDAO;
import yankunwei.javabean.PageVideo;
import yankunwei.javabean.UserCollectVideo;
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

@WebServlet(name = "Collectvideo",urlPatterns = "/Collectvideo")
public class Collectvideo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = ((UserInfo)request.getSession().getAttribute("user")).getUID();
        CollectVideoDAO collectVideoDAO = new CollectVideoDAO();
        List<UserCollectVideo> userCollectVide = collectVideoDAO.SelectAllVideoCollect(uid);
        List<UserCollectVideo> Listvideo = new ArrayList<>();
        if(userCollectVide == null)
        {
            request.setAttribute("PageCount", 1);
            request.setAttribute("PageNo", 1);
            request.setAttribute("CollectList", Listvideo);
            request.getRequestDispatcher("Collection.jsp").forward(request,response);
        }
        else {
            String reqPageStr = request.getParameter("page");
            for(int i =0;i < userCollectVide.size();i++)
            {
                String videoName = userCollectVide.get(i).getVideoName().substring(0,userCollectVide.get(i).getVideoName().lastIndexOf('.'));
                userCollectVide.get(i).setVideoName(videoName);
            }
            int PageSize = 12;
            int pageCount = userCollectVide.size()/PageSize;
            pageCount += userCollectVide.size() % PageSize == 0 ? 0 : 1;
            if(pageCount == 0) pageCount=1;
            Integer pageNo = reqPageStr == null ? 1 : Integer.valueOf(reqPageStr);
            Listvideo = PageVideo.getpages(pageNo, PageSize, userCollectVide);
            request.setAttribute("PageCount",pageCount);
            request.setAttribute("PageNo", pageNo);
            request.setAttribute("CollectList", Listvideo);
            request.getRequestDispatcher("Collection.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
