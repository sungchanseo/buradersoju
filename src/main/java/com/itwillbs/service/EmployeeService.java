package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.EmployeeVO;

public interface EmployeeService {

	// 사원 등록
	public void insertEmployee(EmployeeVO vo);
	
	// 사원 번호 자동 부여
	int getNextNumber() throws Exception;
	
	// 사원리스트
	public List<EmployeeVO> getEmployeeList();
	
	// 사원 정보 조회
	public EmployeeVO getEmployee(String emp_id);
	
	// 사원 정보 수정
	public Integer modifiyEmployee(EmployeeVO uvo);

	
	
}
