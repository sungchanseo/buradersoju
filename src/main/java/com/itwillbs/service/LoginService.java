package com.itwillbs.service;


import com.itwillbs.domain.LoginVO;

public interface LoginService {
	// 일반적으로는 DAO랑 같은 메소드명을 사용하여 일관성을 유지한다
	// public MemberVO readMemberWithIDPW(String userid,String userpw) throws Exception;
	
	// 로그인기능
	public LoginVO loginMember(LoginVO vo);
	
}