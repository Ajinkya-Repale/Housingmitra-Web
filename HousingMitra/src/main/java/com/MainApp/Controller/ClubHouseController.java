package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MainApp.Entity.ClubHouse;
import com.MainApp.Entity.Notice;
import com.MainApp.Service.ClubHouseService;
import com.MainApp.Service.ComplaintService;
import com.MainApp.Service.NoticeService;

@Controller
public class ClubHouseController {

	@Autowired
	ClubHouseService clubhouseService;
	
	@Autowired
	NoticeService nService;
	
	@RequestMapping("/add-club-booking")
	public String addBooking(@ModelAttribute ClubHouse cl,Model model)
	{
		clubhouseService.addClubHouseBooking(cl);
		
		List<Notice> lan = nService.getallNotices();
		model.addAttribute("lan",lan);
		
		return "redirect:/userhome";
	}
	
	
	@RequestMapping("/approve-booking")
	public String HandleApproveClubBooking(@RequestParam("BookingId") int BookingId)
	{
		clubhouseService.approvebooking(BookingId);
		return "redirect:/adminhome";
	}
	
	
	
		
	
	
	
}
