package yankunwei.javabean;

import java.util.List;

public interface IVideoDAO {
     String addVideo(VideoInfo videoInfo);
     boolean updateVideo(String videoID,String videoname);
     boolean deleteVideo(String videoID);
     List<VideoInfo> SelectVideos();
     VideoInfo SelectVideo(String videoID);
}
