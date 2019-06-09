package yankunwei.servlet;

import yankunwei.javabean.CollectVideoDAO;
import yankunwei.javabean.UserCollectVideo;
import yankunwei.javabean.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

@WebServlet(name = "Collectvideo",urlPatterns = "/Collectvideo")
public class Collectvideo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = ((UserInfo)(request.getSession().getAttribute("user"))).getUID();
        UserCollectVideo userCollectVide = null;
        CollectVideoDAO collectVideoDAO = new CollectVideoDAO();
        userCollectVide = collectVideoDAO.SelectAllVideoCollect(uid);
        if(userCollectVide == null)
        {
            request.getRequestDispatcher("Collection.jso").forward(request,response);
        }
        Iterator entries = userCollectVide.getVideos().entrySet().iterator();
        while(entries.hasNext())
        {
            Map.Entry entry = (Map.Entry) entries.next();
            String fileDir = request.getServletContext().getRealPath("") + "\\resources\\vides\\"+entry.getValue();

        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
