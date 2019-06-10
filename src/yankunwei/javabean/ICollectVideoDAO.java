package yankunwei.javabean;

import java.util.List;

public interface ICollectVideoDAO {
    boolean addVideoCollect(int UID,String videoID,String videoname);
    boolean deleteVideoCollect(int UID, String videoID);
    List<UserCollectVideo> SelectAllVideoCollect(int UID);
    boolean SelectVideo(String videoID, int UID);
    boolean deleteAllVideoCollect(int UID);
}
