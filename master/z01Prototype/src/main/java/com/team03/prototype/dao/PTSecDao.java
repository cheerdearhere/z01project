package com.team03.prototype.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.team03.prototype.dto.AuthUserDto;
import com.team03.prototype.dto.PTJoinDto;
import com.team03.prototype.util.Constant;

public class PTSecDao implements ISecDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String join(PTJoinDto dto) {
		System.out.println("join() method");
		String result=null;
		try {
			int res = sqlSession.insert("join", dto);
			System.out.println("result: " + res);
			if(res > 0) {
				result = "success";
			}
			else {
				result = "failed";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			result="failed";
		}
		return result;
	} 
	@Override
	public PTJoinDto login(String pid) {
		System.out.println("login() method");
		PTJoinDto result = sqlSession.selectOne("login", pid);
		return result;
	}

	//social login
	@Override
	public void authDB(AuthUserDto dto) {
		System.out.println("social Auth DB method");
		String authUsername = dto.getAuthUsername();
		AuthUserDto result = sqlSession.selectOne("authDB",authUsername);
		if(result == null) {//이전 등록한 기록이 없으면 생성
			authInsert(dto);
		}
	}

	@Override
	public void authInsert(AuthUserDto dto) {
		System.out.println("social Auth DB Insert method");
		int res = sqlSession.insert("authInsert",dto);
		System.out.println(res);
	}

	@Override//social login 처리
	public AuthUserDto authLogin(String uesrname) {
		System.out.println("Auth DB login method");
		AuthUserDto dto = sqlSession.selectOne("authLogin", uesrname);
		return dto;
	}
	@Override
	public String identifyUser(String uEmail,String upw) {
		System.out.println("identifyUser() method");
		PTJoinDto dto = sqlSession.selectOne("identifyUser", uEmail);
		PasswordEncoder passwordEncoder = Constant.passwordEncoder;
		Boolean res =passwordEncoder.matches(upw,dto.getUpw());
		String result=null;
		try {
			System.out.println("result: " + res);
			if(res) {
				result = "success";
			}
			else {
				result = "failed";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			result="failed";
		}
		return result;
	}
	@Override
	public PTJoinDto userInforView(String uEmail) {
		System.out.println("userInforView() method");
		PTJoinDto dto = sqlSession.selectOne("userInforView", uEmail);
		return dto;
	}
	@Override
	public void userInfoSave(PTJoinDto dto) {
		System.out.println("uerInfoSave() method");
		int res = sqlSession.update("userInfoSave", dto);
	}
}
