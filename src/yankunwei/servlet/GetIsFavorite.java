package yankunwei.servlet;

import yankunwei.javabean.CollectVideoDAO;
import yankunwei.javabean.ICollectVideoDAO;
import yankunwei.javabean.VideoDAO;

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
        ICollectVideoDAO collectVideoDAO = new CollectVideoDAO();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
