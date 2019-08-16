package com.zhiyou.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.model.Video;

public interface VideoService {
	
	void add(Video video);
	void delete(int id);
	void update(Video video);
	List<Video> selectAll();
	Video selectById(int id);
	int selectCount();
	List<Video> selectLimit(int page,int pageSize);
	void deleteAllVideo(int[] str);
	List<Video> selectLike(String title,int speaker_id,int course_id);
	int selectLikeCount(String title,int speaker_id,int course_id);
	Video selectVideo(int id);


}
