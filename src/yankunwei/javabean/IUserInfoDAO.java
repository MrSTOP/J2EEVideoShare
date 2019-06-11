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

    boolean isPasswordRightByEmailOrUID(String emailOrUID, String passwordEncrypt);

    UserInfo getUserInfoByEmailOrUID(String emailOrUID);

    void getUserInfoByEmailOrUID(String emailOrUID, UserInfo userInfo);

    UserInfo getUserInfoByEmail(String email);

    void getUserInfoByEmail(String email, UserInfo userInfo);

    UserInfo getUserInfoByUserName(String userName);

    void getUserInfoByUserName(String userName, UserInfo userInfo);

    UserInfo getUserInfoByUID(int UID);

    void getUserInfoByUID(int UID, UserInfo userInfo);

    boolean isUserNameExist(String userName);

    boolean isEmailExist(String email);

    boolean giveVideoCoin(UserInfo giver, String videoID, UserInfo receiver);

    boolean giveVideoCoin(int giverUID, String videoID, int receiverUID);

    List<UserInfo> getAllUserInfo();
}
