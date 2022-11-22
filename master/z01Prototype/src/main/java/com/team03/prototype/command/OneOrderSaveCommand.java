package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTOrderDto;
import com.team03.prototype.util.Constant;

public class OneOrderSaveCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		
		try {
			//data
			String opName=request.getParameter("opName");
			String opPricest=String.valueOf(request.getParameter("opPrice"));
			int opPrice = Integer.parseInt(opPricest);
			String opQuantyst=String.valueOf(request.getParameter("opQuanty"));
			int opQuanty = Integer.parseInt(opQuantyst);
			String opTotalst=String.valueOf(request.getParameter("opTotal"));
			int opTotal = Integer.parseInt(opTotalst);
			String opColor=request.getParameter("opColor");
			String opSize=request.getParameter("opSize");
			String pIdst=String.valueOf(request.getParameter("pId"));
			int pId = Integer.parseInt(pIdst);
			String uEmail=request.getParameter("uEmail");
			String opPhoto=request.getParameter("opPhoto");
			
			System.out.println(pId+"//"+opQuanty+"//"+opTotal);
			PTOrderDto dto = new PTOrderDto(0,opName,opPrice,opQuanty,opColor,opSize,pId,uEmail,opPhoto);
			bdao.orderSave(dto);
		}
		catch(Exception e) {
			e.printStackTrace();
		}

	}

}
