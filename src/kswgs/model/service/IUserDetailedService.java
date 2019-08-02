package kswgs.model.service;

import java.util.Date;
import java.util.Map;

public interface IUserDetailedService {
    /**
     * 输入用户名，当前注册时间和激活码，添加到相应的用户详细信息中
     * @param user_id
     * @param registration_time
     * @param activate_code
     * @return
     */
    public Boolean addUserDetailed(String user_id, Date registration_time,String activate_code);

    /**
     * 输入用户名
      * @param user_id
     * @param activate
     * @param activate_code
     * @return
     */
    public Boolean updateUserActivate(String user_id,int activate,String activate_code);


    /**
     * 用户购买图书时，减去相应的图书积分
     * 输入用户名和图书积分，减去相应的图书积分
     * @param user_id
     * @param book_point
     * @return
     */
    public Boolean updatePointById(String user_id,int book_point);

    /**
     * 用户签到添加积分
     * 输入用户名和签到所得积分，加上签到所得积分
     *
     * @param user_id
     * @param sign_point
     * @return
     */
    public Boolean updatePointBySign(String user_id,int sign_point);

    /**
     * 用户修改个人信息
     * 输入用户id，修改性别和生日
     * @param user_id
     * @param gender
     * @param birthday
     * @return
     */
    public Boolean updateUserInfoById(String user_id,String gender,Date birthday);

    /**
     * 用户修改个人头像
     * 输入用户id，修改头像路径
     * user_id为用户id
     * image_path为图片路径
     * @param user_id
     * @param image_path
     * @return
             */
    public Boolean updateUserHeadImgById(String user_id,String image_path);

}
