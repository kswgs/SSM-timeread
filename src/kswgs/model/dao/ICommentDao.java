package kswgs.model.dao;

import kswgs.model.entity.Comment;

import java.util.ArrayList;
import java.util.Map;

public interface ICommentDao {

    /**
     * 用户评论添加评论信息
     * 传入Map参数，键只能有四个，comment_id 、content 、user_id 、comment_time、book_id
     * 四个键必须都有
     * comment_id为评论id，为UUID
     * content为评论内容
     * user_id为评论用户
     * comment_time为评论时间
     * book_id为图书id
     *
     * @param map
     * @return
     */
    public Boolean insertCommentByUser(Map<String, Object> map);


    /**
     * 获取相应图书的评论信息
     * @param book_id
     * @return
     */
    public ArrayList<Comment> selectCommentByBookId(String book_id);


}
