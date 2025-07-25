package com.MainApp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.MainApp.Entity.Staff;
import com.MainApp.Service.StaffService;

@Controller
public class AddEditDeleteStaff {

	@Autowired
	StaffService stService;
	
	
	
	@RequestMapping("/add-staff")
	public String handleAddStaff(@ModelAttribute Staff st)
	{
		stService.AddStaff(st);
		
		return "redirect:/adminhome";
	}
	
}
