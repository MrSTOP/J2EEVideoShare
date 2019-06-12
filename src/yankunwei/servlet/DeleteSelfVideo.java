package yankunwei.servlet;

import yankunwei.dao.IVideoDAO;
import yankunwei.dao.VideoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteSelfVideo",urlPatterns = "/DeleteSelfVideo")
public class DeleteSelfVideo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoID = request.getParameter("VideoID");
        IVideoDAO iVideoDAO = new VideoDAO();
        if(iVideoDAO.deleteVideo(videoID))
        request.setAttribute("info",true);
        request.getRequestDispatcher("ShowSelfVideo").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
