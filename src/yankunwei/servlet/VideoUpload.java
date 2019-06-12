package yankunwei.servlet;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import yankunwei.javabean.UserInfo;
import yankunwei.dao.VideoDAO;
import yankunwei.javabean.VideoInfo;
import yankunwei.utils.FFMPEGTool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.UUID;

@WebServlet(name = "VideoUpload", urlPatterns = "/VideoUpload")
public class VideoUpload extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String IP = request.getRemoteAddr();
        String saveDir = this.getServletContext().getRealPath("") + "\\resources\\videos";
        File saveDirectory = new File(saveDir);
       int UID = ((UserInfo)request.getSession().getAttribute("user")).getUID();
        VideoDAO videoDAO = new VideoDAO();
        VideoInfo videoInfo = new VideoInfo();
        videoInfo.setVideoID(UUID.randomUUID().toString());
        videoInfo.setUID(UID);
        videoInfo.setCoin(0);
        if (!saveDirectory.exists()) {
            saveDirectory.mkdir();
        }
        int maxPostSize = 1024 * 1024 * 1024;
        FileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy();
        MultipartRequest multipartRequest = new MultipartRequest(request, saveDir, maxPostSize, "UTF-8", fileRenamePolicy);
        Enumeration<String> files = multipartRequest.getFileNames();
        String name = files.nextElement();
        File file = multipartRequest.getFile(name);
        System.out.println(file.getName());
        if (file != null) {
            String fileName = file.getName();
            File serverFile = new File(saveDir + "\\" +System.currentTimeMillis() + "-" + fileName);
            if (serverFile.exists()) {
                serverFile.delete();
            }
            file.renameTo(serverFile);
            videoInfo.setVideoName(fileName);
            videoDAO.addVideo(videoInfo);
            fileName = fileName.substring(0,fileName.lastIndexOf("."));
            String photoDir = this.getServletContext().getRealPath("") + "\\resources\\img\\covers\\"+fileName+".jpg";
            FFMPEGTool.getInstance().screenImageRandom(serverFile.getPath(),photoDir);
            request.setAttribute("Info", true);
            System.out.println("FILE NOT NULL");
            request.getRequestDispatcher("uploadVideo.jsp").forward(request,response);
        }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
