package yankunwei.servlet;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

@WebServlet(name = "GetRegistryCAPTCHA", urlPatterns = "/GetRegistryCAPTCHA")
public class GetRegistryCAPTCHA extends HttpServlet {
    private static final String MAIL_HOST_NAME;
    private static final int SMTP_PORT;
    private static final String MAIL_AUTH_USERNAME;
    private static final String MAIL_AUTH_PASSWORD;

    static {
        Properties properties = new Properties();
        try {
            properties.load(GetRegistryCAPTCHA.class.getResourceAsStream("/yankunwei/Config.properties"));
            MAIL_HOST_NAME = properties.getProperty("MAIL_HOST_NAME");
            SMTP_PORT = Integer.valueOf(properties.getProperty("SMTP_PORT"));
            MAIL_AUTH_USERNAME = properties.getProperty("MAIL_AUTH_USERNAME");
            MAIL_AUTH_PASSWORD = properties.getProperty("MAIL_AUTH_PASSWORD");
        } catch (IOException e) {
            e.printStackTrace();
            IllegalStateException illegalStateException = new IllegalStateException("CAPTCHA Sender Initialize failed");
            illegalStateException.addSuppressed(e);
            throw illegalStateException;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        @SuppressWarnings("unchecked")
        Map<String, String> CAPTCHAMap = (Map<String, String>) request.getServletContext().getAttribute("CAPTCHAMap");
        String registryEmailAddr = request.getParameter("email");
        String CAPTCHA = generateCAPTCHA();
        if (CAPTCHAMap == null) {
            CAPTCHAMap = new HashMap<>();
            request.getServletContext().setAttribute("CAPTCHAMap", CAPTCHAMap);
        }
        CAPTCHAMap.put(registryEmailAddr, CAPTCHA);
        response.setCharacterEncoding("UTF-8");
        try {
            Email email = new SimpleEmail();
            email.setHostName(MAIL_HOST_NAME);
            email.setSmtpPort(SMTP_PORT);
            email.setAuthenticator(new DefaultAuthenticator(MAIL_AUTH_USERNAME, MAIL_AUTH_PASSWORD));
            email.setSSLOnConnect(true);
            email.setFrom(MAIL_AUTH_USERNAME);
            email.setSubject("验证码");
            email.setMsg("您收到这封邮件，是由于在 VideoShare 新用户注册页面使用了这个邮箱地址。"+
                                 "如果您并没有访问过 VideoShare ，或没有进行上述操作，请忽略这封邮件。"+
                                 "您不需要退订或进行其他进一步的操作。您的验证码是： " + CAPTCHA);
            email.addTo(registryEmailAddr);
            email.send();
        } catch (EmailException e) {
            response.getWriter().write("FAIL");
            e.printStackTrace();
        }
        response.getWriter().write("SUCCESS");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    private String generateCAPTCHA() {
        StringBuilder stringBuilder = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            stringBuilder.append(random.nextInt(10));
        }
        return stringBuilder.toString();
    }
}
