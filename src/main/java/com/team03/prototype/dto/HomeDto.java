package com.team03.prototype.dto;

import java.sql.Date;

public class HomeDto {
	private Date hmDate;//수정날짜
	private String hmSlide0;//slide file 
	private String hmSlide1;//slide file 
	private String hmSlide2;//slide file 
	private String hmMain;//main 사진
	private String hmInstar;//social link
	private String hmYoutube;
	public HomeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HomeDto(Date hmDate, String hmSlide0, String hmSlide1, String hmSlide2, String hmMain, String hmInstar,
			String hmYoutube) {
		super();
		this.hmDate = hmDate;
		this.hmSlide0 = hmSlide0;
		this.hmSlide1 = hmSlide1;
		this.hmSlide2 = hmSlide2;
		this.hmMain = hmMain;
		this.hmInstar = hmInstar;
		this.hmYoutube = hmYoutube;
	}
	public Date getHmDate() {
		return hmDate;
	}
	public void setHmDate(Date hmDate) {
		this.hmDate = hmDate;
	}
	public String getHmSlide0() {
		return hmSlide0;
	}
	public void setHmSlide0(String hmSlide0) {
		this.hmSlide0 = hmSlide0;
	}
	public String getHmSlide1() {
		return hmSlide1;
	}
	public void setHmSlide1(String hmSlide1) {
		this.hmSlide1 = hmSlide1;
	}
	public String getHmSlide2() {
		return hmSlide2;
	}
	public void setHmSlide2(String hmSlide2) {
		this.hmSlide2 = hmSlide2;
	}
	public String getHmMain() {
		return hmMain;
	}
	public void setHmMain(String hmMain) {
		this.hmMain = hmMain;
	}
	public String getHmInstar() {
		return hmInstar;
	}
	public void setHmInstar(String hmInstar) {
		this.hmInstar = hmInstar;
	}
	public String getHmYoutube() {
		return hmYoutube;
	}
	public void setHmYoutube(String hmYoutube) {
		this.hmYoutube = hmYoutube;
	}	
	
	
}
