package com.team03.prototype.dto;

import java.sql.Timestamp;

public class PTrBoardDto {
	  private int rbId;
      private String pId;
      private String rPhoto;
      private String rTitle;
      private String rContent;
      private String rGood;
      private Timestamp rDate;
      private int rGroup;
      private int rStep;
      private int rIndent;
      private String uEmail;

   public PTrBoardDto() {
      super();
   }
         
	public PTrBoardDto(int rbId, String pId, String rPhoto, String rTitle, String rContent, String rGood,
			Timestamp rDate, int rGroup, int rStep, int rIndent, String uEmail) {
		super();
		this.rbId = rbId;
		this.pId = pId;
		this.rPhoto = rPhoto;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rGood = rGood;
		this.rDate = rDate;
		this.rGroup = rGroup;
		this.rStep = rStep;
		this.rIndent = rIndent;
		this.uEmail = uEmail;
	}

	public int getRbId() {
		return rbId;
	}

	public void setRbId(int rbId) {
		this.rbId = rbId;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getrPhoto() {
		return rPhoto;
	}

	public void setrPhoto(String rPhoto) {
		this.rPhoto = rPhoto;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrGood() {
		return rGood;
	}

	public void setrGood(String rGood) {
		this.rGood = rGood;
	}

	public Timestamp getrDate() {
		return rDate;
	}

	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}

	public int getrGroup() {
		return rGroup;
	}

	public void setrGroup(int rGroup) {
		this.rGroup = rGroup;
	}

	public int getrStep() {
		return rStep;
	}

	public void setrStep(int rStep) {
		this.rStep = rStep;
	}

	public int getrIndent() {
		return rIndent;
	}

	public void setrIndent(int rIndent) {
		this.rIndent = rIndent;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public PTrBoardDto(int rGroup, int rStep) {
		super();
		this.rGroup = rGroup;
		this.rStep = rStep;
	}

	public PTrBoardDto(String rTitle, String rContent, String uEmail) {
		super();
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.uEmail = uEmail;
	}

	public PTrBoardDto(int rbId, String pId, String rTitle, String rContent, String uEmail) {
		super();
		this.rbId = rbId;
		this.pId = pId;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.uEmail = uEmail;
	}

	public PTrBoardDto(int rbId, String rTitle, String rContent) {
		super();
		this.rbId = rbId;
		this.rTitle = rTitle;
		this.rContent = rContent;
		
	}

	public PTrBoardDto(int rbId, String rTitle, String rContent, int rGroup, int rStep, int rIndent) {
		super();
		this.rbId = rbId;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rGroup = rGroup;
		this.rStep = rStep;
		this.rIndent = rIndent;
	}


   }