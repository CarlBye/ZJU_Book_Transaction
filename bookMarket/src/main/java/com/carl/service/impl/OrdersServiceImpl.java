package com.carl.service.impl;

import com.github.pagehelper.PageHelper;
import com.carl.dao.OrdersMapper;
import com.carl.pojo.Orders;
import com.carl.service.OrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersService {
	
	@Resource
	private OrdersMapper ordersMapper;

	public List<Orders> getOrdersByUserId(Integer user_id) {
		// TODO Auto-generated method stub
		List<Orders> orders=ordersMapper.selectOrdersByUserId(user_id);
		return orders;
	}

	@Override
	public List<Orders> getOrdersByUserAndBooks(Integer user_id) {
		// TODO Auto-generated method stub
		
		List<Orders> ordersOfSell=ordersMapper.selectOrdersByUserAndBooks(user_id);
		return ordersOfSell;
	}

	@Override
	public void addOrders(Orders orders) {
		// TODO Auto-generated method stub
		
		ordersMapper.addOrders(orders);
		
	}

	@Override
	public void updateByPrimaryKey(Integer id, Orders orders) {
			orders.setId(id);
	        this.ordersMapper.updateByPrimaryKey(orders);
		
	}
}
