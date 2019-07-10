package com.carl.controller;

import com.carl.pojo.*;
import com.carl.service.*;
import com.carl.util.DateUtil;
import com.carl.util.MD5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
	private UserService userService;
	@Resource
	private BooksService BooksService;


	@RequestMapping(value = "/loginRegister")
	public String loginRegister() {
		return "/user/loginRegister";
	}

	/**
	 * 用户注册
	 */
	@RequestMapping(value = "/addUser")
	public String addUser(HttpServletRequest request, @ModelAttribute("user") User user1) {
		String url = request.getHeader("Referer");
		User user = userService.getUserByEmail(user1.getEmail());
		if (user == null && user1.getPassword().length() > 6) {// 检测该用户是否已经注册
			String t = DateUtil.getNowDate();
			// 对密码进行MD5加密
			String str = MD5.md5(user1.getPassword());
			user1.setPassword(str);
			userService.addUser(user1);

			User cur_user = userService.getUserByEmail(user1.getEmail());
			request.getSession().setAttribute("cur_user", cur_user);
			return "redirect:/books/homeBooks";
		}
		return "redirect:" + url;
	}
	/**
	 * 验证登录
	 */
	@RequestMapping(value = "/login")
	public String loginValidate(HttpServletRequest request, User user) {
		User cur_user = userService.getUserByEmail(user.getEmail());
		String url = request.getHeader("Referer");
		if (cur_user != null) {
			String pwd = MD5.md5(user.getPassword());
			if (pwd.equals(cur_user.getPassword())) {
				request.getSession().setAttribute("cur_user", cur_user);
				return "redirect:/books/homeBooks";
			}
		}
		return "redirect:" + url;
	}

	/**
	 * 用户退出
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().setAttribute("cur_user", null);
		return "redirect:/books/homeBooks";
	}

	/**
	 * 个人中心
	 */
	@RequestMapping(value = "/home")
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		User cur_user = (User) request.getSession().getAttribute("cur_user");
		Integer userId = cur_user.getId();
		int size=5;
		List<User> users=userService.getPageUser(0, size);
		mv.addObject("users", users);
		mv.setViewName("/user/home");
		return mv;
	}
	/**
	 * 我的闲置
	 */
	@RequestMapping(value = "/allBooks")
	public ModelAndView Books(HttpServletRequest request) {
		User cur_user = (User) request.getSession().getAttribute("cur_user");
		Integer userId = cur_user.getId();
		List<Books> booksList = BooksService.getBooksByUserIdAndStatus(userId, 1);
		List<BooksExtend> booksAndImage = new ArrayList<>();
		for (int i = 0; i < booksList.size(); i++) {
			// 将用户信息和image信息封装到BooksExtend类中，传给前台
			BooksExtend booksExtend = new BooksExtend();
			Books books = booksList.get(i);
			booksExtend.setBooks(books);
			booksAndImage.add(i, booksExtend);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("booksAndImage", booksAndImage);
		mv.setViewName("user/myBooks");
		return mv;
	}
	/**
	 * 我的求购
	 */
	@RequestMapping(value = "/allWants")
	public ModelAndView Wants(HttpServletRequest request) {
		User cur_user = (User) request.getSession().getAttribute("cur_user");
		Integer userId = cur_user.getId();
		List<Books> booksList = BooksService.getBooksByUserIdAndStatus(userId, 2);
		List<BooksExtend> booksAndImage = new ArrayList<>();
		for (int i = 0; i < booksList.size(); i++) {
			// 将用户信息和image信息封装到BooksExtend类中，传给前台
			BooksExtend booksExtend = new BooksExtend();
			Books books = booksList.get(i);
			booksExtend.setBooks(books);
			booksAndImage.add(i, booksExtend);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("booksAndImage", booksAndImage);
		mv.setViewName("user/myWants");
		return mv;
	}
}
