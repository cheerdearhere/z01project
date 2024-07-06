package com.team03.prototype.dto;

public class OrderStateCurrentGraphDto {
	private String opState;
	private int opQuanty;
	public OrderStateCurrentGraphDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderStateCurrentGraphDto(String opState, int opQuanty) {
		super();
		this.opState = opState;
		this.opQuanty = opQuanty;
	}
	public String getOpState() {
		return opState;
	}
	public void setOpState(String opState) {
		this.opState = opState;
	}
	public int getOpQuanty() {
		return opQuanty;
	}
	public void setOpQuanty(int opQuanty) {
		this.opQuanty = opQuanty;
	}
}
