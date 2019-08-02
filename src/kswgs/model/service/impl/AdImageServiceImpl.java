package kswgs.model.service.impl;

import kswgs.model.dao.IAdImageDao;
import kswgs.model.entity.AdImage;
import kswgs.model.service.IAdImageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("adImageService")
public class AdImageServiceImpl implements IAdImageService {

    @Resource
    private IAdImageDao adImageDao;

    @Override
    public ArrayList<AdImage> getAdImage() {
        return adImageDao.selectAdImage();
    }
}
