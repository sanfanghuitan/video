package com.zhiyou.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou.model.Admin;
import com.zhiyou.service.AdminService;
/**
 * 管理员登录校验退出
 * @author 李爽
 *
 */
@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	
	@RequestMapping("AdminLogin")
	public void loginCheck(String adminPassword,String adminAccount,
			HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		Admin admin = adminService.selectByAccount(adminAccount);
		request.getSession().setAttribute("admin", admin);		
		response.sendRedirect("courseShow");
		
	}
	
	@RequestMapping("adminExit")
	public String adminExit(HttpServletRequest request){
		request.getSession().invalidate();
		return "index";
	}
	
	@RequestMapping("checkAdminAccount.login")
    public void checkAdminAccount(String accounts,HttpServletResponse resp) throws ServletException, IOException{		 
	
		Admin admin = adminService.selectByAccount(accounts);
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
