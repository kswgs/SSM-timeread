package kswgs.model.dao;

import kswgs.model.entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.Map;

public interface IBookDao {

    /**
     * 插入一本图书
     * @return
     */
    public Boolean insertBook(Book book);

    /**
     * 输入书名判断一本书是否存在
     */
    public String isExistBookName(String bookname);

    /**
     * 获取最新上传的图书
     * 传入Map参数，键只能有三个，count、category、categoryParent
     * 必须有count键
     * count为数量，
     * category为图书具体的类型,
     * categoryParent为分类（畅销图书、网络小说、网络小说（女频）、合集、学习教材）
     */
    public ArrayList<Book> selectByNewBook( Map<String,Object> map);

    /**
     *输入图书id获取一本图书
     */
    public Book selectBookById(String book_id);

    /**
     * 获取最新上传的图书
     * 传入Map参数，键只能有四个，start、end、category、categoryParent
     * 必须有start、end
     * start为开始的条数
     * end为结束的条数
     * category为图书具体的类型,
     * categoryParent为分类（畅销图书、网络小说、网络小说（女频）、合集、学习教材）
     * category和categoryParent都为0则为最新的图书
     */
    public ArrayList<Book> selectBookByCategory(Map<String,Object> map);

    /**
     * 获取图书的数量
     * 传入Map参数，键只能有两个，category、categoryParent
     * category为图书具体的类型,
     * categoryParent为分类（畅销图书、网络小说、网络小说（女频）、合集、学习教材）
     * category和categoryParent都为0则为最新的图书
     */
    public int selectBookCount(Map<String,Object> map);


    /**
     * 随机获取图书
     * count为获取是数量
     * @param count
     * @return
     */
    public ArrayList<Book> selectBookByRandom(int count);


}
