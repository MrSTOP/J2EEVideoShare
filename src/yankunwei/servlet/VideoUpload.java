package yankunwei.servlet;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Enumeration;

@WebServlet(name = "VideoUpload", urlPatterns = "/VideoUpload")
public class VideoUpload extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String IP = request.getRemoteAddr();
        String saveDir = this.getServletContext().getRealPath("") + "\\UploadFile";
        File saveDirectory = new File(saveDir);
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
            File serverFile = new File(saveDir + "\\" + fileName + System.currentTimeMillis());
            if (serverFile.exists()) {
                serverFile.delete();
            }
            file.renameTo(serverFile);
            String info = "文件上传成功！文件名为" + IP + "-" + fileName;
            request.setAttribute("Info", info);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
