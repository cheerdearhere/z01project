package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.util.Constant;

public class PTProductDeleteCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		PTBoardDao bdao = Constant.bdao;
		String pid = request.getParameter("pId");
		int pId = Integer.parseInt(pid);
		bdao.productDelete(pId);
	}

}
