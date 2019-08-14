package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.dao.SpeakerDao;
import com.zhiyou.model.Speaker;
import com.zhiyou.service.SpeakerService;

@Service
public class SpeakerServiceImpl implements SpeakerService{
	
	@Autowired
	SpeakerDao speakerDao;

	public void add(Speaker speaker) {
		speakerDao.add(speaker);
	}

	public void delete(int id) {
		speakerDao.delete(id);
	}

	public void update(Speaker speaker) {
		speakerDao.update(speaker);
	}

	public List<Speaker> selectAll() {
		
		return speakerDao.selectAll();
	}

	public Speaker selectById(int id) {
		
		return speakerDao.selectById(id);
	}

	public int selectCount() {
		
		return speakerDao.selectCount();
	}

	public List<Speaker> selectLimit(int page, int pageSize) {
	
		return speakerDao.selectLimit(page, pageSize);
	}

	public void deleteAllSpeaker(int[] str) {
		speakerDao.deleteAllSpeaker(str);
	}

	
}
