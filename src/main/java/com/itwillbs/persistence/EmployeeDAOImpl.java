package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.EmployeeVO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	//DB연결 (xml에서 만들어진 객체를 가져다 사용하고자함 = 의존 주입)
	@Inject
	private SqlSession sqlSession; //mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요

	//mapper구분하는 값 namespace
	private static final String namespace = "com.itwillbs.mappers.employeeMapper";

	@Override
	public String getTime() {
		String result = sqlSession.selectOne(namespace+".getTime"); //괄호안에 쿼리구문입력하기
		return result;
	}

	//회원가입구현 -> memberMapper.xml 작성 후 아래 메서드 작성 -> MemberDAOtest.java 이동
	@Override
	public void insertEmployee(EmployeeVO vo) {
		System.out.println("#####");
		sqlSession.insert(namespace+".insertEmployee", vo); //괄호안은 (쿼리구문, 매개변수)순으로 입력하기
	}
}
