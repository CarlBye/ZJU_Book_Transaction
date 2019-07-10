package com.carl.service;

import com.carl.pojo.User;

import java.util.List;

public interface UserService {
	void addUser(User user);

	User getUserByEmail(String email);

	User selectByPrimaryKey(Integer id);

	List<User> getPageUser(int pageNum, int pageSize);

	int getUserNum();

	int getUserNum(String userName);

	List<User> getPageUser(int pageNum, int pageSize, String username);

	User getUserById(int id);

	void deleteUserById(String idArr);

	List<User> getPageUserByUser(String email, String userName, int pageNum, int pageSize);

}