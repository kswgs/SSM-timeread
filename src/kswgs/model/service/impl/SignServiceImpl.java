package kswgs.model.service.impl;

import kswgs.model.dao.ISignDao;
import kswgs.model.entity.Sign;
import kswgs.model.service.ISignService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service("signService")
public class SignServiceImpl implements ISignService {

    @Resource
    private ISignDao signDao;

    @Override
    public Boolean addNewSignById(Sign sign) {
        return signDao.insertNewSignById(sign);
    }

    @Override
    public Boolean updateSignById(String user_id, int sign_count, int sign_continue, Date last_time) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("user_id",user_id);
        map.put("sign_count",sign_count);
        map.put("sign_continue",sign_continue);
        map.put("last_time",last_time);
        return signDao.updateSignById(map);
    }

    @Override
    public Sign getSignById(String user_id) {
        return signDao.selectSignById(user_id);
    }
}
