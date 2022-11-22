package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTOrderDto;
import com.team03.prototype.util.Constant;

public class PmOrderStateModifyCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		String opid = String.valueOf(request.getParameter("opId"));
		String opState = request.getParameter("opState");
		int opId = Integer.parseInt(opid);
		PTOrderDto dto = new PTOrderDto(opId,opState);
		bdao.opStateModify(dto);
	}
}
