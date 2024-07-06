package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dto.PTrBoardDto;
import com.team03.prototype.util.Constant;

public class PTrBoardWriteCommand implements PTCommand {

   @Override
   public void execute(HttpServletRequest request, Model model) {
      
      PTBoardDao bdao = Constant.bdao;
     PTrBoardDto bdto = (PTrBoardDto)request.getAttribute("rdto");
      
      bdao.rWrite(bdto);
   }

}