package kswgs.model.service;

import kswgs.model.entity.Notice;

import java.util.ArrayList;

public interface INoticeService {
    /**
     * 获取最新的公告
     * count为获取数量
     * 只获取id，时间和标题，没有内容
     * @param count
     * @return
     */
    public ArrayList<Notice> getNoticeByNewTime(int count);

    /**
     * 根据id获取公告
     * @param notice_id
     * @return
     */
    public Notice getNoticeById(String notice_id);
}
