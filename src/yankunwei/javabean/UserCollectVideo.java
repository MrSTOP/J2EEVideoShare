package yankunwei.javabean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserCollectVideo {
    private int UID;
    private Map<String,String> Videos = new HashMap<>();
    public UserCollectVideo(){}
    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }
    public Map<String, String> getVideos() {
        return Videos;
    }

    public void setVideos(String videoID, String videoname) {
        Videos.put(videoID,videoname);
    }

}
