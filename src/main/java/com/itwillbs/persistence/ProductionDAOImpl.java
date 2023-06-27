package com.itwillbs.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductionVO;

@Repository
public class ProductionDAOImpl implements ProductionDAO {
	
	// 디비연결정보, mapper접근 => sqlSession 객체
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductionDAOImpl.class);
	
	// mapper의 namespace 정보
	private static final String NAMESPACE = "com.itwillbs.mappers.productionMapper";
	
	@Override
	public List<ProductionVO> getProductionList() throws Exception {
		logger.debug(" getProductionList() 호출 ");
		return sqlSession.selectList(NAMESPACE+".getProductionList");
	}

	
	
	
}
