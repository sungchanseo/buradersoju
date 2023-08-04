package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.domain.PagingVO;

public interface EmployeeService {

	// 사원 등록
	public void insertEmployee(EmployeeVO vo);
	
	//사원 인증 등록
	public void insertEmployeeAuth(EmployeeVO vo);
	
	// 사원 번호 자동 부여
	public int getNextNumber() throws Exception;
	
    // 마지막으로 생성된 번호 조회
    String getLastGeneratedNumber() throws Exception;
	
	// 사원리스트
	public List<EmployeeVO> getEmployeeList();
	
	// 사원 정보 조회
	public EmployeeVO getEmployee(String emp_id);
	
	// 사원 정보 수정
	public Integer modifiyEmployee(EmployeeVO uvo);

	//사원 페이징 처리
	public PagingVO setPageInfoForEmployee(PagingVO pvo) throws Exception;

	
}
