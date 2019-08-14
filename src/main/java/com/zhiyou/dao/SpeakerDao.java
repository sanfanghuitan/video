package com.zhiyou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhiyou.model.Course;
import com.zhiyou.model.Speaker;

public interface SpeakerDao {
	
	void add(Speaker speaker);
	void delete(int id);
	void update(Speaker speaker);
	List<Speaker> selectAll();
	Speaker selectById(int id);
	int selectCount();
	List<Speaker> selectLimit(@Param("page") int page,@Param("pageSize") int pageSize);
	void deleteAllSpeaker(@Param("str") int[] str);
}
