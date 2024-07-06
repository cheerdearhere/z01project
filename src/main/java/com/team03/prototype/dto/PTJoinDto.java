package com.team03.prototype.dto;

import java.sql.Timestamp;

public class PTJoinDto {
	private String uemail;
	private String uname;
	private Timestamp udate;
	private String uaddress;
	private String uphone1;
	private String uphone2;
	private String uauth;
	private String upw;
	public PTJoinDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PTJoinDto(String uemail, String uname, Timestamp udate, String uaddress, String uphone1, String uphone2,
			String uauth, String upw) {
		super();
		this.uemail = uemail;
		this.uname = uname;
		this.udate = udate;
		this.uaddress = uaddress;
		this.uphone1 = uphone1;
		this.uphone2 = uphone2;
		this.uauth = uauth;
		this.upw = upw;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Timestamp getUdate() {
		return udate;
	}
	public void setUdate(Timestamp udate) {
		this.udate = udate;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getUphone1() {
		return uphone1;
	}
	public void setUphone1(String uphone1) {
		this.uphone1 = uphone1;
	}
	public String getUphone2() {
		return uphone2;
	}
	public void setUphone2(String uphone2) {
		this.uphone2 = uphone2;
	}
	public String getUauth() {
		return uauth;
	}
	public void setUauth(String uauth) {
		this.uauth = uauth;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	
}
