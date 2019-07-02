package com.carl.service.impl;

import com.github.pagehelper.PageHelper;
import com.carl.dao.UserMapper;
import com.carl.pojo.User;
import com.carl.service.UserService;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    public void addUser(User user) {
        userMapper.insert(user);
    }

    public User getUserByEmail(String email) {
        User user  = userMapper.getUserByEmail(email);
        return  user;
    }

    public void updateuserName(User  user) {
        userMapper.updateByPrimaryKey(user);
    }

    public User selectByPrimaryKey(Integer id) {
        User user = userMapper.selectByPrimaryKey(id);
        return user;
    }

    //获取出当前页用户
    public List<User> getPageUser(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);//分页核心代码
        List<User> list= userMapper.getUserList();
        return list;
    }

    //获取出用户的数量
    public int getUserNum() {
        List<User> users = userMapper.getUserList();
        return users.size();
    }


    public static HttpSession getSession() {
        HttpSession session = null;
        try {
            session = getRequest().getSession();
        } catch (Exception e) {}
        return session;
    }

    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attrs =(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs.getRequest();
    }

    public int getUserNum(String userName) {
        // TODO Auto-generated method stub
        return 0;
    }

    public InputStream getInputStream1SS() throws Exception {
        // TODO Auto-generated method stub
        return null;
    }

    public List<User> getPageUser(int pageNum, int pageSize, String userName) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public User getUserById(int id) {

        return userMapper.getUserById(id);
    }

    @Override
    public void deleteUserById(String ids) {
        this.userMapper.deleteByPrimaryKey(Integer.parseInt(ids));

    }

    @Override
    public List<User> getPageUserByUser(String email, String userName, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);//分页核心代码
        List<User> list= userMapper.getUserListByUser(email,userName);
        return list;

    }

}