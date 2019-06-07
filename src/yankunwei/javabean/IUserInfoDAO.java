package yankunwei.javabean;

import java.util.List;

public interface IUserInfoDAO {
    boolean addUserInfo(UserInfo userInfo, String passwordEncrypt);

    boolean deleteUserInfo(UserInfo userInfo);

    boolean deleteUserInfo(int UID);

    boolean updateUserInfo(UserInfo userInfo, String passwordEncrypt);

    UserInfo getUserInfoByUserName(String userName);

    void getUserInfoByUserName(String userName, UserInfo userInfo);

    UserInfo getUserInfoByUID(int UID);

    void getUserInfoByUID(int UID, UserInfo userInfo);

    List<UserInfo> getAllUserInfo();
}
