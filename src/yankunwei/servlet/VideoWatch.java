package yankunwei.servlet;

import yankunwei.javabean.VideoDAO;
import yankunwei.javabean.VideoInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "VideoWatch", urlPatterns = "/VideoWatch")
public class VideoWatch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoID = request.getParameter("VideoID");
        VideoDAO videoDAO = new VideoDAO();
        VideoInfo videoInfo = videoDAO.SelectVideo(videoID);
        request.setAttribute("VideoID", videoInfo.getVideoID());
        request.setAttribute("VideoFileName", videoInfo.getVideoName());
        request.setAttribute("VideoAuthor", videoInfo.getVideoName());
        request.getRequestDispatcher("watchVideo.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
