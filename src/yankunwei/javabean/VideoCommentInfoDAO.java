package yankunwei.javabean;

import yankunwei.utils.DataBaseHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VideoCommentInfoDAO implements IVideoCommentInfoDAO {
    @Override
    public boolean addVideoComment(VideoCommentInfo videoCommentInfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "INSERT INTO videocomment(VideoID, UID, comment) values (?, ?, ?)";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, videoCommentInfo.getVideoID());
            preparedStatement.setInt(2, videoCommentInfo.getUID());
            preparedStatement.setString(3, videoCommentInfo.getVideoComment());
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean deleteVideoComment(VideoCommentInfo videoCommentInfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "DELETE FROM videocomment WHERE VideoID=? AND UID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, videoCommentInfo.getVideoID());
            preparedStatement.setInt(2, videoCommentInfo.getUID());
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public List<VideoCommentInfo> getAllVideoCommentByVideoID(String videoID) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<VideoCommentInfo> videoCommentInfos = new ArrayList<>();
        UserInfoDAO userInfoDAO = new UserInfoDAO();
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT * FROM videocomment WHERE VideoID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, videoID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                VideoCommentInfo videoCommentInfo = new VideoCommentInfo(
                        resultSet.getString("VideoID"),
                        resultSet.getInt("UID"),
                        resultSet.getString("Comment")
                );
                UserInfo userInfo = new UserInfo();
                userInfoDAO.getUserInfoByUID(videoCommentInfo.getUID(), userInfo);
                videoCommentInfo.setUserName(userInfo.getUserName());
                videoCommentInfos.add(videoCommentInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return videoCommentInfos;
    }

    @Override
    public List<VideoCommentInfo> getAllVideoComment() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<VideoCommentInfo> videoCommentInfos = new ArrayList<>();
        UserInfoDAO userInfoDAO = new UserInfoDAO();
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT * FROM videocomment";
            preparedStatement = connection.prepareStatement(SQL);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                VideoCommentInfo videoCommentInfo = new VideoCommentInfo(
                        resultSet.getString("VideoID"),
                        resultSet.getInt("UID"),
                        resultSet.getString("Comment")
                );
                UserInfo userInfo = new UserInfo();
                userInfoDAO.getUserInfoByUID(videoCommentInfo.getUID(), userInfo);
                videoCommentInfo.setUserName(userInfo.getUserName());
                videoCommentInfos.add(videoCommentInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return videoCommentInfos;
    }
}
