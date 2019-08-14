package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.dao.CourseDao;
import com.zhiyou.model.Course;
import com.zhiyou.service.CourseService;
import com.zhiyou.utils.VideoResult;

@Service
public class CouseServiceImpl implements CourseService{
	@Autowired
	CourseDao courseDao;

	public void add(Course course) {
		courseDao.add(course);
	}

	public void delete(int id) {
		courseDao.delete(id);
	}

	public void update(Course course) {
		courseDao.update(course);
	}

	public List<Course> selectAll() {
		
		return courseDao.selectAll();
	}

	public Course selectById(int id) {
	
		return courseDao.selectById(id);
	}

	public int selectCount() {
		
		return courseDao.selectCount();
	}

	public List<Course> selectLimit(int page, int pageSize) {
		
		return courseDao.selectLimit(page, pageSize);
	}

	public void deleteAll(int[] str) {
		courseDao.deleteAll(str);
	}

	public Course selectOne(int id) {
		// TODO Auto-generated method stub
		return courseDao.selectOne(id);
	}

	/**
	 * 根据subjectId查询
	 */
	@Override
	public VideoResult selectCourse(int subjectId) {
		List<Course> list = courseDao.selectCourse(subjectId);
		if (list.isEmpty()) {
			return VideoResult.build(400, "错误操作", list);
		} 
		return VideoResult.success(list);
	}

	@Override
	public VideoResult selectVideo(int videoId) {
		List<Course> list = courseDao.selectVideo(videoId);
		return VideoResult.success(list);
	}

	@Override
	public VideoResult selectSpeaker(int speakerId) {
		List<Course> list = courseDao.selectSpeaker(speakerId);
		return VideoResult.success(list);
	}

}
