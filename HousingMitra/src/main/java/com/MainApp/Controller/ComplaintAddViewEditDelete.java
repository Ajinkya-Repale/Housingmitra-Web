package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MainApp.Entity.Complaint;
import com.MainApp.Entity.Notice;
import com.MainApp.Service.ComplaintService;
import com.MainApp.Service.NoticeService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ComplaintAddViewEditDelete {

	@Autowired
	ComplaintService cService;
	
	@Autowired
	NoticeService nService;
	
	@RequestMapping("/add-complaint")
	public String addComplaint(@ModelAttribute Complaint c,Model model
	,HttpServletRequest req)
	{
		
		cService.addComplaint(c);
		
		 List<Notice> lan = nService.getallNotices();
		 model.addAttribute("lan", lan);
		 
		 String uname=(String)req.getSession().getAttribute("utoken");
		 List<Complaint> lc = cService.getComplaints(uname);
		 model.addAttribute("lc",lc);
		 
		
        return "redirect:/userhome";
	 
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
