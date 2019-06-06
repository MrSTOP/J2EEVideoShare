package yankunwei.javabean;

import java.util.List;

public interface IUserInfoDAO {
    boolean addUserInfo(UserInfo userInfo, String passwordEncrypt);

    boolean deleteUserInfo(UserInfo userInfo);

    boolean deleteUserInfo(String userName);

    boolean updateUserInfo(UserInfo userInfo);

    UserInfo getUserInfoByUserName(String userName);

    List<UserInfo> getAllUserInfo(UserInfo userInfo);
}
