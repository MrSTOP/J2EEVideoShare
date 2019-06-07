package yankunwei.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "CAPTCHACheck", urlPatterns = "/CAPTCHACheck")
public class CAPTCHACheck extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String CAPTCHASubmit = request.getParameter("CAPTCHA");
        @SuppressWarnings("unchecked")
        Map<String, String> CAPTCHAMap = (Map<String, String>) this.getServletContext().getAttribute("CAPTCHAMap");
        if (CAPTCHAMap != null &&
                CAPTCHAMap.get(email) != null &&
                CAPTCHAMap.get(email).equals(CAPTCHASubmit)) {
            response.getWriter().write("ALLOW");
        } else {
            response.getWriter().write("DENY");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
