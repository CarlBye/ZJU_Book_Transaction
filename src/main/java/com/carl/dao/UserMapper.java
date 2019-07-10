package com.carl.dao;

import com.carl.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User getUserByEmail(String email);

    List<User> getUserList();//获取所有用户

    User getUserById(int id);

    List<User> getUserListByUser(@Param("email") String email, @Param("user_name") String userName);

}