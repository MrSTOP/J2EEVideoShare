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
    public String addVideo(String videoID, String videoname) {
        String info = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            VideoInfo videoInfo = SelectVideo(videoID);
            if(videoInfo == null)
            {
                info = "已存在该视频";
            }
            else {
                String sql = "insert into video values(?,?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, videoID);
                preparedStatement.setString(2, videoname);
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
                return videoInfo;
            }
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return null;
    }
}
