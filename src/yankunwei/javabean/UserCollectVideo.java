package yankunwei.javabean;

import java.util.ArrayList;
import java.util.List;

public class UserCollectVideo {
    private int UID;
    private List<String>VideoIDs = new ArrayList<>();
    public UserCollectVideo(){}
    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public List<String> getVideoIDs() {
        return VideoIDs;
    }

    public void setVideoIDs(String videoID) {
        VideoIDs.add(videoID);
    }
}
