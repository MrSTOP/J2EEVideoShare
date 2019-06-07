package yankunwei.utils;

import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import java.util.UUID;

public class DataBaseHelper {

    private final String DriverName;
    private final String DBName;
    private final String UserName;
    private final String Password;
    private final String DBURL;

    private static DataBaseHelper dataBaseHelper = null;

    private DataBaseHelper() throws IOException {
        Properties properties = new Properties();
        properties.load(DataBaseHelper.class.getResourceAsStream("/yankunwei/Config.properties"));
        DriverName = properties.getProperty("DriverName");
        DBName = properties.getProperty("DBName");
        UserName = properties.getProperty("UserName");
        Password = properties.getProperty("Password");
        DBURL = String.format(properties.getProperty("DBURLFormat"),
                              DBName, UserName, Password);
    }

    public static DataBaseHelper getInstance() {
        if (dataBaseHelper == null) {
            try {
                DataBaseHelper.dataBaseHelper = new DataBaseHelper();
                Class.forName(dataBaseHelper.DriverName);
            } catch (IOException | ClassNotFoundException e) {
                e.printStackTrace();
                IllegalStateException illegalStateException = new IllegalStateException("DataBase Driver Initialize failed");
                illegalStateException.addSuppressed(e);
                throw illegalStateException;
            }
        }
        return dataBaseHelper;
    }

    public Connection getConnection() throws SQLException {
        Connection connection = null;
        connection = DriverManager.getConnection(DBURL);
        return connection;
    }

    public void closeResource(ResultSet resultSet, Statement statement, Connection connection) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
