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
	//창고수정 아이디 가져오기위한 DAO
	@Override
	public WarehouseVO warehouseID(String whs_id) {
        logger.debug("창고정보수정할때 아이디가져오기이이잉");
		return sqlSession.selectOne(NAMESPACE+".warehouseID",whs_id);
	}
	//창고수정디비처리 DAO
	@Override
	public Integer modifyWarehouse(WarehouseVO mvo) {
     logger.debug("창고 수정 DAO 왔느냐~@@@");
		return sqlSession.update(NAMESPACE+".modifyWarehouse",mvo);
	}

	//창고삭제 DAO
	@Override
	public Integer removeWarehouse(String whs_id) {
		logger.debug("삭제 DAOODODODODO가자아아");
		return sqlSession.delete(NAMESPACE+".removeWarehouse",whs_id);
	}

	@Override
	public String getMaxNumber() throws Exception {
         logger.debug("자동넘버리일일일이");
         return sqlSession.selectOne(NAMESPACE+".getMaxNumber");
	}

	@Override
	public WarehouseVO regisWhsId(String whs_id) throws Exception {
	
		return sqlSession.selectOne(NAMESPACE+".registWhsid", whs_id);
	}

	@Override
	public String getMaxprNumber() throws Exception {
		 logger.debug("자동넘버리일일일이");
         return sqlSession.selectOne(NAMESPACE+".getMaxprNumber");
	}

	
	
}
