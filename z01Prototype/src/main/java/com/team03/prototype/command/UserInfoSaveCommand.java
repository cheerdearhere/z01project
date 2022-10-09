package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTSecDao;
import com.team03.prototype.dto.PTJoinDto;
import com.team03.prototype.util.Constant;

public class UserInfoSaveCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTSecDao sdao = Constant.sdao;
		PTJoinDto dto = (PTJoinDto)request.getAttribute("userModiDto");
		sdao.userInfoSave(dto);
	}

}
