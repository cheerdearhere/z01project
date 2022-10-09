package com.team03.prototype.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.team03.prototype.dao.PTSecDao;
import com.team03.prototype.dto.AuthUserDto;
import com.team03.prototype.dto.PTJoinDto;
import com.team03.prototype.util.Constant;

public class CustomUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		PTSecDao sdao = Constant.sdao;
		PTJoinDto dto = null;
		AuthUserDto adto = null;
		Boolean flag = false;
		
		if(username.startsWith("kakao_") || username.startsWith("naver_") || username.startsWith("google_")) {
			adto = sdao.authLogin(username);
		}
		else {//social login이 아닌경우 EzenUserDto를 사용
			dto = sdao.login(username);
			flag=true;
			if(dto == null) {
				System.out.println("Spring security에서 dto null로 로그인 실패");
				throw new UsernameNotFoundException("No user found with username");
				//spring security에서 예외를 처리
			}
		}
		System.out.println("PTJoinDto: " + dto);
		System.out.println("AuthUserDto: " + adto);

		if(flag) {
			String pw = dto.getUpw();
			String auth = dto.getUauth();
			System.out.println("pw: " + pw + "// auth: " + auth);
			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();

			roles.add(new SimpleGrantedAuthority(auth));
			UserDetails user = new User(username,pw,roles);
			return user;
		}
		else {
			String pw = adto.getAuthPw();
			String auth = adto.getAuth();

			System.out.println("pw: " + pw + "// auth: " + auth);
			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
			roles.add(new SimpleGrantedAuthority(auth));
			UserDetails user = new User(username,pw,roles);
			return user;
		}
	}
}
