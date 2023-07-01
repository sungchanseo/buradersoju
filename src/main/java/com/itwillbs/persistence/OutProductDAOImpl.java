package com.itwillbs.persistence;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OutProductVO;



@Repository
public class OutProductDAOImpl implements OutProductDAO {

	
	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(OutProductDAOImpl.class);
	
	
	// DB연결을 위한 xml 객체 주입
	@Inject
	private SqlSession sqlSession;
	
	
	// Mapper 식별 NAMESPACE
	private static final String NAMESPACE = "com.itwillbs.mappers.outproductMapper";

	
	
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ메서드 정의ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	
	
	
	// 1. 출고 리스트
	@Override
	public List<OutProductVO> getOutProductList() throws Exception{
		logger.debug("############### getOutproductList 호출");
		return sqlSession.selectList(NAMESPACE+".getOutProductList");
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
