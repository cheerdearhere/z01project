package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTSecDao;
import com.team03.prototype.util.Constant;

public class IdentificationUserCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		String uEmail = request.getParameter("uEmail");
		String upw = request.getParameter("pwConfirm");
		
		PTSecDao sdao = Constant.sdao;
		String result=sdao.identifyUser(uEmail,upw);
		request.setAttribute("result", result);
	}

}
