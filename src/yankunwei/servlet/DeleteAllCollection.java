package yankunwei.servlet;

import yankunwei.dao.CollectVideoDAO;
import yankunwei.javabean.UserInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteAllCollection",urlPatterns = "/DeleteAllCollection")
public class DeleteAllCollection extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = ((UserInfo)request.getSession().getAttribute("user")).getUID();
        CollectVideoDAO collectVideoDAO = new CollectVideoDAO();
        if(collectVideoDAO.deleteAllVideoCollect(uid))
        {
            request.setAttribute("info",true);
        }
        request.getRequestDispatcher("Collectvideo").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
