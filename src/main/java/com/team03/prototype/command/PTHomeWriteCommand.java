package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.HomeDto;
import com.team03.prototype.util.Constant;

public class PTHomeWriteCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		HomeDto homeDto = (HomeDto)request.getAttribute("homeDto");
		bdao.homeWrite(homeDto);
	}

}
