package com.zhiyou.service;

import java.util.List;


import com.zhiyou.model.Subject;

public interface SubjectService {
	
	void add(Subject subject);
	void delete(int id);
	void update(Subject subject);
	List<Subject> selectAll();

	Subject selectById(int id);
	int selectCount();
	List<Subject> selectLimit(int page,int pageSize);
}
