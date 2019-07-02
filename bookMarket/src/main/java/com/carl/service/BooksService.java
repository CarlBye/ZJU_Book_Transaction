package com.carl.service;

import com.carl.pojo.Books;

import java.util.List;

public interface BooksService {
    /**
     * 发布书籍
     * duration 允许上架时长
     */
    int addBooks(Books books, Integer duration);

    /**
     * 通过主键获取书籍
     */
    Books getBooksByPrimaryKey(Integer booksId);
    
    Books getBooksById(Integer booksId);

    /**
     * 更新书籍信息
     */
    void updateBooksByPrimaryKeyWithBLOBs(int booksId, Books books);

    /**
     * 通过主键删除书籍
     */
    void downBookById(Integer id);//更新
    
    void deleteBooksByPrimaryKey(Integer id);//删除

    /**
     * 获取所有书籍信息
     */
    List<Books> getAllBooks();

    List<Books> searchBooksByStatus(Integer status, String name);

    /**
     * 通过最新发布分类获取书籍信息
     */
    List<Books> getBooksByStr(Integer limit, String name);

    /**
     * 通过书籍分类和关键字查询书籍信息
     */
    List<Books> getBooksByTypeAndStatus(Integer id, Integer status, String name);

    
    /**
     * 获取 最新发布 物品，根据时间排序,获取前limit个结果
     */
    List<Books> getBooksOrderByDate(Integer limit);
    /**
     * 根据分类id,并进行时间排序,获取前limit个结果
     */
    List<Books> getBooksByTypeOrderByDate(Integer catelogId, Integer limit);

    /**
     * 根据用户的id，查询出该用户的所有闲置
     */
    List<Books> getBooksByUserIdAndStatus(Integer userId, Integer status);

	/**
	 * 获取书籍数
	 */
	int getBooksNum();

	List<Books> getPageBooks(int pageNum, int pageSize);
	
	/**
	 * 模糊查询
	 */
	List<Books> getPageBooksByBooks(Integer id, String name, Integer form, int pageNum, int pageSize);

}