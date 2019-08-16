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
	public String courseShow(@RequestParam(value="pn",defaultValue="1")Integer pages,Model model){
	
		PageHelper.startPage(pages,5);
		List<Course> courses = courseService.selectAll();
		PageInfo<Course> pageInfo = new PageInfo<Course>(courses,5);
		model.addAttribute("pageInfo", pageInfo);
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

	
	@RequestMapping("addCourse.do")
	public String addCourse(Course course){
	
		courseService.add(course);
		return "redirect:/courseShow";	
	}
	
	@RequestMapping("updateCourse.do")
	public String updateCourse(int id,Model model){
	   System.out.println(courseService.selectOne(id));
		List<Subject> subjects = subjectService.selectAll();
		
		model.addAttribute("subject",subjects);
		model.addAttribute("course",courseService.selectOne(id));

		return "redirect:/courseShow";	
	}
	
	@RequestMapping("alterCourse.do")
	public String alterCourse(Course course){
		courseService.update(course);
		return "redirect:/courseShow";
	}
	
	@RequestMapping("deleteAll.do")
	public String deleteAll(int[] str){
       if(str.length!=0){
    	   courseService.deleteAll(str);	
       }		
       return "redirect:/courseShow";
	}

	
	
	
	
}
