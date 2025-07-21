package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MainApp.Entity.Notice;
import com.MainApp.Entity.User;
import com.MainApp.Service.NoticeService;
import com.MainApp.Service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class userRegisterLoginLogout {
 
	@Autowired
	UserService uService;
	
	@Autowired
	NoticeService nService;
	
	@RequestMapping("/uregister")
	public String showUserRegister()
	{
		
		return "userregister";
	}
	
	@RequestMapping("/user-register")
	public String handleUserRegister(@ModelAttribute User u,HttpServletRequest req)
	{
		boolean status = uService.addUser(u);
		
		HttpSession s = req.getSession();
		
		if(status)
		{
			s.setAttribute("msg", "Registered Successfully");
		}
		else
		{
			s.setAttribute("msg", "Something went wrong..");
		}
		
		return "redirect:/uregister";
	}
	
	@RequestMapping("/ulogin")
	public String showUserLogin()
	{
		
		return "userlogin";
	}
	
	
	@RequestMapping("/user-login")
	public String handleUserLogin(@RequestParam("userName") String name
	,@RequestParam("userpass") int pass,HttpServletRequest req,Model model)
	{
		
		String res = uService.checkUser(pass, name);
		HttpSession s = req.getSession();
		
		if(res.equals("exists"))
		{
			//displaying notices
			List<Notice> lan = nService.getallNotices(); 
			model.addAttribute("lan" , lan);
			
			
			s.setAttribute("utoken", name);
			return "userhome";
		}
		else
		{
			s.setAttribute("msg", res);
			return "userregister";
		}
	}
	
	
	@RequestMapping("/user-logout")
	public String handleUserLogout(HttpServletRequest req)
	{
		HttpSession s = req.getSession();
		s.removeAttribute("utoken");
		
		s.setAttribute("msg", "logout successfully..");
		
		 return "redirect:/ulogin";
	}
	
	
	
	
	
	
}
