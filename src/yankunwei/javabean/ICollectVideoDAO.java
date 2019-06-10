package yankunwei.javabean;

public interface ICollectVideoDAO {
    boolean addVideoCollect(int UID,String videoID,String videoname);
    boolean deleteVideoCollect(int UID, String videoID);
    UserCollectVideo SelectAllVideoCollect(int UID);
    boolean SelectVideo(String videoID, int UID);
}
