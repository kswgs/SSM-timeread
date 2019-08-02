package kswgs.model.dao;

import kswgs.model.entity.Sign;

import java.util.Map;

public interface ISignDao {

    /**
     * 用户第一次签到生成一条新的签到记录
     * @param sign
     * @return
     */
    public Boolean insertNewSignById(Sign sign);

    /**
     * 用户签到后更新签到表状态
     * 传入Map参数，键只能有四个个，user_id,sign_count,sign_continue,last_time
     *  四个键都必须有
     * user_id,为用户id
     * sign_count为总签到次数
     * sign_continue为连续签到次数
     * last_time为上次签到时间
     * @param map
     * @return
     */
    public Boolean updateSignById(Map<String,Object> map);

    /**
     * 根据用户id查询对应的签到状态
     * @param user_id
     * @return
     */
    public Sign selectSignById(String user_id);
}
