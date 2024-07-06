package com.team03.prototype.dto;

import java.sql.Timestamp;

public class AuthUserDto {
	private String authUsername;
	private String authPw;
	private String auth;
	private Timestamp temporaryDay;	//임시가입일 추가(not null)

	public AuthUserDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuthUserDto(String authUsername, String authPw, String auth) {
		super();
		this.authUsername = authUsername;
		this.authPw = authPw;
		this.auth = auth;
	}

	public AuthUserDto(String authUsername, String authPw, String auth, Timestamp temporaryDay) {
		super();
		this.authUsername = authUsername;
		this.authPw = authPw;
		this.auth = auth;
		this.temporaryDay = temporaryDay;
	}

	public Timestamp getTemporaryDay() {
		return temporaryDay;
	}

	public void setTemporaryDay(Timestamp temporaryDay) {
		this.temporaryDay = temporaryDay;
	}

	public String getAuthUsername() {
		return authUsername;
	}

	public void setAuthUsername(String authUsername) {
		this.authUsername = authUsername;
	}

	public String getAuthPw() {
		return authPw;
	}

	public void setAuthPw(String authPw) {
		this.authPw = authPw;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}


}
