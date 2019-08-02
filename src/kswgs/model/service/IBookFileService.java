package kswgs.model.service;

import kswgs.model.entity.BookFile;

import java.util.ArrayList;

public interface IBookFileService {

    /**
     * 插入图书文件
     * @param bookFile
     * @return
     */
    public Boolean addBookFile(BookFile bookFile);

    /**
     * 输入图书id获取相应的图书文件
     * @param book_id
     * @return
     */
    public ArrayList<BookFile> getBookFileById(String book_id);
}
