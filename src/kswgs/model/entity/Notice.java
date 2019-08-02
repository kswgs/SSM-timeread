package kswgs.model.entity;

import java.util.Date;

public class Notice {

    /**
     * 公告id
     */
    private String notice_id;

    /**
     * 公告标题
     */
    private String title;

    /**
     * 公告内容
     */
    private String content;

    /**
     * 公告发布时间
     */
    private Date notice_time;


    public String getNotice_id() {
        return notice_id;
    }

    public void setNotice_id(String notice_id) {
        this.notice_id = notice_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getNotice_time() {
        return notice_time;
    }

    public void setNotice_time(Date notice_time) {
        this.notice_time = notice_time;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "notice_id='" + notice_id + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", notice_time=" + notice_time +
                '}';
    }
}
