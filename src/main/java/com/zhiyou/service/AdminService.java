package com.zhiyou.service;

import java.util.List;

import com.zhiyou.model.Admin;

public interface AdminService {
	
	void add();
	void delete();
	void update();
	List<Admin> selectAll();
	Admin selectByAccount(String account);

}
