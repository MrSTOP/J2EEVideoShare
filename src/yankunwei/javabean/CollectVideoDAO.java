package yankunwei.javabean;

import yankunwei.utils.DataBaseHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CollectVideoDAO implements ICollectVideoDAO{

    @Override
    public boolean addVideoCollect(int UID,String videoID, String videoname) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            if(SelectVideo(videoID,UID)) return false;
            String sql = "insert into collection values(?,?,?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,UID);
            preparedStatement.setString(2,videoID);
            preparedStatement.setString(3,videoname);
            return preparedStatement.executeUpdate() == 1;
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return false;
    }

    @Override
    public boolean deleteVideoCollect(int UID, String videoID) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "DELETE from collection where uid = ? and videoID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,UID);
            preparedStatement.setString(2,videoID);
            return preparedStatement.executeUpdate() == 1;
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return false;
    }

    @Override
    public List<UserCollectVideo> SelectAllVideoCollect(int UID) {
        List<UserCollectVideo> userCollectVideoList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "SELECT *from collection where uid = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,UID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                UserCollectVideo userCollectVideo = new UserCollectVideo();
                userCollectVideo.setUID(UID);
                userCollectVideo.setVideoID(resultSet.getString("VideoID"));
                userCollectVideo.setVideoName(resultSet.getString("VideoName"));
                userCollectVideoList.add(userCollectVideo);
            }
            return userCollectVideoList;
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return null;
    }

    @Override
    public boolean SelectVideo(String videoID,int UID) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "SELECT *from collection where VideoID = ? and UID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,videoID);
            preparedStatement.setInt(2,UID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next())
            {
                return true;
            }
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return false;
    }

    @Override
    public boolean deleteAllVideoCollect(int UID) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "DELETE from collection where uid = ? ";
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
}
