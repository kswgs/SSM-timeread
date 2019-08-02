package kswgs.model.service;

import kswgs.model.entity.User;

import java.util.ArrayList;

public interface IUserService {
    /**
     * 输入一个用户名，获取用户的基本信息和积分
     * @param username
     * @return
     */
    public User getUserByUsername(String username);

    /**
     * 输入一个邮箱，获取用户的基本信息
     * @param email
     * @return
     */
    public User getUserByEmail(String email);

    /**
     * 返回所有的用户
     * @return
     */
    public ArrayList<User> getByAllUser();

    /**
     * 输入开始的条数和需要多少条数据
     * @param start
     * @param count
     * @return
     */
    public ArrayList<User> getByUser(int start,int count);

    /**
     * 输入一个用户名，查询出用户的所有信息包含详细信息
     * @param username
     * @return
     */
    public User getUserDetailed(String username);

    /**
     * 输入一个用户信息，添加用户，返回一个布尔值
     * @param user
     * @return
     */
    public Boolean addUser(User user);

    /**
     * 输入用户名判断一个用户是否存在，返回一个布尔值
     * @param username
     * @return
     */
    public Boolean isExistUsername(String username);

    /**
     * 输入邮箱判断一个用户是否存在，返回一个布尔值
     * @param email
     * @return
     */
    public Boolean isExistEmail(String email);

    /**
     * 输入用户名查询出激活码，返回一个含有用户名，邮箱和激活码的用户信息
     * @param username
     * @return
     */
    public User getUserActivate(String username);

    /**
     * 获取有详细信息的用户总条数
     * @return
     */
    public int getUserCount();


    /**
     * 获取密码
     * 用于修改密码判断输入的旧密码是否正确
     * @param username
     * @return
     */
    public String getPasswordById(String username);

    /**
     * 修改密码
     * 用于用户在个人中心进行修改密码
     * @param username
     * @param password
     * @return
     */
    public Boolean updatePasswordById(String username,String password);
}
