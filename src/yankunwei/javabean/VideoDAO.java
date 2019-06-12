package yankunwei.javabean;

import yankunwei.utils.DataBaseHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VideoDAO implements IVideoDAO{

    @Override
    public String addVideo(VideoInfo vInfo) {
        String info = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            VideoInfo videoInfo = SelectVideo(vInfo.getVideoID());
            if(videoInfo != null)
            {
                info = "已存在该视频";
            }
            else {
                String sql = "insert into video(VideoID, VideoName, UID, Coin) values(?,?, ?, ?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, vInfo.getVideoID());
                preparedStatement.setString(2, vInfo.getVideoName());
                preparedStatement.setInt(3, vInfo.getUID());
                preparedStatement.setInt(4, vInfo.getCoin());
                if (preparedStatement.executeUpdate() != 0) {
                    info = "添加成功";
                } else {
                    info = "添加失败";
                }
            }
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return info;
    }

    @Override
    public boolean updateVideo(String videoID, String videoname) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "UPDATE video SET VideoName=? WHERE VideoID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, videoname);
            preparedStatement.setString(2, videoID);
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean deleteVideo(String videoID) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "DELETE from video where VideoID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,videoID);
            return preparedStatement.executeUpdate() == 1;
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return false;
    }

    @Override
    public List<VideoInfo> SelectVideos() {
       List<VideoInfo> videoInfoList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "SELECT *from video";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                VideoInfo videoInfo = new VideoInfo();
                videoInfo.setVideoID(resultSet.getString("VideoID"));
                videoInfo.setVideoName(resultSet.getString("VideoName"));
                videoInfo.setUID(resultSet.getInt("UID"));
                videoInfo.setCoin(resultSet.getInt("Coin"));
                videoInfoList.add(videoInfo);
            }
            return videoInfoList;
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return null;
    }

    @Override
    public VideoInfo SelectVideo(String videoID) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "SELECT *from video where VideoID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,videoID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next())
            {
                VideoInfo videoInfo = new VideoInfo();
                videoInfo.setVideoID(resultSet.getString("VideoID"));
                videoInfo.setVideoName(resultSet.getString("VideoName"));
                videoInfo.setUID(resultSet.getInt("UID"));
                videoInfo.setCoin(resultSet.getInt("Coin"));
                return videoInfo;
            }
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return null;
    }

    @Override
    public boolean deleteAllVideo(int UID) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "DELETE from video where UID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,UID);
            return preparedStatement.executeUpdate() != 0;
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return false;
    }

    @Override
    public List<VideoInfo> SelectSelfVideos(int UID) {
        List<VideoInfo> videoInfoList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "SELECT *from video where UID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,UID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                VideoInfo videoInfo = new VideoInfo();
                videoInfo.setVideoID(resultSet.getString("VideoID"));
                videoInfo.setVideoName(resultSet.getString("VideoName"));
                videoInfo.setUID(resultSet.getInt("UID"));
                videoInfo.setCoin(resultSet.getInt("Coin"));
                videoInfoList.add(videoInfo);
            }
            return videoInfoList;
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return null;
    }

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

}
