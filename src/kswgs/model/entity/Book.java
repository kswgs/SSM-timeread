package kswgs.model.entity;

import java.util.ArrayList;
import java.util.Date;

public class Book {
    /**
     * 图书id
     */
    private String book_id;

    /**
     * 图书名
     */
    private String name;

    /**
     * 图书作者
     */
    private String author;

    /**
     * 图书简介
     */
    private String introduction;

    /**
     * 目录（图书为合集的需要添加目录）
     */
    private String catalog;

    /**
     * 图书类型
     */
    private String category;

    /**
     * 图书分类（畅销图书、网络小说、网络小说（女频）、合集、学习教材）
     */
    private String category_parent;

    /**
     * 图书图片路径
     */
    private String image;

    /**
     * 图书上传时间
     */
    private Date upload_time;

    /**
     * 图书下载所需积分
     */
    private int book_point;


    /**
     * 连接的图书文件
     *
     * @return
     */
    private ArrayList<BookFile> bookFile;


    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getCatalog() {
        return catalog;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory_parent() {
        return category_parent;
    }

    public void setCategory_parent(String category_parent) {
        this.category_parent = category_parent;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getUpload_time() {
        return upload_time;
    }

    public void setUpload_time(Date upload_time) {
        this.upload_time = upload_time;
    }

    public int getBook_point() {
        return book_point;
    }

    public void setBook_point(int book_point) {
        this.book_point = book_point;
    }

    public ArrayList<BookFile> getBookFile() {
        return bookFile;
    }

    public void setBookFile(ArrayList<BookFile> bookFile) {
        this.bookFile = bookFile;
    }

    public Book(String book_id, String name, String author, String introduction, String catalog, String category, String category_parent, String image, Date upload_time, int book_point) {
        this.book_id = book_id;
        this.name = name;
        this.author = author;
        this.introduction = introduction;
        this.catalog = catalog;
        this.category = category;
        this.category_parent = category_parent;
        this.image = image;
        this.upload_time = upload_time;
        this.book_point = book_point;
    }

    public Book() {
    }

    @Override
    public String toString() {
        return "Book{" +
                "book_id='" + book_id + '\'' +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", introduction='" + introduction + '\'' +
                ", catalog='" + catalog + '\'' +
                ", category='" + category + '\'' +
                ", category_parent='" + category_parent + '\'' +
                ", image='" + image + '\'' +
                ", upload_time='" + upload_time + '\'' +
                ", book_point=" + book_point +
                ", bookFile=" + bookFile +
                '}';
    }
}
