package com.zhiyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.Course;
import com.zhiyou.model.Speaker;
import com.zhiyou.service.SpeakerService;

@Controller
public class SpeakerController {
	
	@Autowired
	SpeakerService speakerService;
	
	@RequestMapping("SpeakerShow.do")
	public String SpeakerShow(@RequestParam(value="pn",defaultValue="1") Integer pages,Model model){
	
		PageHelper.startPage(pages,5);
		List<Speaker> speakers = speakerService.selectAll();
		PageInfo<Speaker> pageInfo = new PageInfo<Speaker>(speakers,5);
		model.addAttribute("pageInfo", pageInfo);
		return "speakerManage";
				
	}
	
	
	
	@RequestMapping("addSpeakerShow.do")
	public String addCourse(){
		
		return "addSpeaker";
				
	}
	
	
	@RequestMapping("deleteSpeaker.do")
	public String deleteCourse(Integer id){
		
		
		speakerService.delete(id);
		return "redirect:addSpeakerShow.do";	
				
	}
	
	@RequestMapping("addSpeaker.do")
	public String addSpeaker(Speaker speaker){
	
		speakerService.add(speaker);
		return "redirect:addSpeakerShow.do";	
	}
	
	@RequestMapping("updateSpeaker.do")
	public String updateSpeaker(int id,Model model){
	
	model.addAttribute("speaker",speakerService.selectById(id));

		return "updateSpeaker";	
	}
	
	@RequestMapping("alterSpeaker.do")
	public String alterSpeaker(Speaker speaker){
		speakerService.update(speaker);
		return "redirect:addSpeakerShow.do";	
	}
	
	@RequestMapping("deleteAllSpeaker.do")
	public String deleteAll(int[] str){

		if(str.length!=0){
			speakerService.deleteAllSpeaker(str);	
		}
		return "redirect:addSpeakerShow.do";		
	}
	
	
	
	
	

}
