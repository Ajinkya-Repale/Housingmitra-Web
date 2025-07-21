package com.MainApp.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class User {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	int userid;
	
	@Column
	String userName;
	
	@Column
	String userEmail;
	
	@Column
	String userFlatno;
	
	@Column
	int userPhoneno;
	
	@Column
	int userFamno;
	
	@Column
	int userpass;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	

	public String getUserFlatno() {
		return userFlatno;
	}

	public void setUserFlatno(String userFlatno) {
		this.userFlatno = userFlatno;
	}

	public int getUserPhoneno() {
		return userPhoneno;
	}

	public void setUserPhoneno(int userPhoneno) {
		this.userPhoneno = userPhoneno;
	}

	public int getUserFamno() {
		return userFamno;
	}

	public void setUserFamno(int userFamno) {
		this.userFamno = userFamno;
	}

	public int getUserpass() {
		return userpass;
	}

	public void setUserpass(int userpass) {
		this.userpass = userpass;
	} 
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
	
}
