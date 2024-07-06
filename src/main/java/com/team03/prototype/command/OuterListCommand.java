package com.team03.prototype.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTProductDto;
import com.team03.prototype.util.Constant;

public class OuterListCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		ArrayList<PTProductDto> dtos = bdao.outerList();
		model.addAttribute("outerList", dtos);
	}

}
