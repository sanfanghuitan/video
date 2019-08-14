package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.User;

public interface UserDao {
	
	void add(User user);
	void delete();
	void update(User user);
	List<User> selectAll();
	User selectByAccount(String account);

}
