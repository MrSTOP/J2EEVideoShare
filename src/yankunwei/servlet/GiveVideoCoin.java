package yankunwei.servlet;

import yankunwei.dao.IUserInfoDAO;
import yankunwei.dao.UserInfoDAO;
import yanzichao.dao.VideoDAO;
import yankunwei.javabean.*;
import yanzichao.javabean.VideoInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GiveVideoCoin", urlPatterns = "/GiveVideoCoin")
public class GiveVideoCoin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoID = request.getParameter("VideoID");
        VideoDAO videoDAO = new VideoDAO();
        IUserInfoDAO userInfoDAO = new UserInfoDAO();
        UserInfo userInfo = ((UserInfo) request.getSession().getAttribute(LoginCheck.SESSION_ATTR_USER_INFO));
        VideoInfo videoInfo = videoDAO.SelectVideo(videoID);
        UserInfo UPInfo = userInfoDAO.getUserInfoByUID(videoInfo.getUID());
        userInfoDAO.giveVideoCoin(userInfo, videoID, UPInfo);
        response.getWriter().write("{ \"coin\":" + videoDAO.SelectVideo(videoID).getCoin() +"}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
