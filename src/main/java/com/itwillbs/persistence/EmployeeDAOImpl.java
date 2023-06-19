package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.EmployeeVO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeDAOImpl.class);
	//DB연결 (xml에서 만들어진 객체를 가져다 사용하고자함 = 의존 주입)
	@Inject
	private SqlSession sqlSession; //mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요

	//mapper구분하는 값 namespace
	private static final String NAMESPACE = "com.itwillbs.mappers.employeeMapper";

	@Override
	public String getTime() {
		String time = sqlSession.selectOne(NAMESPACE + ".getTime"); //괄호안에 쿼리구문입력하기
		return time;
	}

	// 사원등록구현 -> memberMapper.xml 작성 후 아래 메서드 작성
	@Override
	public void insertEmployee(EmployeeVO vo) {
		System.out.println("#####");
		sqlSession.insert(NAMESPACE + ".insertEmployee", vo); //괄호안은 (쿼리구문, 매개변수)순으로 입력하기
	}
	
	// 사원 번호 자동 부여
	@Override
	public int getNextNumber() {
		Integer nextNumber = sqlSession.selectOne(NAMESPACE + ".getNextNumber");
		return (nextNumber != null) ? nextNumber : 1;
	}
	
	// 사원리스트
	@Override
	public List<EmployeeVO> getEmployeeList() {
		return sqlSession.selectList(NAMESPACE + ".employeeList");
	}	

	// 사원 정보 조회
	@Override
	public EmployeeVO getEmployee(String emp_id) {
		logger.debug(" 사원상세정보 mapper 호출");
		logger.debug(" @@@@@emp_id " + emp_id);
		return sqlSession.selectOne(NAMESPACE + ".getEmployee", emp_id);
	}

	// 사원 정보 수정
	@Override
	public Integer modifiyEmployee(EmployeeVO uvo) {
		
		logger.debug(" 테스트 -> DAO 호출 : 회원정보 수정 ");
		// 수정할 정보를 가져옴(uvo)
		logger.debug(" DAO -> mapper 호출 -> SQL 실행 ");
		
		Integer empResult = sqlSession.update(NAMESPACE + ".modifyEmployee", uvo);
		
		logger.debug(" SQL 실행결과를 리턴 ");
		
		return empResult;
	}

}
