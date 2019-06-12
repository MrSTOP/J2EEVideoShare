package yanzichao.dao;

import yanzichao.javabean.UserHistoryinfo;

import java.util.List;

public interface IHistoryvideoDAO {
    String addHistory(UserHistoryinfo userHistoryinfo);
    boolean updateHistory(UserHistoryinfo userHistoryinfo);
    boolean deleteHistory(UserHistoryinfo userHistoryinfo);
    boolean deleteAll(int UID);
    UserHistoryinfo selectHistory(UserHistoryinfo userHistoryinfo);
    List<UserHistoryinfo> selectAllHistory(int UID);
}
