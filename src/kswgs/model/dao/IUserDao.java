package kswgs.model.dao;

import kswgs.model.entity.User;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Map;


public interface IUserDao {
    /**
     * 输入一个用户名，获取用户的基本信息和积分
     * @param username
     * @return
     */
    public User selectByUsername(String username);
    /**
     * 输入一个邮箱，获取用户的基本信息
     * @param email
     * @return
     */
    public User selectByEmail(String email);
    /**
     * 返回所有的用户
     * @return
     */
    public ArrayList<User> selectByAllUser();
    /**
     * 输入开始的条数和需要多少条数据
     * @param start
     * @param count
     * @return
     */
    public ArrayList<User> selectByUser(int start,int count);
    /**
     * 输入一个用户信息，添加用户，返回一个布尔值
     * @param user
     * @return
     */
    public Boolean insertUser(User user);
    /**
     * 输入一个用户名，查询出用户的所有信息包含详细信息
     * @param username
     * @return
     */
    public User selectUserDetailed(String username);
    /**
     * 输入用户名判断一个用户是否存在
     * @param username
     * @return
     */
    public String isExistUsername(String username);
    /**
     * 输入邮箱判断一个用户是否存在
     * @param email
     * @return
     */
    public String isExistEmail(String email);
    /**
     * 输入用户名查询出激活码，返回一个含有用户名，邮箱和激活码的用户信息
     * @param username
     * @return
     */
    public User selectUserActivate(String username);

    /**
     * 获取有详细信息的用户总条数
     * @return
     */
    public int selectUserCount();

    /**
     * 获取密码
     * 用于修改密码判断输入的旧密码是否正确
     * @param username
     * @return
     */
    public String selectPasswordById(String username);

    /**
     * 修改密码
     * 用于用户在个人中心进行修改密码
     * 传入两个参数，username、password
     * username为用户id
     * password为新的密码
     * @param map
     * @return
     */
    public Boolean updatePasswordById(Map<String,Object> map);
}
