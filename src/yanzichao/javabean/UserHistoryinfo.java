package yanzichao.javabean;

import java.sql.Timestamp;

public class UserHistoryinfo {
    private int UID;
    private String videoID;
    private Timestamp Date = new Timestamp(System.currentTimeMillis());
    private String videoname;
    public UserHistoryinfo(){}

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public String getVideoID() {
        return videoID;
    }

    public void setVideoID(String videoID) {
        this.videoID = videoID;
    }

    public Timestamp getDate() {
        return Date;
    }

    public void setDate(Timestamp date) {
        Date = date;
    }

    public String getVideoname() {
        return videoname;
    }

    public void setVideoname(String videoname) {
        this.videoname = videoname;
    }
}
