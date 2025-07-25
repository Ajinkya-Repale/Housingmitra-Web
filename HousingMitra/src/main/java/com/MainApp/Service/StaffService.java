package com.MainApp.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Entity.Staff;
import com.MainApp.Repository.StaffRepository;

@Service
public class StaffService {

	@Autowired
	StaffRepository sRepo;
	
	boolean flag;
	
	public boolean AddStaff(Staff st)
	{
		Optional<Staff> newStaff = sRepo.findById(st.getStaffId());
		
		if(newStaff.isEmpty())
		{
			sRepo.save(st);
			flag=true ;
			
		}
		else
		{
			flag=false;
		}
		
		return flag;
	}
	
	public List<Staff> getStaff(String aname)
	{
		return sRepo.findByAdminName(aname);
	}
	
	
	public List<Staff> getAllStaff()
	{
		return sRepo.findAll();
	}
	
	
	
	
}
