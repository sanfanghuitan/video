package com.zhiyou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.model.Video;

public interface VideoDao {
	
	void add(Video video);
	void delete(int id);
	void update(Video video);
	List<Video> selectAll();
	Video selectById(int id);
	int selectCount();
	List<Video> selectLimit(@Param("page") int page,@Param("pageSize") int pageSize);
	void deleteAllVideo(@Param("str") int[] str);
	List<Video> selectLike(@Param("title") String title,@Param("speaker_id") int speaker_id,@Param("course_id") int course_id);
	int selectLikeCount(@Param("title") String title,@Param("speaker_id") int speaker_id,@Param("course_id") int course_id);
	Video selectVideo(int id);

}
