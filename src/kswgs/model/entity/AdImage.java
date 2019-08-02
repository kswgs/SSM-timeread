package kswgs.model.entity;

import java.sql.Date;

public class AdImage {

    /**
     * 广告图id
     */
    private String adImage_id;

    /**
     * 图片地址
     */
    private String image_path;

    /**
     * 修改时间
     */
    private Date modify_time;

    /**
     * 轮播顺序
     */
    private int adimage_order;

    public String getAdImage_id() {
        return adImage_id;
    }

    public void setAdImage_id(String adImage_id) {
        this.adImage_id = adImage_id;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public Date getModify_time() {
        return modify_time;
    }

    public void setModify_time(Date modify_time) {
        this.modify_time = modify_time;
    }

    public int getAdimage_order() {
        return adimage_order;
    }

    public void setAdimage_order(int adimage_order) {
        this.adimage_order = adimage_order;
    }

    @Override
    public String toString() {
        return "AdImage{" +
                "adImage_id='" + adImage_id + '\'' +
                ", image_path='" + image_path + '\'' +
                ", modify_time=" + modify_time +
                ", adimage_order=" + adimage_order +
                '}';
    }
}
