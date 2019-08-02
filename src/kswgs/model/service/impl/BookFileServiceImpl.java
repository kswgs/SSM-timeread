package kswgs.model.service.impl;

import kswgs.model.dao.IBookFileDao;
import kswgs.model.entity.BookFile;
import kswgs.model.service.IBookFileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

@Service("bookFileSerivce")
public class BookFileServiceImpl implements IBookFileService {

    @Resource
    private IBookFileDao bookFileDao;

    @Override
    public Boolean addBookFile(BookFile bookFile) {
        return bookFileDao.insertBookFile(bookFile);
    }

    @Override
    public ArrayList<BookFile> getBookFileById(String book_id) {
        return bookFileDao.selectBookFileById(book_id);
    }
}
