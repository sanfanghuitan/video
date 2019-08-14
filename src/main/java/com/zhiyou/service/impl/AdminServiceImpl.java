package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.dao.AdminDao;
import com.zhiyou.model.Admin;
import com.zhiyou.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminDao adminDao;

	public void add() {
		adminDao.add();
	}

	public void delete() {
		adminDao.delete();
	}

	public void update() {
		adminDao.update();
	}

	public List<Admin> selectAll() {
		
		return adminDao.selectAll();
	}

	public Admin selectByAccount(String account) {
		
		return adminDao.selectByAccount(account);
	}

}
