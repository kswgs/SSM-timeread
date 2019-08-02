package kswgs.model.dao;

import java.util.Date;
import java.util.Map;

public interface IUserDetailedDao {
    /**
     * 输入用户名，当前注册时间和激活码，添加到相应的用户详细信息中
     *
     * @param user_id
     * @param registration_time
     * @param activate_code
     * @return
     */
    public Boolean insertUserDetailed(String user_id, Date registration_time, String activate_code);

    /**
     * 输入用户名
     *
     * @param user_id
     * @param activate
     * @param activate_code
     * @return
     */
    public Boolean updateActivate(String user_id, int activate, String activate_code);

    /**
     * 用户购买图书时，减去相应的图书积分
     * 传入Map参数，键只能有两个，book_point、user_id
     * 两个键都必须有
     * book_point为图书积分，
     * user_id为用户id
     *
     * @param map
     * @return
     */
    public Boolean updatePointById(Map<String, Object> map);

    /**
     * 用户签到添加积分
     * 传入Map参数，键只能有两个，sign_point、user_id
     * 两个键都必须有
     * sign_point为签到所得积分，
     * user_id为用户id
     *
     * @param map
     * @return
     */
    public Boolean updatePointBySign(Map<String,Object> map);

    /**
     * 用户修改个人信息
     * 传入Map参数，键只能有三个，user_id,gender,birthday
     * 三个键都必须有
     * user_id为用户id
     * gender为性别
     * birthday为生日
     * @param map
     * @return
     */
    public Boolean updateUserInfoById(Map<String,Object> map);

    /**
     * 用户修改个人头像
     * 传入Map参数，键只能有两个，user_id,image_path
     * user_id为用户id
     * image_path为图片路径
     * @param map
     * @return
     */
    public Boolean updateUserHeadImgById(Map<String,Object> map);
}
