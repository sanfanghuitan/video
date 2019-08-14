package com.zhiyou.service;

import java.util.List;


import com.zhiyou.model.Course;

public interface CourseService {
	void add(Course course);
	void delete(int id);
	void update(Course course);
	List<Course> selectAll();
	Course selectById(int id);
	int selectCount();
	List<Course> selectLimit(int page,int pageSize);
	void deleteAll(int[] str);
	Course selectOne(int id);

}
