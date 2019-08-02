package kswgs.model.service;

import kswgs.model.entity.BackUser;

public interface IBackUserService {

    /**
     * 输入一个用户名，获取用户的基本信息
     * @param username
     * @return
     */
    public BackUser getBackUserByUsername(String username);
}
