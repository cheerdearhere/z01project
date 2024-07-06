package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTProductDto;
import com.team03.prototype.util.Constant;

public class ProductViewCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		String pid = (String)request.getParameter("pId");
		int pId = Integer.parseInt(pid);
		PTProductDto dto = bdao.productView(pId);
		model.addAttribute("pmDto",dto);
	}

}
