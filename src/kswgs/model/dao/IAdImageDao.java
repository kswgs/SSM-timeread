package kswgs.model.dao;

import kswgs.model.entity.AdImage;

import java.util.ArrayList;

public interface IAdImageDao {

    /**
     * 获取广告轮播图
     * 目前在sql中设置了只获取3个
     * @return
     */
    public ArrayList<AdImage> selectAdImage();

}
