package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTrBoardDto;
import com.team03.prototype.util.Constant;

public class PTrBoardReplyViewCommand implements PTCommand {

   @Override
   public void execute(HttpServletRequest request, Model model) {
      
      PTBoardDao bdao = Constant.bdao;
      
      String rbid = request.getParameter("rbId");
		int rbId = Integer.parseInt(rbid);
      
      PTrBoardDto dto = bdao.replyView(rbId);
      
      model.addAttribute("replyView",dto);

   }

}