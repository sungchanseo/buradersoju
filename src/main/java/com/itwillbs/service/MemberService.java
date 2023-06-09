package com.itwillbs.service;


import com.itwillbs.domain.MemberVO;

public interface MemberService {
	// 회원 가입 (일반회원가입테이블에 sns계정 컬럼 추가하기)
	// 일반적으로는 DAO랑 같은 메소드명을 사용하여 일관성을 유지한다
	public void insertMember(MemberVO vo);
	
	// 로그인기능 DAO랑 같은 이름으로 하지않은이유? 이름이 달라도 메서드생성가능하다는 걸 보여주기 위해서.
	// public MemberVO readMemberWithIDPW(String userid,String userpw) throws Exception;
	
	// 로그인기능
	public MemberVO loginMember(MemberVO vo);
	
}