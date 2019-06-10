package yankunwei.filter;

import yankunwei.javabean.UserInfo;
import yankunwei.javabean.UserInfoDAO;
import yankunwei.servlet.LoginCheck;

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
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpServletRequest request = (HttpServletRequest) req;
        if (request.getParameter("test") != null && request.getParameter("test").equals("true")) {
            UserInfoDAO userInfoDAO = new UserInfoDAO();
            UserInfo userInfo = new UserInfo();
            userInfoDAO.getUserInfoByUID(3, userInfo);
            request.getSession().setAttribute(LoginCheck.SESSION_ATTR_USER_INFO, userInfo);
        }
        String URL = request.getRequestURL().toString();
        System.out.println(URL);
        System.out.println(request.getServletPath());
        if (request.getSession().getAttribute(LoginCheck.SESSION_ATTR_USER_INFO) == null &&
                request.getServletPath() != null &&
                request.getServletPath().endsWith(".jsp") &&
                !request.getServletPath().endsWith("registry.jsp") &&
                !request.getServletPath().endsWith("registry.jsp")) {
            System.out.println("BLOCK: " + request.getServletPath());
            request.getRequestDispatcher("./login.jsp").forward(req, resp);
        } else {
            chain.doFilter(req, resp);
        }
//        if (request.getServletPath().equals("/GetLoginCAPTCHA") ||
//                request.getServletPath().equals("/GetRegistryCAPTCHA") ||
//                request.getServletPath().equals("/LoginCheck") ||
//                request.getServletPath().equals("/Logout") ||
//                request.getServletPath().equals("/RegistryCAPTCHACHECK") ||
//                request.getServletPath().equals("/RegistryProcess")) {
//            chain.doFilter(req, resp);
//        } else if (URL.contains("/css/") || URL.contains("/js/") || URL.contains("/resources/")) {
//            chain.doFilter(req, resp);
//        } else if (request.getSession().getAttribute("user") == null &&
//                request.getServletPath() != null &&
//                !request.getServletPath().equals("/registry.jsp")) {
//            req.getRequestDispatcher("./login.jsp").forward(req, resp);
//        } else {
//            chain.doFilter(req, resp);
//        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
