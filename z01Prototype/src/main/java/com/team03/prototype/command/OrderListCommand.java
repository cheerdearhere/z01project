package com.team03.prototype.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTOrderDto;
import com.team03.prototype.util.Constant;

public class OrderListCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		String uEmail = request.getParameter("uEmail");
		ArrayList<PTOrderDto> dtos = bdao.orderList(uEmail);
		model.addAttribute("orderReadylist",dtos);
	}

}
