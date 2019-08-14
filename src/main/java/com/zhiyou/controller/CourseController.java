package com.zhiyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.zhiyou.model.Course;
import com.zhiyou.model.Subject;
import com.zhiyou.service.CourseService;
import com.zhiyou.service.SubjectService;

@Controller
public class CourseController {
	@Autowired
	CourseService courseService;
	
	@Autowired
	SubjectService subjectService;
	
	@RequestMapping("courseShow")
	public String courseShow(Integer pages,Integer num,Model model){
		PageHelper.startPage(pages,num);
		List<Course> courses = courseService.selectAll();
		model.addAttribute("course", courses);
		return "courseShow";
	}
	
	@RequestMapping("addCourseShow.do")
	public String addCourse(Model model){
		
		List<Subject> subject = subjectService.selectAll();
		model.addAttribute("subject", subject);
		return "addCourse";
		
	}
	
	@RequestMapping("deleteCourse.do")
	public String deleteCourse(Integer id){
		
		courseService.delete(id);
		
		return "redirect:/courseShow";
	}

}
