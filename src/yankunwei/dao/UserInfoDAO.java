package yankunwei.dao;

import yankunwei.dao.IUserInfoDAO;
import yankunwei.javabean.UserInfo;
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
    public boolean updateUserInfo(UserInfo userInfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "UPDATE user SET UserName=?, Sex=?, Birth=?, Email=?, RegDay=?, LastLogin=?, Coin=? WHERE UID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, userInfo.getUserName());
            preparedStatement.setString(2, userInfo.getSex());
            preparedStatement.setTimestamp(3, userInfo.getBirth());
            preparedStatement.setString(4, userInfo.getEmail());
            preparedStatement.setTimestamp(5, userInfo.getRegDay());
            preparedStatement.setTimestamp(6, userInfo.getLastLogin());
            preparedStatement.setInt(7, userInfo.getCoin());
            preparedStatement.setInt(8, userInfo.getUID());
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(null, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean freshUserInfo(UserInfo userInfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT UID, UserName, Sex, Birth, Email, RegDay, LastLogin, Coin FROM user WHERE UID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, userInfo.getUID());
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
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean loginCheckByUID(int UID, String passwordEncrypt) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT COUNT(*) FROM user WHERE UID=? AND Password=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, UID);
            preparedStatement.setString(2, passwordEncrypt);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            return resultSet.getInt(1) == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean loginCheckByEmail(String email, String passwordEncrypt) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT COUNT(*) FROM user WHERE Email=? AND Password=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, passwordEncrypt);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            return resultSet.getInt(1) == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean loginCheckByUserName(String userName, String passwordEncrypt) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT COUNT(*) FROM user WHERE UserName=? AND Password=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, passwordEncrypt);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            return resultSet.getInt(1) == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
        return false;
    }

    @Override
    public boolean isPasswordRightByUID(int UID, String passwordEncrypt) {
        return this.loginCheckByUID(UID, passwordEncrypt);
    }

    @Override
    public boolean isPasswordRightByUserName(String userName, String passwordEncrypt) {
        return this.loginCheckByUserName(userName, passwordEncrypt);
    }

    @Override
    public boolean isPasswordRightByEmail(String email, String passwordEncrypt) {
        return this.loginCheckByEmail(email, passwordEncrypt);
    }

    @Override
    public boolean isPasswordRightByUserInfo(UserInfo userInfo, String passwordEncrypt) {
        boolean rightByUID = false;
        boolean rightByUserName = false;
        boolean rightByEmail = false;
        try {
            rightByUID = this.isPasswordRightByUID(userInfo.getUID(), passwordEncrypt);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
        rightByUserName = this.isPasswordRightByUserName(userInfo.getUserName(), passwordEncrypt);
        rightByEmail = this.isPasswordRightByEmail(userInfo.getEmail(), passwordEncrypt);
        return rightByUID || rightByUserName || rightByEmail;
    }

    @Override
    public boolean isPasswordRightByEmailOrUID(String emailOrUID, String passwordEncrypt) {
        boolean UID = false;
        boolean email = isPasswordRightByEmail(emailOrUID, passwordEncrypt);
        if (!email) {
            try {
                UID = loginCheckByUID(Integer.valueOf(emailOrUID), passwordEncrypt);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        return UID || email;
    }

    @Override
    public UserInfo getUserInfoByEmailOrUID(String emailOrUID) {
        UserInfo userInfo = new UserInfo();
        this.getUserInfoByEmailOrUID(emailOrUID, userInfo);
        return userInfo;
    }

    @Override
    public void getUserInfoByEmailOrUID(String emailOrUID, UserInfo userInfo) {
        try {
            this.getUserInfoByEmail(emailOrUID, userInfo);
        } catch (IllegalArgumentException e) {
            this.getUserInfoByUID(Integer.valueOf(emailOrUID), userInfo);
        }
    }

    @Override
    public UserInfo getUserInfoByEmail(String email) {
        UserInfo userInfo = new UserInfo();
        this.getUserInfoByEmail(email, userInfo);
        return userInfo;
    }

    @Override
    public void getUserInfoByEmail(String email, UserInfo userInfo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            String SQL = "SELECT UID, UserName, Sex, Birth, Email, RegDay, LastLogin, Coin FROM user WHERE Email=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, email);
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
                throw new IllegalArgumentException("Email: " + email + " does not exist");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
        }
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
                userInfo.setUID(UID);
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
    public boolean giveVideoCoin(UserInfo giver, String videoID, UserInfo receiver) {
        return this.giveVideoCoin(giver.getUID(), videoID, receiver.getUID());
    }

    @Override
    public boolean giveVideoCoin(int giverUID, String videoID, int receiverUID) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String SQL = null;
        try {
            connection = DataBaseHelper.getInstance().getConnection();
            connection.setAutoCommit(false);

            //获取用户硬币数量
            SQL = "SELECT Coin FROM user WHERE UID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, giverUID);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int userCoin = resultSet.getInt("Coin");
            resultSet.close();
            preparedStatement.close();
            if (userCoin <= 0) {
                throw new IllegalStateException("Insufficient number of coins");
            }
            //获取用户硬币数量

            //更新投币者硬币数量
            SQL = "UPDATE user SET Coin=Coin-1 WHERE UID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, giverUID);
            if (preparedStatement.executeUpdate() != 1) {
                throw new IllegalStateException("Update user coin count failed.(UID: " + giverUID + ")");
            }
            preparedStatement.close();
            //更新投币者硬币数量

            //更新视频硬币数量
            SQL = "UPDATE video SET Coin=Coin+1 WHERE VideoID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, videoID);
            if (preparedStatement.executeUpdate() != 1) {
                throw new IllegalStateException("Update video coin count failed.(VideoID: " + videoID + ")");
            }
            preparedStatement.close();
            //更新视频硬币数量

            //更新UP主硬币数量
            SQL = "UPDATE user SET Coin=Coin+1 WHERE UID=?";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, receiverUID);
            if (preparedStatement.executeUpdate() != 1) {
                throw new IllegalStateException("Update UP coin count failed.(UID: " + receiverUID +"");
            }
            preparedStatement.close();
            //更新UP主硬币数量
            connection.commit();
            return true;
        } catch (SQLException | IllegalStateException e) {
            e.printStackTrace();
            try {
                if (connection != null) {
                    connection.rollback();
                }
                connection.commit();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                if (connection != null) {
                    connection.setAutoCommit(true);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                DataBaseHelper.getInstance().closeResource(resultSet, preparedStatement, connection);
            }
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
