package yankunwei.javabean;

public interface ICollectVideoDAO {
    boolean addVideoCollect(int UID,String videoID);
    boolean deleteVideoCollect(int UID, String videoID);
    UserCollectVideo SelectAllVideoCollect(int UID);
}
