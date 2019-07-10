package com.carl.dao;

import com.carl.pojo.Books;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BooksMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Books record);

    int insertSelective(Books record);

    Books selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Books record);

    int updateByPrimaryKeyWithBLOBs(Books record);

    int updateByPrimaryKey(Books record);


    Books selectById(Integer BooksId);
    /**
     * 提交订单时下架
     */
    int downBookById(Integer BooksId);
    /**
     * 查询所有的书籍
     */
    List<Books> selectAllBooks();

    List<Books> searchBooksByStatus(@Param("status") Integer status, @Param("name") String name);

    /**
     * 根据最新发布分类，查询书籍
     */
    public List<Books> selectByStr(@Param("limit")Integer limit,@Param("name") String name);

    /**
     * 根据书籍分类的id，查询书籍
     */
    public List<Books> selectByTypeAndStatus(@Param("type_id") Integer type_id, @Param("status") Integer status, @Param("name") String name);

    /**
     * 根据type_id查询书籍信息，结果按更新时间排序，最新的在前
     */
    public List<Books> selectByTypeOrderByDate(@Param("typeId")Integer typeId,@Param("limit")Integer limit);


    /**
     * 查询最新发布书籍信息，结果按更新时间排序，最新的在前
     */
    public List<Books> selectOrderByDate(@Param("limit")Integer limit);

    /**
     * 查询登录用户的书籍
     */
    public List<Books> getBooksByUserIdAndStatus(@Param("userId")Integer userId, @Param("status")Integer status);


    /**
     * 获取书籍数
     */
    List<Books> getBooksList();
    /**
     * 模糊查询
     */
    List<Books> getPageBooksByBooks(@Param("id")Integer id, @Param("name")String name,@Param("form")Integer form);
}