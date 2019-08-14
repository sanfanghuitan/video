package com.zhiyou.controller;

import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou.service.CourseService;
import com.zhiyou.service.VideoService;
import com.zhiyou.utils.VideoResult;

@Controller
@RequestMapping("video")
public class VideoforeController {

	@Autowired
	private CourseService courseService;
	@Autowired
	private VideoService videoService;
	
	@RequestMapping("courseShow")
	public String courseShow(Model model, HttpServletRequest req) {
		VideoResult result = courseService.selectCourse(Integer.valueOf(req.getParameter("subjectId")));
		if (result.getStatus()==400) {
			req.setAttribute("msg", "该课程暂未开放！");
			System.out.println("------");
			return "index";
		} else {
			model.addAttribute("course", result);
		}
		return "courseShow";
	}
	
	@RequestMapping("playVideo")
	public String playVideo(Model model, HttpServletRequest req) {
		System.out.println("-------------"+req.getParameter("video_id"));
		System.out.println("-------------"+req.getParameter("speaker_id"));
		VideoResult result = courseService.selectVideo(Integer.valueOf(req.getParameter("video_id")));
		VideoResult result2 = courseService.selectSpeaker(Integer.valueOf(req.getParameter("speaker_id")));
		model.addAttribute("list", result);
		model.addAttribute("speaker", result2);
		return "playVideo";
	}
	
}
