package kswgs.model.dao;

import kswgs.model.entity.Notice;

import java.util.ArrayList;

public interface INoticeDao {

    /**
     * 获取最新的公告
     * count为获取数量
     * 只获取id，时间和标题，没有内容
     * @param count
     * @return
     */
    public ArrayList<Notice> selectNoticeByNewTime(int count);

    /**
     * 根据id获取公告
     * @param notice_id
     * @return
     */
    public Notice selectNoticeById(String notice_id);



}
