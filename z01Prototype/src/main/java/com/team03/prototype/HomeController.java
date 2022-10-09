package com.team03.prototype;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team03.prototype.command.BestListCommand;
import com.team03.prototype.command.NewListCommand;
import com.team03.prototype.command.PTCommand;
import com.team03.prototype.command.PTHomeViewCommand;
import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.util.Constant;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private PTCommand com;
	//PTBoardDao class bean
	private PTBoardDao bdao;
	@Autowired
	public void setBdao(PTBoardDao bdao) {
		this.bdao = bdao;
		Constant.bdao = bdao;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		 
		model.addAttribute("serverTime", formattedDate );
		//home ȭ�鿡 homeDto/newList/bestList
		com = new PTHomeViewCommand();
		com.execute(request, model);
		com = new NewListCommand();
		com.execute(request, model);
		com = new BestListCommand();
		com.execute(request, model);
		return "home";
	}
	
}
