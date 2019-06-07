package yankunwei.javabean;

import yankunwei.utils.DataBaseHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserInfoDAO implements IUserInfoDAO {

    @Override
    public boolean addUserInfo(UserInfo userInfo, String passwordEncrypt) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "INSERT INTO user(username, password, sex, birth, email, regday, lastlogin, Coin) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, userInfo.getUserName());
            preparedStatement.setString(2, passwordEncrypt);
            preparedStatement.setString(3, userInfo.getSex());
            preparedStatement.setTimestamp(4, userInfo.getBirth());
            preparedStatement.setString(5, userInfo.getEmail());
            preparedStatement.setTimestamp(6, userInfo.getRegDay());
            preparedStatement.setTimestamp(7, userInfo.getLastLogin());
            preparedStatement.setInt(8, userInfo.getCoin());
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean deleteUserInfo(UserInfo userInfo) {
        return deleteUserInfo(userInfo.getUID());
    }

    @Override
    public boolean deleteUserInfo(int UID) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "DELETE FROM user WHERE UID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, UID);
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean updateUserInfo(UserInfo userInfo, String passwordEncrypt) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "UPDATE user SET UserName=?, Password=?, Sex=?, Birth=?, Email=?, RegDay=?, LastLogin=?, Coin=? WHERE UID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, userInfo.getUserName());
            preparedStatement.setString(2, passwordEncrypt);
            preparedStatement.setString(3, userInfo.getSex());
            preparedStatement.setTimestamp(4, userInfo.getBirth());
            preparedStatement.setString(5, userInfo.getEmail());
            preparedStatement.setTimestamp(6, userInfo.getRegDay());
            preparedStatement.setTimestamp(7, userInfo.getLastLogin());
            preparedStatement.setInt(8, userInfo.getCoin());
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public UserInfo getUserInfoByUserName(String userName) {
        UserInfo userInfo = new UserInfo();
        this.getUserInfoByUserName(userName, userInfo);
        return userInfo;
    }

    @Override
    public void getUserInfoByUserName(String userName, UserInfo userInfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT UID, UserName, Sex, Birth, Email, RegDay, LastLogin, Coin FROM user WHERE UserName=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, userName);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userInfo.setUID(resultSet.getInt("UID"));
                userInfo.setUserName(resultSet.getString("UserName"));
                userInfo.setSex(resultSet.getString("Sex"));
                userInfo.setBirth(resultSet.getTimestamp("Birth"));
                userInfo.setEmail(resultSet.getString("Email"));
                userInfo.setRegDay(resultSet.getTimestamp("RegDay"));
                userInfo.setLastLogin(resultSet.getTimestamp("LastLogin"));
                userInfo.setCoin(resultSet.getInt("Coin"));
            } else {
                throw new IllegalArgumentException("UserName: " + userName + " does not exist");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
    }

    @Override
    public UserInfo getUserInfoByUID(int UID) {
        UserInfo userInfo = new UserInfo();
        this.getUserInfoByUID(UID, userInfo);
        return userInfo;
    }

    @Override
    public void getUserInfoByUID(int UID, UserInfo userInfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT UserName, Sex, Birth, Email, RegDay, LastLogin, Coin FROM user WHERE UID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, UID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userInfo.setUID(resultSet.getInt("UID"));
                userInfo.setUserName(resultSet.getString("UserName"));
                userInfo.setSex(resultSet.getString("Sex"));
                userInfo.setBirth(resultSet.getTimestamp("Birth"));
                userInfo.setEmail(resultSet.getString("Email"));
                userInfo.setRegDay(resultSet.getTimestamp("RegDay"));
                userInfo.setLastLogin(resultSet.getTimestamp("LastLogin"));
                userInfo.setCoin(resultSet.getInt("Coin"));
            } else {
                throw new IllegalArgumentException("UID: " + UID + " does not exist");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
    }

    @Override
    public boolean isUserNameExist(String userName) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT COUNT(*) FROM user WHERE UserName=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, userName);
            resultSet = preparedStatement.executeQuery();
            System.out.println(preparedStatement.toString());
            resultSet.next();
            return resultSet.getInt(1) != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean isEmailExist(String email) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT COUNT(*) FROM user WHERE Email=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            return resultSet.getInt(1) != 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public List<UserInfo> getAllUserInfo() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<UserInfo> userInfos = new ArrayList<>();
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT UID, UserName, Sex, Birth, Email, RegDay, LastLogin, Coin FROM user";
            preparedStatement = connection.prepareStatement(SQL);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                UserInfo userInfo = new UserInfo(resultSet.getInt("UID"),
                                                 resultSet.getString("UserName"),
                                                 resultSet.getString("Email"),
                                                 resultSet.getString("Sex"),
                                                 resultSet.getTimestamp("Birth"),
                                                 resultSet.getTimestamp("RegDay"),
                                                 resultSet.getTimestamp("LastLogin"),
                                                 resultSet.getInt("Coin"));
                userInfos.add(userInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
        return userInfos;
    }
}
