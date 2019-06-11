package yankunwei.javabean;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

public class PageVideo {

    public static <T> List<T> getpages(int PageNo, int PageSize, List<T> Videolist){
        List<T> videolists = new ArrayList<>();
        int page;
        int reqPage = 1;
        if (Videolist != null) {
            reqPage = PageNo;
            page = Videolist.size() / PageSize;
            page += Videolist.size() % PageSize == 0 ? 0 : 1;
            int arrayPage = reqPage - 1;
            for (int i = arrayPage * PageSize; i < arrayPage * PageSize + PageSize; i++) {
                if (i < Videolist.size()) {
                    videolists.add(Videolist.get(i));
                } else {
                    break;
                }
            }
        }
        return videolists;
    }
}
