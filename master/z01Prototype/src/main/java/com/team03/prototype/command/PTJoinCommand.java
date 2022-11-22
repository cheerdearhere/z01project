package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.team03.prototype.dao.PTSecDao;
import com.team03.prototype.dto.PTJoinDto;
import com.team03.prototype.util.Constant;

public class PTJoinCommand implements PTCommand {

	@Override
	public void execute(HttpServletRequest request, Model model) {
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		
		String uemail = request.getParameter("uEmail");
		String uname =request.getParameter("uName");
		String upw = request.getParameter("uPw");
		String uphone1 = request.getParameter("uPhone1");
		String uphone2 = "입력하지 않음";
		String uaddress = request.getParameter("uAddress");
		String upw_org = upw;
		upw = passwordEncoder.encode(upw_org);
		
		PTJoinDto dto = new PTJoinDto(uemail,uname,null,uaddress,uphone1,uphone2,null,upw);
		PTSecDao sdao = Constant.sdao;
		
		String result = sdao.join(dto);
		request.setAttribute("result", result);
	}

}
