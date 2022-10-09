package com.team03.prototype.dao;

import com.team03.prototype.dto.AuthUserDto;
import com.team03.prototype.dto.PTJoinDto;

public interface ISecDao {
	public String join(PTJoinDto dto);
	public PTJoinDto login(String pid);
	public void authDB(AuthUserDto dto);
	public AuthUserDto authLogin(String uesrname);
	public void authInsert(AuthUserDto dto);
	public String identifyUser(String uEmail,String upw);
	public PTJoinDto userInforView(String uEmail);
	public void userInfoSave(PTJoinDto dto);
}
