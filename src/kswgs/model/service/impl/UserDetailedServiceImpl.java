package kswgs.model.service.impl;

import kswgs.model.dao.IUserDetailedDao;
import kswgs.model.service.IUserDetailedService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service("userDetailedService")
public class UserDetailedServiceImpl implements IUserDetailedService {

    @Resource
    private IUserDetailedDao userDetailedDao;


    @Override
    public Boolean addUserDetailed(String user_id, Date registration_time,String activate_code) {
        return userDetailedDao.insertUserDetailed(user_id,registration_time,activate_code);
    }

    @Override
    public Boolean updateUserActivate(String user_id,int activate,String activate_code) {
        return userDetailedDao.updateActivate(user_id,activate,activate_code);
    }

    @Override
    public Boolean updatePointById(String user_id, int book_point) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("user_id",user_id);
        map.put("book_point",book_point);
        return userDetailedDao.updatePointById(map);
    }

    @Override
    public Boolean updatePointBySign(String user_id, int sign_point) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("user_id",user_id);
        map.put("sign_point",sign_point);
        return userDetailedDao.updatePointBySign(map);
    }

    @Override
    public Boolean updateUserInfoById(String user_id, String gender, Date birthday) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("user_id",user_id);
        map.put("gender",gender);
        map.put("birthday",birthday);
        return userDetailedDao.updateUserInfoById(map);
    }

    @Override
    public Boolean updateUserHeadImgById(String user_id, String image_path) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("user_id",user_id);
        map.put("image_path",image_path);
        return userDetailedDao.updateUserHeadImgById(map);
    }
}
