package com.MainApp.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Entity.Complaint;
import com.MainApp.Repository.ComplaintRepository;
 
@Service
public class ComplaintService {

	@Autowired
	ComplaintRepository cRepo;
	
	
	boolean flag;
	
	public boolean addComplaint(Complaint c)
	{
		Optional<Complaint> newComplaint = cRepo.findById(c.getComplaintid());
		
		if(newComplaint.isEmpty())
		{
			cRepo.save(c);
			flag=true;
		}
		else
		{
			flag=false;
		}
		
		return flag;
	}
	
	
	public List<Complaint> getComplaints(String uname)
	{
		return cRepo.findByUserName(uname);		 
	}
	
	public List<Complaint> getAllComplaints()
	{
		return cRepo.findAll();
	}
	
	
}
