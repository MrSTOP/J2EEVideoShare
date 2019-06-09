package yankunwei.javabean;

import yankunwei.utils.DataBaseHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CollectVideoDAO implements ICollectVideoDAO{

    @Override
    public boolean addVideoCollect(int UID,String videoID) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "insert into collection values(?,?)";
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
    public UserCollectVideo SelectAllVideoCollect(int UID) {
        UserCollectVideo userCollectVideo = new UserCollectVideo();
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
                userCollectVideo.setUID(UID);
                userCollectVideo.setVideoIDs(resultSet.getString("videoID"));
            }
            return userCollectVideo;
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return null;
    }
}
