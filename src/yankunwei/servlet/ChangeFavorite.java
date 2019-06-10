package yankunwei.servlet;

import yankunwei.javabean.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangeFavorite", urlPatterns = "/ChangeFavorite")
public class ChangeFavorite extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoID = request.getParameter("VideoID");
        int UID = ((UserInfo) request.getSession().getAttribute(LoginCheck.SESSION_ATTR_USER_INFO)).getUID();
        ICollectVideoDAO collectVideoDAO = new CollectVideoDAO();
        IVideoDAO videoDAO = new VideoDAO();
        String videoName = videoDAO.SelectVideo(videoID).getVideoName();
        boolean isFavorite = collectVideoDAO.SelectVideo(videoID, UID);
        if (isFavorite) {
            collectVideoDAO.deleteVideoCollect(UID, videoID);
        } else {
            collectVideoDAO.addVideoCollect(UID, videoID, videoName);
        }
        response.getWriter().write("{\"favorite\":" + !isFavorite + "}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
