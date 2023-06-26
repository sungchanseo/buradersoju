package com.itwillbs.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductionVO;

@Repository
public class WorkOrderDAOImpl implements WorkOrderDAO {
	
	// 디비연결정보, mapper접근 => sqlSession 객체
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(WorkOrderDAOImpl.class);
	
	// mapper의 namespace 정보
	private static final String NAMESPACE = "com.itwillbs.mappers.workOrderMapper";
	
	@Override
	public void insertWorkOrder(ProductionVO vo) throws Exception {
		// TODO Auto-generated method stub
		logger.debug(" insertWorkOrder() 호출 ");
		int result = sqlSession.insert(NAMESPACE + ".insert", vo);
		
		if(result != 0)
			logger.debug(" 글쓰기 완료! ");
	}

	@Override
	public ProductionVO getWoInsertSearch(String cont_id) throws Exception {
		logger.debug(" getWoInsertSearch() 호출 ");
		return sqlSession.selectOne(NAMESPACE+".woInsertSearch", cont_id);
	}
	
	@Override
	public List<ProductionVO> getWorkOrderList() throws Exception {
		logger.debug(" getWorkOrderList() 호출 ");
		
		return sqlSession.selectList(NAMESPACE+".getWorkOrderList");
	}

	@Override
	public ProductionVO detailWorkOrder(String production_id) throws Exception {
		logger.debug(" detailWorkOrder() 호출 ");

		return sqlSession.selectOne(NAMESPACE+".workOrder", production_id);
  }


	// 자재 재고 조회
	@Override
	public List<ProductionVO> getMaterialList(String product_id) throws Exception {
		logger.debug(" getMaterialList() 호출 ");
		logger.debug("@@@@DAOImpl에서 product_id : "+product_id);
		return sqlSession.selectList(NAMESPACE+".getMaterialList", product_id);
	}

//	@Override
//	public ProductionVO contSearch(String production_id) {
//		logger.debug(" getWoInsertSearch() 호출 ");
//		return sqlSession.selectOne(NAMESPACE+".woInsertSearch", cont_id);
//	}

	
	
	
	
}
