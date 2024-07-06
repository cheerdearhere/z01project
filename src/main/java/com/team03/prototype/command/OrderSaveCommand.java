package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTOrderDto;
import com.team03.prototype.util.Constant;

public class OrderSaveCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		
		String opName = "";
		int opPrice=0;
		int opQuanty=0;
		String opColor="";
		String opSize="";
		int pId=0;
		String uEmail="";
		String opPhoto="";
		
		String orderSaveItems = request.getParameter("orderSaveItems");
		System.out.println(orderSaveItems);
		String[] splitedItems = orderSaveItems.split("%%%");
		for(String item : splitedItems) {
			String[] orderData = item.split("``");
			for(int j=0; j<orderData.length;j++) {
				if(j==0) {
					opName=orderData[0];
				}
				else if(j==1) {
					opPrice=Integer.parseInt(orderData[1]);
				}
				else if(j==2) {
					opQuanty=Integer.parseInt(orderData[2]);
				}
				else if(j==3) {
					opColor=orderData[3];
				}
				else if(j==4) {
					opSize=orderData[4];
				}
				else if(j==5) {
					pId=Integer.parseInt(orderData[5]);
				}
				else if(j==6) {
					uEmail = orderData[6];				
				}
				else if(j==7) {
					opPhoto = orderData[7];				
				}
			}
			PTOrderDto dto = new PTOrderDto(0,opName,opPrice,opQuanty,opColor,opSize,pId,uEmail,opPhoto);
			bdao.orderSave(dto);
		}
	}
}
