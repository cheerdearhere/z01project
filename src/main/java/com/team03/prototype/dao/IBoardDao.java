package com.team03.prototype.dao;

import java.util.ArrayList;

import com.team03.prototype.dto.HomeDto;
import com.team03.prototype.dto.MonthlyOrderDto;
import com.team03.prototype.dto.OrderStateCurrentGraphDto;
import com.team03.prototype.dto.PTOrderDto;
import com.team03.prototype.dto.PTProductDto;
import com.team03.prototype.dto.PTrBoardDto;
import com.team03.prototype.dto.ProductCurrentGraphDto;

public interface IBoardDao {
	//home, main slide
	public HomeDto homeView();
	public void homeWrite(HomeDto dto);
	//product
	public ArrayList<PTProductDto> productList();
	public String productwrite(PTProductDto pdto);
	public PTProductDto pmProductView(int pId);
	public void pmProductUpdate(PTProductDto pdto);
	public void productDelete(int pId);
	public ArrayList<PTrBoardDto> pageList(String pageNo);
	public void rWrite(PTrBoardDto bdto);
	public PTrBoardDto rContentView(String bid);
	public void rmodify(PTrBoardDto dto);
	public void rdelete(int bId);
	public PTrBoardDto replyView(int rbId);
	public void reply(PTrBoardDto dto);
	public void replyShape(int rGroup,int rStep);
	//userpage
	public ArrayList<PTrBoardDto> reviewList();
	public PTProductDto productView(int pId);
	public ArrayList<PTrBoardDto> searchList();
	public ArrayList<PTrBoardDto> userSearchList(String uEmail);
	public ArrayList<PTrBoardDto> userReviewList(String uEmail);
	public ArrayList<PTrBoardDto> productReviewList(String pId);
	public ArrayList<PTOrderDto> userOrderedList(String uEmail);
	//shop page load
	public ArrayList<PTProductDto> bottomList();
	public ArrayList<PTProductDto> outerList();
	public ArrayList<PTProductDto> topList();
	public ArrayList<PTProductDto> etcList();
	public ArrayList<PTProductDto> newList();
	public ArrayList<PTProductDto> bestList();
	//order
	public void orderSave(PTOrderDto dto);
	public ArrayList<PTOrderDto> orderList(String uEmail);
	public String orderRequest (PTOrderDto dto);
	public ArrayList<PTOrderDto> pmOrderList();
	public void opStateModify(PTOrderDto dto);
	public ArrayList<PTOrderDto> searchOrder();
	//page information
	public ArrayList<ProductCurrentGraphDto> productCurrentGraph();
	public ArrayList<OrderStateCurrentGraphDto> orderStateCurrentGraph();
	public ArrayList<MonthlyOrderDto> monthlyOrderData();
	public ArrayList<MonthlyOrderDto> monthlyCompleteData();
	
}
