package com.zhiyou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.model.Course;

public interface CourseDao {
	
	void add(Course course);
	void delete(int id);
	void update(Course course);
	List<Course> selectAll();
	Course selectById(int id);
	int selectCount();
	List<Course> selectLimit(@Param("page") int page,@Param("pageSize") int pageSize);
	void deleteAll(@Param("str") int[] str);
	Course selectOne(int id);

}
