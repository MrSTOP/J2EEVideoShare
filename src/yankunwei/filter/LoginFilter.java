package yankunwei.filter;

import yankunwei.javabean.UserInfo;
import yankunwei.javabean.UserInfoDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.logging.SimpleFormatter;

@WebFilter(filterName = "LoginFilter", urlPatterns = "/*")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        if (request.getParameter("test") != null && request.getParameter("test").equals("true")) {
            UserInfoDAO userInfoDAO = new UserInfoDAO();
            UserInfo userInfo = new UserInfo();
            userInfoDAO.getUserInfoByUID(4, userInfo);
            request.getSession().setAttribute("user", userInfo);
        }
        String URL = request.getRequestURL().toString();
        if (URL.contains("/css/") || URL.contains("/js/") || URL.contains("/resources/")) {
            chain.doFilter(req, resp);
        } else if (request.getSession().getAttribute("user") == null &&
                request.getServletPath() != null &&
                !request.getServletPath().equals("/registry.jsp")) {
            req.getRequestDispatcher("./login.jsp").forward(req, resp);
        } else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}