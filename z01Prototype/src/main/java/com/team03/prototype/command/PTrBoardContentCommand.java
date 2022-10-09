package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTrBoardDto;
import com.team03.prototype.util.Constant;

public class PTrBoardContentCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		String bid = request.getParameter("rbId");
		System.out.println("review no:"+bid);
		PTrBoardDto dto = bdao.rContentView(bid);
		if(dto != null) {
			model.addAttribute("rContentView", dto);
		}
	}
}
