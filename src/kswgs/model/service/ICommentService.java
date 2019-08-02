package kswgs.model.service;

import kswgs.model.entity.Comment;

import java.util.ArrayList;
import java.util.Date;

public interface ICommentService {


    /**
     * 用户评论添加评论信息
     * comment_id为评论id，为UUID
     * content为评论内容
     * user_id为评论用户
     * comment_time为评论时间
     *book_id为图书id
     * @param comment_id
     * @param content
     * @param user_id
     * @param comment_time
     * @return
     */
    public Boolean addCommentByUser(String comment_id ,String content ,String user_id , Date comment_time,String book_id);


    /**
     * 获取相应图书的评论信息
     * @param book_id
     * @return
     */
    public ArrayList<Comment> getCommentByBookId(String book_id);
}
