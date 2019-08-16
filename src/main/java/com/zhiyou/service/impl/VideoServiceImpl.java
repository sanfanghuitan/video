package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou.dao.VideoDao;
import com.zhiyou.model.Video;
import com.zhiyou.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService{
	@Autowired
	VideoDao videoDao;

	public void add(Video video) {
		videoDao.add(video);
	}

	public void delete(int id) {
		videoDao.delete(id);
	}

	public void update(Video video) {
		videoDao.update(video);
	}

	public List<Video> selectAll() {
		return videoDao.selectAll();
	}

	public Video selectById(int id) {
	
		return videoDao.selectById(id);
	}

	public int selectCount() {
		return videoDao.selectCount();
	}

	public List<Video> selectLimit(int page, int pageSize) {
		return videoDao.selectLimit(page, pageSize);
	}

	public void deleteAllVideo(int[] str) {
		videoDao.deleteAllVideo(str);
	}

	public List<Video> selectLike(String title,int speaker_id,int course_id) {
		return videoDao.selectLike(title,speaker_id,course_id);
	}

	public int selectLikeCount(String title,int speaker_id,int course_id) {
		// TODO Auto-generated method stub
		return videoDao.selectLikeCount(title,speaker_id,course_id);
	}

	public Video selectVideo(int id) {
		
		return videoDao.selectVideo(id);
	}


}
