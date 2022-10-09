package com.team03.prototype.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.MonthlyOrderDto;
import com.team03.prototype.util.Constant;

public class MonthlyOrderCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		ArrayList<MonthlyOrderDto> dtos = bdao.monthlyOrderData();
		model.addAttribute("monthlyOrderList",dtos);
	}

}
