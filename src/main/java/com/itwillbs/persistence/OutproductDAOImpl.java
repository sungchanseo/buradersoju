package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OutProductVO;



@Repository
public class OutproductDAOImpl implements OutproductDAO {

	
	// session 설정
	@Inject
	private SqlSession sqlSession;
	
	// mapper 변수 설정
	
	private static final String NAMESPACE = "com.itwillbs.mappers.outproductMapper";

	
	private static final Logger logger = LoggerFactory.getLogger(OutproductDAOImpl.class);
	
	// 재고목록 보기
	@Override
	public List<OutProductVO> getOutproductList() {
	    logger.debug("@@@@@@@@출고목록 보기~@@@@@@");
		
		return sqlSession.selectList(NAMESPACE+".getOutproductList");
	}

	
	// 출고 목록보기
}
