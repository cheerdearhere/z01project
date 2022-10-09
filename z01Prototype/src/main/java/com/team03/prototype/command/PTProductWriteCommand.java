package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTProductDto;
import com.team03.prototype.util.Constant;

public class PTProductWriteCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		PTProductDto dto = (PTProductDto)request.getAttribute("pdto");
		String result = bdao.productwrite(dto);
		model.addAttribute("result", result);
	}

}
