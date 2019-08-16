package com.zhiyou.model;

import java.io.Serializable;
import java.util.List;

public class Course implements Serializable {
	private int id;
	private String course_title;
	private String course_desc; 
	private int subject_id;
	private Subject subject;
	private List<Video> video;

	public List<Video> getVideo() {
		return video;
	}
	public void setVideo(List<Video> video) {
		this.video = video;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourse_title() {
		return course_title;
	}
	public void setCourse_title(String course_title) {
		this.course_title = course_title;
	}
	public String getCourse_desc() {
		return course_desc;
	}
	public void setCourse_desc(String course_desc) {
		this.course_desc = course_desc;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}
	
	
	
	@Override
	public String toString() {
		return "Course [id=" + id + ", course_title=" + course_title + ", course_desc=" + course_desc + ", subject_id="
				+ subject_id + ", subject=" + subject + ", video=" + video + "]";
	}
	public Course(int id, String course_title, String course_desc, int subject_id, Subject subject) {
		super();
		this.id = id;
		this.course_title = course_title;
		this.course_desc = course_desc;
		this.subject_id = subject_id;
		this.subject = subject;
	}
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Subject getSubject() {
		return subject;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}
	
	

}
