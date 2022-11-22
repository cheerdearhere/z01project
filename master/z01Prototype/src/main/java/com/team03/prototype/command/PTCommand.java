package com.team03.prototype.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface PTCommand {
	public void execute(HttpServletRequest request, Model model);
}
