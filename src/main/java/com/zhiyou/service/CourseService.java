package com.zhiyou.service;

import java.util.List;


import com.zhiyou.model.Course;
import com.zhiyou.utils.VideoResult;

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
	
	// 根据subjectId查询
	VideoResult selectCourse(int subjectId);
	// 根据videoId查询
	VideoResult selectVideo(int videoId);
	// 根据subjectId查询数据
	VideoResult selectSpeaker(int speakerId);

}
