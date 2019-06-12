package yankunwei.servlet;

import yankunwei.dao.IVideoDAO;
import yankunwei.dao.VideoDAO;
import yankunwei.javabean.VideoInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetVideoCoin", urlPatterns = "/GetVideoCoin")
public class GetVideoCoin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoID = request.getParameter("VideoID");
        IVideoDAO videoDAO = new VideoDAO();
        VideoInfo videoInfo = videoDAO.SelectVideo(videoID);
        response.getWriter().write("{ \"coin\":" + videoInfo.getCoin() +"}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
