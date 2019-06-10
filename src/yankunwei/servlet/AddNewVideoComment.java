package yankunwei.servlet;

import yankunwei.javabean.UserInfo;
import yankunwei.javabean.VideoCommentInfo;
import yankunwei.javabean.VideoCommentInfoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddNewVideoComment", urlPatterns = "/AddNewVideoComment")
public class AddNewVideoComment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoID = request.getParameter("VideoID");
        int UID = ((UserInfo) request.getSession().getAttribute(LoginCheck.SESSION_ATTR_USER_INFO)).getUID();
        String comment = request.getParameter("comment");
        VideoCommentInfo videoCommentInfo = new VideoCommentInfo(videoID, UID, comment);
        VideoCommentInfoDAO videoCommentInfoDAO = new VideoCommentInfoDAO();
        videoCommentInfoDAO.addVideoComment(videoCommentInfo);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
