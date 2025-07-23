package com.MainApp.Controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MainApp.Entity.Admin;
import com.MainApp.Entity.Complaint;
import com.MainApp.Entity.Notice;
import com.MainApp.Entity.User;
import com.MainApp.Service.AdminService;
import com.MainApp.Service.ComplaintService;
import com.MainApp.Service.NoticeService;
import com.MainApp.Service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class adminRegisterLoginLogout {

	@Autowired
	AdminService aService;
	
	@Autowired
	NoticeService nService;
	
	@Autowired
	ComplaintService cService;
	
	@Autowired
	UserService uService;
	
	
	 
	@RequestMapping("/aregister")
	public String showAdminRegister()
	{
		
		return "adminregister";
	}
	
	@RequestMapping("/admin-register")
	public String handleAdminRegister(@ModelAttribute Admin a,
	HttpServletRequest req)
	{
		boolean status=aService.addAdmin(a);
		HttpSession s = req.getSession();
		
		if(status)
		{
			s.setAttribute("msg", "Registered Successfully");
		}
		else
		{
			s.setAttribute("msg", "Something went wrong");
		}
		
		return "redirect:/aregister";
	}
	
	
	@RequestMapping("/alogin")
	public String showAdminLogin()
	{
		
		return "adminlogin";
	}
	
	@RequestMapping("/ahome")
	public String showAdminHome()
	{
		return "adminhome";
	}
	
	
	@RequestMapping("/admin-login")
	public String handleAdminlogin(@RequestParam("name") String name
	,@RequestParam("pass") String pass,
	HttpServletRequest req,Model model) 
	{
		String res = aService.CheckAdmin(name, pass);
		HttpSession s = req.getSession();
        
		
		if(res.equals("exists"))
		{
			//notice added by admin 
			List<Notice> ln = nService.getNotices(name);
			model.addAttribute("ln",ln);
			 
			//for taking complaints from user to admin 
			List<Complaint> lac = cService.getAllComplaints();
			model.addAttribute("lac",lac);
			
			//for taking users information to the admin
			
			List<User> lau = uService.getallMembers();
			model.addAttribute("lau",lau);
			
			
			s.setAttribute("atoken", name);
			return "adminhome";
		}
		else
		{
			s.setAttribute("msg", res);
			return "adminregister";
		}
		
		
	}
	
	 
	@RequestMapping("/admin-logout")
	public String handleAdminLogout(HttpServletRequest req)
	{
		
		HttpSession s = req.getSession();
		s.removeAttribute("atoken");
		
		s.setAttribute("msg", "logout Successfully");
		return "redirect:/alogin";
	}
	
	
}
