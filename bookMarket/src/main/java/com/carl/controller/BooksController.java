package com.carl.controller;

import com.carl.pojo.*;
import com.carl.service.*;
import com.carl.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;


@Controller
@RequestMapping(value = "/books")
public class BooksController {
	@Autowired
	private BooksService booksService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private UserService userService;
	

	/**
	 * 首页显示书籍
	 */
	@RequestMapping(value = "/homeBooks")
	public ModelAndView homeBooks() {
		ModelAndView modelAndView = new ModelAndView();
		// 每个种类显示书籍数量
		int booksSize = 6;

		List<Books> booksList = booksService.getBooksOrderByDate(booksSize);
		List<BooksExtend> booksAndImage = new ArrayList<>();

		for (int j = 0; j < booksList.size(); j++) {
			BooksExtend booksExtend = new BooksExtend();
			Books books = booksList.get(j);
			User user = userService.getUserById(books.getUserId());
			booksExtend.setBooks(books);
			booksExtend.setUser(user);
			booksAndImage.add(j, booksExtend);
		}
		modelAndView.addObject("newlyBooks", booksAndImage);
		modelAndView.setViewName("books/homeBooks");
		return modelAndView;
	}

//	/**
//	 * 全局搜索书籍
//	 */
//	@RequestMapping(value = "/search")
//	public ModelAndView searchBooks(@RequestParam(value = "str", required = false) String str) {
//		List<Books> booksList;
//		if (str == null) str = "";
//		booksList = booksService.searchBooksByStatus(1, str);
//		List<BooksExtend> booksExtendList = new ArrayList<>();
//		for (int i = 0; i < booksList.size(); i++) {
//			BooksExtend booksExtend = new BooksExtend();
//			Books books = booksList.get(i);
//			booksExtend.setBooks(books);
//			booksExtendList.add(i, booksExtend);
//		}
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("booksExtendList", booksExtendList);
//		modelAndView.addObject("search", str);
//		modelAndView.setViewName("/books/searchBooks");
//		return modelAndView;
//	}
	/**
	 * 查询书籍
	 */
	@RequestMapping(value = "/search")
	public ModelAndView typeBooks(HttpServletRequest request, @RequestParam(value = "status", required = false) String status,
								  @RequestParam(value = "typeId", required = false) String typeId,
                                     @RequestParam(value = "str", required = false) String str) throws Exception {
		if(status == null) status = "1";
		if(typeId == null) typeId = "0";
		if(str == null) str = "";
		List<Books> booksList;
		Integer intTypeId = Integer.valueOf(typeId);
		Integer intStatus = Integer.valueOf(status);
		if(intTypeId == 0){
			booksList = booksService.searchBooksByStatus(intStatus, str);
		} else {
			booksList = booksService.getBooksByTypeAndStatus(intTypeId, intStatus, str);
		}
		Type type = typeService.selectByPrimaryKey(intTypeId);
		List<BooksExtend> booksExtendList = new ArrayList<>();
		for (int i = 0; i < booksList.size(); i++) {
			BooksExtend booksExtend = new BooksExtend();
			Books books = booksList.get(i);
			booksExtend.setBooks(books);
			booksExtendList.add(i, booksExtend);
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("booksExtendList", booksExtendList);
		modelAndView.addObject("type", type);
		modelAndView.addObject("search", str);
		modelAndView.setViewName("/books/searchBooks");
		return modelAndView;
	}

	/**
	 * 根据书籍id查询该书籍详细信息
	 */
	@RequestMapping(value = "/booksId/{id}")
	public ModelAndView getBooksById(HttpServletRequest request, @PathVariable("id") Integer id,
                                     @RequestParam(value = "str", required = false) String str) throws Exception {
		Books books = booksService.getBooksByPrimaryKey(id);
		User seller = userService.selectByPrimaryKey(books.getUserId());
		Type type = typeService.selectByPrimaryKey(books.getTypeId());
		BooksExtend booksExtend = new BooksExtend();
		booksExtend.setBooks(books);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("booksExtend", booksExtend);
		modelAndView.addObject("seller", seller);
		modelAndView.addObject("search", str);
		modelAndView.addObject("type", type);
		modelAndView.setViewName("/books/booksDetail");
		return modelAndView;

	}
	
	/**
	 * 书籍下架
	 */
	@RequestMapping(value = "/downBooks")
	public ModelAndView downBooks() throws Exception {

		return null;
	}

	/**
	 * 用户删除书籍
	 */
	@RequestMapping(value = "/deleteBooks/{id}")
	public String deleteBooks(HttpServletRequest request, @PathVariable("id") Integer id) {
		Books books = booksService.getBooksByPrimaryKey(id);
		// 删除书籍后，type的number-1，user表的books_num-1，image删除,更新session的值
		User cur_user = (User) request.getSession().getAttribute("cur_user");
		books.setUserId(cur_user.getId());
		Integer type_id = books.getTypeId();
		Type type = typeService.selectByPrimaryKey(type_id);
		typeService.updateTypeNum(type_id, type.getNumber() - 1);
		booksService.deleteBooksByPrimaryKey(id);
		return "redirect:/user/allBooks";
	}

	/**
	 * 发布书籍
	 */
	@RequestMapping(value = "/addBooks")
	public ModelAndView publishBooks(HttpServletRequest request) {
		// 可以校验用户是否登录
//		User cur_user = (User) request.getSession().getAttribute("cur_user");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/books/addBooks");
		return mv;
	}

	/**
	 * 提交发布的书籍信息(出售/求购)
	 */
	@RequestMapping(value = "/publishBooksSubmit")
	public String publishBooksSubmit(HttpServletRequest request, HttpSession session,
									 Books books, @RequestParam(value = "uploadBookImg")MultipartFile file)
			throws IOException {
		// 查询出当前用户cur_user对象，便于使用id
		String url = request.getHeader("Referer");
		User cur_user = (User) request.getSession().getAttribute("cur_user");
		books.setUserId(cur_user.getId());

		// 原始名称
		String oldFileName = file.getOriginalFilename(); // 获取上传文件的原名
		// 存储图片的物理路径
		String file_path = session.getServletContext().getRealPath("upload");
		// System.out.println("file_path:"+file_path);
		// 上传图片
		if (file != null && oldFileName != null && oldFileName.length() > 0) {
			// 新的图片名称
			String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
			// 新图片
			File newFile = new File(file_path + "/" + newFileName);
			// 将内存中的数据写入磁盘
			file.transferTo(newFile);

			books.setImgUrl(newFileName);
		}
		booksService.addBooks(books, 30);// 在books表中插入物品
		// 发布书籍后，type的number+1
		Integer type_id = books.getTypeId();
		Type type = typeService.selectByPrimaryKey(type_id);
		typeService.updateTypeNum(type_id, type.getNumber() + 1);
		if (books.getStatus() == 1) {
			return "redirect:/user/allBooks";
		} else {
			return "redirect:/user/allWants";
		}
	}



	/**
	 * 购买
	 */
	@RequestMapping(value = "/buyId/{id}")
	public ModelAndView buyBooksById(HttpServletRequest request, @PathVariable("id") Integer id) {
        if (request.getSession().getAttribute("cur_user") == null) {
            return new ModelAndView("redirect:/user/loginRegister");
        }
		Books books = booksService.getBooksByPrimaryKey(id);
		BooksExtend booksExtend = new BooksExtend();
		booksExtend.setBooks(books);
		booksExtend.setUser(userService.getUserById(books.getUserId()));
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("booksExtend", booksExtend);
		modelAndView.setViewName("/books/payment");
		return modelAndView;
	}
}