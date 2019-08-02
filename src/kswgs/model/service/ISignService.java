package kswgs.model.service;

import kswgs.model.entity.Sign;

import java.util.Date;
import java.util.Map;

public interface ISignService {

    /**
     * 用户第一次签到生成一条新的签到记录
     * @param sign
     * @return
     */
    public Boolean addNewSignById(Sign sign);

    /**
     * 用户签到后更新签到表状态
     * user_id,为用户id
     * sign_count为总签到次数
     * sign_continue为连续签到次数
     * last_time为上次签到时间
     * @param user_id
     * @param sign_count
     * @param sign_continue
     * @param last_time
     * @return
     */
    public Boolean updateSignById(String user_id, int sign_count, int sign_continue, Date last_time);

    /**
     * 根据用户id查询对应的签到状态
     * @param user_id
     * @return
     */
    public Sign getSignById(String user_id);
}
