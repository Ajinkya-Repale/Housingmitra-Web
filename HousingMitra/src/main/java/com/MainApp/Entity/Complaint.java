package com.MainApp.Entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class Complaint {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	int complaintid;
	
	@Column
	String complaintName;

	@Column
	String complaintType;
	
	@Column
	LocalDate complaintDate;
	
	@Column
	String complaintMessage;
	
	@Column
	String userName;

	public int getComplaintid() {
		return complaintid;
	}

	public void setComplaintid(int complaintid) {
		this.complaintid = complaintid;
	}

	public String getComplaintName() {
		return complaintName;
	}

	public void setComplaintName(String complaintName) {
		this.complaintName = complaintName;
	}

	public String getComplaintType() {
		return complaintType;
	}

	public void setComplaintType(String complaintType) {
		this.complaintType = complaintType;
	}

	public LocalDate getComplaintDate() {
		return complaintDate;
	}

	public void setComplaintDate(LocalDate complaintDate) {
		this.complaintDate = complaintDate;
	}

	public String getComplaintMessage() {
		return complaintMessage;
	}

	public void setComplaintMessage(String complaintMessage) {
		this.complaintMessage = complaintMessage;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
	
}
