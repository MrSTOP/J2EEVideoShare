package yankunwei.javabean;

import java.util.List;

public interface IUserInfoDAO {
    boolean addUserInfo(UserInfo userInfo, String passwordEncrypt);

    boolean deleteUserInfo(UserInfo userInfo);

    boolean deleteUserInfo(int UID);

    boolean updateUserInfo(UserInfo userInfo, String passwordEncrypt);

    boolean updateUserInfo(UserInfo userInfo);

    boolean loginCheckByUID(int UID, String passwordEncrypt);

    boolean loginCheckByEmail(String email, String passwordEncrypt);

    boolean loginCheckByUserName(String userName, String passwordEncrypt);

    boolean isPasswordRightByUID(int UID, String passwordEncrypt);

    boolean isPasswordRightByUserName(String userName, String passwordEncrypt);

    boolean isPasswordRightByEmail(String email, String passwordEncrypt);

    boolean isPasswordRightByUserInfo(UserInfo userInfo, String passwordEncrypt);

    UserInfo getUserInfoByUserName(String userName);

    void getUserInfoByUserName(String userName, UserInfo userInfo);

    UserInfo getUserInfoByUID(int UID);

    void getUserInfoByUID(int UID, UserInfo userInfo);

    boolean isUserNameExist(String userName);

    boolean isEmailExist(String email);

    List<UserInfo> getAllUserInfo();
}
