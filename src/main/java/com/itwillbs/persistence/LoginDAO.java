package com.itwillbs.persistence;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.LoginVO;

@Repository
public interface LoginDAO {
	//해당 도메인에 관련된 기능 선언
	public String getTime();

	//R: 회원 정보 조회 - 사용자 ID 해당하는 정보 가져오기
	public LoginVO readMember(String emp_id) throws Exception;

	//R: 회원 정보 조회 - ID,PW정보에 해당하는 사용자 정보
	public LoginVO readMemberWithIDPW(String emp_id,String emp_pw) throws Exception;
}