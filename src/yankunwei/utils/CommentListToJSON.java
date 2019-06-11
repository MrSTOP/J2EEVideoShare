package yankunwei.utils;

import yankunwei.javabean.VideoCommentInfo;

import java.util.List;

public class CommentListToJSON {
    public static String videoCommentListToJSON(List<VideoCommentInfo> videoCommentInfoList, int currentPage, int totalPage) {
        StringBuilder builder = new StringBuilder("{\"count\":");
        builder.append(videoCommentInfoList.size());
        builder.append(", \"currentPage\":");
        builder.append(currentPage);
        builder.append(", \"totalPage\":");
        builder.append(totalPage);
        builder.append(", \"comment\":[");
        for (VideoCommentInfo videoCommentInfo : videoCommentInfoList) {
            builder.append("\"").append(videoCommentInfo.getVideoComment()).append("\",");
        }
        builder.deleteCharAt(builder.length() - 1);
        builder.append("],");
        builder.append("\"userName\":[");
        for (VideoCommentInfo videoCommentInfo: videoCommentInfoList) {
            builder.append("\"").append(videoCommentInfo.getUserName()).append("\",");
        }
        builder.deleteCharAt(builder.length() - 1);
        builder.append("]}");
        return builder.toString();
    }
}
