package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.EmployeeVO;

public interface EmployeeService {

	// 사원 등록
	public void insertEmployee(EmployeeVO vo);
	
	// 사원리스트
	public List<EmployeeVO> getEmployeeList();
	
	// 사원 정보 조회
	public EmployeeVO getEmployee(int emp_id);
	
	// 회원정보 수정
	public Integer employeeModify(EmployeeVO uvo);
	
	
}
