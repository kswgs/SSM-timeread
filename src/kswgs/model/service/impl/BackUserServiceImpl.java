package kswgs.model.service.impl;

import kswgs.model.dao.IBackUserDao;
import kswgs.model.entity.BackUser;
import kswgs.model.service.IBackUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("backUserService")
public class BackUserServiceImpl implements IBackUserService {

    @Resource
    private IBackUserDao backUserDao;

    @Override
    public BackUser getBackUserByUsername(String username) {
        return backUserDao.selectBackUserByUsername(username);
    }
}
