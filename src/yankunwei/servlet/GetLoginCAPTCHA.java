package yankunwei.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "GetLoginCAPTCHA", urlPatterns = "/GetLoginCAPTCHA")
public class GetLoginCAPTCHA extends HttpServlet {
    public static final String LOGIN_CAPTCHA_ATTR_NAME = "LoginCAPTHCAMap";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int loginCAPTCHA;
        Random random = new Random();
        Properties properties = new Properties();
        List<File> CAPTCHAImgs = new ArrayList<>();
        String dir = request.getServletContext().getRealPath("") + "\\resources\\img\\CAPTCHA";
        properties.load(new FileInputStream(dir + "\\CAPTCHAInfo.properties"));
        File file = new File(dir);
        File[] imgs = file.listFiles();
        if (imgs != null) {
            for (File img : imgs) {
                if (img.getName().matches("^([a-zA-Z]+\\.png)$|^(([a-zA-Z]+_[a-zA-Z]+)\\.png)$")) {
                    CAPTCHAImgs.add(img);
                }
            }
        }
        int a = random.nextInt(CAPTCHAImgs.size());
        String backGround = CAPTCHAImgs.get(a).getName();
        String foreGround = backGround.substring(0, backGround.lastIndexOf('.')) + "_.png";
        loginCAPTCHA = Integer.parseInt(properties.getProperty(backGround.split("\\.")[0]));
//        for (File str: CAPTCHAImgs) {
//            System.out.println(str.getName());
//            System.out.println("FILE: " + str.getName() + " Px: " + Integer.parseInt(properties.getProperty(str.getName().split("\\.")[0])));
//        }
        request.getSession().setAttribute(LOGIN_CAPTCHA_ATTR_NAME, loginCAPTCHA);
        response.getWriter().write("{\"foreGround\": \"" + foreGround + "\", \"backGround\": \"" + backGround + "\"}");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
