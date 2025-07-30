package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MainApp.Entity.ClubHouse;
import com.MainApp.Entity.Complaint;
import com.MainApp.Entity.Notice;
import com.MainApp.Entity.Staff;
import com.MainApp.Entity.User;
import com.MainApp.Service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class userRegisterLoginLogout {

   
 
	@Autowired
	UserService uService;
	
	@Autowired
	NoticeService nService;
	
	@Autowired
	StaffService stService; 
	
	@Autowired
	ComplaintService cService;
	
	@Autowired
	ClubHouseService clubService;

    
	
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
	
	
	@RequestMapping("/userhome")
	public String hanleUserhome(Model model,HttpServletRequest req)
	{
		//displaying notices
		List<Notice> lan = nService.getallNotices(); 
		model.addAttribute("lan" , lan);
		
		//display staff
		List<Staff> last = stService.getAllStaff();
		model.addAttribute("last",last);
		
		//display approved clubHouse booking
		List<ClubHouse> approvedList = clubService.getApprovedBookings();
		model.addAttribute("approvedList",approvedList);
		
	
		
		String uname = (String) req.getSession().getAttribute("utoken");
	    if (uname != null) {
	        List<Complaint> lc = cService.getComplaints(uname);
	        model.addAttribute("lc", lc);
	    }		
		
		return "userhome";
	}
	
	
	
	
	@RequestMapping("/user-login")
	public String handleUserLogin(@RequestParam("userName") String name
	,@RequestParam("userpass") int pass,HttpServletRequest req,Model model)
	{
		
		String res = uService.checkUser(pass, name);
		HttpSession s = req.getSession();
		
		if(res.equals("exists"))
		{	
			s.setAttribute("utoken", name);
			return "redirect:/userhome";
		}
		else
		{
			s.setAttribute("msg", res);
			return "userlogin";
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
