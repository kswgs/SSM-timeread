package kswgs.model.entity;

import java.util.Date;

public class Sign {

    /**
     * 签到id
     */
    private String sign_id;

    /**
     * 用户id
     */
    private String user_id;

    /**
     * 总签到次数
     */
    private int sign_count;

    /**
     * 连续签到次数
     */
    private int sign_continue;

    /**
     * 上一次签到日期
     */
    private Date last_time;

    public String getSign_id() {
        return sign_id;
    }

    public void setSign_id(String sign_id) {
        this.sign_id = sign_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getSign_count() {
        return sign_count;
    }

    public void setSign_count(int sign_count) {
        this.sign_count = sign_count;
    }

    public int getSign_continue() {
        return sign_continue;
    }

    public void setSign_continue(int sign_continue) {
        this.sign_continue = sign_continue;
    }

    public Date getLast_time() {
        return last_time;
    }

    public void setLast_time(Date last_time) {
        this.last_time = last_time;
    }

    @Override
    public String toString() {
        return "Sign{" +
                "sign_id='" + sign_id + '\'' +
                ", user_id='" + user_id + '\'' +
                ", sign_count=" + sign_count +
                ", sign_continue=" + sign_continue +
                ", last_time=" + last_time +
                '}';
    }
}

