package com.itwillbs.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.EmployeeVO;

@Repository
public interface EmployeeDAO {

	//해당 도메인에 관련된 기능 선언
	public String getTime();

	//C: 사원 등록
	public void insertEmployee(EmployeeVO vo);
	
	// 사원리스트
	public List<EmployeeVO> getEmployeeList();

	// 사원 정보 조회
	public EmployeeVO getEmployee(int emp_id);
	
	// 사원 정보 수정
	public Integer updateEmployee(EmployeeVO uvo);
	
	// 

}
