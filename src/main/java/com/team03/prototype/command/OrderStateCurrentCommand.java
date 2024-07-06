package com.team03.prototype.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.OrderStateCurrentGraphDto;
import com.team03.prototype.util.Constant;

public class OrderStateCurrentCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		ArrayList<OrderStateCurrentGraphDto> dtos = bdao.orderStateCurrentGraph();
		model.addAttribute("orderStateCurrentList", dtos);
	}


}
