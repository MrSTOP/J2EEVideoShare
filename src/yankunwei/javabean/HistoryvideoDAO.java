package yankunwei.javabean;

import yankunwei.utils.DataBaseHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HistoryvideoDAO implements IHistoryvideoDAO{
    @Override
    public String addHistory(UserHistoryinfo userHistoryinfo) {
        String info = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            UserHistoryinfo userHistoryinfo1 = selectHistory(userHistoryinfo);
            if(userHistoryinfo1 != null)
            {
                info = "已存在该视频";
                updateHistory(userHistoryinfo);
            }
            else {
                String sql = "insert into video values(?,?,?,?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, userHistoryinfo.getUID());
                preparedStatement.setString(2, userHistoryinfo.getVideoID());
                preparedStatement.setTimestamp(3, userHistoryinfo.getDate());
                preparedStatement.setString(4, userHistoryinfo.getVideoname());
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
    public boolean updateHistory(UserHistoryinfo userHistoryinfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "UPDATE video SET LastDay =? WHERE VideoID=? and UID = ?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setTimestamp(1, userHistoryinfo.getDate());
            preparedStatement.setString(2, userHistoryinfo.getVideoID());
            preparedStatement.setInt(3, userHistoryinfo.getUID());
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean deleteHistory(UserHistoryinfo userHistoryinfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "DELETE from video where VideoID = ? and UID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,userHistoryinfo.getVideoID());
            preparedStatement.setInt(2,userHistoryinfo.getUID());
            return preparedStatement.executeUpdate() == 1;
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return false;
    }

    @Override
    public boolean deleteAll(int UID) {
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
    public UserHistoryinfo selectHistory(UserHistoryinfo userHistoryinfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "SELECT *from video where VideoID = ? and UID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,userHistoryinfo.getVideoID());
            preparedStatement.setInt(1,userHistoryinfo.getUID());
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next())
            {
                userHistoryinfo.setVideoID(resultSet.getString("VideoID"));
                userHistoryinfo.setDate(resultSet.getTimestamp("LastDay"));
                userHistoryinfo.setUID(resultSet.getInt("UID"));
                userHistoryinfo.setVideoname(resultSet.getString("VideoName"));
                return userHistoryinfo;
            }
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return null;
    }

    @Override
    public List<UserHistoryinfo> selectAllHistory(int UID) {
        List<UserHistoryinfo> userHistoryinfos = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DataBaseHelper.getInstance().getConnection();
            String sql = "SELECT *from watchhistory where UID = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,UID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next())
            {
                UserHistoryinfo userHistoryinfo = new UserHistoryinfo();
                userHistoryinfo.setVideoID(resultSet.getString("VideoID"));
                userHistoryinfo.setDate(resultSet.getTimestamp("LastDay"));
                userHistoryinfo.setUID(resultSet.getInt("UID"));
                userHistoryinfo.setVideoname(resultSet.getString("VideoName"));
                userHistoryinfos.add(userHistoryinfo);
            }
            return userHistoryinfos;
        }catch (SQLException e){
            System.out.println(e);
        }finally {
            DataBaseHelper.getInstance().closeResource(resultSet,preparedStatement,connection);
        }
        return null;
    }
}
