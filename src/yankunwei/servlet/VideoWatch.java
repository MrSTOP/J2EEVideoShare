package yankunwei.servlet;

import yankunwei.dao.*;
import yankunwei.javabean.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(name = "VideoWatch", urlPatterns = "/VideoWatch")
public class VideoWatch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoID = request.getParameter("VideoID");
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute(LoginCheck.SESSION_ATTR_USER_INFO);
        VideoDAO videoDAO = new VideoDAO();
        VideoInfo videoInfo = videoDAO.SelectVideo(videoID);
        IUserInfoDAO userInfoDAO = new UserInfoDAO();
        IHistoryvideoDAO historyvideoDAO = new HistoryvideoDAO();
        UserHistoryinfo userHistoryinfo = new UserHistoryinfo();
        userHistoryinfo.setUID(userInfo.getUID());
        userHistoryinfo.setVideoID(videoID);
        userHistoryinfo.setVideoname(videoInfo.getVideoName());
        userHistoryinfo.setDate(new Timestamp(System.currentTimeMillis()));
        historyvideoDAO.addHistory(userHistoryinfo);
        int authorUID = videoInfo.getUID();
        UserInfo authorInfo = userInfoDAO.getUserInfoByUID(authorUID);
        request.setAttribute("VideoID", videoInfo.getVideoID());
        request.setAttribute("VideoFileName", videoInfo.getVideoName());
        request.setAttribute("VideoAuthor", authorInfo.getUserName());
        request.getRequestDispatcher("watchVideo.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
