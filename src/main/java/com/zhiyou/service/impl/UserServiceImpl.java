package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.dao.UserDao;
import com.zhiyou.model.User;
import com.zhiyou.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao userDao;

	public void add(User user) {
		userDao.add(user);
	}

	public void delete() {
		userDao.delete();
	}

	public void update(User user) {
		userDao.update(user);
	}

	public List<User> selectAll() {
		return userDao.selectAll();
	}

	public User selectByAccount(String account) {
		
		return userDao.selectByAccount(account);
	}

}
