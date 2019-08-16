package com.zhiyou.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.instrument.classloading.ShadowingClassLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.Admin;
import com.zhiyou.service.AdminService;
/**
 * ����Ա��¼У���˳�
 * @author ��ˬ
 *
 */
@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	
	
	@RequestMapping("adminManage.do")
	public String Show(Model model,@RequestParam(value="pn",defaultValue="1")Integer pages){
		PageHelper.startPage(pages,5);
		List<Admin> selectAll = adminService.selectAll();
		PageInfo<Admin> pageInfo = new PageInfo<>(selectAll);
		model.addAttribute("pageInfo",pageInfo);
		return "adminManage";
	}
	
	
	@RequestMapping("AdminLogin.login")
	public String loginCheck(String adminPassword,String adminAccount,
			HttpServletRequest request) throws IOException{
		
		Admin admin = adminService.selectByAccount(adminAccount);
		System.out.println(admin);
		request.getSession().setAttribute("admin", admin);		
		return "redirect:/courseShow";
	}
	
	@RequestMapping("adminExit.do")
	public String adminExit(HttpServletRequest request){
		request.getSession().invalidate();
		return "index";
	}
	
	@RequestMapping("checkAdminAccount.login")
	@ResponseBody
    public void checkAdminAccount(String account,HttpServletResponse resp) throws ServletException, IOException{		 
	
		System.out.println(account);
		Admin admin = adminService.selectByAccount(account);
		if(admin!=null){	
			resp.getWriter().append("success");
		}else{
			resp.getWriter().append("default");
		}		 
	}
	
	@RequestMapping("checkAdminPassword.login")
    public void checkAdminPassword(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{		 
		String accounts = req.getParameter("account");
		String password = req.getParameter("password");

		Admin admin = adminService.selectByAccount(accounts);
		if(admin!=null){
			if(!(admin.getPassword().equals(password))){
				resp.getWriter().append("default");	
			}else{		
				resp.getWriter().append("success");
			}			
		}else{
			resp.getWriter().append("default");
		}	 
	}

}
