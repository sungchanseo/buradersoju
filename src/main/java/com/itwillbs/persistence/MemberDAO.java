package com.itwillbs.persistence;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberVO;

@Repository
public interface MemberDAO {
	//해당 도메인에 관련된 기능 선언
	public String getTime();

	//C: 회원가입
	public void insertMember(MemberVO vo);

	//R: 회원 정보 조회 - 사용자 ID 해당하는 정보 가져오기
	public MemberVO readMember(String userid) throws Exception;

	//R: 회원 정보 조회 - ID,PW정보에 해당하는 사용자 정보
	public MemberVO readMemberWithIDPW(String userid,String userpw) throws Exception;
}