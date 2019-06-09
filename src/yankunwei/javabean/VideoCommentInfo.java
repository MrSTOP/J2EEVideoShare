package yankunwei.javabean;

public class VideoCommentInfo {
    private String videoID;
    private int UID;
    private String videoComment;
    private String userName;

    public VideoCommentInfo() {

    }

    public VideoCommentInfo(String videoID, int UID, String videoComment) {
        this.videoID = videoID;
        this.UID = UID;
        this.videoComment = videoComment;
    }

    public String getVideoID() {
        return videoID;
    }

    public void setVideoID(String videoID) {
        this.videoID = videoID;
    }

    public int getUID() {
        return UID;
    }

    public void setUID(int UID) {
        this.UID = UID;
    }

    public String getVideoComment() {
        return videoComment;
    }

    public void setVideoComment(String videoComment) {
        this.videoComment = videoComment;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
