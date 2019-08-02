package kswgs.model.dao;

import kswgs.model.entity.BackUser;

public interface IBackUserDao {

    /**
     * 输入一个用户名，获取用户的基本信息
     * @param username
     * @return
     */
    public BackUser selectBackUserByUsername(String username);

}
