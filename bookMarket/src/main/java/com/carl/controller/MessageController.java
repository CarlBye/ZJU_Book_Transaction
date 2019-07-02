package com.carl.controller;

import com.carl.pojo.*;
import com.carl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping(value="/message")
public class MessageController {

    @Resource
    private MessageService messageService;
    @Resource
    private BooksService booksService;
    @Resource
    private UserService userService;

    ModelAndView mv = new ModelAndView();
    /**
     * 收件箱
     */
    @RequestMapping(value = "/inbox/{id}")
    public ModelAndView getInbox(HttpServletRequest request) {
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        List<Message> messageList = messageService.selectByReceiverId(user_id);
        List<MessageExtend> messageExList = new ArrayList<>();
        for (int i = 0; i < messageList.size(); i++) {
            MessageExtend messageExtend = new MessageExtend();
            messageExtend.setReceiver(userService.getUserById(messageList.get(i).getReceiverId()));
            messageExtend.setSender(userService.getUserById(messageList.get(i).getSendId()));
            messageExtend.setBooks(booksService.getBooksById(messageList.get(i).getBookId()));
            messageExtend.setMessage(messageList.get(i));

            messageExList.add(messageExtend);
        }
        mv.addObject("messages",messageExList);
        mv.setViewName("message/myInbox");
        return mv;
    }
    /**
     * 已发送
     */
    @RequestMapping(value = "/sent/{id}")
    public ModelAndView getSent(HttpServletRequest request, @PathVariable("id") Integer id) {
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        List<Message> messageList = messageService.selectBySenderId(user_id);
        List<MessageExtend> messageExList = new ArrayList<>();
        for (int i = 0; i < messageList.size(); i++) {
            MessageExtend messageExtend = new MessageExtend();
            messageExtend.setReceiver(userService.getUserById(messageList.get(i).getReceiverId()));
            messageExtend.setSender(userService.getUserById(messageList.get(i).getSendId()));
            messageExtend.setMessage(messageList.get(i));

            messageExList.add(messageExtend);
        }
        mv.addObject("messages", messageExList);
        mv.addObject("selectId", id);
        mv.setViewName("message/mySent");
        return mv;
    }

    /**
     * 发送邮件
     */
    @RequestMapping(value = "/addMessage")
    public String addMessage(HttpServletRequest request, Message message) {
        if (request.getSession().getAttribute("cur_user") == null) {
            return "redirect:/user/loginRegister";
        }
        Date d = new Date();//获取时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//转换格式
        User cur_user = (User)request.getSession().getAttribute("cur_user");
        Integer user_id = cur_user.getId();
        message.setSendId(user_id);
        message.setTime(sdf.format(d));
        messageService.addMessage(message);
        return "redirect:/message/sent/0";
    }
}
