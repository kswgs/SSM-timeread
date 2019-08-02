package kswgs.model.entity;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.Date;

public class UserDetailed {
    private int id;
    private String user_id;
    private String gender;
    private int point;
    private Date birthday;
    private Date registration_time;
    private String image_path;
    private int activate;
    private String activate_code;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    @JSONField(format = "MM-dd")
    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @JSONField(format = "yyyy-MM-dd HH:MM:SS")
    public Date getRegistration_time() {
        return registration_time;
    }

    public void setRegistration_time(Date registration_time) {
        this.registration_time = registration_time;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public int getActivate() {
        return activate;
    }

    public void setActivate(int activate) {
        this.activate = activate;
    }

    public String getActivate_code() {
        return activate_code;
    }

    public void setActivate_code(String activate_code) {
        this.activate_code = activate_code;
    }

    @Override
    public String toString() {
        return "UserDetailed{" +
                "id=" + id +
                ", user_id='" + user_id + '\'' +
                ", gender='" + gender + '\'' +
                ", point=" + point +
                ", birthday=" + birthday +
                ", registration_time=" + registration_time +
                ", image_path='" + image_path + '\'' +
                ", activate=" + activate +
                ", activate_code='" + activate_code + '\'' +
                '}';
    }
}
