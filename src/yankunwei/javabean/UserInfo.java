package yankunwei.javabean;

import java.sql.Timestamp;
import java.util.Calendar;

public class UserInfo {
    private String userName;
    private String sex;
    private Timestamp birth;
    private Timestamp regDay;
    private Timestamp lastLogin;
    private int coin;

    public UserInfo(String userName, String sex, Timestamp birth, Timestamp regDay, Timestamp lastLogin, int coin) {
        this.userName = userName;
        this.sex = sex;
        this.birth = birth;
        this.regDay = regDay;
        this.lastLogin = lastLogin;
        this.coin = coin;
    }

    public UserInfo(String userName, String sex, String birth, String regDay, String lastLogin, int coin) {
        this(userName, sex, strToTimestamp(birth), strToTimestamp(regDay), strToTimestamp(lastLogin), coin);
    }

    public UserInfo() {
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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
                     Integer.valueOf(times[1]),
                     Integer.valueOf(times[2]),
                     8, 0, 0);
        return new Timestamp(calendar.getTimeInMillis());
    }
}
