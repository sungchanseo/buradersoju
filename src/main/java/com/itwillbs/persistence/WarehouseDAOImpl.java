package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.WarehouseVO;

@Repository
public class WarehouseDAOImpl implements WarehouseDAO{

	@Inject
	private SqlSession sqlSession;
	
	
	private static final String NAMESPACE = "com.itwillbs.mappers.warehouseMapper";

	private static final Logger logger = LoggerFactory.getLogger(WarehouseDAOImpl.class);

	@Override
	public List<WarehouseVO> getWarehouseList() {
		logger.debug("#####DAO 호출완료######");
		return sqlSession.selectList(NAMESPACE + ".getWarehouseList");
	}

	@Override
	public void warehouseInsert(WarehouseVO vo) {
		
		sqlSession.insert(NAMESPACE+".warehouseInsert",vo);
		
	}

	
}
