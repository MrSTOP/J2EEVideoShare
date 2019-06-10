package yankunwei.javabean;

public class VideoInfo {
    private String VideoID;
    private String VideoName;
    private int UID;
    private int coin;
    public VideoInfo(){}
    public String getVideoID() {
        return VideoID;
    }
    public void setVideoID(String videoID) {
        VideoID = videoID;
    }
    public String getVideoName() {
        return VideoName;
    }
    public void setVideoName(String videoName) {
        VideoName = videoName;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public int getCoin() {
        return coin;
    }

    public void setCoin(int coin) {
        this.coin = coin;
    }
}
