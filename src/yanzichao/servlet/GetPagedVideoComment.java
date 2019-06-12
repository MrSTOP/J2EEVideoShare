package yanzichao.servlet;

import yankunwei.javabean.VideoCommentInfo;
import yankunwei.dao.VideoCommentInfoDAO;
import yankunwei.utils.CommentListToJSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetPagedVideoComment", urlPatterns = "/GetPagedVideoComment")
public class GetPagedVideoComment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VideoCommentInfoDAO videoCommentInfoDAO = new VideoCommentInfoDAO();
        List<VideoCommentInfo> videoCommentInfos = videoCommentInfoDAO.getAllVideoCommentByVideoID(request.getParameter("VideoID"));
        List<VideoCommentInfo> videoCommentInfoList = new ArrayList<>();
        int totalPage = videoCommentInfos.size() / 4;
        int reqPage = 0;
        totalPage += videoCommentInfos.size() % 4 == 0 ? 0 : 1;
        String reqPageStr = request.getParameter("reqPage");
        reqPage = reqPageStr == null ? 1 : Integer.valueOf(reqPageStr);
        System.out.println("REQPage:  " + reqPage);
        int arrayPage = reqPage - 1;
        for (int i = arrayPage * 4; i < arrayPage * 4 + 4; i++) {
            if (i < videoCommentInfos.size()) {
                videoCommentInfoList.add(videoCommentInfos.get(i));
            } else {
                break;
            }
        }
        request.setAttribute("reqPage", reqPage);
        request.setAttribute("pageCount", totalPage);
        request.setAttribute("VideoCommentList", videoCommentInfoList);
        response.getWriter().write(CommentListToJSON.videoCommentListToJSON(videoCommentInfoList, reqPage, totalPage));
//        System.out.println(videoCommentListToJSON(videoCommentInfoList, reqPage, totalPage));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
