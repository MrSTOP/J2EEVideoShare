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
        if(userCollectVide == null)
        {
            request.getRequestDispatcher("Collection.jsp").forward(request,response);
        }
        else {
            List<UserCollectVideo> Listvideo = new ArrayList<>();
            String reqPageStr = request.getParameter("page");
            Integer pageNo = reqPageStr == null ? 1 : Integer.valueOf(reqPageStr);
            Listvideo = PageVideo.getpages(pageNo, 12, userCollectVide);
            request.setAttribute("PageCount", PageVideo.getPage());
            request.setAttribute("PageNo", pageNo);
            request.setAttribute("CollectList", Listvideo);
            request.getRequestDispatcher("Collection.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
