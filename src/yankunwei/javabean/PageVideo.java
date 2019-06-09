package yankunwei.javabean;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

public class PageVideo {
    private static int page = 0;
    private static int reqPage = 1;
    public static List<String> getpages(int PageCount, int PageNo, int PageSize, File[] files){
        List<String> fileNames = new ArrayList<>();
        if (files != null) {
            reqPage = PageNo;
            page = files.length / PageSize;
            page += files.length % PageSize == 0 ? 0 : 1;
            int arrayPage = reqPage - 1;
            for (int i = arrayPage * PageSize; i < arrayPage * PageSize + PageSize; i++) {
                if (i < files.length) {
                    fileNames.add(files[i].getName());
                } else {
                    break;
                }
            }
        }
        return fileNames;
    }
}
