package com.zhiyou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.zhiyou.model.Subject;

public interface SubjectDao {
	
	void add(Subject subject);
	void delete(int id);
	void update(Subject subject);
	List<Subject> selectAll();
	Subject selectById(int id);
	int selectCount();
	List<Subject> selectLimit(@Param("page") int page,@Param("pageSize") int pageSize);

}
