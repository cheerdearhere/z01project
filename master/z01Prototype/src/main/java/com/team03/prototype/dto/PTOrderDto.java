package com.team03.prototype.dto;

import java.sql.Timestamp;

public class PTOrderDto {
	private int opId;
	private String opName;
	private int opPrice;
	private int opQuanty;
	private int opTotal;
	private String opColor;
	private String opSize;
	private Timestamp opDate;
	private String opAddress;
	private String opPhone;
	private String opRequest;
	private String opState;
	private int pId;
	private String uEmail;
	private String discountID;
	private String opPhoto;

	
//constructor
	//default
	public PTOrderDto() {
		super();
	}

	public PTOrderDto(int opId, String opName, int opPrice, int opQuanty, int opTotal, String opColor, String opSize,
			Timestamp opDate, String opAddress, String opPhone, String opRequest, String opState, int pId,
			String uEmail, String opPhoto) {
		super();
		this.opId = opId;
		this.opName = opName;
		this.opPrice = opPrice;
		this.opQuanty = opQuanty;
		this.opTotal = opTotal;
		this.opColor = opColor;
		this.opSize = opSize;
		this.opDate = opDate;
		this.opAddress = opAddress;
		this.opPhone = opPhone;
		this.opRequest = opRequest;
		this.opState = opState;
		this.pId = pId;
		this.uEmail = uEmail;
		this.opPhoto = opPhoto;
	}
	//orderList request
	public PTOrderDto(int opId, String opName, int opPrice, int opQuanty, String opColor, String opSize, int pId,
			String uEmail, String opPhoto) {
		super();
		this.opId = opId;
		this.opName = opName;
		this.opPrice = opPrice;
		this.opQuanty = opQuanty;
		this.opColor = opColor;
		this.opSize = opSize;
		this.pId = pId;
		this.uEmail = uEmail;
		this.opPhoto = opPhoto;
	}
	//need all fields
	public PTOrderDto(int opId, String opName, int opPrice, int opQuanty, int opTotal, String opColor, String opSize,
			Timestamp opDate, String opAddress, String opPhone, String opRequest, String opState, int pId,
			String uEmail, String opPhoto, String discountID) {
		super();
		this.opId = opId;
		this.opName = opName;
		this.opPrice = opPrice;
		this.opQuanty = opQuanty;
		this.opTotal = opTotal;
		this.opColor = opColor;
		this.opSize = opSize;
		this.opDate = opDate;
		this.opAddress = opAddress;
		this.opPhone = opPhone;
		this.opRequest = opRequest;
		this.opState = opState;
		this.pId = pId;
		this.uEmail = uEmail;
		this.opPhoto = opPhoto;
		this.discountID = discountID;
	}
	//order request
	public PTOrderDto(int opId, int opPrice, int opQuanty, int opTotal, String opAddress, String opPhone,
			String opRequest, String opState, int pId, String discountID, String opPhoto) {
		super();
		this.opId = opId;
		this.opPrice = opPrice;
		this.opQuanty = opQuanty;
		this.opTotal = opTotal;
		this.opAddress = opAddress;
		this.opPhone = opPhone;
		this.opRequest = opRequest;
		this.opState = opState;
		this.pId = pId;
		this.discountID = discountID;
		this.opPhoto = opPhoto;
	}
	//order state modify
	public PTOrderDto(int opId, String opState) {
		super();
		this.opId = opId;
		this.opState = opState;
	}
	
	//getter and setter method
	public String getDiscountID() {
		return discountID;
	}

	public void setDiscountID(String discountID) {
		this.discountID = discountID;
	}

	public int getOpId() {
		return opId;
	}

	public void setOpId(int opId) {
		this.opId = opId;
	}

	public String getOpName() {
		return opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	public int getOpPrice() {
		return opPrice;
	}

	public void setOpPrice(int opPrice) {
		this.opPrice = opPrice;
	}

	public int getOpQuanty() {
		return opQuanty;
	}

	public void setOpQuanty(int opQuanty) {
		this.opQuanty = opQuanty;
	}

	public int getOpTotal() {
		return opTotal;
	}

	public void setOpTotal(int opTotal) {
		this.opTotal = opTotal;
	}

	public String getOpColor() {
		return opColor;
	}

	public void setOpColor(String opColor) {
		this.opColor = opColor;
	}

	public String getOpSize() {
		return opSize;
	}

	public void setOpSize(String opSize) {
		this.opSize = opSize;
	}

	public Timestamp getOpDate() {
		return opDate;
	}

	public void setOpDate(Timestamp opDate) {
		this.opDate = opDate;
	}

	public String getOpAddress() {
		return opAddress;
	}

	public void setOpAddress(String opAddress) {
		this.opAddress = opAddress;
	}

	public String getOpPhone() {
		return opPhone;
	}

	public void setOpPhone(String opPhone) {
		this.opPhone = opPhone;
	}

	public String getOpRequest() {
		return opRequest;
	}

	public void setOpRequest(String opRequest) {
		this.opRequest = opRequest;
	}

	public String getOpState() {
		return opState;
	}

	public void setOpState(String opState) {
		this.opState = opState;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getOpPhoto() {
		return opPhoto;
	}

	public void setOpPhoto(String opPhoto) {
		this.opPhoto = opPhoto;
	}
	
}
