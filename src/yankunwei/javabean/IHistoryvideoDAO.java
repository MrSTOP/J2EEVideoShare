package yankunwei.javabean;

import java.util.List;

public interface IHistoryvideoDAO {
    String addHistory(UserHistoryinfo userHistoryinfo);
    boolean updateHistory(UserHistoryinfo userHistoryinfo);
    boolean deleteHistory(UserHistoryinfo userHistoryinfo);
    List<UserHistoryinfo> selectAllHistory(int UID);
}
