package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTSecDao;
import com.team03.prototype.dto.AuthUserDto;
import com.team03.prototype.util.Constant;

public class AuthCommand implements PTCommand {
	
	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTSecDao sdao = Constant.sdao;
		AuthUserDto dto = (AuthUserDto)request.getAttribute("dto");
		sdao.authDB(dto);
	}
}
