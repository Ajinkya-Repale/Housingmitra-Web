package com.MainApp.Entity;

import java.time.LocalDate; 

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class Notice {

	@Id
	@Column
	int nid;
	
	@Column
	String noticeName;
	
	@Column
	String noticeType;
	
	@Column
	LocalDate noticeDate;
	
	@Column
	String noticeMessage;
	
	@Column
	String adminName;

	

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getNoticeName() {
		return noticeName;
	}

	public void setNoticeName(String noticeName) {
		this.noticeName = noticeName;
	}

	public String getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	public LocalDate getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(LocalDate noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeMessage() {
		return noticeMessage;
	}

	public void setNoticeMessage(String noticeMessage) {
		this.noticeMessage = noticeMessage;
	}

	
	
}
