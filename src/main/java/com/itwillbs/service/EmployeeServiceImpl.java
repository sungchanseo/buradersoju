package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.persistence.EmployeeDAO;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	//DB와 연결 (의존주입)
	@Inject
	private EmployeeDAO edao;
	
	// 사원 등록
	@Override
	public void insertEmployee(EmployeeVO vo) {
		//컨트롤러 -> 서비스 호출 -> DAO 호출 -> Mapper -> DB
		System.out.println("S : 회원가입동작");
		if(vo == null) {
			//처리
			return;
		}
		edao.insertEmployee(vo);
	}
	
	// 사원 번호 자동 부여
	@Override
	public int getNextNumber() throws Exception {
		return edao.getNextNumber();
	}
	
	
	// 사원리스트
	@Override
	public List<EmployeeVO> getEmployeeList() {
		return edao.getEmployeeList();
	}	

	// 사원 정보 조회
	@Override
	public EmployeeVO getEmployee(String emp_id) {
		return edao.getEmployee(emp_id);
	}

	// 사원 정보 수정
	@Override
	public Integer modifiyEmployee(EmployeeVO uvo) {
		return edao.modifiyEmployee(uvo);
	}
	
	

	
}
