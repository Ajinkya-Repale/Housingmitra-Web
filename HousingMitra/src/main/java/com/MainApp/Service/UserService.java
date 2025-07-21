package com.MainApp.Service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Entity.User;
import com.MainApp.Repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository uRepo;
	
	
	boolean flag;
	
	
	public boolean addUser(User u)
	{
		Optional<User> newUser = uRepo.findById(u.getUserid());
		
		if(newUser.isEmpty())
		{
			uRepo.save(u);
			
			flag=true;
		}
		else
		{
			flag=false;
		}
		
		return flag;
	}
	
	
	
	String result;
	
	public String checkUser(int pass,String name)
	{
		Optional<User> ou = uRepo.findByUserNameAndUserpass(name, pass);
		
		if(ou.isEmpty())
		{
			result="Invalid UserName or Password..";
		}
		else
		{
			result="exists";
		}
		
		return result;
	}
	
	
	
}
