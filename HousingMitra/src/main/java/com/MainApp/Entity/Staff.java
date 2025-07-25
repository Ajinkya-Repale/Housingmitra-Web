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
public class Staff {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	int StaffId;
	 
	@Column
	String StaffName;
	
	@Column
	String StaffRole;
	
	@Column
	String StaffArea;
	
	@Column
	long StaffPhone;
	
	@Column
	LocalDate SaffJoiniDate;
	
	@Column
	LocalTime ShiftStartTime;
	 
	@Column
	LocalTime ShiftEndTime;
	
	@Column
	String adminName;

	public int getStaffId() {
		return StaffId;
	}

	public void setStaffId(int staffId) {
		StaffId = staffId;
	}

	public String getStaffName() {
		return StaffName;
	}

	public void setStaffName(String staffName) {
		StaffName = staffName;
	}

	public String getStaffRole() {
		return StaffRole;
	}

	public void setStaffRole(String staffRole) {
		StaffRole = staffRole;
	}

	public String getStaffArea() {
		return StaffArea;
	}

	public void setStaffArea(String staffArea) {
		StaffArea = staffArea;
	}
	
	
	

	public long getStaffPhone() {
		return StaffPhone;
	}

	public void setStaffPhone(long staffPhone) {
		StaffPhone = staffPhone;
	}

	public LocalDate getSaffJoiniDate() {
		return SaffJoiniDate;
	}

	public void setSaffJoiniDate(LocalDate saffJoiniDate) {
		SaffJoiniDate = saffJoiniDate;
	}

	public LocalTime getShiftStartTime() {
		return ShiftStartTime;
	}

	public void setShiftStartTime(LocalTime shiftStartTime) {
		ShiftStartTime = shiftStartTime;
	}

	public LocalTime getShiftEndTime() {
		return ShiftEndTime;
	}

	public void setShiftEndTime(LocalTime shiftEndTime) {
		ShiftEndTime = shiftEndTime;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	

	
	
	
	
	
}
