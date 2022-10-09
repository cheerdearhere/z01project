package com.team03.prototype.dto;

import java.sql.Timestamp;

public class PTProductDto {
	private int pId;//pk, seq
	private String pType;//top, outer, pant, skirt...
	private String pName;
	private int pPrice;
	private int pQuanty;
	private String pContent;
	private String pPhoto;
	private String pBoard;//new/best/null
	private String pState;//true: ∆«∏≈¡ﬂ(default)
	private Timestamp pDate;//sysdate
	private String pColor;
	private String pSize;
	private int pHit;
	
	public PTProductDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PTProductDto(int pId, String pType, String pName, int pPrice, int pQuanty, String pContent, String pPhoto,
			String pBoard, String pState, Timestamp pDate, String pColor, String pSize) {
		super();
		this.pId = pId;
		this.pType = pType;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pQuanty = pQuanty;
		this.pContent = pContent;
		this.pPhoto = pPhoto;
		this.pBoard = pBoard;
		this.pState = pState;
		this.pDate = pDate;
		this.pColor = pColor;
		this.pSize = pSize;
	}

	public PTProductDto(int pId, String pType, String pName, int pPrice, int pQuanty, String pContent, String pPhoto,
			String pBoard, String pState, Timestamp pDate, String pColor, String pSize, int pHit) {
		super();
		this.pId = pId;
		this.pType = pType;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pQuanty = pQuanty;
		this.pContent = pContent;
		this.pPhoto = pPhoto;
		this.pBoard = pBoard;
		this.pState = pState;
		this.pDate = pDate;
		this.pColor = pColor;
		this.pSize = pSize;
		this.pHit = pHit;
	}
	public int getpHit() {
		return pHit;
	}

	public void setpHit(int pHit) {
		this.pHit = pHit;
	}
	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpQuanty() {
		return pQuanty;
	}

	public void setpQuanty(int pQuanty) {
		this.pQuanty = pQuanty;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpPhoto() {
		return pPhoto;
	}

	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}

	public String getpBoard() {
		return pBoard;
	}

	public void setpBoard(String pBoard) {
		this.pBoard = pBoard;
	}

	public String getpState() {
		return pState;
	}

	public void setpState(String pState) {
		this.pState = pState;
	}

	public Timestamp getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	public String getpColor() {
		return pColor;
	}

	public void setpColor(String pColor) {
		this.pColor = pColor;
	}

	public String getpSize() {
		return pSize;
	}

	public void setpSize(String pSize) {
		this.pSize = pSize;
	}
	
}
