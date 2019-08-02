package kswgs.model.service.impl;


import kswgs.model.dao.IUserDao;
import kswgs.model.entity.User;
import kswgs.model.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Resource
    private IUserDao userDao;


    @Override
    public User getUserByUsername(String username) {
        User user = userDao.selectByUsername(username);
        return user;
    }

    @Override
    public ArrayList<User> getByAllUser() {
        ArrayList<User> list = userDao.selectByAllUser();
        return list;
    }

    @Override
    public ArrayList<User> getByUser(int start,int count) {
        ArrayList<User> list = userDao.selectByUser(start,count);
        return list;
    }

    @Override
    public User getUserDetailed(String username) {
        User user = userDao.selectUserDetailed(username);
        return user;
    }

    @Override
    public User getUserByEmail(String email) {
        User user = userDao.selectByEmail(email);
        return user;
    }

    @Override
    public Boolean addUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public Boolean isExistUsername(String username) {
        if(username.equals(userDao.isExistUsername(username))){
            return true;
        }
        return false;
    }

    @Override
    public Boolean isExistEmail(String email) {
        if(email.equals(userDao.isExistEmail(email))){
            return true;
        }
        return false;
    }

    @Override
    public User getUserActivate(String username) {
        return userDao.selectUserActivate(username);
    }

    @Override
    public int getUserCount() {
        return userDao.selectUserCount();
    }

    @Override
    public String getPasswordById(String username) {
        return userDao.selectPasswordById(username);
    }

    @Override
    public Boolean updatePasswordById(String username, String password) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("username",username);
        map.put("password",password);
        return userDao.updatePasswordById(map);
    }


}
