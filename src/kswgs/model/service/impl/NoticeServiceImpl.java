package kswgs.model.service.impl;

import kswgs.model.dao.INoticeDao;
import kswgs.model.entity.Notice;
import kswgs.model.service.INoticeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("noticeService")
public class NoticeServiceImpl implements INoticeService {

    @Resource
    private INoticeDao noticeDao;

    @Override
    public ArrayList<Notice> getNoticeByNewTime(int count) {
        return noticeDao.selectNoticeByNewTime(count);
    }

    @Override
    public Notice getNoticeById(String notice_id) {
        return noticeDao.selectNoticeById(notice_id);
    }
}
