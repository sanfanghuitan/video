package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.Admin;


public interface AdminDao {
	void add();
	void delete();
	void update();
	List<Admin> selectAll();
	Admin selectByAccount(String account);

}
