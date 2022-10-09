package com.team03.prototype.dto;

public class MonthlyOrderDto {
	private String monthlyData;
	private int orders;
	public MonthlyOrderDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MonthlyOrderDto(String monthlyData, int orders) {
		super();
		this.monthlyData = monthlyData;
		this.orders = orders;
	}
	public String getMonthlyData() {
		return monthlyData;
	}
	public void setMonthlyData(String monthlyData) {
		this.monthlyData = monthlyData;
	}
	public int getOrders() {
		return orders;
	}
	public void setOrders(int orders) {
		this.orders = orders;
	}
	
}
