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
	
	/**
	 * 根据subjectId查询课程
	 * @param subjectId
	 * @return
	 */
	List<Course> selectCourse(int subjectId);
	/**
	 * 根据videoId查询数据
	 * @param videoId
	 * @return
	 */
	List<Course> selectVideo(int videoId);
	/**
	 * 根据speakerId查询数据
	 * @param speakerId
	 * @return
	 */
	List<Course> selectSpeaker(int speakerId);

}
