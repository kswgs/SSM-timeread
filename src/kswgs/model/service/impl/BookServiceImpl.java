package kswgs.model.service.impl;

import kswgs.model.dao.IBookDao;
import kswgs.model.entity.Book;
import kswgs.model.service.IBookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service("bookService")
public class BookServiceImpl implements IBookService {

    @Resource
    private IBookDao bookDao;

    @Override
    public Boolean addBook(Book book){
        return bookDao.insertBook(book);
    }

    @Override
    public Boolean isExistBookName(String bookname) {
        if(bookname.equals(bookDao.isExistBookName(bookname))){
            return true;
        }
        return false;
    }

    @Override
    public ArrayList<Book> getNewBook(Map<String, Object> map){
        //System.out.println(map);
        if (!map.containsKey("count")){
            System.out.println("getNewBook传入的map中没有count键，返回空");
            return null;
        }
        return bookDao.selectByNewBook(map);
    }

    @Override
    public Book getBookById(String book_id) {
        return bookDao.selectBookById(book_id);
    }

    @Override
    public ArrayList<Book> selectBookByCategory(int start, int end, String category, String categoryParent) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("start",start);
        map.put("end",end);
        map.put("category",category);
        map.put("categoryParent",categoryParent);
        return bookDao.selectBookByCategory(map);
    }

    @Override
    public int getBookCount(String category, String categoryParent) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("category",category);
        map.put("categoryParent",categoryParent);
        return bookDao.selectBookCount(map);
    }

    @Override
    public ArrayList<Book> getBookByRandom(int count) {
        return bookDao.selectBookByRandom(count);
    }
}
