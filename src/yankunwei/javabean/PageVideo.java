package yankunwei.javabean;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

public class PageVideo {
    private static int page = 0;
    private static int reqPage = 1;

    public static int getPage() {
        return page;
    }

    public static List<String> getpages(int PageNo, int PageSize, String[] filename){
        List<String> fileNames = new ArrayList<>();
        if (filename != null) {
            reqPage = PageNo;
            page = filename.length / PageSize;
            page += filename.length % PageSize == 0 ? 0 : 1;
            int arrayPage = reqPage - 1;
            for (int i = arrayPage * PageSize; i < arrayPage * PageSize + PageSize; i++) {
                if (i < filename.length) {
                    fileNames.add(filename[i]);
                } else {
                    break;
                }
            }
        }
        return fileNames;
    }
}
