package yankunwei.servlet;

import yankunwei.dao.CollectVideoDAO;
import yankunwei.dao.ICollectVideoDAO;
import yankunwei.javabean.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetIsFavorite", urlPatterns = "/GetIsFavorite")
public class GetIsFavorite extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoID = request.getParameter("VideoID");
        int UID = ((UserInfo) request.getSession().getAttribute(LoginCheck.SESSION_ATTR_USER_INFO)).getUID();
        ICollectVideoDAO collectVideoDAO = new CollectVideoDAO();
        boolean isFaovrite = collectVideoDAO.SelectVideo(videoID, UID);
        response.getWriter().write("{\"favorite\":" + isFaovrite + "}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
