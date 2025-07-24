package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MainApp.Entity.Notice;
import com.MainApp.Service.NoticeService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AddEditDeleteNotice {

	@Autowired
	NoticeService nService;
	
	@RequestMapping("/add-notice")
	public String handleAddNotice(@ModelAttribute Notice n
	,Model model,HttpServletRequest req)
	{
		boolean status=nService.addNotice(n);
		
		if(status)
		{
			String aname=(String)req.getSession().getAttribute("atoken");
			List<Notice> ln = nService.getNotices(aname);
			model.addAttribute("ln",ln);
			
			return "redirect:/adminhome";
		}
		else
		{
			return "alogin";
		}	
	}
}
