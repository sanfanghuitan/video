package com.zhiyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.Course;
import com.zhiyou.model.Speaker;
import com.zhiyou.model.Video;
import com.zhiyou.service.CourseService;
import com.zhiyou.service.SpeakerService;
import com.zhiyou.service.VideoService;

@Controller
public class LsVideoController {
	
	
	@Autowired
	VideoService videoService;
	@Autowired
	SpeakerService speakerService;
	@Autowired
	CourseService courseService;
	
	
	@RequestMapping("VideoShow.do")
	public String CourseShow(Model model,@RequestParam(value="pn",defaultValue="1")Integer pages){
		int count = videoService.selectCount();
		int page=pages==null|| pages.equals("")?1:Integer.valueOf(pages);
		List<Video> video = videoService.selectLimit((page-1)*5,5);
		List<Speaker> speaker = speakerService.selectAll();
		List<Course> course = courseService.selectAll();
		model.addAttribute("course",course);
		model.addAttribute("speaker",speaker);
		PageHelper.startPage(pages,5);
		List<Video> videos = videoService.selectAll();
		PageInfo<Video> pageInfo = new PageInfo<Video>(videos,5);
		model.addAttribute("pageInfo", pageInfo);
		return "videoManage";
				
	}
	
	
	
	@RequestMapping("addVideoShow.do")
	public String addCourse(Model model){
		List<Speaker> speaker = speakerService.selectAll();
		List<Course> course = courseService.selectAll();
		model.addAttribute("speaker", speaker);
		model.addAttribute("course", course);
		return "addVideo";		
	}
	
	
	@RequestMapping("deleteVideo.do")
	public String deleteVideo(Integer id){
		
		
		videoService.delete(id);
		return "redirect:VideoShow.do";	
				
	}
	
	@RequestMapping("addVideo.do")
	public String addVideo(Video video){
	
		videoService.add(video);
		return "redirect:VideoShow.do";	
	}
	@RequestMapping("updateVideo.do")
	public String updateCourse(int id,Model model){
		List<Speaker> speaker = speakerService.selectAll();
		List<Course> course = courseService.selectAll();
		model.addAttribute("course",course);
		model.addAttribute("speaker",speaker);
		model.addAttribute("video",videoService.selectById(id));
		return "updateVideo";	
	}
	
	@RequestMapping("alertVideo.do")
	public String alterVideo(Video video){
		videoService.update(video);
		return "redirect:VideoShow.do";		
	}
	
	@RequestMapping("deleteAllVideo.do")
	public String deleteAll(int[] str){
		if(str.length!=0){
			videoService.deleteAllVideo(str);		
		}
		
		return "redirect:VideoShow.do";		
	}
	
	
	@RequestMapping("selectLikeVideo.do")
	public String selectLike(Video video,Model model,@RequestParam(value="pn",defaultValue="1")Integer pages){

		int count = videoService.selectLikeCount(video.getTitle(),video.getSpeaker_id(),video.getCourse_id());
		int page=pages==null|| pages.equals("")?1:Integer.valueOf(pages);
		List<Speaker> speaker = speakerService.selectAll();
		List<Course> course = courseService.selectAll();
		model.addAttribute("course",course);
		model.addAttribute("speaker",speaker);
		model.addAttribute("oldVideo",video);
		
		PageHelper.startPage(pages,5);
		List<Video> videos = videoService.selectLike(video.getTitle(),video.getSpeaker_id(),video.getCourse_id());
		PageInfo<Video> pageInfo = new PageInfo<Video>(videos,5);
		model.addAttribute("pageInfo", pageInfo);
		return "videoManage";
	}

	

	
	
	

}
