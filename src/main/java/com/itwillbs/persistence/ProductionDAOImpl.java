package com.itwillbs.persistence;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.itwillbs.domain.ProductionVO;

@Repository
public class ProductionDAOImpl implements ProductionDAO {
	

	// DB 연결 (의존주입)
	@Inject
	private SqlSession sqlSession; //mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요
	
	//mapper구분하는 값 namespace
	private static final String NAMESPACE = "com.itwillbs.mappers.productionMapper";

	// 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(ProductionDAOImpl.class);
		
		@Override
		public void insertWorkOrder(ProductionVO vo) throws Exception {
			logger.debug(" sqlSession - Mabatis - mapper - DB ");
			int result = sqlSession.insert(NAMESPACE+".insert", vo);
			
			if(result != 0)
				logger.debug(" 글쓰기 완료! ");
		}
	
		@Override
		public List<ProductionVO> getWorkOrderList() {
			
			return sqlSession.selectList(NAMESPACE+".getWorkOrderList");
		}
	
	
	
}
