package com.team03.prototype.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.team03.prototype.dao.PTBoardDao;
import com.team03.prototype.dao.PTSecDao;

public class Constant {
	public static BCryptPasswordEncoder passwordEncoder;
	public static PTSecDao sdao;
	public static PTBoardDao bdao;
}
