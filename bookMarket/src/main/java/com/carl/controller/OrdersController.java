package com.carl.controller;

import com.carl.pojo.Orders;
import com.carl.pojo.OrdersExtend;
import com.carl.pojo.User;
import com.carl.service.BooksService;
import com.carl.service.OrdersService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value="/orders")
public class OrdersController {
	
	@Resource
	private OrdersService ordersService;
	@Resource
	private BooksService booksService;

    ModelAndView mv = new ModelAndView();
	
	 /**
     * 我的订单 买
     */
    @RequestMapping(value = "/myOrders")
    public ModelAndView orders(HttpServletRequest request) {
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        List<Orders> ordersList1 = ordersService.getOrdersByUserId(user_id);
        List<Orders> ordersList2 = ordersService.getOrdersByUserAndBooks(user_id);
        List<OrdersExtend> ordersExList1 = new ArrayList<>();
        List<OrdersExtend> ordersExList2 = new ArrayList<>();
        for (int i = 0; i < ordersList1.size(); i++) {
            OrdersExtend ordersExtend = new OrdersExtend();
            ordersExtend.setOrders(ordersList1.get(i));
            ordersExtend.setBooks(booksService.getBooksById(ordersList1.get(i).getBooksId()));
            ordersExList1.add(ordersExtend);
        }
        for (int i = 0; i < ordersList2.size(); i++) {
            OrdersExtend ordersExtend = new OrdersExtend();
            ordersExtend.setOrders(ordersList2.get(i));
            ordersExtend.setBooks(booksService.getBooksById(ordersList2.get(i).getBooksId()));
            ordersExList2.add(ordersExtend);
        }
        mv.addObject("ordersOfSell",ordersExList2);
        mv.addObject("orders",ordersExList1);
        mv.setViewName("user/myOrders");
        return mv;
    }
    
    
	 /**
     * 提交订单
     */
    @RequestMapping(value = "/addOrders")
    public String addOrders(HttpServletRequest request, Orders orders) {
    	Date d=new Date();//获取时间
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//转换格式
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        orders.setUserId(user_id);
        orders.setDate(sdf.format(d));
//        orders.setNum(RandomNum.getRandomNum());
//        Books books=new Books();
//        books.setStatus(0);
//        books.setId(orders.getBooksId());
        booksService.downBookById(orders.getBooksId());
        ordersService.addOrders(orders);
        return "redirect:/orders/myOrders";
    }

}
