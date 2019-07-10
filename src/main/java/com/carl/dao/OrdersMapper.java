package com.carl.dao;

import com.carl.pojo.Orders;

import java.util.List;

public interface OrdersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);


    /**
     * 查询用户的订单 买
     */
    List<Orders> selectOrdersByUserId(Integer user_id);

    /**
     * 查询用户的订单 卖
     */

    List<Orders> selectOrdersByUserAndBooks(Integer user_id);

    /**
     * 添加订单
     */

    void addOrders(Orders orders);
}