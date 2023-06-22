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

import com.itwillbs.controller.ProductionController;
import com.itwillbs.domain.ContractVO;
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
	public void insertWorkOrder(ProductionVO vo) throws Exception {
		// TODO Auto-generated method stub
		logger.debug(" insertWorkOrder() 호출 ");
		int result = sqlSession.insert(NAMESPACE + ".insert", vo);
		
		if(result != 0)
			logger.debug(" 글쓰기 완료! ");
	}

	@Override
	public ContractVO getWoInsertSearch(String cont_id) throws Exception {
		logger.debug(" getWoInsertSearch() 호출 ");
		return sqlSession.selectOne(NAMESPACE+".woInsertSearch", cont_id);
	}
	
	@Override
	public List<ProductionVO> getWorkOrderList() throws Exception {
		logger.debug(" getWorkOrderList() 호출 ");
		
		return sqlSession.selectList(NAMESPACE+".getWorkOrderList");
	}

	@Override
	public void insertWorkOrder(ProductionVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ProductionVO detailWorkOrder(String production_id) throws Exception {
		logger.debug(" detailWorkOrder() 호출 ");

		return sqlSession.selectOne(NAMESPACE+".workOrder", production_id);
  }

	
	
	
	
}
