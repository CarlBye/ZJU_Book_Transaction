package com.carl.service.impl;

import com.github.pagehelper.PageHelper;
import com.carl.dao.BooksMapper;
import com.carl.pojo.Books;
import com.carl.service.BooksService;
import com.carl.util.DateUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("booksService")
public class BooksServiceImpl implements BooksService {

    @Resource
    private BooksMapper booksMapper;

    public int addBooks(Books books , Integer duration) {
        String startTime = DateUtil.getNowDay();
        String endTime = DateUtil.getLastTime(startTime, duration);
        String updateTime = startTime;

        books.setUpdateTime(updateTime);
        books.setEndTime(endTime);
        books.setStartTime(startTime);
        return booksMapper.insert(books);
    }

    public Books getBooksByPrimaryKey(Integer booksId) {
        Books books = booksMapper.selectByPrimaryKey(booksId);
        return books;
    }

    public Books getBooksById(Integer booksId) {
        Books books = booksMapper.selectById(booksId);
        return books;
    }

    public void downBookById(Integer id) {
        booksMapper.downBookById(id);
    }

    public void deleteBooksByPrimaryKey(Integer id) {
        booksMapper.deleteByPrimaryKey(id);
    }

    public List<Books> getAllBooks() {
        List<Books> books = booksMapper.selectAllBooks();
        return books;
    }

    public List<Books> searchBooksByStatus(Integer status, String name) {
        List<Books> books = booksMapper.searchBooksByStatus(status, name);
        return  books;
    }

    public List<Books> getBooksByStr(Integer limit,String name) {
        List<Books> books = booksMapper.selectByStr(limit, name);
        return books;
    }

    public List<Books> getBooksByTypeAndStatus(Integer id, Integer status, String name) {
        List<Books> books = booksMapper.selectByTypeAndStatus(id, status, name);
        return books;
    }

    public void updateBooksByPrimaryKeyWithBLOBs(int booksId,Books books) {
        books.setId(booksId);
        this.booksMapper.updateByPrimaryKeyWithBLOBs(books);
    }

    public List<Books> getBooksByTypeOrderByDate(Integer typeId,Integer limit) {
        List<Books> booksList = booksMapper.selectByTypeOrderByDate(typeId , limit);
        return booksList;
    }

    public List<Books> getBooksOrderByDate(Integer limit) {
        List<Books> booksList = booksMapper.selectOrderByDate(limit);
        return booksList;
    }

    public List<Books> getBooksByUserIdAndStatus(Integer userId, Integer status) {
        List<Books> booksList = booksMapper.getBooksByUserIdAndStatus(userId, status);
        return booksList;
    }

	public int getBooksNum() {
		 //获取出商品的数量
		List<Books> books = booksMapper.getBooksList();
	    return books.size();
	    }

	public List<Books> getPageBooks(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Books> list =booksMapper.getBooksList();
		return list;
	}

	public List<Books> getPageBooksByBooks(Integer id,String name,Integer form, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Books> list =booksMapper.getPageBooksByBooks(id,name,form);
		return list;
	}
}

