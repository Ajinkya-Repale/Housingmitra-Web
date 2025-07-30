package com.MainApp.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Entity.ClubHouse;
import com.MainApp.Repository.ClubHouseRepository;

@Service
public class ClubHouseService {

	@Autowired
	ClubHouseRepository clRepo;
	
	boolean flag;
	
	
	public boolean addClubHouseBooking(ClubHouse cb)
	{
		
		Optional<ClubHouse> newBooking = clRepo.findById(cb.getBookingId());
		
		if(newBooking.isEmpty())
		{
			clRepo.save(cb);
			flag=true;
		}
		else
		{
			flag=false;
		}
		
		return flag;
	}
	
	
	
	public List<ClubHouse> getAllBooking()  
	{
		return clRepo.findAll();		
	}
	
	
	
	public void approvebooking(int BookingId)
	{
		Optional<ClubHouse> NewBooking = clRepo.findById(BookingId);
		if(NewBooking.isPresent())
		{
			ClubHouse booking = NewBooking.get();
			booking.setAdminApproval("approved");
			clRepo.save(booking);
		}
		
	}
	
	
	public List<ClubHouse> getApprovedBookings()
	{
		return clRepo.findByAdminApproval("Approved");
	}
	
	
	
	
}
