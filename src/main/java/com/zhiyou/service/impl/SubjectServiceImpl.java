package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.dao.SubjectDao;
import com.zhiyou.model.Subject;
import com.zhiyou.service.SubjectService;

@Service
public class SubjectServiceImpl implements SubjectService{
	
	@Autowired
	SubjectDao subjectDao;

	public void add(Subject subject) {
		subjectDao.add(subject);
	}

	public void delete(int id) {
		subjectDao.delete(id);
	}

	public void update(Subject subject) {
		subjectDao.update(subject);
	}

	public List<Subject> selectAll() {
		
		return subjectDao.selectAll();
	}

	public Subject selectById(int id) {
		
		return subjectDao.selectById(id);
	}

	public int selectCount() {
		// TODO Auto-generated method stub
		return subjectDao.selectCount();
	}

	public List<Subject> selectLimit(int page, int pageSize) {
		// TODO Auto-generated method stub
		return subjectDao.selectLimit(page, pageSize);
	}

}
