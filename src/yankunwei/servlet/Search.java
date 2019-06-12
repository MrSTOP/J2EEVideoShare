package yankunwei.servlet;

import yankunwei.dao.VideoDAOPlus;
import yankunwei.javabean.VideoInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Search", urlPatterns = "/Search")
public class Search extends HttpServlet {
    private static final int COUNT_PER_PAGE = 6;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchVideoName = request.getParameter("VideoName");
        VideoDAOPlus videoDAOPlus = new VideoDAOPlus();
        List<VideoInfo> searchResult = videoDAOPlus.getAllNameLikeVideo(searchVideoName);
        List<VideoInfo> searchResultPaged = new ArrayList<>();
        List<String> imgURLs = new ArrayList<>();
        int totalPage = searchResult.size() / COUNT_PER_PAGE;
        int reqPage = 0;
        totalPage += searchResult.size() % COUNT_PER_PAGE == 0 ? 0 : 1;
        String reqPageStr = request.getParameter("reqPage");
        reqPage = reqPageStr == null ? 1 : Integer.valueOf(reqPageStr);
        System.out.println("REQSearchPage:  " + reqPage);
        int arrayPage = reqPage - 1;
        for (int i = arrayPage * COUNT_PER_PAGE; i < arrayPage * COUNT_PER_PAGE + COUNT_PER_PAGE; i++) {
            if (i < searchResult.size()) {
                searchResultPaged.add(searchResult.get(i));
            } else {
                break;
            }
        }

        for (VideoInfo videoInfo: searchResultPaged) {
            String videoName = videoInfo.getVideoName();
            String imgURL = videoName.substring(0, videoName.lastIndexOf('.')) + ".jpg";
            imgURLs.add(imgURL);
        }
        request.setAttribute("reqPage", reqPage);
        request.setAttribute("VideoName", searchVideoName);
        request.setAttribute("pageCount", totalPage);
        request.setAttribute("searchResult", searchResultPaged);
        request.setAttribute("imgURLs", imgURLs);
        request.getRequestDispatcher("./searchResult.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
