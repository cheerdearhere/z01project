package com.team03.prototype.dto;

public class ProductCurrentGraphDto {
	private String pType;
	private int views;
	private int quanty;
	
	public ProductCurrentGraphDto() {
		super();
	}

	public ProductCurrentGraphDto(String pType, int views, int quanty) {
		super();
		this.pType = pType;
		this.views = views;
		this.quanty = quanty;
	}

	public String getpType() {
		return pType;
	}

	public void setpType(String pType) {
		this.pType = pType;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getQuanty() {
		return quanty;
	}

	public void setQuanty(int quanty) {
		this.quanty = quanty;
	}
	
}
