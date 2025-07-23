package com.MainApp.Entity;

import java.time.LocalDate;
import java.time.LocalTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class ClubHouse {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	int BookingId;
	
	@Column
	String UserName;
	
	@Column
	int UserPhone;
	
	@Column
	int UserFlatNo;
	
	@Column
	LocalDate bookingDate;
	
	@Column
	String bookingPurpose;
	
	@Column
	LocalTime eventStartTime;
	
	@Column
	LocalTime eventEndTime;
	
	@Column
	int guestCount;
	
	@Column
	String adminApproval;

	public int getBookingId() {
		return BookingId;
	}

	public void setBookingId(int bookingId) {
		BookingId = bookingId;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public int getUserPhone() {
		return UserPhone;
	}

	public void setUserPhone(int userPhone) {
		UserPhone = userPhone;
	}

	public int getUserFlatNo() {
		return UserFlatNo;
	}

	public void setUserFlatNo(int userFlatNo) {
		UserFlatNo = userFlatNo;
	}

	public LocalDate getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(LocalDate bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getBookingPurpose() {
		return bookingPurpose;
	}

	public void setBookingPurpose(String bookingPurpose) {
		this.bookingPurpose = bookingPurpose;
	}

	public LocalTime getEventStartTime() {
		return eventStartTime;
	}

	public void setEventStartTime(LocalTime eventStartTime) {
		this.eventStartTime = eventStartTime;
	}

	public LocalTime getEventEndTime() {
		return eventEndTime;
	}

	public void setEventEndTime(LocalTime eventEndTime) {
		this.eventEndTime = eventEndTime;
	}

	public int getGuestCount() {
		return guestCount;
	}

	public void setGuestCount(int guestCount) {
		this.guestCount = guestCount;
	}

	public String getAdminApproval() {
		return adminApproval;
	}

	public void setAdminApproval(String adminApproval) {
		this.adminApproval = adminApproval;
	}
	
	
}
