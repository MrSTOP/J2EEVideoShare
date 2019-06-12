package yankunwei.dao;

import yanzichao.javabean.VideoInfo;
import yankunwei.utils.DataBaseHelper;
import yanzichao.dao.VideoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VideoDAOPlus extends VideoDAO {

    public boolean updateVideoInfo(VideoInfo videoInfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "UPDATE video SET VideoName=?, VideoID=?, UID=?, Coin=? WHERE VideoID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, videoInfo.getVideoName());
            preparedStatement.setString(2, videoInfo.getVideoID());
            preparedStatement.setInt(3, videoInfo.getUID());
            preparedStatement.setInt(4, videoInfo.getCoin());
            preparedStatement.setString(4, videoInfo.getVideoID());
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return false;
    }

    public List<VideoInfo> getAllNameLikeVideo(String videoName) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<VideoInfo> videoInfoList = new ArrayList<>();
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT VideoID, VideoName, UID, Coin FROM video WHERE VideoName LIKE ?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, "%" + videoName + "%");
            System.out.println(preparedStatement.toString());
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                VideoInfo videoInfo = new VideoInfo();
                videoInfo.setVideoID(resultSet.getString("VideoID"));
                videoInfo.setVideoName(resultSet.getString("VideoName"));
                videoInfo.setUID(resultSet.getInt("UID"));
                videoInfo.setCoin(resultSet.getInt("Coin"));
                videoInfoList.add(videoInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
        return videoInfoList;
    }
}
