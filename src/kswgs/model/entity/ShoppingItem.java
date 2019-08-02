package kswgs.model.entity;

import java.util.Date;

public class ShoppingItem {

    /**
     * 购买记录id
     */
    private String shopping_id;

    /**
     * 购买的图书id
     */
    private String book_id;

    /**
     * 购买图书的用户id
     */
    private String user_id;

    /**
     * 购买时间
     */
    private Date time;

    /**
     * 购买所花积分
     */
    private int point;

    public String getShopping_id() {
        return shopping_id;
    }

    public void setShopping_id(String shopping_id) {
        this.shopping_id = shopping_id;
    }

    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    @Override
    public String toString() {
        return "ShoppingItem{" +
                "shopping_id='" + shopping_id + '\'' +
                ", book_id='" + book_id + '\'' +
                ", user_id='" + user_id + '\'' +
                ", time=" + time +
                ", point=" + point +
                '}';
    }
}
