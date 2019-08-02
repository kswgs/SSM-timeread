package kswgs.model.dao;

import kswgs.model.entity.BookFile;

import java.util.ArrayList;

public interface IBookFileDao {

    /**
     * 插入图书文件
     * @param bookFile
     * @return
     */
    public Boolean insertBookFile(BookFile bookFile);

    /**
     * 输入id获取相应id的图书文件
     */
    public ArrayList<BookFile> selectBookFileById(String Book_id);
}
