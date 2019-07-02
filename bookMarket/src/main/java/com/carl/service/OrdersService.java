package com.carl.service;

import com.carl.pojo.Orders;

import java.util.List;

public interface OrdersService {
	
	public List<Orders> getOrdersByUserId(Integer user_id);
	
	public List<Orders> getOrdersByUserAndBooks(Integer user_id);

	public void addOrders(Orders orders);

	public void updateByPrimaryKey(Integer id, Orders orders);

}
