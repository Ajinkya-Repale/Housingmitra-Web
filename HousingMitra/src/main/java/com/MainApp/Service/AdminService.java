package com.MainApp.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Entity.Admin;
import com.MainApp.Repository.AdminRepository;

@Service
public class AdminService {

	@Autowired
	AdminRepository aRepo;
	
    boolean flag=false;
     
	
	public boolean addAdmin(Admin a)
	{
		Optional<Admin> newAdmin = aRepo.findById(a.getName());
		
		if(newAdmin.isEmpty())
		{
			aRepo.save(a);
			
			flag=true;
		}
		else
		{
			flag=false;
		}
		 
		return flag; 
	}
	
	
	
	
	String result;
	
	public String CheckAdmin(String name ,String pass)
	{
		Optional<Admin> oa = aRepo.findByNameAndPass(name, pass);
		
		if(oa.isEmpty())
		{
			result="Invaild Username and PassWord";
		}
		else
		{
			result="exists";
		}
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}
