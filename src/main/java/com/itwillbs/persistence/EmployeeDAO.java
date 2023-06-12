package com.itwillbs.persistence;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.EmployeeVO;

@Repository
public interface EmployeeDAO {

	//해당 도메인에 관련된 기능 선언
	public String getTime();

	//C: 회원가입
	public void insertEmployee(EmployeeVO vo);


}
