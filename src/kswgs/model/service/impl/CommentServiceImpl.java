package kswgs.model.service.impl;

import kswgs.model.dao.ICommentDao;
import kswgs.model.entity.Comment;
import kswgs.model.service.ICommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service("/commentService")
public class CommentServiceImpl implements ICommentService {

    @Resource
    private ICommentDao commentDao;

    @Override
    public Boolean addCommentByUser(String comment_id, String content, String user_id, Date comment_time,String book_id) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("comment_id",comment_id);
        map.put("content",content);
        map.put("user_id",user_id);
        map.put("comment_time",comment_time);
        map.put("book_id",book_id);

        return commentDao.insertCommentByUser(map);
    }

    @Override
    public ArrayList<Comment> getCommentByBookId(String book_id) {
        return commentDao.selectCommentByBookId(book_id);
    }
}
