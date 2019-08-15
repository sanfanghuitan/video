package com.zhiyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.style.DefaultValueStyler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
	public String courseShow(@RequestParam(defaultValue="0")Integer pages,Model model){
		PageHelper.startPage(pages,5);
	
		List<Course> courses = courseService.selectAll();
		
		PageInfo<Course> pageInfo = new PageInfo<Course>(courses);
		model.addAttribute("count", pageInfo.getTotal());
		model.addAttribute("course", pageInfo.getList());
		model.addAttribute("page", pageInfo.getPageNum());
		return "courseManage";
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
