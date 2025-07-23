package com.MainApp.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Repository.ClubHouseRepository;

@Service
public class ClubHouseService {

	@Autowired
	ClubHouseRepository clRepo;
	
	
	
}
