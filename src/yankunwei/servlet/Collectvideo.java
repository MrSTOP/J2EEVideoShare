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
       // int uid = ((UserInfo)request.getSession().getAttribute("user")).getUID();
        int uid = 3;
        UserCollectVideo userCollectVide = null;
        CollectVideoDAO collectVideoDAO = new CollectVideoDAO();
        userCollectVide = collectVideoDAO.SelectAllVideoCollect(uid);
        if(userCollectVide == null)
        {
            request.getRequestDispatcher("Collection.jsp").forward(request,response);
        }
        Iterator entries = userCollectVide.getVideos().entrySet().iterator();
        List<String> files1 = new ArrayList<>();
        while(entries.hasNext())
        {
            Map.Entry entry = (Map.Entry) entries.next();
            files1.add((String) entry.getValue());
        }
        String[] files = new String[files1.size()];
        files1.toArray(files);
        String reqPageStr = request.getParameter("page");
        Integer pageNo = reqPageStr == null ? 1 : Integer.valueOf(reqPageStr);
        List<String> filenames = PageVideo.getpages(pageNo, 12, files);
        request.setAttribute("PageCount", PageVideo.getPage());
        request.setAttribute("PageNo",pageNo);
        request.setAttribute("FileList",filenames);
        request.getRequestDispatcher("Collection.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
