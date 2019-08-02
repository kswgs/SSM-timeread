package kswgs.model.entity;

import java.util.Date;

public class Comment {

    /***
     * 评论id
     */
    private String comment_id;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 评论用户id
     */
    private String user_id;

    /**
     * 评论时间
     */
    private Date comment_time;

    private UserDetailed userDetailed;

    /**
     * 图书id
     */
    private String book_id;

    public String getComment_id() {
        return comment_id;
    }

    public void setComment_id(String comment_id) {
        this.comment_id = comment_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Date getComment_time() {
        return comment_time;
    }

    public void setComment_time(Date comment_time) {
        this.comment_time = comment_time;
    }

    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public UserDetailed getUserDetailed() {
        return userDetailed;
    }

    public void setUserDetailed(UserDetailed userDetailed) {
        this.userDetailed = userDetailed;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "comment_id='" + comment_id + '\'' +
                ", content='" + content + '\'' +
                ", user_id='" + user_id + '\'' +
                ", comment_time=" + comment_time +
                ", book_id='" + book_id + '\'' +
                '}';
    }
}
