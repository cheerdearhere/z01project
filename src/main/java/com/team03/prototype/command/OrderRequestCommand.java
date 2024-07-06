package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTOrderDto;
import com.team03.prototype.util.Constant;

public class OrderRequestCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		String[] orderRequests = request.getParameterValues("orderRequestList");
		
		if(orderRequests !=null && orderRequests.length>0) {
			//data
			int opId=0;
			String opIdst;
			int opPrice = 0;
			String opPricest;
			int opQuanty = 0;
			String opQuantyst;
			int opTotal = 0;
			String opTotalst;
			String opAddress = "";
			String opPhone = "";
			String opRequest="";
			int pId = 0;
			String pIdst;
			String discountID="";
			String opPhoto="";
			String opState="ordered";
			
			PTOrderDto dto;
			try {
				for(String orderString:orderRequests) {
					JSONParser parser = new JSONParser(); 
					Object obj = parser.parse(orderString);
					JSONObject orderJSON = (JSONObject)obj;
					
					opIdst = String.valueOf(orderJSON.get("opId"));
					opId = Integer.parseInt(opIdst);
					opPricest = String.valueOf(orderJSON.get("opPrice"));
					opPrice = Integer.parseInt(opPricest);
					opQuantyst = String.valueOf(orderJSON.get("opQuanty"));
					opQuanty = Integer.parseInt(opQuantyst);
					opTotalst = String.valueOf(orderJSON.get("opTotal"));
					opTotal = Integer.parseInt(opTotalst);
					opAddress = (String)orderJSON.get("opAddress");
					opPhone = (String)orderJSON.get("opPhone");
					opRequest = (String)orderJSON.get("opRequest");
					pIdst = String.valueOf(orderJSON.get("pId"));
					pId = Integer.parseInt(pIdst);
					discountID = (String)orderJSON.get("discountID");
					opPhoto = (String)orderJSON.get("opPhoto");
					
					dto = new PTOrderDto(opId,opPrice,opQuanty,opTotal,opAddress,opPhone,opRequest,opState,pId,discountID,opPhoto);
					String result = bdao.orderRequest(dto);
					System.out.println(result);
				}			
			}
			catch(Exception e) {
				e.printStackTrace();
			}			
		}
		else {
			System.out.println("OrderRequestCommand: null data");
		}
	}	
}
