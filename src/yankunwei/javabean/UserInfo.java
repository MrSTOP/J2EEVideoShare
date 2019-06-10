package yankunwei.javabean;

import java.sql.Timestamp;
import java.util.Calendar;

public class UserInfo {

    public static final long DAY_AS_MILLISECONDS = 86400000L;

    private int UID = -1;
    private String userName;
    private String email;
    private String sex;
    private Timestamp birth;
    private Timestamp regDay;
    private Timestamp lastLogin;
    private int coin;

    public UserInfo(int UID, String userName, String email, String sex, Timestamp birth, Timestamp regDay, Timestamp lastLogin, int coin) {
        this(userName, email, sex, birth, regDay, lastLogin, coin);
        this.UID = UID;
    }

    public UserInfo(String userName, String email, String sex, Timestamp birth, Timestamp regDay, Timestamp lastLogin, int coin) {
        this.userName = userName;
        this.email = email;
        this.sex = sex;
        this.birth = birth;
        this.regDay = regDay;
        this.lastLogin = lastLogin;
        this.coin = coin;
    }

    public UserInfo(int UID, String userName, String email, String sex, String birth, String regDay, String lastLogin, int coin) {
        this(UID, userName, email, sex, strToTimestamp(birth), strToTimestamp(regDay), strToTimestamp(lastLogin), coin);
    }

    public UserInfo(String userName, String email, String sex, String birth, String regDay, String lastLogin, int coin) {
        this(userName, email , sex, strToTimestamp(birth), strToTimestamp(regDay), strToTimestamp(lastLogin), coin);
    }

    public UserInfo() {
    }

    public boolean isUIDExist() {
        return UID > 0;
    }

    public int getUID() {
        if (UID <= 1) {
            throw new IllegalStateException("User UID does not exist");
        }
        return UID;
    }

    public void setUID(int UID) {
        if (UID <= 0) {
            throw new IllegalArgumentException("UID must not be less than 1");
        }
        this.UID = UID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Timestamp getBirth() {
        return birth;
    }

    public String getStrBirth() {
        return timestampToStr(birth);
    }

    public void setBirth(Timestamp birth) {
        this.birth = birth;
    }

    public void setBirth(String birth) {
        this.birth = strToTimestamp(birth);
    }

    public Timestamp getRegDay() {
        return regDay;
    }

    public String getStrRegDay() {
        return timestampToStr(regDay);
    }

    public void setRegDay(Timestamp regDay) {
        this.regDay = regDay;
    }

    public void setRegDay(String regDay) {
        this.regDay = strToTimestamp(regDay);
    }

    public Timestamp getLastLogin() {
        return lastLogin;
    }

    public String getStrLastLogin() {
        return timestampToStr(lastLogin);
    }

    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = strToTimestamp(lastLogin);
    }

    public int getCoin() {
        return coin;
    }

    public void setCoin(int coin) {
        this.coin = coin;
    }

    public void updateCoin() {
        if (System.currentTimeMillis() - this.lastLogin.getTime() >= DAY_AS_MILLISECONDS) {
            this.coin++;
        }
        this.lastLogin.setTime(System.currentTimeMillis());
    }

    public void coinInc() {
        this.coin++;
    }

    public void coinDec() {
        this.coin--;
    }

    public boolean hasCoin() {
        return this.coin > 0;
    }

    private static String timestampToStr(String timestamp) {
        return timestamp.split("\\s+")[0];
    }

    private static String timestampToStr(Timestamp timestamp) {
        return timestampToStr(timestamp.toString());
    }

    private static Timestamp strToTimestamp(String timestamp) {
        String[] times = timestamp.split("-");
        Calendar calendar = Calendar.getInstance();
        calendar.set(Integer.valueOf(times[0]),
                     Integer.valueOf(times[1]) - 1,
                     Integer.valueOf(times[2]),
                     8, 0, 1);
        return new Timestamp(calendar.getTimeInMillis());
    }

    @Override
    public String toString() {
        return "UID: " + UID +
                " UserName: " + userName +
                " Email: " + email +
                " Sex: " + sex +
                " Birth: " + timestampToStr(birth) +
                " RegDay: " + timestampToStr(regDay) +
                " Coin: " + coin;
    }
}
