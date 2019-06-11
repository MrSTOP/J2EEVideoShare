package yankunwei.servlet;

import yankunwei.javabean.CollectVideoDAO;
import yankunwei.javabean.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteCollect",urlPatterns = "/DeleteCollect")
public class DeleteCollect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         int UID = ((UserInfo)request.getSession().getAttribute("user")).getUID();
        String videoID = request.getParameter("VideoID");
        CollectVideoDAO collectVideoDAO = new CollectVideoDAO();
        if(collectVideoDAO.deleteVideoCollect(UID,videoID))
        request.setAttribute("info",true);
        request.getRequestDispatcher("Collectvideo").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
