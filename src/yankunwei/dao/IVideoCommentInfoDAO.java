package yankunwei.dao;

import yankunwei.javabean.VideoCommentInfo;

import java.util.List;

public interface IVideoCommentInfoDAO {
    boolean addVideoComment(VideoCommentInfo videoCommentInfo);

    boolean deleteVideoComment(VideoCommentInfo videoCommentInfo);

    List<VideoCommentInfo> getAllVideoCommentByVideoID(String videoID);

    List<VideoCommentInfo> getAllVideoComment();
}
